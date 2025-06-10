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

## ⚙️ Phase 0: Setup & First Flash
| Lesson | Topic                    | Outcome                              |
| ------ | ------------------------ | ------------------------------------ |
| 0.1    | [PlatformIO + CubeMX sync](doc/environment.md) | Set up and build STM32 project flow  |
| 0.2    | [LED blink with HAL](doc/GPIO/led-blink.md)| Confirm flashing + basic GPIO output |

---

## ⚙️ Phase 1: GPIO + Timing
| Lesson | Topic                            | Skills Acquired                    |
| ------ | -------------------------------- | ---------------------------------- |
| 1.1    | [`HAL_GPIO_TogglePin()`](doc/GPIO/led-blink.md###HAL_GPIO_TogglePin)| GPIO output, LED blink|
| 1.2    | [`HAL_Delay()`](doc/GPIO/led-blink.md###HAL_Delay)| Basic blocking delay|
| 1.3    | [`HAL_GetTick()`](doc/GPIO/led-blink.md###HAL_Delay)| Non-blocking loop, software timer  |
| 1.4    | [`HAL_GPIO_ReadPin()`](doc/GPIO/button.md)| Read button via `HAL_GPIO_ReadPin`, Edge detection + software debounce|

---

## 🧪 Phase 2: UART & Serial Communication

| Lesson | Topic                      | Skills Gained                             |
|--------|----------------------------|-------------------------------------------|
| 2.1    | UART `printf` via USB      | Serial debug output                       |
| 2.2    | Receive UART commands      | Control LED via typed commands            |

---

## ⚡ Phase 3: Timer, PWM & Delay Accuracy

| Lesson | Topic                    | Skills Gained                              |
|--------|--------------------------|--------------------------------------------|
| 3.1    | Timer-based LED blink    | Use hardware timer                         |
| 3.2    | PWM for brightness       | LED dimming with `HAL_TIM_PWM_Start()`     |
| 3.3    | Servo control with PWM   | Precision PWM control                      |

---

## 📈 Phase 4: ADC & Analog Sensor Input

| Lesson | Topic                     | Skills Gained                              |
|--------|---------------------------|--------------------------------------------|
| 4.1    | Basic ADC                 | Read potentiometer, convert to voltage     |
| 4.2    | ADC + OLED                | Display sensor values                      |
| 4.3    | ADC with DMA              | Efficient analog sampling                  |

---

## 🔌 Phase 5: I2C & SPI Communication

| Lesson | Topic                     | Skills Gained                              |
|--------|---------------------------|--------------------------------------------|
| 5.1    | I2C OLED display          | Display text over SSD1306                  |
| 5.2    | Read digital sensor (I2C) | e.g., temperature, IMU                     |
| 5.3    | SPI display or SD card    | Fast peripheral communication              |

---

## 🧠 Phase 6: Structuring + C++ (optional)

| Lesson | Topic                         | Skills Gained                            |
|--------|-------------------------------|------------------------------------------|
| 6.1    | Modular C file structure       | `gpio.c`, `uart.c`, etc.                 |
| 6.2    | Wrap peripherals in C++       | C++ class for LED, Button, UART          |
| 6.3    | HAL + C++ OOP architecture    | Clean project structure                  |

---

## 🧩 Bonus Phase: Advanced / Optional

| Lesson | Topic                    | Use Case                                 |
|--------|--------------------------|------------------------------------------|
| B.1    | External Interrupts (EXTI)| Button with interrupt handler            |
| B.2    | FreeRTOS                 | Task scheduling and delay accuracy       |
| B.3    | USB CDC / HID device     | Use MCU as virtual serial / keyboard     |


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
