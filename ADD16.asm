.MODEL small
.STACK 100h
.DATA
        msg1 db "Enter number1 (0-9999) : $"
        msg2 db 10,"Enter another number2 : $"
	    msg3 db 10,"ADDITION : $"
        temp dw 0
.CODE
.STARTUP

        MOV DX,offset msg1
        MOV AH,09H
        INT 21H

        MOV BL,00H
        MOV CX,4
        
input1: SHL BX,4H
        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV AH,00H;
        ADD BX,AX
        LOOP input1

        MOV temp,BX
        
        MOV DX,offset msg2
        MOV AH,09H
        INT 21H

        MOV BX,00H
        MOV CX,4H

input2: SHL BX,4H
        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV AH,00H
        ADD BX,AX
        LOOP input2

        MOV DX,offset msg3
        MOV AH,09H
        INT 21H

        MOV DX,temp
        ADD BL,DL
        MOV AL,BL
        DAA 
        MOV AH,AL
        ADC BH,DH
        MOV AL,BH
        DAA

        MOV BX,AX
 
        JNC contin
        MOV DL,31H
        MOV AH,02H
        INT 21H

contin: ROL BX,8
        MOV CX,4H

output:	ROL BX,4
        MOV DL,BL
        AND DL,0FH
        ADD DL,30H
        MOV AH,02H
        INT 21H
        LOOP output
ex:
.EXIT

END