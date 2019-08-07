.model tiny
.386
.stack 100h
.data 
    msg db 100 dup(?)
    len db ?
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        call nhapXau
        call daoXau
        call inXau
        .exit
    mainproc endp
    
    nhapXau proc
        mov ax, ds
        mov es, ax
        lea di, msg
      _do:  
        mov ah, 0
        int 16h
        cmp al, 13
        je _end
        mov ah, 0eh
        int 10h
        stosb
        jmp _do
      _end: 
        mov al, '$'
        stosb
        ret
    nhapXau endp
    
    daoXau proc
        mov ax, ds
        mov es, ax
        
        lea si, msg
        xor cx, cx
        xor ax, ax
      L1:
        lodsb
        push ax
        inc cx
        cmp al, '$'
        jne L1
        pop ax
        dec cx
        lea di, msg
      L2:
        pop ax
        stosb
        loop L2
        ret
    daoXau endp
    
    inXau proc
        mov ah, 9
        lea dx, msg
        int 21h
        ret
    inXau endp
end mainproc
        
        