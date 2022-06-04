
; programa de resistencias en paralelo


;programa
org 100h
.model smail

;variables ----------------------------------------------------------------
.data
;variables de macros:
obDato db ?   
obNumero db ?
;variables de las etiquetas
continuarCable dw ?
Posicion dw ?
lugar dw ?

iterador db ?
numeroMayor db ?
numeroMayor1 db ?
numeroEditar db ?
mutiplicarmayor db ?
multiplicador db ?

u db ?
d db ?
c db ?


valoresValanceados db ?


coordTemp dw ?
Ibluclede6 dw ?
valorResistenciaTemp dw ?

resistencia1 dw ?
resistencia2 dw ?
resistencia3 dw ?
resistencia4 dw ?
resistencia5 dw ?
resistencia6 dw ?

DatoR1 db ?
DatoR2 db ?
DatoR3 db ?
DatoR4 db ?
DatoR5 db ?
DatoR6 db ?

DatoR11 db ?
DatoR21 db ?
DatoR31 db ?
DatoR41 db ?
DatoR51 db ?
DatoR61 db ?


; textos ---------------------------------- 
Instruccion1 dw 'calcula resistencias en paralelo                                     ',10,13,'$'
Instruccion2 dw 'recuerda que M tiene que ser mayor que N                            ',10,13,'$'


errUsu1 dw 'Hubo un error de su parte, no siguio las instrucciones correctamente',10,13,'$'
errUsu2 dw 'Preciona una tecla para continuar:                                  ',10,13,'$'

endl dw '.                                                                       ',10,13,'$'





;codigo ----------------------------------------------------------------
.code

; macros ----------------------------------------------------------------
mover macro cord
    mov ah, 02
    mov bh, 00
    mov dx, cord
    int 10h
endm

figuras macro color, c, d
    Inicializar0
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


; macros unicos para este programa ----------------------------------------------------------------

resistencia macro

    Inicializar0
    mov ax, lugar
    mov Posicion, ax

    Inicializar0

    figuras 060h, Posicion, Posicion

    add Posicion, 0001h
    add Posicion, 0100h
    figuras 060h, Posicion, Posicion

    sub Posicion, 0001h
    add Posicion, 0100h
    figuras 060h, Posicion, Posicion

    add Posicion, 0001h
    add Posicion, 0100h
    figuras 060h, Posicion, Posicion

    mov ax, Posicion
    mov coordTemp, ax
    add coordTemp, 0005h
    mover Posicion
    Imprimir8 1fh
    Imprimir8 1fh
    Imprimir8 52h
    Imprimir8 0f2h
    Imprimir8 1fh



    sub Posicion, 0001h
    add Posicion, 0100h
    figuras 060h, Posicion, Posicion

    add Posicion, 0100h
    mov ax, Posicion
    mov continuarCable, ax

endm

apagador macro
    Inicializar0
    mov ax, lugar
    mov Posicion, ax
    
    Inicializar0

    figuras 0f0h, Posicion, Posicion


    add Posicion, 0001h
    add Posicion, 0100h
    figuras 0f0h, Posicion, Posicion

    add Posicion, 0001h
    add Posicion, 0100h
    figuras 0f0h, Posicion, Posicion

    add Posicion, 0001h
    add Posicion, 0100h
    figuras 0f0h, Posicion, Posicion

    
    mov ax, lugar
    mov Posicion, ax
    figuras 0f0h, Posicion, Posicion

    sub Posicion, 0001h
    add Posicion, 0100h
    figuras 0f0h, Posicion, Posicion

    sub Posicion, 0001h
    add Posicion, 0100h
    figuras 0f0h, Posicion, Posicion

    
    mov ax, lugar
    mov Posicion, ax
    add Posicion, 0100h
    add Posicion, 0100h
    add Posicion, 0100h
    add Posicion, 0100h
    add Posicion, 0100h
    figuras 0f0h, Posicion, Posicion

    Inicializar0
    add Posicion, 0100h
    mov ax, Posicion
    mov continuarCable, ax
    
endm

;comparacion macro

;endm


; Inicio de la ejecucion del programa -------------------------------
inicio:

