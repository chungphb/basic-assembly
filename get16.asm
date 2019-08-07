.model tiny
.386
.stack 100h
    
.data 

.code
    mainproc proc
        mov ax, @data
        mov ds, ax 

        push 0
    _do:
        mov ah, 0
        int 16h
        cmp al, 13
        je _enddo
        cmp al, 30h
        jl _do
        cmp al, 39h
        jg _or
        mov ah, 0eh
        int 10h
        sub al, 30h
        jmp _next
    _or:
        cmp al, 'a'
        jl _do
        cmp al, 'f'
        jg _do
        mov ah, 0eh
        int 10h
        sub al, 'a'
        add al, 10
    _next:
        xor bx, bx
        mov bl, al
        pop ax
        mov dx, 16
        mul dx
        add ax, bx
        push ax
        jmp _do
    _enddo:
        pop ax    
        .exit
    mainproc endp
end mainproc
        
        