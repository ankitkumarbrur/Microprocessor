.MODEL SMALL
.STACK 100H
.DATA
	msg1 db 10,"Enter number1 (0-FFFFFFFF) : $"
        msg2 db 10,"Enter number2 (0-FFFFFFFF) : $"
	msg3 db 10,"RESULT: $"
        n1 dw 2 dup(0)
        n2 dw 2 dup(0)
        res dw 2 dup(0)
	ls dw ?
.CODE
.STARTUP

		MOV DX,offset msg1
        	MOV AH,09H
        	INT 21H

		MOV SI,0
		MOV CX,2
	inp1:	
		MOV BX,00
		MOV ls,CX
		MOV CX,4
		input11:SHL BX,4
			MOV AH,01
			INT 21H
			SUB AL,30H
			CMP AL,9H
			JBE cnt1
			SUB AL,07H
		cnt1:	MOV AH,00H
			ADD BX,AX
			LOOP input11
		MOV n1[SI],BX
		INC SI
		INC SI
		MOV CX,ls
		LOOP inp1

		MOV DX,offset msg2
	        MOV AH,09H
        	INT 21H

		MOV SI,0
		MOV CX,2
	inp2:	
		MOV BX,00
		MOV ls,CX
		MOV CX,4
		input21:SHL BX,4
			MOV AH,01
			INT 21H
			SUB AL,30H
			CMP AL,9H
			JBE cnt2
			SUB AL,07H
		cnt2:	MOV AH,00H
			ADD BX,AX
			LOOP input21
		MOV n2[SI],BX
		INC SI
		INC SI
		MOV CX,ls
		LOOP inp2


		MOV CX,2
                MOV SI,2
		CLC
        L1:
                MOV AX, n1[SI]    
                ADC AX, n2[SI]    
                MOV res[SI],AX
                DEC SI
                DEC SI
		LOOP L1

                MOV DX,offset msg3
	        MOV AH,09H
        	INT 21H
		
                JNC print
		MOV DL,31h
		MOV AH,02h
		INT 21H

	print:
		MOV CX,2
		MOV SI,0
	output:
		MOV BX,res[SI]
		mov ls,cx
		MOV CX,4
		print1:
			ROL BX,4
			MOV DL,BL
			AND DL,0FH
			ADD DL,30H
			CMP DL,39H
			JBE print12
			ADD DL,07H
			print12:
				MOV AH,02
				INT 21H
			LOOP print1
		INC SI
		INC SI
		MOV cx,ls
		LOOP output
.EXIT
END
			

