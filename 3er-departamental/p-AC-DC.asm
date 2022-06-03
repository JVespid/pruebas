
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

coordTemp dw ?
valorResistenciaTemp dw ?

resistencia1 dw ?
resistencia2 dw ?
resistencia3 dw ?
resistencia4 dw ?
resistencia5 dw ?
resistencia6 dw ?


; textos ----------------------------------
Instruccion1 dw 'Ingresa los datos solicitados en la expresion                       ',10,13,'$'
Instruccion2 dw 'recuerda que M tiene que ser mayor que N                            ',10,13,'$'


errUsu1 dw 'Hubo un error de su parte, no siguio las instrucciones correctamente',10,13,'$'
errUsu2 dw 'Preciona una tecla para continuar:                                  ',10,13,'$'

endl dw '.                                                                       ',10,13,'$'





;codigo ----------------------------------------------------------------
.code

; macros ----------------------------------------------------------------
mover macro x, y
    mov ah, 02
    mov bh, 00
    mov dl, x
    mov dh, y
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



; Inicio de la ejecucion del programa -------------------------------
inicio:

ReiniciarPrograma:
;llamados macros para repintar la pantalla
figuras 0Fh, 0000h, 184fh
mover 0000h , 0000h
;reiniciando las variables y registros
Inicializar0

; Iniciando el codigo -------------------------------------------------------------
codigo:

; color cable           040h
; color resistencia     060h
; color apagador        0f0h                0f                   1f               2f            3f             4f
;                                        0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
;cable 040h, 0103h, 0900h, 0000h        __________________________________________________________________________________;
;marca 0                            ;1    ;              (0)                                                              ;
figuras 050h, 0103h, 0120h;         ;2    ;    ------------------------------
                                    ;3    ;    |                            
                                    ;4    ;    |                            
                                    ;5    ;    |                            
                                    ;6 0f ;    |                            
                                    ;7    ;    | (1)                        
                                    ;8    ;    |                            
                                    ;9    ;    |                            
;marca 1                            ;a    ;    |                            
figuras 050h, 0103h, 0a03h;         ;b    ;    *                            
mov lugar, 0a03h;                   ;c    ;   * * 1                         
apagador ;                          ;d    ;  *   *                          
                                    ;e    ;       *                         
;marca 2                            ;f    ;    *                            
figuras 050h, continuarCable, 1503h ;0    ;    |                            
                                    ;1    ;    |                            
                                    ;2 18 ;    | (2)                        
                                    ;3    ;    |                            
                                    ;4    ;    |                            
;marca 3                            ;5    ;    ------------------------------
figuras 050h, 1503h, 1520h          ;6    ;                (3)                                                            ;
                                    ;7    ;                                                                               ;
                                    ;8    ;                                                                               ;
                                    ;     ________________________________________________________________________________;
;marca 4
;marca 5
;marca 6
;marca 7
;marca 8
;marca 9
;marca 10
;marca 11
;marca 12
;marca 13




IngresaDato




; Fin de la ejecucion del programa -------------------------------
jmp salir:



salir:
.exit