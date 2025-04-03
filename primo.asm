%include "io.asm"

section .data 
    msg1 db "El numero no es primo."
    len1 equ $-msg1
    msg2 db "El numero es primo."
    len2 equ $-msg2
    msg3 db "Ingrese un numero."
    len3 equ $-msg3


section .bss   
    numero resb 12

section .text
    global _start

_start:
    move esi, [msg3]
    call print_str
    call scan_num 
    mov numero, eax
    mov eax, 2
    div numero
    cmp 0, edx
    je veri
    bucle:
    add eax, 2
    div numero
    cmp 0, edx
    je veri
    jmp bucle

veri:
    cmp eax, numero
    je primo
    jmp no_primo

no_primo:
    mov esi, [msg1]
    call print_str
    mov eax, numero
    call print_num
    jmp fin

primo:
    mov esi, [msg2]
    call print_str 
    mov eax, numero
    call print_num 
    jmp fin

fin:
    xor ebx, ebx
    int 0x80
    
