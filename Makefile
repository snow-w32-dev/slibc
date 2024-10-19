AR := $(CROSS_COMPILE)ar
CC := $(CROSS_COMPILE)gcc

ifeq ($(ARCH),)
    $(warning ARCH is not set)
endif

CPPFLAGS += -I$(ARCH) -Iinc

ifeq ($(SNOW),)
    $(info === Targeting $(ARCH) Linux ===)

    CPPFLAGS += -DNO_SNOW
else
    $(info === Targeting $(ARCH) SNOW ===)
endif

CFLAGS += -fPIC -g

ASM_SRCS := $(wildcard $(ARCH)/*.S *.S)
C_SRCS := $(wildcard $(ARCH)/*.c *.c)

ASM_DEPS := $(patsubst %.S,%.d,$(ASM_SRCS))
C_DEPS := $(patsubst %.c,%.d,$(C_SRCS))

ASM_OBJS := $(patsubst %.S,%.o,$(ASM_SRCS))
C_OBJS := $(patsubst %.c,%.o,$(C_SRCS))

ALL_DEPS := $(ASM_DEPS) $(C_DEPS)
ALL_OBJS := $(ASM_OBJS) $(C_OBJS)

CRT0_OBJS := $(ARCH)/start.o crt0.o
SLIBC_OBJS := $(filter-out $(CRT0_OBJS),$(ALL_OBJS))

all: slibc_crt0.o slibc.a

%.o: %.S
	$(CC) -MD -MT $@ -MP -MF $(patsubst %.S,%.d,$<) \
		-c $(CPPFLAGS) $(CFLAGS) $< -o $@

%.o: %.c
	$(CC) -MD -MT $@ -MP -MF $(patsubst %.c,%.d,$<) \
		-c $(CPPFLAGS) $(CFLAGS) $< -o $@

-include $(ALL_DEPS)

slibc_crt0.o: $(CRT0_OBJS)
	$(CC) $(CFLAGS) -r $^ -o $@

slibc.a: $(SLIBC_OBJS)
	$(AR) rcs $@ $^

clean:
	rm -f slibc_crt0.o slibc.a $(ALL_DEPS) $(ALL_OBJS)

.PHONY: all clean
