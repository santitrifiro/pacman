.ORIG x3000

AND R0, R0, x0000
AND R1, R1, x0000
AND R2, R2, x0000
AND R3, R3, x0000
AND R4, R4, x0000
AND R5, R5, x0000
AND R6, R6, x0000
AND R7, R7, x0000

; FUNCIÓN DRAW: R1 = COLOR, R2 = DIRECCIÓN, R5 = x, R6 = y;

; R2 será la coordenda de cálculo de ubicación
; Reservamos R5 y R6 para el cálculo de coordenadas (x = R5, y = R6)

ADD R0, R0, x0004
ST R0, contador

;; GENERACIÓN DE MAPA

ADD R5, R5, #4
ADD R6, R6, #14

JSR GENERATECOIN

ADD R5, R5, #5
ADD R6, R6, #14

JSR GENERATECOIN

ADD R5, R5, #6
ADD R6, R6, #14

JSR GENERATECOIN

ADD R5, R5, #7
ADD R6, R6, #14

JSR GENERATECOIN

ADD R5, R5, #0
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #1
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #2
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #3
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #4
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #5
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #6
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #7
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #8
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #9
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #10
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #11
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #12
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #13
ADD R6, R6, #8

JSR GENERATEWALL

ADD R5, R5, #14
ADD R6, R6, #8

;;

AND R5, R5, x0000
AND R6, R6, x0000

JSR LOOP

contador .FILL x0000

DRAWCOIN0 .FILL xC183
DRAWCOIN1 .FILL xC184
DRAWCOIN2 .FILL xC203
DRAWCOIN3 .FILL xC204

LOOP

AND R1, R1, x0000
AND R2, R2, x0000

;; Generación de pacman

LD R1, c_white
JSR DRAWPACMAN

;;

;; Corrección de posición de pacman

JSR WIPELAST
ST R5, lastx
ST R6, lasty

;;

;; Procesamiento de entrada

JSR GETCOIN
ADD R1, R1, #0
LD R0, contador
NOT R1, R1
ADD R1, R1, #1
ADD R0, R0, R1
ST R0, contador

;;

;; Eliminación de coin

LD R1, c_black

LEA R2, DRAWCOIN0
JSR DRAW
ADD R2, R2, #1
JSR DRAW
ADD R2, R2, #1
JSR DRAW
ADD R2, R2, #1
JSR DRAW

;;

LDI R0, ascii_input

LD R1, ascii_w
;; Chequeamos coincidencia con w
NOT R1, R1
ADD R1, R1, #1
ADD R1, R0, R1
BRnp #7
ADD R5, R5, #0
BRz #1
ADD R5, R5, #-1
JSR CHECKWALL
ADD R4, R4, #-2
BRnp #1
ADD R5, R5, #1

LD R1, ascii_a
;; Chequeamos coincidencia con a
NOT R1, R1
ADD R1, R1, #1
ADD R1, R0, R1
BRnp #7
ADD R6, R6, #0
BRz #1
ADD R6, R6, #-1
JSR CHECKWALL
ADD R4, R4, #-2
BRnp #1
ADD R6, R6, #1

LD R1, ascii_s
;; Chequeamos coincidencia con s
NOT R1, R1
ADD R1, R1, #1
ADD R1, R0, R1
BRnp #7
ADD R1, R5, #-14
BRz #1
ADD R5, R5, #1
JSR CHECKWALL
ADD R4, R4, #-2
BRnp #1
ADD R5, R5, #-1

LD R1, ascii_d
;; Chequeamos coincidencia con d
NOT R1, R1
ADD R1, R1, #1
ADD R1, R0, R1
BRnp #7
ADD R1, R6, #-15
BRz #1
ADD R6, R6, #1
JSR CHECKWALL
ADD R4, R4, #-2
BRnp #1
ADD R6, R6, #-1

OUT

LD R0, contador
ADD R0, R0, #0

; Espera

JSR WAIT

BRp LOOP

; Animación de final

LD R5, zeros
LD R6, zerosend
LD R1, c_green

NOT R6, R6

STR R1, R5, #0
ADD R5, R5, #1
AND R0, R0, x0000
ADD R0, R5, R6
BRnp #-5

HALT

WIPELAST 

ST R5, AUXR51
ST R6, AUXR61
ST R7, AUXR71

LD R5, lastx
LD R6, lasty

LD R1, c_black

JSR DRAWPACMAN

LD R5, AUXR51
LD R6, AUXR61
LD R7, AUXR71

JMP R7

DRAWPACMAN 

ST R7, AUXR70

LEA R2, DRAW0

AND R0, R0, x0000
ADD R0, R0, #8
LEA R2, DRAW0
JSR DRAW
ADD R2, R2, #1
ADD R0, R0, #-1
BRp #-4

LD R7, AUXR70

JMP R7

GENERATEWALL

ST R7, AUXR70

JSR SAVEWALL

LD R1, c_red

AND R0, R0, x0000
ADD R0, R0, #4
LEA R2, DRAWCOIN0
JSR DRAW
ADD R2, R2, #1
ADD R0, R0, #-1
BRp #-4

AND R5, R5, x0000
AND R6, R6, x0000

