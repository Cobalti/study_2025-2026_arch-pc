%include 'in_out.asm'

SECTION .data
msg:    db 'Введите x:',0
result: db '2x+7=',0

SECTION .bss
x:   resb 80
res: resb 80

SECTION .text
global _start
_start:
    ; Вывод сообщения
    mov eax, msg
    call sprint

    ; Ввод x
    mov ecx, x
    mov edx, 80
    call sread

    ; Преобразование в число
    mov eax, x
    call atoi

    ; Вызов подпрограммы
    call _calcul

    ; Вывод результата
    mov eax, result
    call sprint
    mov eax, [res]
    call iprintLF

    call quit
_calcul:
    call _subcalcul      ; вызов g(x)
    mov ebx, 2
    mul ebx
    add eax, 7
    mov [res], eax
    ret

_subcalcul:
    mov ebx, 3
    mul ebx
    sub eax, 1           ; g(x) = 3x - 1
    ret
