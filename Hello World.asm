.MODEL small
.STACK 100h
.DATA
        msg db "HELLO WORLD$"
.CODE
.STARTUP
        MOV AX,@DATA
        MOV DS,AX
        MOV DX,offset msg
        MOV AH,09
        INT 21h
.EXIT
END