LD R7, AUXR70

JMP R7

SAVEWALL

ST R0, AUXR0
ST R5, AUXR50
ST R6, AUXR60
LD R0, memo

ADD R0, R0, x0001
ADD R6, R6, #-1
BRp #-3

LD R6, count_16

ADD R0, R0, R6
ADD R5, R5, #-1
BRp #-3

AND R5, R5, x0000
ADD R5, R5, #2

STR R5, R0, #0

LD R0, AUXR0
LD R5, AUXR50
LD R6, AUXR60

JMP R7

CHECKWALL

ST R0, AUXR0
ST R5, AUXR50
ST R6, AUXR60

LD R0, memo

ADD R0, R0, x0001
ADD R6, R6, #-1
BRp #-3

LD R6, count_16

ADD R0, R0, R6
ADD R5, R5, #-1
BRp #-3

LDR R4, R0, #0

LD R0, AUXR0
LD R5, AUXR50
LD R6, AUXR60

JMP R7

GENERATECOIN

ST R7, AUXR70

JSR SAVECOIN

LD R1, c_yellow

AND R0, R0, x0000
ADD R0, R0, #4
LEA R2, DRAWCOIN0
JSR DRAW
ADD R2, R2, #1
ADD R0, R0, #-1
BRp #-4

AND R5, R5, x0000
AND R6, R6, x0000

LD R7, AUXR70

JMP R7

SAVECOIN

ST R0, AUXR0
ST R5, AUXR50
ST R6, AUXR60
LD R0, memo

ADD R0, R0, x0001
ADD R6, R6, #-1
BRp #-3

LD R6, count_16

ADD R0, R0, R6
ADD R5, R5, #-1
BRp #-3

AND R5, R5, x0000
ADD R5, R5, #1

STR R5, R0, #0

LD R0, AUXR0
LD R5, AUXR50
LD R6, AUXR60

JMP R7

GETCOIN

ST R0, AUXR0
ST R5, AUXR50
ST R6, AUXR60

LD R0, memo

ADD R0, R0, x0001
ADD R6, R6, #-1
BRp #-3

LD R6, count_16

ADD R0, R0, R6
ADD R5, R5, #-1
BRp #-3

LDR R1, R0, #0
LDR R4, R0, #0

AND R6, R6, x0000
STR R6, R0, #0

LD R0, AUXR0
LD R5, AUXR50
LD R6, AUXR60

JMP R7

DRAW

ST R0, AUXR0
ST R2, AUXR2
ST R5, AUXR50
ST R6, AUXR60

LDR R2, R2, #0
LEA R0, #2
ADD R5, R5, #0
BRp GETXCORD
LEA R0, #2
ADD R6, R6, #0
BRp GETYCORD
STR R1, R2, #0

LD R0, AUXR0
LD R2, AUXR2
LD R5, AUXR50
LD R6, AUXR60

JMP R7

GETXCORD

ST R1, AUXR1
ST R5, AUXR50

LD R1, count_x
ADD R2, R2, R1
ADD R5, R5, #-1
BRp #-3

LD R1, AUXR1
LD R5, AUXR50

JMP R0

GETYCORD

ST R1, AUXR1
ST R6, AUXR60

LD R1, count_y
ADD R2, R2, R1
ADD R6, R6, #-1
BRp #-3

LD R1, AUXR1
LD R6, AUXR60

JMP R0

WAIT

ST R0, AUXR0

LD R0, waittime
ADD R0, R0, #-1
BRp #-2

LD R0, AUXR0

JMP R7

lastx .FILL x0000
lasty .FILL x0000

c_blue .FILL x001F
c_yellow .FILL x7FE0
c_red .FILL x7C00
c_white .FILL x7FFF
c_green .FILL x03E0
c_black .FILL x0000
zeros .FILL xC000
zerosend .FILL xFDFF

memo .FILL xB000

count_x .FILL #1024
count_y .FILL #8
count_16 .FILL #16

ascii_input .FILL xFE02

ascii_w .FILL #119
ascii_a .FILL #97
ascii_s .FILL #115
ascii_d .FILL #100

waittime .FILL x03E8

DRAW0 .FILL xC103
DRAW1 .FILL xC104
DRAW2 .FILL xC182
DRAW3 .FILL xC185
DRAW4 .FILL xC202
DRAW5 .FILL xC205
DRAW6 .FILL xC283
DRAW7 .FILL xC284

DRAW0ON .FILL xC103
DRAW1ON .FILL xC104
DRAW2ON .FILL xC182
DRAW3ON .FILL xC185
DRAW4ON .FILL xC202
DRAW5ON .FILL xC205
DRAW6ON .FILL xC283
DRAW7ON .FILL xC284

AUXR0 .FILL x0000
AUXR1 .FILL x0000
AUXR2 .FILL x0000
AUXR3 .FILL x0000
AUXR4 .FILL x0000
AUXR50 .FILL x0000
AUXR51 .FILL x0000
AUXR60 .FILL x0000
AUXR61 .FILL x0000
AUXR70 .FILL x0000
AUXR71 .FILL x0000
AUXR72 .FILL x0000
