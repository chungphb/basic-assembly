.model tiny
.386
.stack 100h
.data 
    date = 2159h
.code
    mainproc proc
        mov ax, @data
        ; In ngay
        mov ax, date
        and ax, 31
        call writeDec 
        
        ; In thang
        mov ax, date
        and ax, 01e0h
        shr ax, 5
        call writeDec 
        
        ; In nam
        mov ax, date
        and ax, 07e00h
        shr ax, 9
        add ax, 1980
        call writeDec 
        .exit
    mainproc endp
    
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
        
        