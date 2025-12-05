%include 'in_out.asm'

SECTION .data
div: db 'Результат: ',0

SECTION .text
global _start
_start:
    mov eax, 3
    add eax, 2        ; eax = 5
    mov ebx, 4
    mul ebx           ; eax = 5 * 4 = 20
    add eax, 5        ; eax = 25
    mov edi, eax

    mov eax, div
    call sprint
    mov eax, edi
    call iprintLF
    call quit
