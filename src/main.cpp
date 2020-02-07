#include "stm32f103xb.h"

void mainFn() {
    RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;
    GPIOC->CRH = 0b0100'0100'0011'0100'0100'0100'0100'0100;
    GPIOC->BRR = 1 << 13;

    while (1) {
        int ctr;
        ctr = (8000000 / 3) / 2;
        // each loop iteration takes 3 cycles to execute.
        while (ctr) {
            asm ("");
            --ctr;
        }
        GPIOC->BRR = 1 << 13;
        ctr = (8000000 / 3) / 2;
        // each loop iteration takes 3 cycles to execute.
        while (ctr) {
            asm ("");
            --ctr;
        }
        GPIOC->BSRR = 1 << 13;
    }
}

/*
 * Set up the vector table.
 *
 * "__attribute__ ((section(".vectors")))" defines a variable attribute which
 * instructs GCC to emit this variable into the beginning of the .vectors
 * section. This is later found by the linker.
 *
 * Type is vector of (void (*)()) because table is filled with (mostly) function
 * pointers.
 *
 * Since this table never changes and is stored in flash, it's declared const.
 *
 * Const-qualification of a non-local non-volatile variable gives it internal
 * linkage. To provide it with external linkage, declare as extern. This allows
 * the structure to be accessed from other translation units.
 *
 * First entry contains the reset value of the stack pointer. Since the stack
 * grows towards lower addresses and the start of SRAM is at 0x20000000,
 * <address value> - 0x20000000 specifies the stack size.
 *
 * The second entry corresponds to the reset handler, which is where program
 * execution starts once the microcontroller resets/powers on.
 */
typedef void (* const const_func_pointer_t)();
extern const_func_pointer_t vectors[] __attribute__ ((section(".vectors"))) =
{
    (void (*)())0x20000400,
    mainFn,
};
