#CONFIG_UCLIBC_BUILD=y
CROSS_COMPILE?= #mips-linux-uclibc-gnu-

INCLUDES = -I./include/imp_sys
SDK_LIB_DIR     =  ./lib/imp_sys/uclibc
IMP_LIBS        = $(SDK_LIB_DIR)/libimp.so $(SDK_LIB_DIR)/libalog.so
LIBS    =  $(IMP_LIBS)

CC = $(CROSS_COMPILE)gcc
CPLUSPLUS = $(CROSS_COMPILE)g++
LD = $(CROSS_COMPILE)ld
AR = $(CROSS_COMPILE)ar cr
STRIP = $(CROSS_COMPILE)strip

CFLAGS = $(INCLUDES) -O2 -Wall #-march=mips32r2

ifeq ($(CONFIG_UCLIBC_BUILD), y)
        CFLAGS += -muclibc
        LDFLAG += -muclibc
endif

#LIBS = $(SDK_LIB_DIR)/libimp.a $(SDK_LIB_DIR)/libalog.a

LDFLAG += -Wl,-gc-sections


#C_COMPILER   =  $(CROSS_COMPILE)gcc


#LDLIBS = -lpthread

TARGET := rtp_push

.PHONY : clean all

#all: $(TARGET)

APP = rtp_push
LINK_OPTS = 
LINK_OBJ  = rtp.o

$(APP): $(LINK_OBJ)
		$(CC) -o $@  $(LINK_OBJ) $(LINK_OPTS)

clean:
		rm -rf *o $(APP)