# 🧠 STM32 Timer Family Overview (STM32F401RE)

| Timer       | Type         | Notes                                                |
| ----------- | ------------ | ---------------------------------------------------- |
| **TIM1**    | Advanced     | For motor control, complementary PWM                 |
| **TIM2**    | 32-bit GP    | Best for long delays or capture                      |
| **TIM3**    | 16-bit GP    | 🟢 Commonly used for PWM, basic periodic tasks       |
| **TIM4**    | 16-bit GP    | Alternative to TIM3                                  |
| **SysTick** | System timer | Used by `HAL_Delay()` — avoid using for custom logic |

## 🧩 When to Use Other Timers?
| Use Case                  | Preferred Timer   |
| ------------------------- | ----------------- |
| Millisecond tasks         | TIM3 / TIM4       |
| Very long intervals       | TIM2 (32-bit)     |
| Complementary PWM signals | TIM1 (advanced)   |
| HAL delay/tick            | SysTick (default) |
