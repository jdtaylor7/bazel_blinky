load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "tool_path")

# Windows toolchain configuration.

msvc_path = "/cygdrive/c/Program Files(x86)/Microsoft Visual Studio/2019/BuildTools/VC/Tools/MSVC/14.24.28314/bin/Hostx64/x64/"

def _windows_toolchain_config_impl(ctx):
    tool_paths = [
        tool_path(
            name = "ar",
            path = "/bin/false",
        ),
        tool_path(
            name = "cpp",
            path = "/bin/false",
        ),
        tool_path(
            name = "gcc",
            path = msvc_path + "cl.exe",
        ),
        tool_path(
            name = "gcov",
            path = "/bin/false",
        ),
        tool_path(
            name = "ld",
            path = msvc_path + "link.exe",
        ),
        tool_path(
            name = "nm",
            path = "/bin/false",
        ),
        tool_path(
            name = "objdump",
            path = "/bin/false",
        ),
        tool_path(
            name = "strip",
            path = "/bin/false",
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

arm_gcc_path = "//external/arm_none_eabi/bin/"

def _arm_toolchain_config_impl(ctx):
    tool_paths = [
        tool_path(
            name = "ar",
            path = "/bin/false",
        ),
        tool_path(
            name = "cpp",
            path = arm_gcc_path + "arm-none-eabi-c++.exe",
        ),
        tool_path(
            name = "gcc",
            path = arm_gcc_path + "arm-none-eabi-g++.exe",
        ),
        tool_path(
            name = "gcov",
            path = "/bin/false",
        ),
        tool_path(
            name = "ld",
            path = arm_gcc_path + "arm-none-eabi-ld.exe",
        ),
        tool_path(
            name = "nm",
            path = "/bin/false",
        ),
        tool_path(
            name = "objcopy",
            path = arm_gcc_path + "arm-none-eabi-objcopy.exe",
        ),
        tool_path(
            name = "objdump",
            path = "/bin/false",
        ),
        tool_path(
            name = "strip",
            path = "/bin/false",
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
