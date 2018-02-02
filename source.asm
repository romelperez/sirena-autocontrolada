;------------------------------------------------------------
; Código assembler generado por Niple V5.1.0
; Nombre del Proyecto: Sirena Autocontrolada
; Autor: Romel Francisco Perez Estrada
; Fecha: 10/09/2011
; PIC: 16F84
; Velocidad de reloj: 4 Mhz
; Descripcion: Autocontrol para Sirena, funcional y manejable.
; Institucion: Instituto Tecnico Industrial Laureano Gomez Castro
;------------------------------------------------------------


 LIST    P=PIC16F84


_XT_OSC               equ  0x3FFD
_WDT_OFF              equ  0x3FFB
_PWRTE_ON             equ  0x3FF7
_CP_OFF               equ  0x3FFF

 __config _XT_OSC & _WDT_OFF & _PWRTE_ON & _CP_OFF


;------------------------------------------------------------
;                  Declaración de Registros
;------------------------------------------------------------
w                     equ  00h
status                equ  0x03
porta                 equ  0x05
portb                 equ  0x06
pclath                equ  0x0a
_np_tiempo            equ  0x0c
_np_tiempo1           equ  0x0f
_np_tiempo2           equ  0x10
_np_tiempo3           equ  0x11
cont                  equ  0x13
trisa                 equ  0x85
trisb                 equ  0x86


;------------------------------------------------------------
;                  Declaración de Bits
;------------------------------------------------------------
c                     equ  0   ;carry / borrow bit
ra0                   equ  0   ;bit 0 del puerto a
ra1                   equ  1   ;bit 1 del puerto a
ra2                   equ  2   ;bit 2 delpuerto a
rb0_int               equ  0   ;bit 0 del puerto b
rb1                   equ  1   ;bit 1 del puerto b
rb2                   equ  2   ;bit 2 delpuerto b
rb3                   equ  3   ;bit 3 del puerto b
rb4                   equ  4   ;bit 4 del puerto b
rb5                   equ  5   ;bit 5 del puerto b
rb6                   equ  6   ;bit 6 del puerto b
rb7                   equ  7   ;bit 7 del puerto b
rp0                   equ  5   ;registrer bank select bit
rp1                   equ  6   ;registrer bank select bit
z                     equ  2   ;bit cero


;------------------------------------------------------------
;                        Inicio
;------------------------------------------------------------

reset   org 0
   goto paso2


;------------------------------------------------------------
;                      programa principal
;------------------------------------------------------------
paso2
   movlw b'00011111'                ;configurar el puerto a como xxxeeeee
   bsf status,rp0                   ;cambiar a banco 1
   movwf trisa
   movlw b'00000000'                ;configurar el puerto b como ssssssss
   movwf trisb
   ;escribir en el puerto b
   movlw b'00000000'
   bcf status,rp0                   ;cambiar a banco 0
   movwf portb
   movlw .5                         ;temporizador 5 seg
   call tiempo_1_255_mega_c
   btfss porta,ra0                  ;si el bit ra0 = 0
   goto paso10
   bsf portb,rb1
   call usr_hor1
   goto end
paso10
   btfss porta,ra1                  ;si el bit ra1 = 0
   goto paso13
   bsf portb,rb2
   call usr_hor2
paso13
   btfss porta,ra2                  ;si el bit ra2 = 0
   goto paso16
   bsf portb,rb3
   call usr_hor3
paso16
   sleep


;------------------------------------------------------------
;                  Declaración de Subrutinas
;------------------------------------------------------------

