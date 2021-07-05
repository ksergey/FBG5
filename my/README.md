# Мои настройки

Настройки для моего принтера Flying Bear Ghost 5 (2x tmc2208 + 2x a4988)

## Marlin

Прошивка от [Соркина](https://github.com/dmitry-sorkin/Marlin_FB5_K3D/releases/tag/2.0.7.2)

### Настройка экструдера

```
M302 P1       ; Отключение температурной защиты экструдера
G92 E0        ; Сброс позиции экструдера
G1 E280 F800  ; Выдавить 280 мм пластика
```

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

Получилось так (экструдер):
```
M301 P17.24 I1.23 D60.48
```

В `Configuration.h`:
```
#define DEFAULT_Kp 9.81
#define DEFAULT_Ki 0.62
#define DEFAULT_Kd 38.73
```

Получилось так (стол):
```
M301 P55 I10 D197
```

В `Configuration.h`:
```
#define DEFAULT_bedKp 55
#define DEFAULT_bedKi 10
#define DEFAULT_bedKd 197
```

### Cura

Я использую 4.8, в визарде уже есть FBG5.

Исправленный стартоый G-код (для одновременного нагрева стола и сопла):
```
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate

G28 ;Home

M140 S{material_bed_temperature} ;
M104 S{material_print_temperature} T0 ;
M190 S{material_bed_temperature} ;
M109 S{material_print_temperature} T0 ;

;Fix X0 Y0 being outside the bed after homing
G1 Z2.0 F3000 ;Move Z Axis up
G1 X1.3 Y4.8 ;Place the nozzle over the bed
G92 X0 Y0 ;Set new X0 Y0

;Code for nozzle cleaning and flow normalization
G92 E0 ;Reset Extruder
G1 Z2.0 F3000 ;Move Z Axis up
G1 X10.4 Y20 Z0.28 F5000.0
G1 X10.4 Y170.0 Z0.28 F1500.0 E15
G1 X10.1 Y170.0 Z0.28 F5000.0
G1 X10.1 Y40 Z0.28 F1500.0 E30

G92 E0 ;Reset Extruder
G1 Z2.0 F3000 ;Move Z Axis up
```
