%include 'in_out.asm'
SECTION .data
msg1: DB 'Сообщение № 1',0
msg2: DB 'Сообщение № 2',0
msg3: DB 'Сообщение № 3',0
SECTION .text
GLOBAL _start
_start:
  jmp _label1
_label1:
  mov eax, msg3
  call sprintLF
_label2:
  mov eax, msg2
  call sprintLF
_label3:
  mov eax, msg1
  call sprintLF
_end:
  call quit