ReiniciarPrograma:
;llamados macros para repintar la pantalla
figuras 0Fh, 0000h, 184fh
mover 0000h
;reiniciando las variables y registros
Inicializar0
mov iterador, al


; imprimiendo la primer linea 
mov ax, @data
mov ds, ax
mov dx, offset Instruccion1
mov ah, 09
int 21h

; Iniciando el codigo -------------------------------------------------------------
codigo:


;codigo estetico FrontEnd ---------------------------------------------------------------------------------


; color cable           040h
; color resistencia     060h
; color apagador        0f0h        
;                                    ;       0f                   1f               2f            3f             4f
;                                        0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
;cable 040h, 0103h, 0900h, 0000h        __________________________________________________________________________________;
;marca 0                            ;0    ;              (0)                                                              ;
figuras 050h, 0103h, 0120h;         ;1    ;    -----------------------------
;                                   ;2    ;    |                            
;                                   ;3    ;    |                            
;                                   ;4    ;    |                            
;                                   ;5 0f ;    |                            
;                                   ;6    ;    | (1)                        
;                                   ;7    ;    |                            
;                                   ;8    ;    |                            
;marca 1                            ;9    ;    |                            
figuras 050h, 0103h, 0a03h;         ;a    ;    *                            
mov lugar, 0a03h;                   ;b    ;   * * 1                         
apagador ;                          ;c    ;  *   *                          
;                                   ;d    ;       *                         
;marca 2                            ;f    ;    *                            
figuras 050h, continuarCable, 1503h ;e    ;    |                            
;                                   ;f    ;    |                            
;                                   ;0 18 ;    | (2)                        
;                                   ;1    ;    |                            
;                                   ;2    ;    |                            
;marca 3                            ;3    ;    -----------------------------
figuras 050h, 1503h, 1520h          ;4    ;                (3)                                                            ;
figuras 050h, 0120h, 0420h          ;5    ;                                                                               ;
;                                   ;6    ;                                                                               ;
;                                   ;7    ;                                                                               ;
;                                   ;8    ;                                                                               ;
;                                   ;    _________________________________________________________________________________;
;marca 4
mov lugar, 0420h
resistencia
mov ax, coordTemp
mov resistencia1, ax

;marca 5
Inicializar0
mov ax, continuarCable
mov lugar, ax
add lugar, 0300h
figuras 050h, continuarCable, lugar

;marca 6+
resistencia 
mov ax, coordTemp
mov resistencia2, ax

;marca 7
figuras 050h, continuarCable, 1520h


;marca 8
figuras 050h, 1520h, 1530h
figuras 050h, 0120h, 0130h
figuras 050h, 0130h, 0430h

;marca 10
mov lugar, 0430h
resistencia
mov ax, coordTemp
mov resistencia3, ax

;marca 9
Inicializar0
mov ax, continuarCable
mov lugar, ax
add lugar, 0300h
figuras 050h, continuarCable, lugar


;marca 11
resistencia 
mov ax, coordTemp
mov resistencia4, ax

;marca 12
figuras 050h, continuarCable, 1530h




;marca 8
figuras 050h, 1520h, 1540h
figuras 050h, 0120h, 0140h
figuras 050h, 0140h, 0440h

;marca 10
mov lugar, 0440h
resistencia
mov ax, coordTemp
mov resistencia5, ax

;marca 9
Inicializar0
mov ax, continuarCable
mov lugar, ax
add lugar, 0300h
figuras 050h, continuarCable, lugar


;marca 11
resistencia 
mov ax, coordTemp
mov resistencia6, ax

;marca 12
figuras 050h, continuarCable, 1540h


mover 0305h
Imprimir8 52h
Imprimir8 1fh
Imprimir8 1fh
Imprimir8 0f2h
mover 0406h
Imprimir8 54h





;codigo funcional BackEnd ---------------------------------------------------------------------------------



