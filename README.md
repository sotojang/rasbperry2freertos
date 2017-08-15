# FreeRTOS Ported to Raspberry Pi
This provides a very basic port of FreeRTOS to Raspberry pi.

# GCC-ARM
URL: https://launchpad.net/gcc-arm-embedded/+milestone/4.7-2013-q1-update
File: gcc-arm-none-eabi-4_7-2013q1-20130313-win32.exe (md5)
 
## How to Build
C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS>make
C:\GNUARM\bin\arm-none-eabi-gcc -march=armv6z -gdwarf-2 -O0 -Wall -Traspberrypi.ld -lgcc -lc  -IC:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS/source/Drivers -IC:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS/freertos/Source/portable/GCC/RaspberryPi -IC:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS/freertos/Source/include -I. C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\source/main.c C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\freertos\Source\portable\GCC\RaspberryPi/port.c C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\freertos\Source\portable\GCC\RaspberryPi/portisr.c C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\freertos\Source/croutine.c C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\freertos\Source/list.c C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\freertos\Source/queue.c C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\freertos\Source/tasks.c C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\source\Drivers/irq.c C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\source\Drivers/gpio.c C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\freertos\Source\portable\MemMang/heap_4.c C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\source\startup.s -o obj/RaspberryPi-FreeRTOS.elf
C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\source/main.c:35:6: warning: return type of 'main' is not 'int' [-Wmain]
C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\source/main.c: In function 'main':
C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\source/main.c:39:2: warning: pointer targets in passing argument 2 of 'xTaskGenericCreate' differ in signedness [-Wpointer-sign]
In file included from C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\source/main.c:2:0:
C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS/freertos/Source/include/task.h:1282:22: note: expected 'const signed char * const' but argument is of type 'char *'
C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\source/main.c:40:2: warning: pointer targets in passing argument 2 of 'xTaskGenericCreate' differ in signedness [-Wpointer-sign]
In file included from C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\source/main.c:2:0:
C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS/freertos/Source/include/task.h:1282:22: note: expected 'const signed char * const' but argument is of type 'char *'
C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\freertos\Source\portable\GCC\RaspberryPi/port.c:7:17: warning: missing terminating " character [enabled by default]
C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\freertos\Source\portable\GCC\RaspberryPi/port.c:7:17: warning: extra tokens at end of #include directive [enabled by default]
C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\freertos\Source\portable\GCC\RaspberryPi/port.c: In function 'prvSetupTimerInterrupt':
C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS\freertos\Source\portable\GCC\RaspberryPi/port.c:172:16: warning: variable 'ulCompareMatch' set but not used [-Wunused-but-set-variable]
C:\GNUARM\bin\arm-none-eabi-objcopy -O ihex obj/RaspberryPi-FreeRTOS.elf obj/RaspberryPi-FreeRTOS.hex
C:\GNUARM\bin\arm-none-eabi-objcopy -O binary obj/RaspberryPi-FreeRTOS.elf obj/RaspberryPi-FreeRTOS.bin
C:\GNUARM\bin\arm-none-eabi-objdump -Wi obj/RaspberryPi-FreeRTOS.elf > obj/RaspberryPi-FreeRTOS.map
---------------------------------------------------------------
C:\GNUARM\bin\arm-none-eabi-size obj/RaspberryPi-FreeRTOS.elf
   text    data     bss     dec     hex filename
  19964    1100    5120   26184    6648 obj/RaspberryPi-FreeRTOS.elf
---------------------------------------------------------------
 Finished ...

C:\GNUARM\workspace\RTOS\RaspberryPi-FreeRTOS>



Hope this helps.

SotoLAB
