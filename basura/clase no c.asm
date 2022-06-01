; Bernardo Abel Lopez Sachez

; 2021350477

.model small 

.data 

.code       

            
mov ah,01 
int 21h   
sub al, 30h 
mov ah, 0000h          


mov bl, al    


          
mov ah,02
mov dl,2Ah
int 21h   

            
            
mov ah,01 
int 21h   
sub al, 30h 
mov ah, 0000h  

mul bl 
   
mov cl, al       

aam

mov bx, ax   
 
add bx, 3030h 

             
mov ah,02
mov dl,0f2h
int 21h    


          
mov ah,02
mov dl,bh
int 21h 

mov ah,02
mov dl,bl
int 21h        





        


           