obtenerVarloResistencias:

    mover resistencia1
    IngresaNumero
    mov al, obNumero
    mov DatoR1, al

    mover resistencia2
    IngresaNumero
    mov al, obNumero
    mov DatoR2, al

    mover resistencia3
    IngresaNumero
    mov al, obNumero
    mov DatoR3, al

    mover resistencia4
    IngresaNumero
    mov al, obNumero
    mov DatoR4, al

    mover resistencia5
    IngresaNumero
    mov al, obNumero
    mov DatoR5, al

    mover resistencia6
    IngresaNumero
    mov al, obNumero
    mov DatoR6, al


    mov al, 1
    mov iterador, al






    mov al, 0
    mov numeroMayor, al

    inicializaI1:
    mov al, 0
    mov iterador, al

    blucleMayorque1:
    add iterador, 1

    b1:
    cmp iterador, 1
    je inicializar1:
    jne b2:

    b2:
    cmp iterador, 2
    je inicializar2:
    jne b3:

    b3:
    cmp iterador, 3
    je inicializar3:
    jne b4:

    b4:
    cmp iterador, 4
    je inicializar4:
    jne b5:

    b5:
    cmp iterador, 5
    je inicializar5:
    jne b6:

    b6:
    cmp iterador, 6
    je inicializar6:
    jne inicializaI1:


    inicializar1:
    mov al, DatoR1
    mov numeroMayor, al
    jmp continuarblucle1
    inicializar2:
    mov al, DatoR2
    mov numeroMayor, al
    jmp continuarblucle1
    inicializar3:
    mov al, DatoR3
    mov numeroMayor, al
    jmp continuarblucle1
    inicializar4:
    mov al, DatoR4
    mov numeroMayor, al
    jmp continuarblucle1
    inicializar5:
    mov al, DatoR5
    mov numeroMayor, al
    jmp continuarblucle1
    inicializar6:
    mov al, DatoR6
    mov numeroMayor, al
    jmp continuarblucle1





    continuarblucle1:
    mov al, DatoR1
    cmp numeroMayor, al
    je mayorTrue1:   ;si son iguales salta
    jb mayorFalse:  ;si el segundo es mayor
    ja mayorTrue1:    ;Si el segundo es menor

    mayorTrue1:
    mov al, DatoR2
    cmp numeroMayor, al
    je mayorTrue2:   ;si son iguales salta
    jb mayorFalse:  ;si el segundo es mayor
    ja mayorTrue2:    ;Si el segundo es menor


    mayorTrue2:
    mov al, DatoR3
    cmp numeroMayor, al
    je mayorTrue3:   ;si son iguales salta
    jb mayorFalse:  ;si el segundo es mayor
    ja mayorTrue3:    ;Si el segundo es menor


    mayorTrue3:
    mov al, DatoR4
    cmp numeroMayor, al
    je mayorTrue4:   ;si son iguales salta
    jb mayorFalse:  ;si el segundo es mayor
    ja mayorTrue4:    ;Si el segundo es menor


    mayorTrue4:
    mov al, DatoR5
    cmp numeroMayor, al
    je mayorTrue5:   ;si son iguales salta
    jb mayorFalse:  ;si el segundo es mayor
    ja mayorTrue5:    ;Si el segundo es menor


    mayorTrue5:
    mov al, DatoR6
    cmp numeroMayor, al
    
    je mayorTrue:   ;si son iguales salta
    jb mayorFalse:  ;si el segundo es mayor
    ja mayorTrue:    ;Si el segundo es menor


    mayorTrue:
    mov cx, 1
    jmp blucleMayorque1Fin:



    mayorFalse:
    mov cx, 2
    jmp blucleMayorque1Fin:


    blucleMayorque1Fin:
    loop blucleMayorque1:




Inicializar0

mov bl, 1
mov mutiplicarmayor, bl

mov bl, 1

mov DatoR11, bl
mov DatoR21, bl
mov DatoR31, bl
mov DatoR41, bl
mov DatoR51, bl
mov DatoR61, bl


InicializacionBucle2:
Inicializar0
mov iterador, al
mov valoresValanceados, al
mov cx, 6
mov Ibluclede6, cx


InicioBucle2:
mov Ibluclede6, cx
mov al, 1
mov multiplicador, al

_blucleMayorque1:
add iterador, 1

