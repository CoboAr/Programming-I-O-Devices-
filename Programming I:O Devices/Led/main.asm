

;export symbols
            XDEF Entry, _Startup            ;export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



;Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 

            ORG   $4000


Entry:
_Startup:

         LDAA   #$FF       ;ACCA = $FF = 11111111
         STAA   DDRH       ;STORE DATA OF A IN DATA DIRECTORY REGISTER H, CONFIGURE PORT H FOR OUTPUT
         STAA   PERT       ;ENABLE THE PULL UP RESISTORS OF PORT T, PORT T IS CONNECTED WITH SWITCHES 
         
       
 LOOP:   LDAA   PTT        ;READ PORT T
         STAA   PTH        ;DISPLAY SW1 ON LED1 CONNECTED TO PORT H
         BRA    LOOP       ;BRANCH TO LOOP
 
            
;code section
         
                    
;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
