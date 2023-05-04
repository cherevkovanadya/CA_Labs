org 100h

.data
A dw 4, -6, 0, 1, -2, 10, -8, -2, 1
c dw -6
d dw 8    
L dw 4
count_neg dw 0
result dw 1

.code
main proc
mov cx, @data
mov ds, cx

lea si, A  
add si, 9  
add si, 9
sub si, 2
mov cx, 9

mov ax, 1

compare:   
    mov bx, count_neg    
    cmp bx, L
    jg skip 
    je skip  
                  
    mov bx, c    
    cmp word ptr [si], bx
    jl skip               
    mov bx, d
    cmp word ptr [si], bx
    jg skip  
         
    cmp word ptr [si], 0
    jl mult  
    jg skip
    je skip        
        
mult:
    inc count_neg 
    imul word ptr [si]  
    jmp skip

skip:
    sub si, 2   
    
loop compare
 
mov result, ax           

test ax, ax
jns oi1

mov cx, ax
mov ah, 02h
mov dl, '-'
int 21h
mov ax, cx
neg ax

oi1:  
    xor cx, cx
    mov bx, 10
oi2:
    xor dx,dx
    div bx    
    push dx
    inc cx  
    test ax, ax
    jnz oi2
    mov ah, 02h

oi3:
    pop dx
    cmp dl,9
    jbe oi4
    add dl,7 

oi4:
    add dl, '0'
    int 21h
    
loop oi3 

main endp
    
ret
