; lab4.asm
section .data
; Начало секции данных
lab4:DB 'Sofiia Bondarenko',10 ; 'Sofiia Bondarenko' плюс
lab4Len:EQU $-lab4
; символ строки перевода
SECTION .text
; Длина строки lab4
; Начало секции кода
GLOBAL _start
_start:
; Точка входа в программу
mov eax,4; Системный вызов для записи (sys_write)
mov ebx,1; Описатель файла '1' - стандартный вывод
mov ecx,lab4; Адрес строки lab в ecx
mov edx,lab4Len; Размер строки lab4
int 80h; Вызов ядра
mov eax,1; Системный вызов для выхода (sys_exit)
mov ebx,0; Выход с кодом возврата '0' (без ошибок)
int 80h; Вызов ядра
