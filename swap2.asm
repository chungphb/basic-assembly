.model tiny
.386
.stack 100h
.data 
    a dw ?
    b dw ?
    c dw ?
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        call input
        
        mov ax, a
        mov bx, b
        call swap
        mov a, ax
        mov b, bx
        
        mov ax, b
        mov bx, c
        call swap
        mov c, bx
        mov b, ax

        push a
        call writeDec
        push b
        call writeDec
        push c
        call writeDec
        .exit
    mainproc endp
    
    input proc
        mov cx, 3
      outerLoop:
        push 0
      innerLoop:
        mov ah, 0
        int 16h
        cmp al, 13
        je _next
        cmp al, '0'
        jl innerLoop
        cmp al, '9'
        jg innerLoop
        mov ah, 0eh
        int 10h
        sub al, 30h
        xor bx, bx
        mov bl, al
        pop ax
        mov dx, 10
        mul dx
        add ax, bx
        push ax
        jmp innerLoop
      _next:
        mov al, 0ah
        mov ah, 0eh
        int 10h
        mov al, 0dh
        mov ah, 0eh
        int 10h
        loop outerLoop
        ; Dua vao bien tuong ung
        pop c
        pop b
        pop a
        ret        
    input endp
    
    swap proc near
        xchg ax, bx
        ret
    swap endp
    
    writeDec proc
        push bp
        mov bp, sp
        push ax
        mov ax, 4[bp]
        mov bx, 10
        xor cx, cx
      divLoop:
        xor edx, edx
        div ebx
        push dx
        inc cx
        cmp eax, 0
        jnz divLoop
      printLoop:
        pop ax
        add ax, 30h
        mov ah, 0eh
        xor bx,bx
        int 10h
        loop printLoop
        pop ax
        pop bp
        ret 2
    writeDec endp
end mainproc
        
        