      

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 

            ORG   $4000


Entry:
_Startup:
           BSET   DDRP,%11111111
           LDAA   #%10000000
           
 MAINLOOP: STAA   PTP
           LDX    #$1FFF
   Delay:  DEX
           BNE    Delay
           EORA   #%10000000
           BRA    MAINLOOP
        
 
            
; code section
         
                    
;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
