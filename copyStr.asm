.model tiny
.386
.stack 100h
.data 
    vec1 db "Hello$"
    len = $ - vec1
    vec2 db "Goodbye$"
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
       
        mov ax, ds
        mov es, ax      
        lea si, vec1
        lea di, vec2
        mov cx, len
        cld
        rep movsb
        call printStr
        .exit
    mainproc endp
    
    printStr proc
        mov ah, 9
        lea dx, vec2
        int 21h
        ret
    printStr endp
end mainproc
        
        