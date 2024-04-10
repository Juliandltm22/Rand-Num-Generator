;****************************************************************************************************************************
;Program name: "Non-deterministic Random Numbers". This program serves as a model to generate up to 100 random numbers      *
;using the non-deterministic random number generator found inside of modern X86 microprocessors.                            *
;Copyright (C) 2024  Julian De La Torre.                                                                                    *
;                                                                                                                           *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *
;but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *
;the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *
;<https://www.gnu.org/licenses/>.                                                                                           *
;****************************************************************************************************************************

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;Author information
;  Author name: Julian De La Torre
;  Author email: Julian_DeLaTorre1204@csu.fullerton.edu
;
;Program information
;  Program name: Non-deterministic Random Numbers
;  Programming languages: One modules in C, one module in C++, five modules in asm X86, one in bash
;  Date program began: 2024-Mar-1
;  Date of last update: 2024-April-9
;  Files in this program: main.c, sort.cpp, executive.asm, fill_random_array.asm, isnan.asm, normalize_array.asm, show_array.asm, r.sh
;  Testing: Testing completed
;  Status: Program ready for public
;
;Purpose
;      Purpose of this program is generate up to 100 random numbers.
;
;This file:
;  File name: fill_random_array.asm
;  Language: X86-64
;  Max page width:
;  Assemble (standard): nasm -f elf64 -l fill_random_array.lis -o fill_random_array.o fill_random_array.asm
;  Assemble (debug): g++ -m64 -o learn.out executive.o fill_random_array.o isnan.o normalize_array.o show_array.o sort.o main.o -fno-pie -no-pie -std=c++20 -g
;  Optimal print specification: Landscape, 7 points, monospace, 8½x11 paper
; 
;
;
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;Declaration section

extern printf
extern executive
extern show_array
extern rdrand
extern isnan
global fill_random_array

;===============================================================================

segment .data
int_format db 10, "%d %d", 10, 0

;===============================================================================

segment .bss
;EMPTY

;===============================================================================

segment .text
fill_random_array:

;Back up the GPRs (General Purpose Registers)
push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf

mov r15, rdi ;holding array
mov r14, rsi ;holding number of values
xor r13, r13

;Printing array and number of values
mov rax, 0
mov rdi, int_format
mov rsi, r15
mov rdx, r14
mov r13, 0

;===============================================================================

fill_loop:
cmp r13, r14
jge fill_done

rdrand r12
mov [r15 + r13 * 8], r12
inc r13
movsd xmm15, [rsp]
movsd xmm0, xmm15
call isnan
jmp fill_loop


;===============================================================================

fill_done:

;Restore the GPRs
popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp
ret
;End of the the function fill_random_array =====================================
