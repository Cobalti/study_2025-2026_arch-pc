%include 'in_out.asm'

SECTION .data
msg1 db "Функция: f(x)=15x+2",0h
msg2 db "Результат:",0

SECTION .text
global _start
_start:
    mov eax, msg1
    call sprintLF

    pop ecx         ; argc
    pop edx         ; argv[0]
    sub ecx, 1
    mov esi, 0      ; сумма f(x)

next:
    cmp ecx, 0
    jz _end
    pop eax
    call atoi       ; eax = x

    ; f(x) = 4*x + 3
    mov ebx, 15
    mul ebx         ; eax = 4*x
    add eax, 2      ; eax = 4*x + 3

    add esi, eax    ; накапливаем сумму
    loop next

_end:
    mov eax, msg2
    call sprint
    mov eax, esi
    call iprintLF
    call quit
