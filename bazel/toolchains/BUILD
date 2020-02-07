load(
    "//toolchains:toolchain_config.bzl",
        "windows_toolchain_config",
        "arm_toolchain_config"
)

# Windows toolchain.
cc_toolchain(
    name = "windows_cc_toolchain_definition",
    all_files = "",
    compiler_files = "",
    dwp_files = "",
    linker_files = "",
    objcopy_files = "",
    strip_files = "",
    toolchain_config = "windows_toolchain_config",
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
cc_toolchain(
    name = "arm_cc_toolchain_definition",
    all_files = "",
    compiler_files = "",
    dwp_files = "",
    linker_files = "",
    objcopy_files = "",
    strip_files = "",
    toolchain_config = "arm_toolchain_config",
)

toolchain(
    name = "arm_cc_toolchain",
    toolchain = "arm_cc_toolchain_definition",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    target_compatible_with = [
        "@platforms//cpu:armv7",
        "@platforms//os:none",
    ],
)
