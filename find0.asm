.model tiny
.386
.stack 100h
.data 
    vec dw 34, 50, 24, -57, 22, 0, 20
    len = ($ - vec)/type vec
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        
        mov ax, ds
        mov es, ax
        
        lea di, vec
        mov si, di
        mov ax, 0
        mov cx, len
        repne scasw
        jnz notExist
        sub di, type vec
        sub di, si
        shr di, 1
        push di
        call writeDec
      notExist:
        .exit
    mainproc endp
    
    writeDec proc near
        push bp
        mov bp, sp
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
        pop bp
        ret 2
    writeDec endp
end mainproc
        
        