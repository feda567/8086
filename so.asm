data segment
    n db ?
    arr db 20 dup('$')
    msg1 db 10,13,"enter the array:$"
    msg2 db 10,13,"count:$"
    msg3 db 10,13,"sorted array:$"
data ends
code segment
    assume cs:code,ds:data
    start:
        mov ax,data
        mov ds,ax

        lea dx,msg1
        mov ah,09H
        int 21H
        
        mov cl,00H
        lea si,arr

       next:
             mov ah,01H
             int 21H
             cmp al,0Dh
             je skip
             mov [si],al
             inc si
             inc cl
             jmp next
       skip:mov n,cl
            lea dx,msg2
            mov ah,09H
            int 21H
            
            add cl,30H
            cmp al,39H
            je skip2
            add cl,07H
           skip2: 
            mov dl,cl
            mov ah,02H
            int 21H
            lea dx,msg3
            mov ah,09H
            int 21H
         
            mov cl,n
            dec cl
            loop1:mov ch,n
            dec ch
            lea si,arr
            loop2:mov al,[si]
                inc si
                cmp al,[si]
                jc skip3
                mov bl,[si]
                dec si
                mov [si],bl
                inc si
                mov [si],al
            skip3:dec ch
            jnz loop2
            dec cl
            jnz loop1

            mov cl,n
            lea si,arr
            exit:mov al,[si]
                mov dl,al
                mov ah,02H
                int 21h 
                inc si
                dec cl
                jnz exit
                mov ah,4ch
                int 21H
code ends
end start