usr_hor1
   call usr_sirena1
   bcf portb,rb4
   bcf portb,rb5
   bcf portb,rb6
   bsf portb,rb7
   call usr_min55
   call usr_sirena1
   bcf portb,rb4
   bcf portb,rb5
   bsf portb,rb6
   bcf portb,rb7
   call usr_min55
   call usr_sirena1
   bsf portb,rb4
   bsf portb,rb5
   bsf portb,rb6
   bsf portb,rb7
   call usr_min15
   call usr_sirena1
   bcf portb,rb4
   bcf portb,rb5
   bsf portb,rb6
   bsf portb,rb7
   call usr_min55
   call usr_sirena1
   bcf portb,rb4
   bsf portb,rb5
   bcf portb,rb6
   bcf portb,rb7
   call usr_min55
   call usr_sirena1
   bsf portb,rb4
   bsf portb,rb5
   bsf portb,rb6
   bsf portb,rb7
   call usr_min15
   call usr_sirena1
   bcf portb,rb4
   bsf portb,rb5
   bcf portb,rb6
   bsf portb,rb7
   call usr_min55
   call usr_sirena1
   bcf portb,rb4
   bsf portb,rb5
   bsf portb,rb6
   bcf portb,rb7
   call usr_min55
   call usr_sirena3
usr_hor151
   goto usr_hor1_salir
usr_hor1_salir
   bcf status,rp0                   ;cambiar a banco 0
   return


usr_hor2
   call usr_sirena1
   bcf portb,rb4
   bcf portb,rb5
   bcf portb,rb6
   bsf portb,rb7
   call usr_min40
   call usr_sirena1
   bcf portb,rb4
   bcf portb,rb5
   bsf portb,rb6
   bcf portb,rb7
   call usr_min40
   call usr_sirena1
   bcf portb,rb4
   bcf portb,rb5
   bsf portb,rb6
   bsf portb,rb7
   call usr_min40
   call usr_sirena1
   bsf portb,rb4
   bsf portb,rb5
   bsf portb,rb6
   bsf portb,rb7
   call usr_min15
   call usr_sirena1
   bcf portb,rb4
   bsf portb,rb5
   bcf portb,rb6
   bcf portb,rb7
   call usr_min40
   call usr_sirena1
   bcf portb,rb4
   bsf portb,rb5
   bcf portb,rb6
   bsf portb,rb7
   call usr_min40
   call usr_sirena1
   bcf portb,rb4
   bsf portb,rb5
   bsf portb,rb6
   bcf portb,rb7
   call usr_min40
   call usr_sirena3
usr_hor245
   goto usr_hor2_salir
usr_hor2_salir
   bcf status,rp0                   ;cambiar a banco 0
   return


usr_hor3
   call usr_sirena1
   bcf portb,rb4
   bcf portb,rb5
   bcf portb,rb6
   bsf portb,rb7
   call usr_min30
   call usr_sirena1
   bcf portb,rb4
   bcf portb,rb5
   bsf portb,rb6
   bcf portb,rb7
   call usr_min30
   call usr_sirena1
   bcf portb,rb4
   bcf portb,rb5
   bsf portb,rb6
   bsf portb,rb7
   call usr_min30
   call usr_sirena1
   bsf portb,rb4
   bsf portb,rb5
   bsf portb,rb6
   bsf portb,rb7
   call usr_min15
   call usr_sirena1
   bcf portb,rb4
   bsf portb,rb5
   bcf portb,rb6
   bcf portb,rb7
   call usr_min30
   call usr_sirena1
   bcf portb,rb4
   bsf portb,rb5
   bcf portb,rb6
   bsf portb,rb7
   call usr_min30
   call usr_sirena1
   bcf portb,rb4
   bsf portb,rb5
   bsf portb,rb6
   bcf portb,rb7
   call usr_min30
   call usr_sirena3
usr_hor345
   goto usr_hor3_salir
usr_hor3_salir
   bcf status,rp0                   ;cambiar a banco 0
   return


usr_sirena1
   bcf status,rp0                   ;cambiar a banco 0
   bsf portb,rb0_int
   movlw .5                         ;temporizador 5 seg
   call tiempo_1_255_mega_c
   bcf portb,rb0_int
usr_sirena15
   goto usr_sirena1_salir
usr_sirena1_salir
   bcf status,rp0                   ;cambiar a banco 0
   return


usr_min55
   movlw d'00000000'
   bcf status,rp0                   ;cambiar a banco 0
   movwf cont
