data segment
    MSG1 DB "HELLO$"
data ends
code segment
    ASSUME cs:code,ds:data
    START:
        MOV AX,data
        MOV ds,AX
        LEA DX,MSG1
        MOV AH,09h
        INT 21h
        MOV AH,4ch
        INT 21h
code ends
end start