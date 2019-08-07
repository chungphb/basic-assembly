.model tiny
.386
.stack 100h
.data 
    n dw ?
    arr dw 100 dup(?)
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        call docDaySo
        call sapXep
        call inDaySo
        .exit
    mainproc endp
    
    docDaySo proc
        xor cx, cx
      _daySo:  
        push 0
      _so:
        mov ah, 0
        int 16h
        cmp al, 13
        je _next
        cmp al, '0'
        jl _so
        cmp al, '9'
        jg _so
        
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
        jmp _so
      _next:
        pop ax
        cmp ax, 0
        jz _end
        push ax
        ; In cac ky tu xuong hang, thut dau dong truoc khi doc phan tu tiep theo
        mov al, 0ah
        mov ah, 0eh
        int 10h
        mov al, 0dh
        mov ah, 0eh
        int 10h
        inc cx
        jmp _daySo
      _end:
        ; Dua day dang o trong stack vao mang
        mov n, cx
        xor si, si
      L:
        pop ax
        mov arr[si], ax
        add si, 2
        loop L
        ret    
    docDaySo endp
    
    sapXep proc
        xor si, si
        xor di, di
        mov ax, n
        mov dx, 2
        mul dx
        mov cx, ax
        mov dx, cx
        sub cx, 2
      L1:
        mov di, si
        add di, 2
      L2:
        mov ax, arr[si]
        cmp ax, arr[di]
        jna next
        xchg ax, arr[di]
        xchg ax, arr[si]
      next:
        add di, 2
        cmp di, dx
        jb L2
        add si, 2
        cmp si, cx
        jb L1
        ret
    sapXep endp
    
    inDaySo proc
        mov cx, n
        xor si, si
      L3:
        push cx
        push arr[si]
        call writeDec
        ; In dau phay ngan cach giua cac phan tu
        mov al, ','
        mov ah, 0eh
        int 10h
        add si, 2
        pop cx
        loop L3
        ret
    inDaySo endp
    
    writeDec proc near
        push bp
        mov bp, sp
        mov ax, 4[bp]
        
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
        
        pop bp
        ret 2
    writeDec endp
end mainproc
        
        