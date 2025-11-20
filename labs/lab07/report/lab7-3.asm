%include 'in_out.asm'    ; Подключение внешнего файла с функциями

section .data
a dd 21
b dd 28
c dd 34

section .text
global _start
_start:
    mov eax, [a]
    mov ebx, [b]
    mov ecx, [c]

    ; Сравниваем a и b
    cmp eax, ebx
    jl check_c
    mov eax, ebx

check_c:
    ; Сравниваем текущий минимум (eax) с c
    cmp eax, ecx
    jl print
    mov eax, ecx

print:
    call iprintLF    ; Вывод числа
    call quit        ; Завершение программы

