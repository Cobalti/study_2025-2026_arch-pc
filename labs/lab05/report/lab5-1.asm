; Программа вывода сообщения на экран и ввода строки с клавиатуры

SECTION .data
    msg: DB 'Введите строку:',10
    msgLen: EQU $-msg

SECTION .bss
    buf1: RESB 80

SECTION .text
    GLOBAL _start

_start:
    ; Системный вызов `write`
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msgLen
    int 0x80

    ; Системный вызов `read`
    mov eax, 3
    mov ebx, 0
    mov ecx, buf1
    mov edx, 80
    int 0x80

    ; Системный вызов `exit`
    mov eax, 1
    mov ebx, 0
    int 0x80
