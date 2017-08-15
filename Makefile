#
#  Copyright (C) 2017 by SotoLAB
#  <soto1935@gmail.com>
#
# See file CREDITS for list of people who contributed to this
# project.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of
# the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
# MA 02111-1307 USA
# 	

####################################################
####     Tools Path Definition       ####
####################################################
PROJ_NAME	= RaspberryPi-FreeRTOS
PART		= RTOS
TOPDIR		= C:\GNUARM\workspace\$(PART)\$(PROJ_NAME)
OUT_DIR		= sources
RTOS_NAME	= FreeRTOS
BSPDIR		= $(TOPDIR)\$(OUT_DIR)
RTOSDIR		= $(TOPDIR)\$(RTOS_NAME)
TARGET		= arm-none-eabi
TOOLDIR		= C:\GNUARM
LIBCDIR		= $(TOOLDIR)\$(TARGET)\lib
LIBGCCDIR	= $(TOOLDIR)\lib\gcc\$(TARGET)\4.7.3


AS			= $(TOOLDIR)\bin\$(TARGET)-as
CC			= $(TOOLDIR)\bin\$(TARGET)-gcc
AR			= $(TOOLDIR)\bin\$(TARGET)-ar -r
NM 			= $(TOOLDIR)\bin\$(TARGET)-nm
LD			= $(TOOLDIR)\bin\$(TARGET)-ld
SIZE		= $(TOOLDIR)\bin\$(TARGET)-size
OBJCOPY		= $(TOOLDIR)\bin\$(TARGET)-objcopy
OBJDUMP		= $(TOOLDIR)\bin\$(TARGET)-objdump

MK			= mkdir
RM			= rm -rf
OUT_DIR		= obj

####################################################
#####      File Definition           ####
####################################################
SRCS = main.c 

# RTOS
SRCS += port.c portisr.c croutine.c list.c queue.c tasks.c irq.c gpio.c heap_4.c 

# add startup file to build
SRCS += $(TOPDIR)\source\startup.s

####################################################
####             Option Definition              ####
####################################################
# Include files from STM libraries
CFLAGS = -march=armv6z -gdwarf-2 -O0 -Wall -Traspberrypi.ld -lgcc -lc 

CFLAGS += -I$(TOPDIR)/source/Drivers
CFLAGS += -I$(TOPDIR)/freertos/Source/portable/GCC/RaspberryPi
CFLAGS += -I$(TOPDIR)/freertos/Source/include
CFLAGS += -I.

OBJS = $(SRCS:.c=.o)

vpath %.c $(TOPDIR)\source
vpath %.c $(TOPDIR)\source\Drivers
vpath %.c $(TOPDIR)\freertos\Source
vpath %.c $(TOPDIR)\freertos\Source\portable\GCC\RaspberryPi
vpath %.c $(TOPDIR)\freertos\Source\portable\MemMang

.PHONY: proj

all: proj

proj: $(PROJ_NAME).elf

$(PROJ_NAME).elf: $(SRCS)
	$(MK) $(OUT_DIR)
	$(CC) $(CFLAGS) $^ -o $(OUT_DIR)/$@ 
	$(OBJCOPY) -O ihex $(OUT_DIR)/$(PROJ_NAME).elf $(OUT_DIR)/$(PROJ_NAME).hex
	$(OBJCOPY) -O binary $(OUT_DIR)/$(PROJ_NAME).elf $(OUT_DIR)/$(PROJ_NAME).bin
	$(OBJDUMP) -Wi $(OUT_DIR)/$(PROJ_NAME).elf > $(OUT_DIR)/$(PROJ_NAME).map
	@echo ---------------------------------------------------------------
	$(SIZE) $(OUT_DIR)/$@
	@echo ---------------------------------------------------------------
	@echo  Finished ...

clean:
	$(RM) $(OUT_DIR)

dep:
	$(CC) -M $(INCLUDE) $(SRCS) > .depend

ifeq (.depend,$(wildcard .depend))
include .depend
endif
