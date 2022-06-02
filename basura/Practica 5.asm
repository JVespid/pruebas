
.model small 

.data 

.code    
          
    mov ah,02
    mov dl,2Dh
    int 21h
    mov ah,02
    mov dl,10h
    int 21h
    mov ah,02
    mov dl,1fh
    int 21h   
       
    mov ah,01
    int 21h
    mov ah,01
    int 21h
    mov ah,01
    int 21h        
    mov ah,01
    int 21h
    mov ah,01
    int 21h
    mov ah,01
    int 21h      
    mov ah,01
    int 21h 
    mov ah,01
    int 21h
             
         
    mov ah,02
    mov dl,1fh
    int 21h      
    mov ah,02
    mov dl,0eh
    int 21h
    mov ah,02
    mov dl,0eh
    int 21h   
     
    
    
    


.exit   