usr_min553
   movlw .60                        ;temporizador 60 seg
   call tiempo_1_255_mega_c

   incf cont,1                      ;cont = cont + 1
   movf cont,w                      ;si el reg cont = d'55'
   xorlw d'55'
   btfss status,z
   goto usr_min553                  ;cierra el ciclo
   goto usr_min55_salir
usr_min55_salir
   bcf status,rp0                   ;cambiar a banco 0
   return


usr_min15
   movlw d'00000000'
   bcf status,rp0                   ;cambiar a banco 0
   movwf cont
usr_min153
   movlw .60                        ;temporizador 60 seg
   call tiempo_1_255_mega_c

   incf cont,1                      ;cont = cont + 1
   movf cont,w                      ;si el reg cont = d'15'
   xorlw d'15'
   btfss status,z
   goto usr_min153                  ;cierra el ciclo
   goto usr_min15_salir
usr_min15_salir
   bcf status,rp0                   ;cambiar a banco 0
   return


usr_sirena3
   bcf status,rp0                   ;cambiar a banco 0
   bsf portb,rb0_int
   movlw .3                         ;temporizador 3 seg
   call tiempo_1_255_mega_c
   bcf portb,rb0_int
   movlw .2                         ;temporizador 2 seg
   call tiempo_1_255_mega_c
   bsf portb,rb0_int
   movlw .3                         ;temporizador 3 seg
   call tiempo_1_255_mega_c
   bcf portb,rb0_int
   movlw .2                         ;temporizador 2 seg
   call tiempo_1_255_mega_c
   bsf portb,rb0_int
   movlw .3                         ;temporizador 3 seg
   call tiempo_1_255_mega_c
   bcf portb,rb0_int
usr_sirena313
   goto usr_sirena3_salir
usr_sirena3_salir
   bcf status,rp0                   ;cambiar a banco 0
   return


usr_min40
   movlw d'00000000'
   bcf status,rp0                   ;cambiar a banco 0
   movwf cont
usr_min403
   movlw .60                        ;temporizador 60 seg
   call tiempo_1_255_mega_c

   incf cont,1                      ;cont = cont + 1
   movf cont,w                      ;si el reg cont = d'40'
   xorlw d'40'
   btfss status,z
   goto usr_min403                  ;cierra el ciclo
   goto usr_min40_salir
usr_min40_salir
   bcf status,rp0                   ;cambiar a banco 0
   return


usr_min30
   movlw d'00000000'
   bcf status,rp0                   ;cambiar a banco 0
   movwf cont
usr_min303
   movlw .60                        ;temporizador 60 seg
   call tiempo_1_255_mega_c

   incf cont,1                      ;cont = cont + 1
   movf cont,w                      ;si el reg cont = d'30'
   xorlw d'30'
   btfss status,z
   goto usr_min303                  ;cierra el ciclo
   goto usr_min30_salir
usr_min30_salir
   bcf status,rp0                   ;cambiar a banco 0
   return


tiempo_1_255_mega_c
   movwf _np_tiempo
   goto tiempo_1_255_mega_c_1
tiempo_1_255_mega_c_bucle2
   nop
   nop
   nop
   nop
   nop
   nop
   nop
tiempo_1_255_mega_c_1
   movlw .10
   movwf _np_tiempo1
tiempo_1_255_mega_c_bucle1
   nop
   nop
   movlw .99
   movwf _np_tiempo2
tiempo_1_255_mega_c_bucle0
   nop
   nop
   nop
   movlw .200
   movwf _np_tiempo3
tiempo_1_255_mega_c_bucle
   nop
   nop
   decfsz _np_tiempo3,1
   goto tiempo_1_255_mega_c_bucle
   nop
   nop
   nop
   decfsz _np_tiempo2,1
   goto tiempo_1_255_mega_c_bucle0
   nop
   nop
   nop
   decfsz _np_tiempo1,1
   goto tiempo_1_255_mega_c_bucle1
   decfsz _np_tiempo,1
   goto tiempo_1_255_mega_c_bucle2
   return




















 End