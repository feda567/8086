data segment
    msg1 db 10,13,"enter first number:$"
    msg2 db 10,13,"enter second number:$"
    msg3 db 10,13,"sum is:$"
data ends
code segment
    assume cs:code,ds:data
    start:
        mov ax,data
        mov ds,ax

        lea dx,msg1
        mov ah,09h
        int 21h

        mov ah,01h
        int 21h
        sub al,30h
        mov bl,al

        lea dx,msg2
        mov ah,09h
        int 21h

        mov ah,01h
        int 21h
        lea dx,msg3
        mov ah,09h
        int 21h

        sub al,30h
        
        add al,bl
        mov ah,00h
        aaa

        mov bl,al
        mov dl,ah

        add dl,30h
        
        mov ah,02h
        int 21h

        mov dl,bl
        add dl,30h
        mov ah,02h
        int 21h

        mov ah,4ch
        int 21h

code ends
end start