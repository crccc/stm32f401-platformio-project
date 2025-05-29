# LED Blink
## API
### HAL_GPIO_TogglePin

Toggles the output state of a specific GPIO pin — switches it from HIGH to LOW or from LOW to HIGH.



#### Function Prototype

```c
void HAL_GPIO_TogglePin(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin);
```
#### Parameter
| Parameter  | Type            | Description                                       |
| ---------- | --------------- | ------------------------------------------------- |
| `GPIOx`    | `GPIO_TypeDef*` | GPIO port (e.g., `GPIOA`, `GPIOB`, etc.)          |
| `GPIO_Pin` | `uint16_t`      | GPIO pin mask (e.g., `GPIO_PIN_5`, `GPIO_PIN_13`) |
#### Return
* void (no return value)
#### Important Notes
| Requirement                        | Explanation                                                        |
| ---------------------------------- | ------------------------------------------------------------------ |
| Pin must be initialized as output  | Use `HAL_GPIO_Init()` with `GPIO_MODE_OUTPUT_PP` (cubeMX already set for me -- #define LD2_Pin GPIO_PIN_5)|
| Does not work on input/analog pins | No effect if the pin is not configured as output                   |
| Does not return the new state      | Use `HAL_GPIO_ReadPin()` to check the actual logic level if needed |
---
### HAL_Delay

HAL_Delay() is a commonly used STM32 HAL function that causes the MCU to pause (block) for a specified amount of time in milliseconds.
- How It Works
  - Internally, it relies on the SysTick timer, which runs at 1 ms resolution.
SysTick generates an interrupt every 1 ms, incrementing a global tick counter.
HAL_Delay() checks this counter in a loop and blocks until the desired time passes.

#### Function Prototype
``` c
void HAL_Delay(uint32_t Delay);
```
#### Parameter
| Parameter | Type       | Description                       |
| --------- | ---------- | --------------------------------- |
| `Delay`   | `uint32_t` | Duration to wait, in milliseconds |

####  Important Notes

| Behavior                           | Explanation                                                    |
| ---------------------------------- | -------------------------------------------------------------- |
| 🛑 **Blocking**                    | MCU will halt (do nothing else) during the delay               |
| ⚡ **Requires SysTick**             | `HAL_Init()` and `SystemClock_Config()` must be called first   |
| 🐞 **Must not disable interrupts** | If `__disable_irq()` is called, `HAL_Delay()` may hang forever |
| ⏱️ **Not very precise**            | OK for ms-range timing, not good for microsecond accuracy      |

#### Alternatives
| Option                | Use Case                            |
| --------------------- | ----------------------------------- |
| `HAL_GetTick()`       | Non-blocking time tracking          |
| Timer interrupt (TIM) | Precise and non-blocking scheduling |
| `HAL_Delay()`         | Simple, blocking behavior           |

---

## Practice
Add in main.c and upload, it will blink every 500ms
```c
  while (1)
  {
    /* USER CODE END WHILE */
    HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_5);
    HAL_Delay(500);
    /* USER CODE BEGIN 3 */
  }
```