// ride_sharing_statistics.c
#include <stdio.h>
#include <stdlib.h>

int compare(const void* a, const void* b) {
    return (*(int*)a - *(int*)b);
}

float calculate_mean(int arr[], int size) {
    int sum = 0;
    for (int i = 0; i < size; i++)
        sum += arr[i];
    return (float)sum / size;
}

float calculate_median(int arr[], int size) {
    qsort(arr, size, sizeof(int), compare);
    if (size % 2 == 0)
        return (arr[size/2 - 1] + arr[size/2]) / 2.0;
    else
        return arr[size/2];
}

void calculate_mode(int arr[], int size) {
    int max_count = 0, count = 1;
    qsort(arr, size, sizeof(int), compare);

    printf("Mode(s): ");
    for (int i = 1; i <= size; i++) {
        if (i < size && arr[i] == arr[i-1])
            count++;
        else {
            if (count > max_count) {
                max_count = count;
            }
            count = 1;
        }
    }

    count = 1;
    for (int i = 1; i <= size; i++) {
        if (i < size && arr[i] == arr[i-1])
            count++;
        else {
            if (count == max_count)
                printf("%d ", arr[i-1]);
            count = 1;
        }
    }
    printf("\n");
}

int main() {
    int arr[] = {2, 3, 2, 5, 3, 4, 2, 5, 5};
    int size = sizeof(arr) / sizeof(arr[0]);

    printf("Mean: %.2f\n", calculate_mean(arr, size));
    printf("Median: %.2f\n", calculate_median(arr, size));
    calculate_mode(arr, size);

    return 0;
}
