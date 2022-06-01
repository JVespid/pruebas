
org 100h
.model small
.data      
var1 db ?
var2 db ? 
instruccion1 db 'Ingresando un dato',13,10,'$'
.code

mov var1, 10
mov var2, 10    
mov al, var1

cmp var1, al ;instruccion de comparacionl cmp ax, bx
jmp WA_HA_HA:;jump
;je ;jumpo, ecual
;jne ;jump no ecua

mov ah, h1




;etiquetas
; nombre}:
;codigo de esa etiqueta

WA_HA_HA:        
mov ax, @data
mov ds, ax
mov dx, offset instruccion1
mov ah, 09
int 21h

mov ah, 1
int 21h

.exit