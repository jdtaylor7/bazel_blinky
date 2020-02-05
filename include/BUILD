cc_library(
    name = "cmsis",
    hdrs = glob(["cmsis/*.h"]),
    visibility = ["//visibility:public"],
)

cc_library(
    name = "stm32f1xx",
    hdrs = glob(["stm32f1xx/*.h"]),
    deps = ["cmsis"],
    visibility = ["//visibility:public"],
)
