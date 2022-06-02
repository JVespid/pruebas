
; Bernardo Abel Lopez Sachez

; 2021350477

;programa
org 100h
.model smail

;variables ----------------------------------------------------------------
.data
;variables de macros:
obDato db ?   
obNumero db ?
;variables de las etiquetas
Factorial16ax dd ?
Factorial16dx dw ?
Iterador db ?
numero db ?


Instruccion1 dw 'Ingresa los datos solicitados en la expresion                       ',10,13,'$'
Instruccion2 dw 'recuerda que M tiene que ser mayor que N                            ',10,13,'$'


errUsu1 dw 'Hubo un error de su parte, no siguio las instrucciones correctamente',10,13,'$'
errUsu2 dw 'Preciona una tecla para continuar:                                  ',10,13,'$'

endl dw '.                                                                       ',10,13,'$'





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



; Inicio de la ejecucion del programa -------------------------------
inicio:

ReiniciarPrograma:
;llamados macros para repintar la pantalla
figuras 0Fh, 0000h, 184fh
mover 0000h , 0000h
;reiniciando las variables y registros
mov iterador, 0
mov numero, 0
Inicializar0

; imprimiendo la primer linea 
mov ax, @data
mov ds, ax
mov dx, offset endl
mov ah, 09
int 21h


; Iniciando el codigo -------------------------------------------------------------
codigo:



; funciones para factorial
PrimerFactorial:


Segundofactorial:



; Fin de la ejecucion del programa -------------------------------
jmp salir:
; etiqueta para calcular el factorial
factorial:
Inicializar0
add Iterador, 1
mov cl, numero
mov ax, 1
mov bx, 1
; etiquetas del buble para el factorial -------------------------------
inicioFact:
    mul bx
    add bx, 1 
FinFac:
    loop InicioFact:
    mov Factorial16ax, ax
    mov Factorial16dx, dx

: comparardo, para ver en cual etiqueta terminaria
cmp Iterador, 1
je PrimerFactorial:
jne factorialCMP2:
factorialCMP2:

cmp Iterador, 2
je Segundofactorial:
jne errorUsuario:




; mensaje de error que envia al inicio del programa para empezar de 0
errorUsuario:
mover 0, 0
figuras 0ch, 0005h, 0544h

mov ax, @data
mov ds, ax
mov dx, offset errUsu1
mov ah, 09
int 21h

mov ax, @data
mov ds, ax
mov dx, offset errUsu2
mov ah, 09
int 21h

ingresaDato
Inicializar0
jmp ReiniciarPrograma:


salir:
.exit