.model small
.stack 100h
.data
        a dw 0eeeeh,0eeeeh
        b dw 0eeeeh,0eeeeh
        temp1 dw ?
        temp2 dw ?
        temp3 dw ?
        temp4 dw ?
        temp5 dw ?
        temp6 dw ?
.code
.startup
        mov ax,a[2]
        mul b[2]
        mov temp1,ax
	mov temp2,dx
	mov ax,a[0]
        mul b[2]
        add temp2,ax
	mov temp3,dx
	adc temp3,0
	
	mov ax,a[2]
        mul b[0]
        mov temp4,ax
	mov temp5,dx
	mov ax,a[0]
        mul b[0]
        add temp5,ax
	mov temp6,dx
	adc temp6,0
     

	mov dx,temp4
	add temp2,dx
	mov dx,temp5
	adc temp3,dx
	adc temp6,0


	mov cx,4h
        mov bx,temp6
     t6:rol bx,4
	mov dx,bx
        and dl,0fh
        add dl,30h
        cmp dl,39h
        jbe printc6
        add dl,07h
        printc6:
                mov ah,02h
                int 21h
        loop t6


	mov cx,4h
        mov bx,temp3
     t3:rol bx,4
	mov dx,bx
        and dl,0fh
        add dl,30h
        cmp dl,39h
        jbe printc3
        add dl,07h
        printc3:
                mov ah,02h
                int 21h
        loop t3

	
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







