   

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 

            ORG   $4000


Entry:
_Startup:
           BSET   DDRP,%11111111
           BSET   DDRE,%00010000
           BCLR   PORTE,%00010000
        
  LOOP:    LDAA   PTS
           LSRA
           LSRA
           LSRA
           LSRA
           STAA   PTP
           BRA    LOOP
            
            
; code section
         
                    
;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
