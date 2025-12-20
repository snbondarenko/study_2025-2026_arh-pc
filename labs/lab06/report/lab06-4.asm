%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
msg: DB 'Введите значение переменной x: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80 ;Переменная, значение которой будем вводить с клавиатуры
SECTION .text
GLOBAL _start
_start:
; ----Вычисление выражения
mov eax, msg
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax,x  ;вызов подпрограммы преобразования
call atoi ; eax = x (преобразование ASCII в число)
mov ebx, 2
mul ebx   ; eax=eax*ebx=2*x
add eax, 10 ; eax =2*x+10
mov ebx, 3 ; ebx=3 (делитель)
xor edx, edx ; обнуляем edx для деления
div ebx ; eax=(2*x+10)/3, edx=остаток
mov  edi,eax  ; запись вычисления в 'edi'
;--------Вывод результата на экран
mov eax,rem  ;вызов подпрограммы печати
call sprint  ;сообщение 'Результат: '
mov eax, edi ;вызов подпрограммы печати значения
call iprint  ;из 'edi' в виде символов
call quit    ;вызов подпрограммы завершения
