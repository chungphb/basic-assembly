.model tiny
.386
.stack 100h
    
.data 
    
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        
        mov ax, 1024
        mov bx, 2
        xor cx, cx
        
    L:
        xor dx, dx
        div bx
        push dx
        inc cx
        cmp ax, 0
        jnz L
   
    INKQ:
        pop ax
        add ax, 30h
        mov ah, 0eh
        xor bx, bx
        int 10h
        loop INKQ
        
        mov al, 'b'
        mov ah, 0eh
        xor bx, bx
        int 10h
        .exit
    mainproc endp
end mainproc
        
        