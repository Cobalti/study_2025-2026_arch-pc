%include 'in_out.asm'

SECTION .data
div: DB 'Результат: ',0
rem: DB 'Остаток от деления: ',0

SECTION .text
GLOBAL _start
_start:
    mov eax,5
    mov ebx,2
    mul ebx
    add eax,3
    xor edx,edx
    mov ebx,3
    div ebx
    
    mov edi,eax
    
    mov eax,div
    call sprint
    mov eax,edi
    call iprintLF
    
    mov eax,rem
    call sprint
    mov eax,edx
    call iprintLF
    
    call quit
