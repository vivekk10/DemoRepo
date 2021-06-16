CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -mfloat-abi=soft -std=gnu11 -Wall -O0
LDFLAGS= -nostdlib -T stm32_ls.ld -Wl,-Map=finalled.map
source= main.c led.c stm32_startup.c
all:main.o led.o stm32_startup.o finalled.elf
gitall:add push

main.o:main.c
	$(CC) $(CFLAGS) -o $@ $^

led.o:led.c
	$(CC) $(CFLAGS) -o $@ $^

stm32_startup.o:stm32_startup.c
	$(CC) $(CFLAGS) -o $@ $^

finalled.elf:main.o led.o stm32_startup.o
	$(CC) $(LDFLAGS) -o $@ $^
clean:
	rm -rf *.o *.elf *.map 

analysis:
	cppcheck --enable=all --inconclusive $(source)

git:
	git init

add:
	git add .
	git commit -m="$m"
	
status:
	git status
	
clone:
	git clone "$c"
	
push:
	git push

pull:
	git pull
