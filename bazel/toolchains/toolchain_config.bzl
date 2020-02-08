load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "tool_path")

# Windows toolchain configuration.

def _windows_toolchain_config_impl(ctx):
    tool_paths = [
        tool_path(
            name = "ar",
            path = "/usr/bin/ar",
        ),
        tool_path(
            name = "cpp",
            path = "/usr/bin/cpp",
        ),
        tool_path(
            name = "gcc",
            path = "/usr/bin/gcc",
        ),
        tool_path(
            name = "gcov",
            path = "/usr/bin/gcov",
        ),
        tool_path(
            name = "ld",
            path = "/usr/bin/ld",
        ),
        tool_path(
            name = "nm",
            path = "/usr/bin/nm",
        ),
        tool_path(
            name = "objdump",
            path = "/usr/bin/objdump",
        ),
        tool_path(
            name = "strip",
            path = "/usr/bin/strip",
        ),
    ]
    return [
        cc_common.create_cc_toolchain_config_info(
            ctx = ctx,
            toolchain_identifier = "windows_toolchain",
            host_system_name = "unknown",
            target_system_name = "unknown",
            target_cpu = "unknown",
            target_libc = "unknown",
            compiler = "unknown",
            abi_version = "unknown",
            abi_libc_version = "unknown",
            tool_paths = tool_paths,
        )
    ]

windows_toolchain_config = rule(
    implementation = _windows_toolchain_config_impl,
    provides = [CcToolchainConfigInfo],
)

# Arm toolchain configuration.

def _arm_toolchain_config_impl(ctx):
    tool_paths = [
        tool_path(
            name = "ar",
            path = "bin/false",
        ),
        tool_path(
            name = "cpp",
            path = "//external/arm_none_eabi/bin/arm-none-eabi-c++.exe",
        ),
        tool_path(
            name = "gcc",
            path = "//external/arm_none_eabi/bin/arm-none-eabi-g++.exe",
        ),
        tool_path(
            name = "gcov",
            path = "bin/false",
        ),
        tool_path(
            name = "ld",
            path = "//external/arm_none_eabi/bin/arm-none-eabi-ld.exe",
        ),
        tool_path(
            name = "nm",
            path = "bin/false",
        ),
        tool_path(
            name = "objcopy",
            path = "//external/arm_none_eabi/bin/arm-none-eabi-objcopy.exe",
        ),
        tool_path(
            name = "objdump",
            path = "bin/false",
        ),
        tool_path(
            name = "strip",
            path = "bin/false",
        ),
    ]
    return [
        cc_common.create_cc_toolchain_config_info(
            ctx = ctx,
            toolchain_identifier = "arm_toolchain",
            host_system_name = "unknown",
            target_system_name = "unknown",
            target_cpu = "armv7",
            target_libc = "unknown",
            compiler = "arm_none_eabi",
            abi_version = "unknown",
            abi_libc_version = "unknown",
            tool_paths = tool_paths,
        )
    ]

arm_toolchain_config = rule(
    implementation = _arm_toolchain_config_impl,
    fragments = ["cpp"],
    provides = [CcToolchainConfigInfo],
)
