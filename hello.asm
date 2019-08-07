.model tiny
.386
.stack 100h
.data 
    msg db 'Hello World', 0dh, 0ah, '$'
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        
        mov dx, offset msg
        mov ah, 9
        int 21h
        mov ah, 0
        int 16h
        
        .exit
    mainproc endp
end mainproc
        
        