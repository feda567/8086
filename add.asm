; 4 bit addition

assume cs:code , ds:data
data segment
   str1 db 0ah,"Enter 1st no :$"
   str2 db 0ah,"Enter 2nd no: $"
   str3 db 0ah,"The sum is:  $ "
data ends
code segment
start: mov ax,data
       mov ds,ax

       lea dx,str1
       mov ah,09h
       int 21h
       ;PRINT MSG1
       mov ah,01h
       int 21h
		;FIRST I/P
       sub al,30h
       mov bl,al
		;FIRST I/P IN BL
       lea dx,str2
       mov ah,09h
       int 21h
		;SECOND MESSAGE
		mov ah,01h
		int 21h
		;SECOND I/P				 
		lea dx,str3
		mov ah,09h
		int 21h
				;THIRD MESSAGE
		sub al,30h
			;al has second i/p
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
		