load("//src:rules.bzl", "cc_firmware")

cc_firmware(
    name = "main",
    src = "main.cpp",
    deps = [
        "//include/st:cmsis",
        "//include/st:stm32f1xx",
    ],
    copts = [
        "-Iinclude/st/cmsis",
        "-Iinclude/st/stm32f1xx",
    ],
)
