#/bin/bash

#Program name "Average Delivery Time"
#Author: J. De La Torre
#This file is the script file that accompanies the "Assignment #1" program.
#Prepare for execution in normal code (not gdb mode)

#Delete some un-needed files
rm *.o
rm *.out

echo "Assemble the source file executive.asm"
nasm -f elf64 -l executive.lis -o executive.o executive.asm

echo "Assemble the source file fill_random_array.asm"
nasm -f elf64 -l fill_random_array.lis -o fill_random_array.o fill_random_array.asm

echo "Assemble the source file show_array.asm"
nasm -f elf64 -l show_array.lis -o show_array.o show_array.asm

echo "Assemble the source file normalize_array.asm"
nasm -f elf64 -l normalize_array.lis -o normalize_array.o normalize_array.asm

echo "Assemble the source file isnan.asm"
nasm -f elf64 -l isnan.lis -o isnan.o isnan.asm

echo "Compile the source file sort.cpp"
g++ -c -m64 -Wall -fno-pie -no-pie -o sort.o sort.cpp

echo "Compile the source file main.c"
gcc  -m64 -Wall -no-pie -o main.o -std=c2x -c main.c

echo "Link the object modules to create an executable file"
g++ -m64 -o learn.out executive.o fill_random_array.o isnan.o normalize_array.o show_array.o sort.o main.o -fno-pie -no-pie -std=c++20


echo "Execute the program"
# chmod +x a.out
./learn.out