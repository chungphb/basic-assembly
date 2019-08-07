.model tiny
.386
.stack 100h
    
.data 
    vec dw 34, -50, 24, 57, 22, -69, 20
    len = ($ - vec)/type vec
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
    
        xor ax, ax
        mov cx, len
        mov bx, offset vec
    sum: 
        add ax, [bx]
        add bx, type vec
        loop sum
    
        mov bx, 10
        xor cx, cx
    lap:     
        xor dx, dx
        div bx
        push dx
        inc cx
        cmp ax, 0
        jnz lap
    inkq:
        pop ax
        add ax, 30h
        mov ah, 0eh
        xor bx, bx
        int 10h
        loop inkq
        
        .exit
    mainproc endp
end mainproc
        
        