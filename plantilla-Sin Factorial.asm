
;programa
org 100h
.model smail

;variables ----------------------------------------------------------------
.data
;variables de macros:
obDato db ?   
obNumero db ?
;variables de las etiquetas


Instruccion1 dw 'Ingresa los datos solicitados en la expresion                       ',10,13,'$'
Instruccion2 dw 'recuerda que M tiene que ser mayor que N                            ',10,13,'$'


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
    sub al, 30h
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
Inicializar0

; imprimiendo la primer linea 
mov ax, @data
mov ds, ax
mov dx, offset endl
mov ah, 09
int 21h


; aqui va todo el codigo -------------------------------------------------------------
codigo:




; Fin de la ejecucion del programa -------------------------------
jmp salir:
;Aqui van todas las etiquetas




salir:
.exit
