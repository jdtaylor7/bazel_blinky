# cc_test(
#     name = "include",
#     srcs = glob(["**/*"]),
#     copts = ["-Iinclude/gtest/include"],
#     deps = ["@gtest//:gtest_main"] + glob(["//include/*"]),
#     timeout = "short",
# )

cc_test(
    name = "test_math",
    srcs = ["test_math.cpp"],
    copts = ["-Iinclude/gtest/include"],
    deps = [
        "@gtest//:gtest_main",
        "//include/math:math",
    ],
    timeout = "short",
)
