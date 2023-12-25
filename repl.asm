data segment
    str db 20 dup('$')
    olds db ?
    newst db ?
    msg1 db 10,13,"enter the string:$"
    msg2 db 10,13,"enter the character to be replaced:$"
    msg3 db 10,13,"enter the character to be replaced with:$"
    msg4 db 10,13,"string is:$"
data ends
code segment
    assume cs:code,ds:data
    start:
        mov ax,data
        mov ds,ax

        lea dx,msg1
        mov ah,09H
        int 21H

        mov si,offset str
        mov ah,0ah
        mov dx,si
        int 21H

        lea dx,msg2
        mov ah,09H
        int 21H

        mov ah,01H
        int 21H
        mov olds,al

        lea dx,msg3
        mov ah,09H
        int 21H

        mov ah,01H
        int 21H
        mov newst,al

        ;replacement
        mov cl,str+1
        mov di,offset str+2
        mov bh,newst
        ;mov bl,olds
        next:
            mov al,[di]
            cmp al,olds
            jne skip
            mov [di],bh
        skip:
            inc di
            dec cl
            jnz next
            mov si,offset str+2
            lea dx,msg4
            mov ah,09H
            int 21h
            mov ah,09H
            mov dx,si
            int 21H
            mov ah,4ch
            int 21H
code ends
end start
           
