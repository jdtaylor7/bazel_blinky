arm-none-eabi-g++ -c -mcpu=cortex-m3 -mthumb --std=c++17 -O2 -fno-rtti -fno-exceptions -Iinclude/cmsis -Iinclude/stm32f1xx src/main.cpp -o main.o
arm-none-eabi-g++ -mcpu=cortex-m3 -mthumb -Tlinkerscript.ld -nostartfiles main.o -o main.elf
arm-none-eabi-objcopy -O binary main.elf main.bin

ST-LINK_CLI.exe -c
ST-LINK_CLI.exe -P main.bin 0x08000000
ST-LINK_CLI.exe -Rst
