load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "tool_path")

# Windows toolchain configuration.

def _windows_toolchain_config_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name)
    toolpaths = [
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
            host_system_name = "",
            target_system_name = "",
            target_cpu = "",
            target_libc = "",
            compiler = "",
            abi_version = "",
            abi_libc_version = "",
            tool_paths = tool_paths,
        )
    ]

windows_toolchain_config = rule(
    implementation = _windows_toolchain_config_impl,
    provides = [CcToolchainConfigInfo],
    executable = True,
)

# Arm toolchain configuration.

arm_toolchain_base_path = "/cygdrive/c/Program Files (x86)/GNU Tools Arm Embedded/bin/"

def _arm_toolchain_config_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name)
    toolpaths = [
        tool_path(
            name = "ar",
            path = arm_toolchain_base_path + "arm-none-eabi-ar",
        ),
        tool_path(
            name = "cpp",
            path = arm_toolchain_base_path + "arm-none-eabi-cpp",
        ),
        tool_path(
            name = "gcc",
            path = arm_toolchain_base_path + "arm-none-eabi-gcc",
        ),
        tool_path(
            name = "ld",
            path = arm_toolchain_base_path + "arm-none-eabi-ld",
        ),
        tool_path(
            name = "nm",
            path = arm_toolchain_base_path + "arm-none-eabi-nm",
        ),
        tool_path(
            name = "objdump",
            path = arm_toolchain_base_path + "arm-none-eabi-objdump",
        ),
        tool_path(
            name = "strip",
            path = arm_toolchain_base_path + "arm-none-eabi-strip",
        ),
    ]
    return [
        cc_common.create_cc_toolchain_config_info(
            ctx = ctx,
            toolchain_identifier = "arm_toolchain",
            host_system_name = "",
            target_system_name = "",
            target_cpu = "",
            target_libc = "",
            compiler = "",
            abi_version = "",
            abi_libc_version = "",
            tool_paths = tool_paths,
        )
    ]

arm_toolchain_config = rule(
    implementation = _arm_toolchain_config_impl,
    provides = [CcToolchainConfigInfo],
    executable = True,
)
