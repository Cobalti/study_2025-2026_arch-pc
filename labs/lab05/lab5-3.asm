; Программа вывода сообщения, ввода строки и ее вывода
SECTION .data
    msg: DB 'Введите строку:',10
    msgLen: EQU $-msg

SECTION .bss
    buf1: RESB 80

SECTION .text
    GLOBAL _start

_start:
    ; Вывод приглашения
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msgLen
    int 0x80

    ; Ввод строки
    mov eax, 3
    mov ebx, 0
    mov ecx, buf1
    mov edx, 80
    int 0x80

    ; Сохранение длины введенной строки
    mov edx, eax

    ; Вывод введенной строки
    mov eax, 4
    mov ebx, 1
    mov ecx, buf1
    ; edx уже содержит длину строки
    int 0x80

    ; Завершение программы
    mov eax, 1
    mov ebx, 0
    int 0x80
