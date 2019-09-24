.MODEL small
.STACK 100h
.DATA
        msg db "Enter a number(0-99) : $"
        msg2 db 10,"Entered number is : $"
.CODE
.STARTUP
        MOV AX,@DATA
        MOV DS,AX
        MOV DX,offset msg
        MOV AH,09
        INT 21h
        MOV BL,00H
        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV BL,AL
        SHL BL,4
        MOV AH,01H
        INT 21H
        SUB AL,30H
        ADD BL,AL
        MOV DX,offset msg2
        MOV AH,09
        INT 21H
        ROL BL,4
        MOV DL,BL
        AND DL,0FH
        ADD DL,30H
        MOV AH,02h
        INT 21H
        ROL BL,4
        MOV DL,BL
        AND DL,0FH
        ADD DL,30H
        MOV AH,02h
        INT 21H
.EXIT
END
