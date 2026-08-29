#!/usr/bin/env bash

set -euo pipefail

MCU="attiny85"
F_CPU="1000000UL"
TARGET="breathingLED"

echo "Building for ATtiny85..."

avr-gcc \
    -mmcu="$MCU" \
    -DF_CPU="$F_CPU" \
    -std=c17 \
    -Os \
    -Wall \
    -Wextra \
    -Wpedantic \
    -ffunction-sections \
    -fdata-sections \
    -Wl,--gc-sections \
    main.c \
    -o "$TARGET.elf"

avr-objcopy \
    -O ihex \
    -R .eeprom \
    "$TARGET.elf" \
    "$TARGET.hex"

avr-size \
    -C \
    --mcu="$MCU" \
    "$TARGET.elf"

echo
echo "Created:"
echo "  $TARGET.elf"
echo "  $TARGET.hex"
