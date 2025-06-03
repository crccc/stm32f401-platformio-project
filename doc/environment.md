# Learning note

Thanks ... GPT 

## Environment
### cubeMX
#### What cubeMX do?
- CubeMX help to set GPIO / UART / Clock and generate initial code
  
| auto generate                  | function                     |
| ----------------------- | ------------------------ |
| `SystemClock_Config()`  | set PLL,SYSCLK,HCLK,PCLK etc. |
| `MX_GPIO_Init()`        | initialize pins like LED, button        |
| `MX_USARTx_UART_Init()` | initialize UART serial settings        |
| `HAL_Init()`            | initialize HAL  |
#### Concepts
| Principle                                  | Explanation                                                                                                                                                              |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| ⚡ **No clock, no run**                     | Without proper clock configuration, the MCU operates slowly or incorrectly. UART may produce garbage output, timers will be inaccurate, and delay functions will be off. |
| 🔌 **No pin setup, no response**           | All GPIOs default to high-impedance (Hi-Z). You must configure them as input/output to make them functional (e.g., LEDs won’t light up, buttons won’t work).             |
| 🔧 **No initialization, no communication** | Peripherals like UART, ADC, I2C, SPI must be explicitly initialized before use. Otherwise, data won't be transmitted/received.                                           |

#### Steps
1. register on stm website
2. download cubeMX
3. connect to stm32 and generate code
   1. use default settings for a beginer 
### VSCode + PlatformIO
1. install vscode + PlatformIO extension
2. install PlatformIO 
```zsh
brew install platformio
```
3. create platform io project
4. generate Makefile to copy cubeMX generate code to platformio folder
   1. be careful of main.c overwrite
5. try to build and upload to the board
```zsh
pio run -t upload
```

## STM32 SWD/JTAG debug interface disabled (Q__Q)
### !! How to fix !!
#### Connect Under Reset
1. platformio.ini change to following content
```
[env:nucleo_f401re]
platform = ststm32
board = nucleo_f401re
framework = stm32cube
upload_protocol = stlink
upload_flags =
  -c "reset_config srst_only srst_nogate connect_assert_srst"

```
2. Before Upload
   1. hold hardware RESET button
   2. ```pio run -t upload```
   3. wait all things done and release RESET button
   4. Revert platform and upload correct firmware
