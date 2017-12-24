; Program: Project.asm

;Delay Code from:
;


; Castle Creature

.model small
.stack 256
.code

jmp start
;==============================
; Drawing
;==============================
startaddr dw 0a000h ;start of video memory
; al stores colour
blue db 1
green db 2
gray db 8
red db 4
yellow db 6
graylight db 19
;==============================
start:
mov ah,00
mov al,19
int 10h
;switch to 320x200 mode

mov es, startaddr ;put segment address in es

;=============================
; Left Tower
;=============================

mov al,gray

;Horizontal 1
l1:
mov di, 16000 ; (320 * x)
add di, 20 ;column
mov cx, 13 ;loop counter
l1plot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop l1plot

;Horizontal 1 Lower
l11:
mov di, 19200 ; (320 * x)
add di, 33 ;column
mov cx, 13 ;loop counter
l11plot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop l11plot

;Horizontal 2
l2:
mov di, 16000 ; (320 * x)
add di, 46 ;column
mov cx, 13 ;loop counter
l2plot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop l2plot

;Horizontal 2 lower
l21:
mov di, 19200 ; (320 * x)
add di, 59 ;column
mov cx, 15 ;loop counter
l21plot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop l21plot

;Horizontal 3
l3:
mov di, 16000 ; (320 * x)
add di, 73 ;column
mov cx, 13 ;loop counter
l3plot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop l3plot

mov al,graylight

;Vertical 1
l1v:
mov di, 16000 ;row
add di, 33 ;column
mov cx, 10 ;loop counter
l1vplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop l1vplot

;Vertical 2
l2v:
mov di, 16000 ;row
add di, 46 ;column
mov cx, 11 ;loop counter
l2vplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop l2vplot

;Vertical 3
l3v:
mov di, 16000 ;row
add di, 59 ;column
mov cx, 10 ;loop counter
l3vplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop l3vplot

;Vertical 4
l4v:
mov di, 16000 ;row
add di, 73 ;column
mov cx, 11 ;loop counter
l4vplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop l4vplot

mov al,gray

lhoriz:
mov di, 16000 ;row
add di, 86 ;column
mov cx, 50 ;loop counter
lhorizplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop lhorizplot

;=============================
; Right Tower
;=============================

mov al,gray

rhoriz:
mov di, 16000 ;row
add di, 235 ;column
mov cx, 50 ;loop counter
rhorizplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop rhorizplot

mov al,gray

;Horizontal 1
r1:
mov di, 16000 ; (320 * x)
add di, 235 ;column
mov cx, 13 ;loop counter
r1plot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop r1plot

;Horizontal 1 Lower
r11:
mov di, 19200 ; (320 * x)
add di, 248 ;column
mov cx, 13 ;loop counter
r11plot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop r11plot

;Horizontal 2
r2:
mov di, 16000 ; (320 * x)
add di, 261 ;column
mov cx, 13 ;loop counter
r2plot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop r2plot

;Horizontal 2 lower
r21:
mov di, 19200 ; (320 * x)
add di, 274 ;column
mov cx, 14 ;loop counter
r21plot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop r21plot

;Horizontal 3
r3:
mov di, 16000 ; (320 * x)
add di, 287 ;column
mov cx, 13 ;loop counter
r3plot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop r3plot

mov al,graylight

;Vertical 1
r1v:
mov di, 16000 ;row
add di, 248 ;column
mov cx, 10 ;loop counter
r1vplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop r1vplot

;Vertical 2
r2v:
mov di, 16000 ;row
add di, 261 ;column
mov cx, 11 ;loop counter
r2vplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop r2vplot

;Vertical 3
r3v:
mov di, 16000 ;row
add di, 274 ;column
mov cx, 10 ;loop counter
r3vplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop r3vplot

;Vertical 4
r4v:
mov di, 16000 ;row
add di, 287 ;column
mov cx, 11 ;loop counter
r4vplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop r4vplot


;=============================
;Door
;=============================
mov al,blue

doorl:
mov di, 41600 ;row
add di, 135 ;column
mov cx, 50 ;loop counter
doorlplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop doorlplot

mov al,blue

doorr:
mov di, 41600 ;row
add di, 185 ;column
mov cx, 50 ;loop counter
doorrplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop doorrplot

doormiddle:
mov di, 41600 ;row
add di, 160 ;column
mov cx, 50 ;loop counter
doormiddleplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop doormiddleplot

doortop:
mov di, 41600 ;row (320 * x)
add di, 135 ;column
mov cx, 50 ;loop counter
doortopplot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop doortopplot

mov al,red

doorknob:
mov di, 49600 ;row 130
add di, 155 ;column
mov cx, 10 ;loop counter
doorknobplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop doorknobplot

doorknob2:
mov di, 49600 ;row 130
add di, 165 ;column
mov cx, 10 ;loop counter
doorknob2plot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop doorknob2plot

;=============================
;Leftwindow
;=============================

mov al, green

;ll = Left window left side lr = Left window right side .. etc
ll:
mov di, 41600 ;row 130
add di, 40 ;column
mov cx, 30 ;loop counter
llplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop llplot

lr:
mov di, 41600 ;row 130
add di, 70 ;column
mov cx, 30 ;loop counter
lrplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop lrplot

ltop:
mov di, 41600 ;row (320 * x)
add di, 40 ;column
mov cx, 30 ;loop counter
ltplot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop ltplot

lb:
mov di, 51200;row (320 * x)
add di, 40 ;column
mov cx, 31 ;loop counter
lbplot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop lbplot

mov al, yellow

l2top:
mov di, 40000 ;row (320 * x)
add di, 40 ;column
mov cx, 30 ;loop counter
l2tplot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop l2tplot

mov al, red

