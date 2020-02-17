load("//src:rules.bzl", "cc_firmware")

# cc_binary(
#     name = "main",
#     srcs = [
#         "main.cpp",
#     ],
#     deps = [
#         "//include:cmsis",
#         "//include:stm32f1xx",
#     ],
#     copts = [
#         "-Iinclude/cmsis",
#         "-Iinclude/stm32f1xx",
#     ],
# )

cc_firmware(
    name = "main",
    src = "main.cpp",
    deps = [
        "//include:cmsis",
        "//include:stm32f1xx",
    ],
    copts = [
        "-Iinclude/cmsis",
        "-Iinclude/stm32f1xx",
    ],
)
