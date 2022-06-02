
;programa
org 100h
.model smail

;variables ----------------------------------------------------------------
.data
;variables de macros:
obDato db ?   
obNumero db ?

Factorial32 dd ?
Factorial8dx dw ?




numero db ?
u db ?
d db ?
c db ?





Iterador db ?
iteradorFor db ?

Instrucciones dw 'Ingresa los datos solicitados en la expresion                       ',10,13,'$'
Instrucciones2 dw 'recuerda que M tiene que ser mayor que N                            ',10,13,'$'


p1 dw ' n       m!                                                         ',10,13,'$'
p2 dw 'V = ------------                                                    ',10,13,'$'
p3 dw ' m    ( m-n )!                                                      ',10,13,'$'

errUsu1 dw 'Hubo un error de su parte, no siguio las instrucciones correctamente',10,13,'$'
errUsu2 dw 'Preciona una tecla para continuar: ',10,13,'$'

endl dw '.                                                                   ',10,13,'$'

Factorial8ax dw ?


m db ?
n db ? 
Rresta db ?


FMAX dw ?
FMDX dw ?
FRresta dw ?


Rdivicion dw ?

RdivicionMSG dw '    El resultado esta guardado en la variable Rdivicion             ',10,13,'$'



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

ReiniciarPprograma:
figuras 0Fh, 0000h, 184fh
mov iterador, 0
mov iteradorFor, 0
mov m, 0
mov n, 0

Inicializar0

mover 0000h , 0000h

mov ax, @data
mov ds, ax
mov dx, offset endl
mov ah, 09
int 21h


; imprimiendo formula -------------------------------------------
ImprimiendoFormula:
add IteradorFor, 1

mov ax, @data
mov ds, ax
mov dx, offset p1
mov ah, 09
int 21h

mov ax, @data
mov ds, ax
mov dx, offset p2
mov ah, 09
int 21h

mov ax, @data
mov ds, ax
mov dx, offset p3
mov ah, 09
int 21h

cmp IteradorFor, 1
je PosFormula1:;jumpo, ecual
jne PosFormula2:;jump no ecua



PosFormula1:

mov ax, @data
mov ds, ax
mov dx, offset endl
mov ah, 09
int 21h

mov ax, @data
mov ds, ax
mov dx, offset Instrucciones
mov ah, 09
int 21h
mov ax, @data
mov ds, ax
mov dx, offset Instrucciones2
mov ah, 09
int 21h

mov ax, @data
mov ds, ax
mov dx, offset endl
mov ah, 09
int 21h


jmp ImprimiendoFormula:

PosFormula2:

; ingresando numero, N y M respectivamente --------------------------

;ingresando dato N
mover 08h, 02h  
IngresaNumero 
mov al, obNumero
mov n, al

mover 0ah, 0bh
Imprimir8 n

;ingresando dato M
mover 0ah, 02h  
IngresaNumero
mov al, obNumero
mov m, al

; compararndo si se cumple la condicional
mov al, m
cmp n, al
jl continuarMNCorrectos:
jnl errorUsuario:


continuarMNCorrectos:
mover 0ah, 09h
Imprimir8 m
mover 08h, 0ah
Imprimir8 m


; Iniciando los factoriales: -----------------------------------------------------------
; factorial de m simple -----------------------------------------------------------
mov al, m
sub al, 30h
mov numero, al
jmp factorial:
PrimerFactorial:
mov bx,Factorial8ax
mov FMAX, bx
mov dx, Factorial8dx
mov FMDX, dx


; factorial de la suma de m y n
Inicializar0
mov al, m
sub al, n
mov Rresta, al

mov al, Rresta
mov numero, al
jmp factorial: 
Segundofactorial:
mov bx,Factorial8ax
mov FRresta, bx



; divicion entre un factorial de 32 bits y uno de 16 bits

MOV DX,FMDX
MOV AX,FMAX
MOV BX,FRresta

DIV BX

mov Rdivicion, AX



mover 09h, 12h
Inicializar0


cmp Rdivicion, 00ffh
jl resultadoImprimible:
jnl resultadoNoImprimible:


resultadoImprimible:



mov ax, Rdivicion
aam

add al, 30h
mov u, al
mov al, ah
aam

add al, 30h
mov d, al
mov al, ah
aam

add al, 30h
mov c, al

Imprimir8 0f2h
Imprimir8 1fh
Imprimir8 c
Imprimir8 d
Imprimir8 u




; Fin de la ejecucion del programa -------------------------------
jmp salir:


resultadoNoImprimible:

Imprimir8 0f2h
Imprimir8 1fh
mov ax, @data
mov ds, ax
mov dx, offset RdivicionMSG
mov ah, 09
int 21h


; Fin de la ejecucion del programa -------------------------------
jmp salir:

; etiquetas del buble para el factorial -------------------------------



factorial:

Inicializar0
add Iterador, 1
mov cl, numero
mov ax, 1
mov bx, 1

inicioFact:
    mul bx
    add bx, 1 
FinFac:
    loop InicioFact:
    mov Factorial8ax, ax
    mov Factorial8dx, dx

cmp Iterador, 1
je PrimerFactorial:;jumpo, ecual
jne Segundofactorial:;jump no ecual



errorUsuario:
mover 0, 0
figuras 0ch, 0005h, 0044h

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
jmp ReiniciarPprograma:







salir:
.exit