
;ingresar 5 letras


;programa
org 100h
.model smail

;variables ----------------------------------------------------------------
.data
obDato db ?
obNumero db ?
dato db ?
i db ?




Iterador db ?
iteradorFor db ?

txt dw 'ingresa 5 letras                                     ',10,13,'$'
error dw 'error no ingresaste una letra                        ',10,13,'$'

endl dw '.                                                     ', 10,13,'$'         

;codigo ----------------------------------------------------------------
.code

; macros ----------------------------------------------------------------
mover macro y, x
    mov ah, 02
    mov bh, 00
    mov dl, x
    mov dh, y
    int 10h
endm

figuras macro color, c, d
    mov ah, 06
    mov bh, color
    mov cx, c
    mov dx, d
    int 10h
endm 
    
IngresaDato macro
    mov ah, 01
    int 21h
    mov obDato, al
endm

IngresaNumero macro
    mov ah, 01
    int 21h
    mov obNumero, al
endm
    
Imprimir8 macro dato
    mov ah, 02
    mov dl, dato
    int 21h
endm

Imprimir16 macro dato
    mov ah, 02
    mov dx, dato
    int 21h
endm

Inicializar0 macro
    mov ax, 000
    mov bx, 000
    mov cx, 000
    mov dx, 000
    
endm
        
; A    Z    a     z
;65 - 90   97 - 122

inicio:
figuras 0Fh, 0000h, 184fh
mover 0000h, 0000h


mov ax, @data
mov ds, ax
mov dx, offset endl
mov ah, 09
int 21h


mov ax, @data
mov ds, ax
mov dx, offset txt
mov ah, 09
int 21h


mov cx, 5


repetir:

IngresaDato

mov al, obDato
mov dato, al


mov bl, 41h

cmp bl, dato
jl correcto1:
jnl err:
correcto1:
mov bl, 6ah

cmp dato,bl 
jl correcto2:
jnl err:  

correcto2:
mov bl, 61h

cmp bl, dato
jl correcto3:
jnl err:  

correcto3:
mov bl, 7ah

cmp dato, bl 
jl correcto4:
jnl err:


correcto4:
loop repetir:

jmp salir:



err:
mov ax, @data
mov ds, ax
mov dx, offset error
mov ah, 09
int 21h

jmp inicio:


salir:
.exit