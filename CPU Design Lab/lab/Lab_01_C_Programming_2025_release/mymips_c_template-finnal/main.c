#include "mfp_io.h"
#include <stdint.h>

void delay();

int main() {
    volatile uint8_t n;  // 通过8位开关控制n（范围0-255）
    volatile uint32_t fib[256]; // 预分配足够空间（根据实际需求调整）
    fib[0] = 1;
    fib[1] = 1;

    while (1) {
        // 步骤1：读取开关值并转换为n
        n = MFP_SWITCHES & 0xFF; // 取低8位（假设开关组为8位）
		MFP_7SEGDIGITS=n;
        volatile int i=2;
        if (n >= 2) {
            for (i = 2; i <= n; i++) {
                fib[i] = fib[i-1] + fib[i-2];
            }
        }
		i=0;
        // 步骤3：循环显示前n个斐波那契数（动态更新）
        for (i = 0; i <= n; i++) {
            MFP_LEDS = fib[i]; // 输出到LED（二进制显示）
            delay();          // 控制显示间隔
        }
		
    }
    return 0;
}

void delay() {
    volatile unsigned int j;
    for (j = 0; j < 1000000; j++); // 调整循环次数以控制延时
}