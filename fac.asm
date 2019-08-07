.model tiny
.386
.stack 100h
.data 
    n db 10
    fac dd ?
.code
    mainProc proc
        mov ax, @data
        mov ds, ax 

        movzx ecx, n
        mov eax, 1 
    L1:
        mul ecx
        loop L1
        mov fac, eax
        call writeDec
        .exit
    mainProc endp
    
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
        
        