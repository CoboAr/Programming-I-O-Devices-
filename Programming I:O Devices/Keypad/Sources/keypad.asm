   

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 

            ORG   $4000


Entry:
_Startup:
           BSET   DDRP,%11111111     ; Configure port P for output, all pins of port P are 1, able to output LED2 control
           BSET   DDRE,%00010000     ; Configure pin PE4 for output (enable only pin4)
           BCLR   PORTE,%00010000    ; Enable keypad, only pin4
        
  LOOP:    LDAA   PTS                ; Read a keycode into accumulator A
           LSRA                      ; Logical shift right acumulator A
           LSRA                      ; Logical shift right acumulator A
           LSRA                      ; Logical shift right acumulator A
           LSRA                      ; Logical shift right acumulator A
           STAA   PTP                ; Output the content of accumulator A to port P which controls LED2
           BRA    LOOP               ; Branch to LOOP
            
            
; code section
         
                    
;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
