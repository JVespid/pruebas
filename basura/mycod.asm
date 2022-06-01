;2021350792                  
  
;inicializando memoria en 0 

mov ah, 2  
mov al, 0 

mov bh, 0  
mov bl, 0 

mov ch, 0  
mov cl, 0 

mov dl, 0


; 2*2
add dl, ah
add dl, ah

mov ah, 0
            
; x*3 = m              
add al, dl
add al, dl
add al, dl
       
mov dl, 0  

; m*4 = y         
add bh, al
add bh, al
add bh, al
add bh, al
       
mov al, 0    
     
     
; y*5 = n         
add bl, bh 
add bl, bh 
add bl, bh 
add bl, bh 
add bl, bh  
       
mov bh, 0  
     
; n*6  = o         
add cl, bl;1
add cl, bl;2 
add cl, bl;3
add cl, bl;4
add cl, bl;5
add cl, bl;6 
       
mov bl, 0  


; o*7 = r         
add ch, cl;1
add ch, cl;2
add ch, cl;3
add ch, cl;4
add ch, cl;5
add ch, cl;6
add ch, cl;7  
          
; Moviendo el esultado a ah:          
mov ah, ch

