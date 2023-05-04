title lab3

org 100h       

;27)      b/a-7, a>b
;    X =  43, a=b
;         (a^3-b)/b, a<b

.data
a dw -3
b dw -1
divZero db 0
result dw 0

.code
mov ax,a
mov bx,b
cmp ax,bx

jl lower
jg higher

; a=b
mov result,43
jmp short exit

; a<b  
lower:  
mov dx,a
imul dx  
mov dx,a
imul dx
sub ax,bx
cmp bx,0
je error
cwd
idiv bx
mov result,ax
jmp short exit

; a>b
higher:
cmp ax,0
je error
mov ax,bx
mov bx,a
cwd
idiv bx
sub ax,7
mov result,ax
jmp short exit

; /0
error:
mov divZero,1
ret      

exit:
ret




