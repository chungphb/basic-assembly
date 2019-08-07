.model tiny
.386
.stack 100h
.data 
    buf db 16 dup(0), '$'
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 

        mov cx, 16
        mov si, offset buf
    L1: 
        shl ax, 1
        mov byte ptr[si], '0'
        jnc L2
        mov byte ptr [si], '1'
    L2: 
        inc si
        loop L1
        
        mov ah, 9
        lea dx, buf
        int 21h
        .exit
    mainproc endp
end mainproc
        
        