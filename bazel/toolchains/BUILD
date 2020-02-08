package(default_visibility = ["//visibility:public"])

load(
    "//bazel/toolchains:toolchain_config.bzl",
        "windows_toolchain_config",
        "arm_toolchain_config"
)

filegroup(name = "empty")

filegroup(
    name = "arm_all",
    srcs = ["@arm_none_eabi//:all"],
)

# Windows toolchain.

windows_toolchain_config(name = "windows-toolchain-config")

cc_toolchain(
    name = "windows_cc_toolchain_definition",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    toolchain_config = ":windows-toolchain-config",
)

toolchain(
    name = "windows_cc_toolchain",
    toolchain = "windows_cc_toolchain_definition",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    target_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:windows",
    ],
)

# Arm toolchain.

arm_toolchain_config(name = "arm-toolchain-config")

cc_toolchain(
    name = "arm_cc_toolchain_definition",
    toolchain_identifier = "arm_toolchain",
    all_files = ":arm_all",
    compiler_files = ":arm_all",
    dwp_files = ":arm_all",
    linker_files = ":arm_all",
    objcopy_files = ":arm_all",
    strip_files = ":arm_all",
    toolchain_config = ":arm-toolchain-config",
)

toolchain(
    name = "arm_cc_toolchain",
    toolchain = "arm_cc_toolchain_definition",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:windows",
    ],
    target_compatible_with = [
        "@platforms//cpu:armv7",
        "@platforms//os:none",
    ],
)
