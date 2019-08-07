.model tiny
.386
.stack 100h
.data 
    arr db 1, 2, 3, 4, 5, 6, 7, 8, 9, 0
    len = $ - arr 
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        
        mov ax, ds
        mov es, ax
        
        lea di, arr
        mov si, din
        mov cx, len
        cld
      L:
        lodsb
        shl al, 4
        stosb
        loop L
        .exit
    mainproc endp
    
    writeDec proc
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
        ret
    writeDec endp
end mainproc
        
        