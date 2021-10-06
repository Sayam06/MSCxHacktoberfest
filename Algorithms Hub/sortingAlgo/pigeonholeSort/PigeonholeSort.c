#include<stdio.h>
void pigeonholeSort(int max, int min, int n, int *hole)
{
    int i, count = 0;
    int *currentHole;
    currentHole = hole;
    int holes[n];
    for(i = 0; i < n; i++)
    {
        holes[i] = 0;
    }
    for(i = 0; i < n; i++, currentHole++)
    {
        holes[*currentHole - min] += 1;
    }
    for(count = 0, currentHole = &hole[0]; count < n; count++)
    {
        while((holes[count]--) > 0)
        {
            *currentHole++ = count + min;
        }
    }
}
int main()
{
    int n;
    printf("Enter Number of Elements: ");
    scanf("%d", &n);
    int i, arr[n], max, min;
    for(i = 0; i < n; i++)
    {
        printf("Enter Element Number %d: ", i + 1);
        scanf("%d", &arr[i]);
    }
    min = arr[0];
    max = arr[0];
    for(i = 1; i < n; i++)
    {
        if(arr[i] < min)
        {
            min = arr[i];
        }
        if(arr[i] > max)
        {
            max = arr[i];
        }
    }
    pigeonholeSort(max, min, n, arr);
    printf("\nSorted Array:\n\n");
    for(i = 0; i < n; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");
    return 0;
}