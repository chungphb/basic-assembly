.model tiny
.386
.stack 100h
.data 
    n dw ?
    sum dw 0
    max dw 0
    arr dw 100 dup(?)
.code
    mainproc proc
        mov ax, @data
        mov ds, ax
        mov ax, ds
        mov es, ax 
        
        call nhapDaySo
        call timMax
        mov ax, max
        call writeDec
        .exit
    mainproc endp
         
    timMax proc
        mov cx, n
        lea si, arr
        mov max, 0
      maxLoop:
        mov ax, [si]
        cmp max, ax
        jnl next
        mov max, ax
      next:
        add si, type arr
        loop maxLoop
    timMax endp
    
    tong proc
        mov cx, n
        lea si, arr
      sumLoop:
        lodsw
        add sum, ax
        loop sumLoop
        ret
    tong endp
    
    nhapDaySo proc
        call nhapSo
        mov n, ax
        mov cx, n
        lea di, arr
      L:
        call nhapSo
        stosw
        loop L
        ret
    nhapDaySo endp
    
    nhapSo proc
        push 0
      _do:
        mov ah, 0
        int 16h
        cmp al, 13
        je _end
        cmp al, '0'
        jl _do
        cmp al, '9'
        jg _do     
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
        jmp _do
      _end:
        mov al, 0ah
        mov ah, 0eh
        int 10h
        mov al, 0dh
        mov ah, 0eh
        int 10h
        pop ax
        ret
    nhapSo endp
    
    writeDec proc
        mov bx, 10
        xor cx, cx
      divLoop:
        xor dx, dx
        div bx
        push dx
        inc cx
        cmp ax, 0
        jnz divLoop
      printLoop:
        pop ax
        add ax, 30h
        mov ah, 0eh
        xor bx,bx
        int 10h
        loop printLoop
        ret
    writeDec endp
end mainproc
        
        