data segment
str1 db 20 dup("$")
str2 db 20 dup("$")
msg1 db 10,13,"Enter the first string:$"
msg2 db 10,13,"Enter the 2nd string:$"
msg3 db 10,13,"Strings not equal$"
msg4 db 10,13,"strings equal$"
data ends

code segment
    assume cs:code,ds:data
    start:
           mov ax,data  ; iniatializing data segment
           mov ds,ax

           lea dx,msg1 ;print msg 1
           mov ah,09H
           int 21H

           lea si,str1  
           mov cl,00h
           repeat1:mov ah,01H ;taking input one by one
           int 21H
           cmp al,13; 13 is next lines ascii value
           je skip1
           add cl,01H
           mov [si],al
           inc si
           jmp repeat1
           
           skip1: lea dx,msg2
           mov ah,09H
           int 21H

           lea si,str2
           repeat2:mov ah,01H
           int 21H
           cmp al,13
           je skip2
           mov [si],al
           inc si
           jmp repeat2

          skip2:
            lea si,str1
            lea di,str2
            mov dl,'$'
            repeat3:cmp dl,[si]
                    jz exit1
                    cmp dl,[di]
                    jz exit1
                    mov al,[si]
                    cmp al,[di]
                    jnz exit2
                    inc si
                    inc di
                    jmp repeat3

                    exit1:cmp dl,[di]
                    jnz exit2
                    lea dx,msg4
                    mov ah,09H
                    int 21H
                    jmp skip5

                    exit2:lea dx,msg3
                          mov ah,09H
                          int 21H



skip5:


           mov ah,4ch
           int 21H

           code ends
           end start