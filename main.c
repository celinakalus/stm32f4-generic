#include "stm32f4xx.h"
#include "stm32f4xx_hal_conf.h"

#define GPIOEN(port) RCC->AHB1ENR |= 
#define SETOUT(port, pin) port->MODER = (port->MODER & ~(0x03 << (pin << 1))) | (0x01 << (pin << 1))
#define TOGGLE(port, pin) port->ODR ^= (1 << pin)

void __libc_init_array(void) {
    
}

int main(void) {
    int a = 1;
    int b = 1;

    RCC->AHB1ENR |= RCC_AHB1ENR_GPIOCEN;
    SETOUT(GPIOC, 13);
    while (1) {
        int tmp = a;
        a = a + b;
        b = tmp;

        TOGGLE(GPIOC, 13);
    }
}