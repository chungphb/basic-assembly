.model tiny
.386
.stack 100h
.data 
    a dw 25
    b dw 10
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        mov ax, a
        mov bx, b
        call subProc
        mov a, ax
        mov b, bx
        push a
        call writeDec
        push b
        call writeDec
        .exit
    mainproc endp
    
    subProc proc
        xchg ax, bx
        ret
    subProc endp
    
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
        
        