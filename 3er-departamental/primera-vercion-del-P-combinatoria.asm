
; Bernardo Abel Lopez Sachez

; 2021350477

;programa
org 100h
.model smail

;variables
.data

obDato db ?
obNumero db ?

txt dw 'Ingresa los datos solicitados con la expresion',10,13,'$'

RFactorial dw ?
numero db ?
m db ?
n db ? 
Fm dw ?
Fn dw ?  
Rsuma dw ?
Rdivvicion dw ?

;codigo
.code


mover macro x y
    mov ah, 02
    mov bh, 00
    mov dl, x
    mov dh, y
    int 10h
endm

figuras macro color, c, d
    mov ah, 02
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


factorial macro numero
    Inicializar0
    
    mov cl, numero
    mov bl, 1
    mov al, 1
    
    inicioFact:
        mul bl
        add bl, 1 
    FinFac:
        loop InicioFact:
    
    mov RFactorial, ax
    
endm
    


mov cx, 10
mov bl, 30h 


inicio:

factorial 5


salir:






; imprimir una cadena de texto
mov ax, @data
mov ds, ax
mov dx, offset txt
mov ah, 09
int 21h





.exit