%include 'in_out.asm'

SECTION .data
msg db "Результат:",0

SECTION .text
global _start
_start:
    pop ecx         ; количество аргументов
    pop edx         ; имя программы
    sub ecx, 1
    mov esi, 0      ; сумма

next:
    cmp ecx, 0
    jz _end
    pop eax
    call atoi
    add esi, eax
    loop next

_end:
    mov eax, msg
    call sprint
    mov eax, esi
    call iprintLF
    call quit
