.model tiny
.386
.stack 100h
    
.data 
    
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        
        mov ax, 12345
        mov bx, 10
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
        
        .exit
    mainproc endp
end mainproc
        
        