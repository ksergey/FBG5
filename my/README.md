# Мои настройки

Настройки для моего принтера Flying Bear Ghost 5 (2x tmc2208 + 2x a4988)

## Marlin

Прошивка от [Соркина](https://github.com/dmitry-sorkin/Marlin_FB5_K3D/releases/tag/2.0.7.2)

### Настройка экструдера

[Инструкция](https://fbghost.info/bin/view/Main/%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0/4S%20-%20%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0%20%D1%88%D0%B0%D0%B3%D0%BE%D0%B2%20%D1%8D%D0%BA%D1%81%D1%82%D1%80%D1%83%D0%B4%D0%B5%D1%80%D0%B0/)

Получилось так:
```
M92 E411
```

В `Configuration.h`:
```
#define DEFAULT_AXIS_STEPS_PER_UNIT   { 80, 80, 400, 411 }
```

### Температура сопла

[Инструкция](https://fbghost.info/bin/view/Main/%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0/%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0%20PID/)

Получилось так:
```
M301 P14 I0 D51
```

В `Configuration.h`:
```
#define DEFAULT_Kp 14
#define DEFAULT_Ki 0
#define DEFAULT_Kd 51
```

### Cura

Я использую 4.8, в визарде уже есть FBG5.
