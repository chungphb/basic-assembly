.model tiny
.386
.stack 100h
.data 
    str db "ilovebk", "$"
    len = $ - str - 1
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        
        mov al, str
        mov cx, len
        xor si, si
      L1:
        cmp al, str[si]
        jna L2
        mov al, str[si]
      L2:
        inc si
        loop L1
        call printChar
        .exit
    mainproc endp
    
    printChar proc
        mov ah, 0eh
        xor bx, bx
        int 10h
        ret
    printChar endp
end mainproc
        
        