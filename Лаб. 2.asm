title lab2

org 100h

;27) (8*b+1-c)/(a/2+b*c)    
.data
a dw 2
b dw 4
c dw -2    
result dw 0

.code
mov ax,b 
mov bx,8
imul bx
mov cx,ax
mov ax,1
add cx,ax
mov ax,c
sub cx,ax   
mov ax,a
mov bx,2
cwd
idiv bx  
mov bx,ax 
mov ax,b
mov dx,c    
imul dx
add ax,bx
mov bx,ax
mov ax,cx
cwd
idiv bx
mov result,ax

ret




