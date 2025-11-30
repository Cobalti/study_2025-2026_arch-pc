%include 'in_out.asm'

SECTION .data
msg db "Произведение:",0

SECTION .text
global _start
_start:
    pop ecx
    pop edx
    sub ecx, 1
    mov esi, 1      ; начальное значение — 1 для произведения

next:
    cmp ecx, 0
    jz _end
    pop eax
    call atoi
    mul esi         ; eax = eax * esi
    mov esi, eax    ; сохраняем результат
    loop next

_end:
    mov eax, msg
    call sprint
    mov eax, esi
    call iprintLF
    call quit
