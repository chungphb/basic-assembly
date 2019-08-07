.model tiny
.386
.stack 100h
.data 
    msg db "heLLo WOrLd!$"
    len = ($ - msg)
.code
    mainproc proc
        mov ax, @data
        mov ds, ax 
        
        mov ax, ds
        mov es, ax
        
        lea di, msg
        mov si, di
        mov cx, len
        cld
      convert:
        lodsb
        cmp al, 'A'
        jb notUpper
        cmp al, 'Z'
        ja notUpper
        or al, 20h
      notUpper:
        stosb
        loop convert
        mov ah, 9
        lea dx, msg
        int 21h
        .exit
    mainproc endp
end mainproc
        
        