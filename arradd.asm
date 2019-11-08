.model small

.data
    A db 54h, 10h, 3h, 5h, 6h, 27h
    B db 99h, 77h, 2h, 4h, 0h, 15h
    C db 6 dup(0)
    msg db "Resultant array: $", 10
.code
    .startup
    mov si, 0h
    lea dx, msg
    mov ah, 09h
    int 21h

    mov cx, 6h
    arr:
        mov dl, A[si]
        add dl, B[si]
        mov C[si], dl
        inc si
    loop arr

    mov si, 0h
    mov cx, 6h
    output:
        mov bl, C[si]
        rol bl, 4h
        mov dl, bl
        and dl, 0fh
        cmp dl, 9
        jbe output1
        add dl, 07h
        output1:
            add dl, 30h 
            mov ah, 02h
            int 21h

        rol bl, 4h
        mov dl, bl
        and dl, 0fh
        cmp dl, 9
        jbe output2
        add dl, 07h
        output2:
            add dl, 30h 
            mov ah, 02h
            int 21h

        mov dl, 20h
        mov ah, 02h
        int 21h
        
        inc si
    loop output

    .exit
end
