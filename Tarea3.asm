;TEC - Escuela de Computación - Arquitectura de Computadoras
;Tarea Corta - Ejercicio #3 - Convertir de Char a Int y viceversa
;Otoniel Andrés Murillo Valerio - 201147941
;Sabado 1 de Abril del 2017 - I Periodo - Esteban Arias Mendez

%include 'io.mac'

.DATA
num_msg db 'Introduzca un texto: ',0
msg  	db 'Aqui voy upper', 0Dh, 0Ah, 0
msg1  	db 'Aqui voy PrintDec', 0Dh, 0Ah, 0

.UDATA

num_data resb 32 ;Espacio para el numero introducido

.CODE
	.STARTUP
	PutStr num_msg ;Imprime el mensaje al usuario
	GetStr num_data, 32 ;Lee maximo 15 caracteres
	;PutStr num_data ;Imprime el valor ingresado como char
	;nwln
	
	mov EBX, num_data
	mov AL, [EBX]
	cmp AL, 0
	je Salir
	;Compara Letras
	cmp AL, 'A'
	jl numeros
	cmp AL, 'Z'
	jg numeros
	call toUpper
	;Compara numeros
numeros:
	cmp AL, '0'
	jl Salir
	cmp AL, '9'
	jg Salir
	call ConvDec
	
Salir:
	.EXIT

ConvDec:
	PutStr msg1
	ret
	
toUpper:
	PutStr msg
	ret

