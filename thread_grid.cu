#include <stdio.h>

__global__ void helloCUDA()
{
    printf("Thread x:%d thread y:%d thread z:%d\n", threadIdx.x, threadIdx.y, threadIdx.z);
    printf("Block x:%d block y:%d block z:%d\n", blockIdx.x, blockIdx.y, blockIdx.z);
}

int main()
{
    unsigned int nx = 16;
    unsigned int ny = 16;
    
    dim3 block(8, 8, 8);
    dim3 grid( nx / block.x, ny / block.y);
    
    helloCUDA<<<grid, block>>>();
    cudaDeviceSynchronize();
    return 0;
}
