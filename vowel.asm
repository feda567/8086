data segment
    str db 20 dup('$')
    msg1 db 10,13,"enter the string:$"
    msg2 db 10,13,"the number of vowels in the string is:$"
data ends
code segment
    assume cs:code,ds:data
    start:
        mov ax,data
        mov ds,ax

        lea dx,msg1
        mov ah,09H
        int 21H

        lea si,str
        rep1:mov ah,01h
        int 21H
        cmp al,13
        je exit1
        mov [si],al
        inc si
        jmp rep1
       
        ;checking
        exit1:mov ch,[str+1]
        mov di,offset str+2
        mov cl,00h
        next:mov al,[di]
             mov ah,'a'
             cmp al,ah
             je skip
             mov ah,'e'
             cmp al,ah
             je skip
             mov ah,'i'
             cmp al,ah
             je skip
             mov ah,'o'
             cmp al,ah
             je skip
             mov ah,'u'
             cmp al,ah
             je skip
             inc di
             dec ch
             jnz next
             jmp skip1
        skip:inc cl
             inc di
             dec ch
             jnz next
        skip1:lea dx,msg2
            mov ah,09H
            int 21h
            mov al,[si]
        and al,0f0H
        mov cl,04H
        rol al,cl
        add al,30H
        cmp al,39H
        jle skipAdd
        add al,07H
        skipAdd:mov ah,02H
        mov dl,al
        int 21H

        mov al,[si]
        and al,0fH
        add al,30H
        cmp al,39H
        jle skipAdd2
        add al,07H
        skipAdd2:mov ah,02H
        mov dl,al
        int 21H

            mov ah,4ch
            int 21h

code ends
end start