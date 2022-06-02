
;programa
org 100h
.model smail
;variables ----------------------------------------------------------------
.data

;codigo ----------------------------------------------------------------
.code
; macros ----------------------------------------------------------------

figuras macro color, c, d
    mov ah, 06
    mov bh, color
    mov cx, c
    mov dx, d
    int 10h
endm 


inicio:

figuras 0eeh, 0000h, 1800h


jmp salir:



salir:
.exit