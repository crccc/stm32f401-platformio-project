# STM32F401 PlatformIO Project

This project is designed for the STM32F401 microcontroller learning of using PlatformIO. 

## Project Structure

- **doc/**: Learning notes
  
- **src/**: Contains the main application code.
  - **main.c**: The main entry point of the application.
  
- **include/**: Intended for header files. You can add your custom header files here.

- **lib/**: Intended for additional libraries that may be used in the project.

- **platformio.ini**: Configuration file for PlatformIO, specifying board type, framework, and libraries.


# 🌱 STM32 Learning Roadmap (C / C++ + HAL + PlatformIO)

## ✅ Phase 1: Essential Foundations

| Topic               | Description                                         |
|--------------------|-----------------------------------------------------|
| GPIO Input / Output| Buttons, switches, [LED Blink](doc/gpio/led-blink.md)                        |
| UART Communication | Print debug info, receive serial commands           |
| Timer / PWM        | LED brightness, precise delays, motor control       |
| External Interrupt | Button-triggered events, wake-up applications       |
| ADC                | Read analog sensors (e.g., potentiometers, temp)    |
| I2C / SPI / UART   | Communicate with displays, sensors, modules         |
| DMA                | Efficient data transfer (e.g., UART/ADC with DMA)   |
| System Structure   | C++ modularization or FreeRTOS for multitasking     |

---

## 🧪 Mini Project Ideas

| Project Name           | Concepts Used                              |
|------------------------|--------------------------------------------|
| Digital Thermometer    | UART + ADC + temperature sensor (NTC)      |
| Breathing Light        | PWM + Timer                                |
| Digital Voltmeter      | ADC + OLED (via I2C)                       |
| UART Command Receiver  | Serial input to control GPIO               |
| IR Remote Receiver     | Timer + External Interrupt + Signal Decode |

---
