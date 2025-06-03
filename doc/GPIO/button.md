# Read Button Input (State Detection)
## API
### HAL_GPIO_ReadPin()

`HAL_GPIO_ReadPin()` is used to **read the logic level (HIGH or LOW)** of a digital input pin — typically for reading buttons, sensors, or switch states.

---

#### Function Prototype

```c
GPIO_PinState HAL_GPIO_ReadPin(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin);
```

---

#### Parameters

| Parameter   | Type             | Description                                                  |
|-------------|------------------|--------------------------------------------------------------|
| `GPIOx`     | `GPIO_TypeDef*`  | GPIO port to read (e.g., `GPIOA`, `GPIOB`, `GPIOC`, etc.)    |
| `GPIO_Pin`  | `uint16_t`       | GPIO pin number constant (e.g., `GPIO_PIN_13`)               |

---

## Return

The function returns a value of type `GPIO_PinState`:

```c
typedef enum {
  GPIO_PIN_RESET = 0,  // Logic LOW (0V)
  GPIO_PIN_SET         // Logic HIGH (e.g., 3.3V)
} GPIO_PinState;
```

| Return Value     | Meaning                            |
|------------------|------------------------------------|
| `GPIO_PIN_SET`   | Pin is HIGH (e.g., 3.3V or VDD)     |
| `GPIO_PIN_RESET` | Pin is LOW (e.g., 0V or GND)        |

---

## Example 1: Check if Button Is Pressed

```c
if (HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_13) == GPIO_PIN_RESET) {
    // Button is pressed (active low)
}
```

---

## ✅ Example 2: Save to a Variable

```c
GPIO_PinState state = HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_13);

if (state == GPIO_PIN_SET) {
    // Button not pressed
} else {
    // Button pressed
}
```

---

## 🧠 Notes

- Many Nucleo boards use **PC13** as a user button (active-low).
- If you haven't configured the GPIO pin via `HAL_GPIO_Init()` or STM32CubeMX, reading it may give undefined results.
- For buttons:
  - Use **pull-up** for active-low input
  - Use **pull-down** for active-high input
- To avoid false triggers, use **software debounce** using `HAL_GetTick()` or a timer.

---

## 🧪 Debounced Button and Edge Check

```c
  /* USER CODE BEGIN 2 */
  GPIO_PinState last_state = GPIO_PIN_SET;
  uint32_t last_press_time = 0;
  uint32_t debounce_delay = 50; // 50 ms debounce delay
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    GPIO_PinState current_state = HAL_GPIO_ReadPin(B1_GPIO_Port, B1_Pin);
    if(current_state== GPIO_PIN_SET && last_state == GPIO_PIN_RESET) {
      last_state = GPIO_PIN_SET; // Update the last state to released
      // Button is released, turn off the LED
      HAL_GPIO_WritePin(LD2_GPIO_Port, LD2_Pin, GPIO_PIN_RESET); // Turn off the LED
      char msg[50] = "Button Released, LED Off\r\n";
      HAL_UART_Transmit(&huart2, (uint8_t *)msg, strlen(msg), HAL_MAX_DELAY);
    } else if (current_state == GPIO_PIN_RESET && last_state == GPIO_PIN_SET) { 
      if(HAL_GetTick() - last_press_time > debounce_delay) {
        last_press_time = HAL_GetTick(); // Record the time of the press
        last_state = GPIO_PIN_RESET; // Update the last state to pressed
        // Button is pressed, toggle the LED
        HAL_GPIO_TogglePin(LD2_GPIO_Port, LD2_Pin);
        char msg[50] = "Button Pressed, Toggling LED\r\n";
        HAL_UART_Transmit(&huart2, (uint8_t *)msg, strlen(msg), HAL_MAX_DELAY);
      }
    } else { 
      // No change in button state
    }
  }
  /* USER CODE END WHILE */
```
