#include "stdio.h"

int x;
int main(){
    x = 0;
    asm(        
        "movl $0, %eax\n"
        "mark:      addl $10, %eax\n"
        "movl %eax, x"
    );
    printf("%d", x);

    int a = 10;
    int b = 20;
    int c;

    asm(
        "movl %1, %%eax\n"     
        "addl %2, %%eax\n"     
        "movl %%eax, %0\n"     
        : "=r" (c)            
        : "r" (a), "r" (b)    
        : "%eax"
    );

    asm(
        "cmp $15, %0\n"        
        "jge greater_or_equal\n" 
        "movl $0, %1\n"        
        "jmp end\n"            
        "greater_or_equal:\n"  
        "movl $1, %1\n"       
        "end:"               
        : "=r" (c)           
        : "r" (c)            
        : "%eax"
    );

    printf("%d", c);

// Оператор сравнения
    int e;

    if (e >= 15)
        printf("True");
    else
        printf("False");

// Оператор сравнения

    asm(
        ";Comment"
    );

// Работа с глобальными массивами

    int mas[15];
    int _mas[12][4];

    mas[4] = 95;
    mas[5] = 96;
    mas[6] = 97;
    _mas[2][1] = 401;
    _mas[3][1] = 402;
    _mas[2][2] = 501;
    _mas[2][3] = 502;

    _mas[0][0] = _mas[2][3] - mas[6];

// Работа с глобальными массивами

// Условный оператор if
    int one = 13;
    int two = 19;
    int _result;

    // if (one >= two)
    //     _result = 0;
    // else
    //     _result = 1;

    asm(
        "movl %1, %%eax\n"
        "   cmpl %2, %%eax\n"
        "   jge greater_or_equal\n"// Условный переход  
        "   movl $0, %0\n"            
        "   jmp end\n"// Безусловный переход              
        "   greater_or_equal\n"// Метка       
        "   movl $1, %0\n"             
        "   end:"// Метка                
        : "=r" (_result)            
        : "r" (one), "r" (two)       
        : "%eax"               
    );

// Условный оператор if

// Цикл for
    // int sum = 0;
    // for (int i = 0; i < 5; i++)
    //     sum += i;
    int i;
    int sum = 0;
    asm(
        "movl $0, %%ecx\n" // Счетчик цикла (с нуля)
        "movl $5, %%ebx\n" // Счетчик цикла (до 5)
        "movl $0, %0\n"
        "loop_start:\n" // Метка начала цикла
        "addl %%ecx, %0\n"
        "incl %%ecx\n" // Увел счетчик на 1
        "loop loop_start\n"
        : "=r" (sum)             
        :                         
        : "%ecx", "%ebx" 
    );

// Цикл for

// Цикл while

    // int i = 0;
    // int sum = 0;
    // while (i < 7)
    //     sum += i;

    int j = 0;
    int _sum = 0;
    asm(
        "movl $0, %%ecx\n" // Счетчик
        "movl $7, %%ebx\n" // До 7
        "movl $0, %0\n" 
        "while_start:\n" // Метка
        "cmpl %%ebx, %%ecx\n"
        "jge while_end\n" 
        "addl %%ecx, %0\n"
        "incl %%ecx\n"    
        "jmp while_start\n"
        "while_end:\n"          
        : "=r" (_sum)    
        :                       
        : "%ecx", "%ebx"  
    );

// Цикл while

// Максимум из двух чисел
    int input1, input2;
    input1 = 2;
    input2 = 2048;
    int max;

    asm(
    "movl %1, %%eax\n"
    "cmpl %2, %%eax\n" 
    "jge is_a_greater_or_equal\n"
    "movl %2, %%eax\n"
    "jmp end\n"
    "is_a_greater_or_equal\n"
    "movl %1, %%eax\n"
    "end:"
    "movl %%eax, %0\n"
    : "=r" (max)
    : "r" (input1), "r" (input2)
    : "%eax"
    );

    printf("%d", max);

// Максимум из двух чисел

// Сумма элементов массива

    int array[10] = {16, 12, 89, 79, 56, 34, 17, 1920, 11, 13};
    int summary;

    __asm__ (
        "movl $0, %%ecx\n" // Индекс i
        "movl $0, %%ebx\n" // Сумма
        "movl %1, %%esi\n"  // Адрес массива
        "movl %2, %%edx\n" // Размер массива

        "loop_start:"
        "cmpl %%edx, %%ecx\n" // Сравниваем индекс с размером массива
        "jge loop_end\n" // Если индекс >= размер массива, выходим из цикла

        "movl (%%esi, %%ecx, 4), %%eax\n"
        "addl %%eax, %%ebx\n" 
        "incl %%ecx\n"  // Увеличиваем индекс
        "jmp loop_start\n" 

        "loop_end:"        
        "movl %%ebx, %0\n"   
        : "=r" (summary)     
        : "r" (array), "r" (10) 
        : "%eax", "%ecx", "%ebx", "%esi", "%edx" 
    );
// Сумма элементов массива

// Максимальный элемент массива с разрывом ассемблерной вставки
    int _max = array[0];
    int current;
        asm(
        "movl %1, %%esi\n" // Адрес массива
        "movl $0, %%ecx\n" // Индекс
        "movl %2, %%edx\n" // Размер массива

        "movl (%%esi, %%ecx, 4), %%ebx\n" 
        "movl %%ebx, %0\n"       

        "loop_start:"              
        "cmpl %%edx, %%ecx\n"         
        "jge loop_end\n"              

        "movl (%%esi, %%ecx, 4), %%eax\n" 
        "movl %%eax, %1\n"
        );

        printf("%d", current);

        asm(
        "cmpl %%ebx, %%eax\n"          
        "jle skip_update\n"           
        "movl %%eax, %%ebx\n"         
        "skip_update:" // Пропуск обновления max              

        "incl %%ecx\n"     
        "jmp loop_start\n"         

        "loop_end:"       
        "movl %%ebx, %0\n"       
        : "=r" (_max), "=r" (current)            
        : "r" (array), "r" (10) 
        : "%eax", "%ebx", "%ecx", "%esi", "%edx" 
    );
// Максимальный элемент массива


}
