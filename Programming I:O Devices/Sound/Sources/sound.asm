      

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 

            ORG   $4000


Entry:
_Startup:
           BSET   DDRP,%11111111   ; Configure all pins of PORT P for outup
           LDAA   #%10000000       ; Prepare to turn Pin7 of PORT P high (1)
           
 MAINLOOP: STAA   PTP              ; Turn Pin7 of PORT P high (1)
           LDX    #$1FFF           ; Initialize the loop counter to 0001111111111111
   Delay:  DEX                     ; Decrement the loop counter
           BNE    Delay            ; If x not equal to 0, branch to loop Delay
           EORA   #%10000000       ; Toogle the most significant bit of accumulator A, turn it into 0
           BRA    MAINLOOP         ; Branch to MAINLOOP
        
 
            
; code section
         
                    
;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
