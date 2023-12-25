data segment
    x db ?
    y db ?
    carry db ?
    sum db ?
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
        mov ah,09H
        int 21H

        call input
        mov x,al
        lea dx,msg2
        mov ah,09H
        int 21h
        call input
        mov y,al
        mov al,x
        add al,y
        daa
        jnc skip3
        inc carry
        skip3:mov sum,al
                lea dx,msg3
                mov ah,09H
                int 21h
                mov al,carry
                add al,30h
                cmp al,39h
                jle skip4
                add al,07h
                skip4:mov dl,al
                     mov ah,02h
                     int 21H
                     lea si,sum
                     call output
                     mov ah,4ch
                     int 21h
input proc near
    mov ah,01H
    int 21H

    sub al,30h
    cmp al,09h
    jle skip1
    sub al,07h
    skip1:mov cl,04h
          rol al,cl
          mov ch,al
          mov ah,01H
          int 21H
          sub al,30h
          cmp al,09H
          jle skip2
          sub al,07h
          skip2:add al,ch
          ret
input endp
output proc near
    mov al,[si]
    and al,0f0h
    mov cl,04h
    rol al,cl
    add al,30h
    cmp al,39H
    jle skip5
    add al,07h
    skip5:mov dl,al
            mov ah,02h
            int 21h
            mov al,[si]
            and al,0fh
            add al,30h
            cmp al,39H
            jle skip6
            add al,07h
            skip6:mov dl,al
                    mov ah,02h
                    int 21H
                    ret
output endp
code ends
end start 