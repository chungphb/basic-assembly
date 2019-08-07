.model tiny
.386
.stack 100h
    
.data 
    
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        
        mov ax, 23456
        mov bx, 16
        xor cx, cx
        
    l1:
        xor dx, dx
        div bx
        push dx
        inc cx
        cmp ax, 0
        jnz l1
   
    inkq:
        pop ax
        cmp ax, 9
        ja l2
        add ax, 30h
        jmp next
    l2: 
        add ax, 37h
    next:
        mov ah, 0eh
        xor bx, bx
        int 10h
        loop inkq
        
        mov al, 'h'
        mov ah, 0eh
        xor bx, bx
        int 10h
        .exit
    mainproc endp
end mainproc
        
        