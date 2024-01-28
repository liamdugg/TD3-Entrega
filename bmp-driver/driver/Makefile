KERNEL_SOURCE = /lib/modules/$(shell uname -r)/build
MOD_NAME = liam_module

obj-m += $(MOD_NAME).o
EXTRA_CFLAGS := -I$(src)/inc

$(MOD_NAME)-objs := src/p_drv.o src/i2c.o src/c_dev.o src/bmp.o

all: build insmod

build:
	clear
	make -C ${KERNEL_SOURCE} M=${PWD} modules

clean: 
	make -C ${KERNEL_SOURCE} M=${PWD} clean

insmod:
	sudo insmod $(MOD_NAME).ko

rmmod:
	sudo rmmod $(MOD_NAME).ko

tail:
	tail -f /var/log/syslog