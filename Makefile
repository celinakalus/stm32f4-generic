.RECIPEPREFIX=>

SOURCES = main.c
GCCFLAGS += -g
GCCFLAGS += -DSTM32F411xE
GCCFLAGS += -mcpu=cortex-m4
GCCFLAGS += -mthumb
GCCFLAGS += -mfloat-abi=softfp
GCCFLAGS += -nostdlib
GCCFLAGS += -lc

# paths to STM32CubeF4 components
DRIVER_PATH = ./STM32CubeF4/Drivers/CMSIS/Device/ST/STM32F4xx
CMSIS_PATH = ./STM32CubeF4/Drivers/CMSIS
HAL_PATH = ./STM32CubeF4/Drivers/STM32F4xx_HAL_Driver
LD_SCRIPT_PATH = ./STM32CubeF4/Projects/STM32F411RE-Nucleo/Examples/HAL/HAL_TimeBase_TIM/SW4STM32/STM32F4xx-Nucleo/STM32F411CEUx_FLASH.ld

# STM32F4 bare metal driver
SOURCES += ${DRIVER_PATH}/Source/Templates/system_stm32f4xx.c
SOURCES += ${DRIVER_PATH}/Source/Templates/gcc/startup_stm32f411xe.s
GCCFLAGS += -I${DRIVER_PATH}/Include

# CMSIS
GCCFLAGS += -I${CMSIS_PATH}/Include/

# STM32F4 HAL driver
SOURCES += ${HAL_PATH}/Src/stm32f4xx_hal.c
SOURCES += ${HAL_PATH}/Src/stm32f4xx_hal_cortex.c
SOURCES += ${HAL_PATH}/Src/stm32f4xx_hal_gpio.c
SOURCES += ${HAL_PATH}/Src/stm32f4xx_hal_i2c.c
SOURCES += ${HAL_PATH}/Src/stm32f4xx_hal_dma.c
SOURCES += ${HAL_PATH}/Src/stm32f4xx_hal_rcc.c
SOURCES += ${HAL_PATH}/Src/stm32f4xx_hal_tim.c
SOURCES += ${HAL_PATH}/Src/stm32f4xx_hal_tim_ex.c
GCCFLAGS += -I${HAL_PATH}/Inc
GCCFLAGS += -I.

# linker script
GCCFLAGS += -Wl,-T"${LD_SCRIPT_PATH}"

out.elf: ${SOURCES}
> arm-none-eabi-gcc -o $@ $^ ${GCCFLAGS}
