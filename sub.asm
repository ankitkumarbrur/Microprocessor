.model small
.stack 100h
.data
        a dw 0000h,4678h
	b dw 0000h,5321h
	temp1 dw ?
	temp2 dw ?
	flag  dw 0h
.code
.startup

	mov ax,a[0]
	mov bx,b[0]
	cmp ax,bx
	jae skip1
	mov flag,1h

  skip1:cmp ax,0h
	ja skip2	
	cmp bx,0h
	ja skip2
	mov flag,2h

  skip2:mov ax,a[2]
	mov bx,b[2]

	cmp flag,2h
	jb skip3
	cmp ax,bx
	jae skip3
	mov flag,1h
	
  skip3:sub ax,bx
	mov temp1,ax

	mov ax,a[0]
	mov bx,b[0]

 	sbb ax,bx
	mov temp2,ax

	cmp flag,1h
	ja skip4
	mov ax,temp1
	neg ax
	mov temp1,ax
	mov ax,temp2
	neg ax
	sub ax,1
	mov temp2,ax
	mov dl,45
	mov ah,02h
	int 21h
	

  skip4:mov cx,4h
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
