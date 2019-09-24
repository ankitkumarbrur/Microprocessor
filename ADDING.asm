.MODEL small
.STACK 100h
.DATA
        msg1 db "Enter number1 (0-99) : $"
        msg2 db 10,"Enter another number2 : $"
	    msg3 db 10,"ADDITION : $"
        temp db 0
.CODE
.STARTUP

        MOV DX,offset msg1
        MOV AH,09H
        INT 21H

        MOV BL,00H
        MOV CX,2
        
input1: SHL BL,4H
        MOV AH,01H
        INT 21H
        SUB AL,30H
        ADD BL,AL
        LOOP input1

        MOV temp,BL
        
        MOV DX,offset msg2
        MOV AH,09H
        INT 21H

        MOV BL,00H
        MOV CX,2H

input2: SHL BL,4H
        MOV AH,01H
        INT 21H
        SUB AL,30H
        ADD BL,AL
        LOOP input2

        ADD BL,temp
        MOV AL,BL

        MOV DX,offset msg3
        MOV AH,09H
        INT 21H

        MOV CX,2H
        
output:	ROL AL,4
        MOV DL,AL
        AND DL,0FH
        ADD DL,30H
        MOV AH,02H
        INT 21H
        LOOP output
.EXIT

END