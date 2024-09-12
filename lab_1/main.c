#include <stdio.h>

#define SIZE 10

int main() {
    int array[SIZE] = {1, 23, 45, 67, 89, 12, 34, 56, 78, 90};
    int max_value = array[0];
    int i = 1;
    int tmp;

    asm(
        "movl %1, %%edi\n"        // Адрес массива
        "movl %2, %%ecx\n"        // Индекс i
        "movl %3, %%eax\n"        // max_value

        ".startCycle1:\n"
        "movl (%%edi, %%ecx, 4), %%ebx\n" // Загрузить значение текущего элемента
        "movl %%ebx, %0\n"        // значение в переменную tmp
        "cmpl %%eax, %%ebx\n"     // Сравнить элемента с max_value
        "jle .endMax1\n"
        "movl %%ebx, %1\n"        // Иначе обновить max_value
        ".endMax1:\n"

        "movl %%ecx, %2\n"        // Сохранить индекс в переменную
        : "=r"(tmp), "+r"(max_value), "=r"(i)
        : "r"(array)
        : "eax", "ebx", "ecx", "edi"
    );

    printf("Current value: %d\n", tmp);

    asm(
        "movl %0, %%ecx\n"        // Индекс i
        "movl %1, %%edi\n"        // Адрес массива

        "incl %%ecx\n"
        "addl $4, %%edi\n"
        "cmpl $10, %%ecx\n"
        "jle .startCycle1\n"

        : "=r"(i)  
        : "r"(array)
        : "ecx", "edi", "memory"
    );

    printf("Maximum value: %d\n", max_value);
    return 0;
}
