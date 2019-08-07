.model tiny
.386
.stack 100h
.data 
    var db 0, 0, 0, 2, 3, 5, 7
    len = $ - var
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        mov cx, len
        xor si, si
      L1:
        cmp var[si], 0
        jz zero
        mov ax, si
        jmp next
      zero:
        inc si
        loop L1
      next:
        call writeDec
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
        
        