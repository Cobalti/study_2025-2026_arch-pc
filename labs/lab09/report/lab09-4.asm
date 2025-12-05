%include 'in_out.asm'

SECTION .data
msg: db "Функция: f(x)=15x+2",0
res_msg: db "Результат:",0

SECTION .text
global _start
_start:
    mov eax, msg
    call sprintLF

    pop ecx         ; argc
    pop edx         ; имя программы
    sub ecx, 1
    mov esi, 0      ; сумма

next:
    cmp ecx, 0
    jz _end
    pop eax
    call atoi       ; x в eax

    call _f         ; результат в eax

    add esi, eax    ; накапливаем сумму
    loop next

_end:
    mov eax, res_msg
    call sprint
    mov eax, esi
    call iprintLF
    call quit

; Подпрограмма: f(x) = 15x + 2
_f:
    mov ebx, 15
    mul ebx
    add eax, 2
    ret
