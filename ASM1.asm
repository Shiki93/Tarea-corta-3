;TEC - Escuela de Computación - Arquitectura de Computadoras
;Tarea Corta# 3 - Ejercicio #1.a - Convertir de Char a Int y viceversa
;Otoniel Andrés Murillo Valerio - 201147941
;Sabado 1 de Abril del 2017 - I Periodo - Esteban Arias Mendez

%include "io.mac"

.DATA
name_msg db 'Please enter your name: ', 0
query_msg db 'How mane times to repeat welcome message? ', 0
confirm_msg1 db 'Repeat welcome message ', 0
confirm_msg2 db ' times? (y/n) ', 0
welcome_msg db 'Welcome to Assembly Language Programming ', 0

.UDATA
user_name resb 16
response resb 1
final resb 1

.CODE
    .STARTUP
    PutStr name_msg
    GetStr user_name,16
ask_count:
	PutStr query_msg
	GetInt CX
	PutStr confirm_msg1
	PutInt CX
	PutStr confirm_msg2
	GetCh [response]
	cmp byte [response],'y'
	jne ask_count
display_msg:
	PutStr welcome_msg
	PutStr user_name
	nwln
	loop display_msg

;Aqui empece yo
mov EAX, name_msg
ciclo:
	
	mov dl, [EAX]
	cmp EAX, final
	je Salir
	call ConvBinario
	inc EAX
	jmp ciclo
Salir:

	.EXIT

;Imprime el caracter en binario
ConvBinario:
	mov CX, 8
Siguiente:
	rcl dl, 1
	jc Uno
	PutCh '0'
	loop Siguiente
	jmp salirc
Uno:
	PutCh '1'
	loop Siguiente
salirc:
	PutCh ' '
	ret
	
	
	
	
