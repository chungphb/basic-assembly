.model tiny
.386
.stack 100h
    key equ 234
.data 
    buf db 'Hello World', 10, 13, '$'
    len = ($ - buf) - 3
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        
        mov ah, 9
        lea dx, buf
        int 21h
        
        mov cx, len
        xor si, si
    L1: xor buf[si], key
        inc si
        loop L1
        
        mov ah, 9
        lea dx, buf
        int 21h
        
        mov cx, len
        xor si, si
    L2: xor buf[si], key
        inc si
        loop L2
        
        mov ah, 9
        lea dx, buf
        int 21h
        
        .exit
    mainproc endp
end mainproc
        
        