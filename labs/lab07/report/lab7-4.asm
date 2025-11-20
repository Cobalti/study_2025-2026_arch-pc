%include 'in_out.asm'    ; Подключение внешнего файла

section .data
msg_x db 'Введите x: ',0
msg_a db 'Введите a: ',0
msg_r db 'Результат: ',0

section .bss
x resb 10
a resb 10

section .text
global _start
_start:
    ; Ввод x
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    mov eax, x
    call atoi
    mov [x], eax

    ; Ввод a
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 10
    call sread
    mov eax, a
    call atoi
    mov [a], eax

    ; Проверка условия
    mov ebx, [x]
    mov ecx, [a]
    
    ; Сравниваем x с 0
    cmp ebx, 0
    jne else_part     ; если x ≠ 0
    
    ; если x = 0: f(x) = 4a
    mov eax, ecx      ; eax = a
    shl eax, 2        ; eax = 4a (умножение на 4)
    jmp print_result

else_part:
    ; если x ≠ 0: f(x) = 4a + x
    mov eax, ecx      ; eax = a
    shl eax, 2        ; eax = 4a
    add eax, ebx      ; eax = 4a + x

print_result:
    mov ebx, eax      ; сохраняем результат
    mov eax, msg_r
    call sprint
    mov eax, ebx
    call iprintLF
    call quit