ler:
mov di, 48960 ;row 130
add di, 63 ;column
mov cx, 5 ;loop counter
lerplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop lerplot

lel:
mov di, 48960 ;row 130
add di, 68 ;column
mov cx, 5 ;loop counter
lelplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop lelplot

let:
mov di, 48960;row (320 * x)
add di, 63 ;column
mov cx, 5 ;loop counter
letplot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop letplot

leb:
mov di, 50560;row (320 * x)
add di, 63 ;column
mov cx, 6 ;loop counter
lebplot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop lebplot

;=============================
;Rightwindow
;=============================

mov al, green

rl:
mov di, 41600 ;row 130
add di, 250 ;column
mov cx, 30 ;loop counter
rlplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop rlplot

rr:
mov di, 41600 ;row 130
add di, 280 ;column
mov cx, 30 ;loop counter
rrplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop rrplot

rtop:
mov di, 41600 ;row (320 * x)
add di, 250 ;column
mov cx, 30 ;loop counter
rtplot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop rtplot

rb:
mov di, 51200;row (320 * x)
add di, 250 ;column
mov cx, 31 ;loop counter
rbplot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop rbplot

mov al, yellow

r2top:
mov di, 40000 ;row (320 * x)
add di, 250 ;column
mov cx, 30 ;loop counter
r2tplot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop r2tplot

;Right eye

rer:
mov di, 48960 ;row 130
add di, 257 ;column
mov cx, 5 ;loop counter
rerplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop rerplot

rel:
mov di, 48960 ;row 130
add di, 252 ;column
mov cx, 5 ;loop counter
relplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop relplot

retop:
mov di, 48960;row (320 * x)
add di, 252 ;column
mov cx, 5 ;loop counter
retplot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop retplot

reb:
mov di, 50560;row (320 * x)
add di, 252 ;column
mov cx, 6 ;loop counter
rebplot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop rebplot

;=============================
;Bottom, top,left and right
;=============================

bottom:
mov di, 57600 ;row (320 * x)
add di, 20 ;column
mov al,gray ;cannot do mem-mem copy so use reg
mov cx, 281 ;loop counter
bottomplot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop bottomplot

top:
mov di, 32000 ;row (320 * x)
add di, 86 ;column
mov al,gray ;cannot do mem-mem copy so use reg
mov cx, 150 ;loop counter
topplot:
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop topplot

left:
mov di, 16000 ;row
add di, 20 ;column
mov cx, 130 ;loop counter
leftplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop leftplot

right:
mov di, 16000 ;row
add di, 300 ;column
mov cx, 130 ;loop counter
rightplot:
mov es:[di],al
add di, 320 ;mov down a pixel
loop rightplot

;=============================
;Flag
;=============================

;mov cl, 10
;l1:

mov al, yellow

flag:
mov di, 8000 ;row
add di, 120 ;column
mov cx, 37 ;loop counter
flagplot:
mov al, yellow
mov es:[di],al
add di, 320 ;mov down a pixel

; start delay
mov bp, 2
mov si, 2
delay2:
dec bp
nop
jnz delay2
dec si
cmp si,0
jnz delay2
; end delay

mov al, red
mov es:[di],al
add di, 320 ;mov down a pixel
loop flagplot

flagtop:
mov di, 8000 ;row (320 * x)
add di, 120 ;column
mov cx, 26 ;loop counter
flagtopplot:
mov al,green ;cannot do mem-mem copy so use reg
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel

; start delay
mov bp, 2
mov si, 2
delay7:
dec bp
nop
jnz delay7
dec si
cmp si,0
jnz delay7
; end delay
mov al, yellow
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel

loop flagtopplot


; Flag right

flagr:
mov di, 8000 ;row
add di, 170 ;column
mov cx, 15 ;loop counter
flagrplot:
mov al, yellow
mov es:[di],al
add di, 320 ;mov down a pixel

; start delay
mov bp, 2
mov si, 2
delay3:
dec bp
nop
jnz delay3
dec si
cmp si,0
jnz delay3
; end delay

mov al, red
mov es:[di],al
add di, 320 ;mov down a pixel

loop flagrplot


flagbottom:
mov di, 17600 ;row (320 * x)
add di, 120 ;column
mov cx, 26 ;loop counter
flagbottomplot:
mov al,green
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel

; start delay
mov bp, 2
mov si, 2
delay6:
dec bp
nop
jnz delay6
dec si
cmp si,0
jnz delay6
; end delay
mov al, yellow
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop flagbottomplot


; ANIMATION PART

flaganimationloop:
; start delay
mov bp, 20
mov si, 20

delay4:

flaganimation:
mov di, 8000 ;row
add di, 170 ;column
mov cx, 30 ;loop counter
flaganimationplot:
mov al, yellow
mov es:[di],al
add di, 320 ;mov down a pixel
loop flaganimationplot

flagbottom2:
mov di, 17600 ;row (320 * x)
add di, 120 ;column
mov cx, 52 ;loop counter
flagbottom2plot:
mov al,green
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop flagbottom2plot

dec bp
; If bp is not zero, go back to start
jnz delay4

flaganimation2:
mov di, 8000 ;row
add di, 170 ;column
mov cx, 30 ;loop counter
flaganimation2plot:
mov al, green
mov es:[di],al
add di, 320 ;mov down a pixel
loop flaganimation2plot

flagbottom3:
mov di, 17600 ;row (320 * x)
add di, 120 ;column
mov cx, 52 ;loop counter
flagbottom3plot:
mov al,red
mov es:[di],al ;set pixel to colour
inc di ;move to next pixel
loop flagbottom3plot

mov bp, 10
dec si
cmp si,0
; If si is not zero, go back to start
jnz delay4
; end delay
loop flaganimationloop

;=============================
keypress:
mov ah,00
int 16h ;await keypress

end start
