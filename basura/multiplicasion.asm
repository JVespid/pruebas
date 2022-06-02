
.model small 

.data 

.code 

mov ah, 01
int 21h    
sub al, 30h 

mov bl, al     
 
mov ah, 01
int 21h    
sub al, 30h 

add bl, al 
mov dl, bl   

 
mov ah, 01
int 21h    
sub al, 30h 

sub bl, al 

mov dl, bl   ;guardando el resultado de la suma


                 
            
               ;multiplicasion
mov ah, 01
int 21h    
sub al, 30h

mul bl  
mov bl, al        

                

mov ah, 01
int 21h    
sub al, 30h 

mul bl
mov bl, al    



sub dl, bl  ; Restando la suma y la multiplicasion
mov al, dl  ; moviendo el resultado a AL
  
