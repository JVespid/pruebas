
.model smail
.data

v1 db ?
v2 dw ?

.code
;Imprimiendo Flecha Inicial
mov ah,02
mov dl,2Dh
int 21h
mov ah,02
mov dl,10h
int 21h
mov ah,02
mov dl,1fh
int 21h    

;Ingresando un dato
mov ah,01
int 21h
aas
mov ah, 0000h 
mov bh, al   

;imprimiendo signo /
mov ah,02
mov dl,2fh
int 21h


;Ingresando un dato
mov ah,01
int 21h
aas
mov ah, 0000h    
mov bl, al


;imprimiendo signo =
mov ah,02
mov dl,0f2h
int 21h  
;imprimiendo signo
mov ah,02
mov dl,1fh
int 21h  

  
; interrupcion para obtener el resultado --------------
mov ah, 0000h
mov al, bh 
div bl

mov ch, ah  

aam   
mov bx, ax
add bx, 3030h
mov cl, ah   
; interrupcion para obtener el resultado --------------
 
       
;imprimiendo decimal del resultado 
mov ah,02
mov dl,bh
int 21h
;imprimiendo unidad del resultado
mov ah,02
mov dl,bl
int 21h  

    
;Imprimiendo Flecha Inicial
mov ah,02
mov dl,2Dh
int 21h
mov ah,02
mov dl,10h
int 21h
mov ah,02
mov dl,1fh
int 21h
           
; interrupcion para obtener el residuo --------------
mov al, ch
aam
mov bx, ax   

add bx, 3030h     
; interrupcion para obtener el residuo --------------

            
;imprimiendo decena del residuo 
mov ah,02
mov dl,bh
int 21h     

;imprimiendo unidad del residuo 
mov ah,02
mov dl,bl
int 21h

.exit