_b1:
cmp iterador, 1
je _inicializar1:
jne _b2:

_b2:
cmp iterador, 2
je _inicializar2:
jne _b3:

_b3:
cmp iterador, 3
je _inicializar3:
jne _b4:

_b4:
cmp iterador, 4
je _inicializar4:
jne _b5:

_b5:
cmp iterador, 5
je _inicializar5:
jne _b6:

_b6:
cmp iterador, 6
je _inicializar6:
jne valanceo:

valanceo:
cmp valoresValanceados, 6
je InicializacionBucle2:
jne salirbucle2:




_inicializar1:
mov al, DatoR1
mov numeroEditar, al
jmp next1:
_inicializar2:
mov al, DatoR2
mov numeroEditar, al
jmp next1:
_inicializar3:
mov al, DatoR3
mov numeroEditar, al
jmp next1:
_inicializar4:
mov al, DatoR4
mov numeroEditar, al
jmp next1:
_inicializar5:
mov al, DatoR5
mov numeroEditar, al
jmp next1:
_inicializar6:
mov al, DatoR6
mov numeroEditar, al
jmp next1:

next1:

;DatoR1
;numeroMayor
;numeroEditar



bucleAnidadoI1:


    igualarbucleI1:



    mov al, numeroEditar
    mov bl, multiplicador
    mul bl
    cmp numeroMayor1, al    
    je _true1:   ;si son iguales salta
    jb _false1:  ;si el segundo es mayor
    ja _true2:    ;Si el segundo es menor


    _false1:
    add mutiplicarmayor, 1
    mov al, numeroMayor
    mov bl, mutiplicarmayor
    mul bl
    mov numeroMayor1, al
    jmp InicializacionBucle2:


    _true2:
    add multiplicador, 1
    mov cx, 2
    jmp igualarbucleF1:



    _true1:


        _b11:
        cmp iterador, 1
        je _inicializar11:
        jne _b21:

        _b21:
        cmp iterador, 2
        je _inicializar21:
        jne _b31:

        _b31:
        cmp iterador, 3
        je _inicializar31:
        jne _b41:

        _b41:
        cmp iterador, 4
        je _inicializar41:
        jne _b51:

        _b51:
        cmp iterador, 5
        je _inicializar51:
        jne _b61:

        _b61:
        cmp iterador, 6
        je _inicializar61:
        jne InicializacionBucle2:

        
        _inicializar11:
        mov al, multiplicador
        mov DatoR11, al
        jmp next2:
        _inicializar21:
        mov al, multiplicador
        mov DatoR21, al
        jmp next2:
        _inicializar31:
        mov al, multiplicador
        mov DatoR31, al
        jmp next2:
        _inicializar41:
        mov al, multiplicador
        mov DatoR41, al
        jmp next2:
        _inicializar51:
        mov al, multiplicador
        mov DatoR51, al
        jmp next2:
        _inicializar61:
        mov al, multiplicador
        mov DatoR61, al
        jmp next2:
        
        next2:
        add valoresValanceados, 1
        mov cx, 1
        jmp igualarbucleF1:








    ;fin del tercer bucle
    igualarbucleF1:
    loop igualarbucleI1:
    jmp bucleAnidadoF1:





;fin del segundo bucle
bucleAnidadoF1:
;loop bucleAnidadoI1:
jmp FinalBucle2:




salirbucle2:
mov cx, 1
mov Ibluclede6, cx
jmp FinalBucle2:


;fin del primer bucle
FinalBucle2:
mov cx, Ibluclede6
loop InicioBucle2:


mover 030bh


add DatoR11, DatoR21
add DatoR11, DatoR31
add DatoR11, DatoR41
add DatoR11, DatoR51
add DatoR11, DatoR61



mov al, DatoR11

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


Imprimir8 1fh

Imprimir8 c
Imprimir8 d
Imprimir8 u

mov al, numeroMayor1

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

Imprimir8 1fh
Imprimir8 02fh
Imprimir8 1fh



Imprimir8 c
Imprimir8 d
Imprimir8 u










; Fin de la ejecucion del programa -------------------------------
jmp salir:



salir:
.exit