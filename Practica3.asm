
;5 multiplicaciones de 4 bits cada factor.

mov ax,0000   
mov bx,0000
               
 
;No: 1 
mov al, 1011b
mov bl, 1001b
mul bl     
 
;No: 2 
mov al, 1111b   
mov bl, 0111b
mul bl
 
;No: 3 
mov al, 1111b   
mov bl, 0011b
mul bl
 
;No: 4 
mov al, 1110b   
mov bl, 1111b
mul bl
 
;No: 5 
mov al, 1111b   
mov bl, 0100b
mul bl


;5 multiplicaciones sucesivas de 4 bits cada factor.

mov ax,0000          
         
         
mov ax, 1110b
mov bl, 1001b
mov bh, 1111b
mov cl, 1000b
mov ch, 1011b 
mov dl, 0011b



mul dl; 1  
mul bl; 2
mul bh; 3
mul cl; 4
mul ch; 5
  



;5 multiplicaciones de 8 bits cada factor. 

mov ax,0000   
mov bx,0000
       
               
;No: 1 
mov al, 00011010b
mov bl, 00101111b
mul bl     
        
;No: 2 
mov al, 10011010b
mov bl, 01101001b
mul bl     
        
;No: 3 
mov al, 01011010b
mov bl, 10101101b
mul bl     
        
;No: 4 
mov al, 01111010b
mov bl, 00111011b
mul bl     
        
;No: 5 
mov al, 11011010b
mov bl, 10100111b
mul bl     
        


;5 multiplicaciones sucesivas de 8 bits cada factor. 

mov ax,0000
       
        
mov ax, 1010b  
mov bl, 1001b
mov bh, 0110b
mov cl, 1000b
mov ch, 0011b 
mov dl, 1111b



mul dl  
mul bl
mul bh
mul cl
mul ch
  


;5 multiplicaciones de 12 bits cada factor.         

mov ax,0000   
mov bx,0000   
       
               
;No: 1 
mov ax, 100100011010b
mov bx, 001101101111b
mul bx     
       
               
;No: 2 
mov ax, 001100000010b
mov bx, 101100101111b
mul bx     
       
               
;No: 3 
mov ax, 010100010010b
mov bx, 101111101111b
mul bx     
       
               
;No: 4 
mov ax, 011100011010b
mov bx, 001101101111b
mul bx     
       
               
;No: 5 
mov ax, 000101011010b
mov bx, 001100100011b
mul bx     
        
       


;5 multiplicaciones sucesivas de 12 bits cada factor. 

mov ax, 101111100011b  
                     
mov bx, 000100011110b
mov cx, 111111011000b
mov dx, 011100011111b 


mul bx

mul cx

mul dx

mul cx

mul bx



;5 multiplicaciones de 16 bits cada factor.       

mov ax,0000   
mov bx,0000   
             
               
;No: 1 
mov ax, 0001000100011010b
mov bx, 0101001100101111b
mul bx     
         
               
;No: 2 
mov ax, 1101110101011010b
mov bx, 0101001111101111b
mul bx     
         
               
;No: 3 
mov ax, 1101000111011010b
mov bx, 1100001100101111b
mul bx     
         
               
;No: 4 
mov ax, 0001110000001010b
mov bx, 0001001101001111b
mul bx     
         
               
;No: 5 
mov ax, 1001000100011010b
mov bx, 1111001110110000b
mul bx     
         
     

;5 multiplicaciones sucesivas de 16 bits cada factor 

mov ax, 0011101000100011b  
                     
mov bx, 1001011111011110b
mov cx, 1010000111011000b
mov dx, 1000010100000011b 


mul bx

mul cx

mul dx

mul cx

mul bx

 

