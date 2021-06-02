import re
import argparse

parser = argparse.ArgumentParser(description='Asembler to machine code prased.')
parser.add_argument("-f","--file_name", help="Asm file to be prased", default="test.asm")
args = parser.parse_args()
file = args.file_name
print(file)

'''
List of implemented commands:
-move Rx,Ry | 0000000000010 Ry 01100 Rx 00000000 |
-movi Rx,imm | 000000000001011010000 Rx imm |
-nop | 00000000000000000000011000000000 |
-jump Rx | 0000001100010 Rx 0110011000000000 |
-jumpi imm | 000000110001011011100110 im |
-jz Rx,imm | 0000000100110 Rx 11100110 imm |
-jnz Rx,imm | 0000001000110 Rx 11100110 imm |
-add Rd,Rx,Ry | 0000000000010 Rx 0 Ry 0 Rd 00000000 |
-addi Rd,Rx,imm | 0000000000010 Rx 1 110 0 Rd imm |
-and Rd,Rx,Ry | 0000000000000 Rx 0 Ry 0 Rd 00000000 |
-andi Rd,Rx,imm | 0000000000000 Rx 1 110 0 Rd imm |
-load Rd, Rx | 0000000000010 Rx 01101 Rd 00000000 |
-loadi Rd, imm | 000000000011011011101 Rd imm |
'''
comands = {"mov":"0b0000000000010" + "000" + "01100" +  "000" + "00000000",
            "movi":"0b000000000001011010000" +  "000" + "00000000",
            "nop":"0b00000000000000000000011000000000",
            "jump":"0b0000001100010" + "000" + "0110011000000000",
            "jumpi":"0b000000110001011011100110" + "00000000",
            "jz":"0b0000000100110" + "000" + "11100110" + "00000000",
            "jnz":"0b0000001000110" + "000" + "11100110" + "00000000", 
            "add":"0b0000000000010" + "000" + "0" + "000" + "0" +  "000" + "00000000",    
            "addi":"0b0000000000010" + "000" + "11100" +  "000" + "00000000", 
            "and":"0b0000000000000" + "000" + "0" +  "000" + "0" + "000" + "00000000",
            "andi":"0b0000000000000" + "000" + "11100" +  "000" + "00000000",
            "load":"0b0000000000010" + "000" + "01101" +  "000" + "00000000", 
            "loadi":"0b000000000011011011101" +  "000" + "00000000"}
            
            
multiply = {"mov":[2**8,2**16],
            "movi":[2**8,2**0],
            "nop":[],
            "jump":[2**16],
            "jumpi":[2**0],
            "jz":[2**16,2**0],
            "jnz":[2**16,2**0], 
            "add":[2**8,2**16,2**12],    
            "addi":[2**8,2**16,2**0], 
            "and":[2**8,2**16,2**12],
            "andi":[2**8,2**16,2**0],
            "load":[2**8,2**16], 
            "loadi":[2**8,2**0]}
            
            
#file = input("Provide asm file name:")
txt = ""

with open(file,mode = 'r') as f:
    for line in f:
        inst =  re.split(r'[ |,]+',line)
        command = inst.pop(0)
        if command not in comands.keys():
            raise Exception("Wrong command " + command)
        if len(inst) != len(multiply[command]):
             raise Exception(f"Wrong number of arguments provided for {command}.\nExpected {len(multiply[command])} got {len(inst)} ")
             
        #converting string values to number array for later manipulation
        for i,ins in enumerate(inst):
            if re.match(r'R',ins): #check if its a register command
                inst[i] = int(ins[1:])
            #if imm check for data type
            elif re.match(r'0x',ins): #hex
                inst[i] = int(ins[:],base = 16)
            elif re.match(r'0b',ins): #binary
                inst[i] = int(ins[:],base = 2)
            else: #deciaml
                inst[i] = int(ins[:])
                
        machine_code = int(comands[command],base = 2) #create machine code
        for num,mult in zip(inst,multiply[command]):
            machine_code += num*int(mult)
        #add machine code to txt to be saved later
        txt += hex(machine_code) + '\n'

with open(file[0:-4] + '.ms','w+') as f:
    f.write(txt)