//直接插入排序  
//假设待排序的记录存放在数组R[1..n]中。  
//初始时，R[1]自成1个有序区，无序区为R[2..n]。  
//从i=2起直至i=n为止，依次将R[i]插入当前的有序区R[1..i-1]中，  
//生成含n个记录的有序区。  

//即将数据逐个插入到有序的数列中
#include <stdio.h>  
#include <stdlib.h>  
#define N 10  
void InsertSort(int a[], int size)  
{  
    int i, j, k, temp = 0;  
    for(i = 1; i < size; i++)  //从第二个开始
    {  
        temp = a[i];  //将要插入的数据放到临时变量中
        for(j = 0; j < i; j++)  
        {  
            if(temp < a[j])  
            {  
                for(k = i - 1; k >= j; k--)  
                {  
                    a[k + 1] = a[k];  
                }  
                a[j] = temp;  
                break;  
            }  
        }  
    }  
}  
  
  
  
int main()  
{  
    int m = 0;  
    int b[N] = {9, 8, 7, 6, 5, 4, 3, 2, 1};  
    printf("=============================\n\n");  
    printf("排序前的数据是:\n9 8 7 6 5 4 3 2 1\n");      
    InsertSort(b, N);  
    printf("排序后的结果是：\n");  
    for(m = 0; m < N; m++)  
    {  
        printf(" %d ", b[m]);  
    }  
    printf("\n\n=============================\n\n");  
    return 0;  
}  