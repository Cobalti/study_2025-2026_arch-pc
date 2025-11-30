%include 'in_out.asm'

SECTION .text
global _start
_start:
    pop ecx         ; количество аргументов
    pop edx         ; имя программы
    sub ecx, 1      ; без имени программы

next:
    cmp ecx, 0
    jz _end
    pop eax
    call sprintLF
    loop next

_end:
    call quit
