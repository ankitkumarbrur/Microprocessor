.model small
.stack 100h
.data
        a dw 07867h,03776h
	b dw 05778h,06656h
	temp1 dw ?
	temp2 dw ?
.code
.startup
	mov ax,a[2]
	mov bx,b[2]
	sub ax,bx
	mov temp1,ax

	mov ax,a[0]
	mov bx,b[0]
	sbb ax,bx
	mov temp2,ax

	mov cx,4h
        mov bx,temp2
     t2:rol bx,4
	mov dx,bx
        and dl,0fh
        add dl,30h
        cmp dl,39h
        jbe printc2
        add dl,07h
        printc2:
                mov ah,02h
                int 21h
        loop t2

	mov cx,4h
        mov bx,temp1
     t1:rol bx,4
	mov dx,bx
        and dl,0fh
        add dl,30h
        cmp dl,39h
        jbe printc1
        add dl,07h
        printc1:
                mov ah,02h
                int 21h
        loop t1


	

.exit
end







	
		
