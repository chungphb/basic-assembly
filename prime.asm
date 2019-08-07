.model tiny
.386
.stack 100h
.data 
    n dw ?
    canN db ? 
    prime db "la so nguyen to$"
    notprime db 'khong la so nguyen to$'
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        call nhapSo
        call xapXiCan
        call soNguyenTo
        .exit
    mainproc endp
    
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
        pop n
        ret
    nhapSo endp
    
    xapXiCan proc
        mov dx, n
        mov cl, 1
      L1:
        mov al, cl
        mul cl
        cmp ax, dx
        ja endLoop
        inc cl
        jmp L1
      endLoop:
        dec cl
        mov canN, cl
        ret
    xapXiCan endp
    
    soNguyenTo proc near
        mov dx, n
        cmp dx, 2
        jl isNotPrime
        movzx cx, canN
      check:  
        cmp cl, 1
        je isPrime
        mov ax, dx
        div cl
        cmp ah, 0
        je isNotPrime
        loop check
      isPrime:
        lea dx, prime
        jmp next
      isNotPrime:
        lea dx, notprime
      next:
        mov ah, 9
        int 21h
    soNguyenTo endp
end mainproc
        
        