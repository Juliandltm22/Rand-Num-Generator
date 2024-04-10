//****************************************************************************************************************************
// Program name: "Non-deterministic Random Numbers". This program serves as a model to generate up to 100 random numbers     *
// using the non-deterministic random number generator found inside of modern X86 microprocessors.                           *
//Copyright (C) 2024  Julian De La Torre.                                                                                    *
//                                                                                                                           *
// This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License *
// version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,  *
// but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See  *
// the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:            *
//<https://www.gnu.org/licenses/>.                                                                                           *
//****************************************************************************************************************************

// Author: Julian De La Torre
// Author email: Julian_DeLaTorre1204@csu.fullerton.edu
// Program name: Non-deterministic Random Numbers
// Programming languages: One modules in C, one module in C++, five modules in asm X86, one in bash
// Date program began: 2024-Mar-1
// Date of last update: 2024-April-9
// File in this program: main.c, sort.cpp, executive.asm, fill_random_array.asm, isnan.asm, normalize_array.asm, show_array.asm, r.sh
// Testing: Testing completed
// Status: Program ready for public

// Purpose of this program:
//     Purpose of this program is generate up to 100 random numbers.

// This file
//  File name: main.c
//  Language: C language
//  Max page width:
//  Compile: gcc  -m64 -Wall -no-pie -o main.o -std=c2x -c main.c
//  Link: g++ -m64 -o learn.out executive.o fill_random_array.o isnan.o normalize_array.o show_array.o sort.o main.o -fno-pie -no-pie -std=c++20
//  ===============================================================================================================================

#include <stdio.h>

extern char* executive();

int main() {

    printf("\n");
    printf("\nWelcome to Random Products, LLC\n");
    printf("\nThis software is maintained by Julian De La Torre.\n");

    char* count = executive();

    printf("\nOh, %s.  We hope you enjoyed your arrays.  Do come again.\n", count);
    printf("A zero will be returned to the operating system.\n \n");

    return 0;

   }