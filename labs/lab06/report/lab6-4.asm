%include 'in_out.asm'

SECTION .data
msg: DB 'Вычисление выражения f(x) = 10(x + 1) - 10',0
input: DB 'Введите x: ',0
res: DB 'Результат: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:
    ; Вывод заголовка
    mov eax, msg
    call sprintLF
    
    ; Ввод значения x
    mov eax, input
    call sprint
    
    mov ecx, x
    mov edx, 80
    call sread
    
    ; Преобразование введенной строки в число
    mov eax, x
    call atoi
    
    ; Вычисление выражения 10(x + 1) - 10
    ; Шаг 1: x + 1
    mov ebx, eax    ; сохраняем x в ebx
    add ebx, 1      ; ebx = x + 1
    
    ; Шаг 2: 10 * (x + 1)
    mov eax, 10     ; eax = 10
    mul ebx         ; eax = 10 * (x + 1)
    
    ; Шаг 3: 10(x + 1) - 10
    sub eax, 10     ; eax = 10(x + 1) - 10
    
    ; Сохранение результата
    mov edi, eax
    
    ; Вывод результата
    mov eax, res
    call sprint
    mov eax, edi
    call iprintLF
    
    call quit
