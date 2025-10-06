app.name: STM32CubeIDE
-

[cube] debug:
    key(super-f11)

[cube] (resume | continue):
    key(super-f8)

[cube] [step] into:
    key(f5)

[cube] [step] over:
    key(f6)

# Don't want "cube step" to be misheard as "cube stop", so make that
# the same as "step over"
[cube] step:
    key(f6)

[cube] [step] return:
    key(f7)

[cube] stop:
    key(super-f2)

[cube] (suspend | pause):
    key(super-f7)

[cube] break:
    key(super-shift-b)

[cube] build:
    key(super-shift-p)

[cube] build all:
    key(super-b)
