# stm32f4-generic
Generic barebones project for STM32F4.

## Prerequisites
You will need an `arm-none-eabi-gcc` toolchain, which is available for download [here](https://developer.arm.com/downloads/-/gnu-rm). Tested with version 12.2.1.

## Setup
This repository depends on the [STM32CubeF4](https://github.com/STMicroelectronics/STM32CubeF4/) software package provided by STmicroelectronics. Use
```
$ git submodule update --init --recursive
```

## Building
A more proper build system will follow, but for now, build with
```
$ make
```
