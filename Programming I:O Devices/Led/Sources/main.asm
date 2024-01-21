

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 

            ORG   $4000


Entry:
_Startup:
            LDAA  #$FF         ; ACCA = $FF
            STAA  %00000011    ; CONFIG. PORT H FOR OUTPUT
            STAA  PERT
            
  LOOP:     LDAA  PTT     ; READ PORT T
            STAA  PTH     ; DISPLAY SW1 ON LED1 CONNECTED TO PORT 
            BRA   LOOP 
; code section
         
                    
;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
