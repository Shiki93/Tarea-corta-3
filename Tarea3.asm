;TEC - Escuela de Computación - Arquitectura de Computadoras
;Tarea Corta - Ejercicio #3 - Convertir de Char a Int y viceversa
;Otoniel Andrés Murillo Valerio - 201147941
;Sabado 1 de Abril del 2017 - I Periodo - Esteban Arias Mendez

%include 'io.mac'

.DATA
	msg_num		db 'Introduzca un numero: ', 0
	msg_error	db 'Dato introducido no es valido: ', 0
	msg_a		db 'Es un numero', 0

.UDATA
	num		resb 	16
	
.CODE
	.STARTUP
	PutStr msg_num
	GetStr num, 16
	mov EBX, num
	
Verificar:
	mov AL, [EBX]
	
	cmp AL, 0
	je Done
	cmp AL, '0'
	jl Error
	cmp Al, '9'
	jg Error
	call IsNum

Error:
	PutStr msg_error
EvE:
	mov AL, [EBX]
	cmp AL, 0
	je Done
	cmp AL, 'a'
	jl NoLower
	cmp AL, 'z'
	jg NoLower
	call toUpper

NoLower:
	PutCh AL
	inc EBX
	jmp EvE

Done:
	nwln
	
	.EXIT

IsNum:

	sub AL, 30h
	cbw
	push eax
	mov eax, edx
	mov ecx, 10
	mul ecx
	mov edx, eax
	pop eax
	add edx, eax
	PutLInt edx
	nwln
	
	;PutStr msg_a
	inc EBX
	jmp Verificar

toUpper:
	add AL, 'A'-'a'
	PutCh AL
	inc EBX
	jmp EvE
