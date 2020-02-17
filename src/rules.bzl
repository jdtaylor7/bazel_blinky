load("//bazel/toolchains:toolchain_config.bzl", "arm_toolchain_config")

def _cc_firmware_impl(ctx):
    print("cc_firmware rule!!!")
    print("src: {}".format(ctx.attr.src.files.to_list()[0].path))
    print("deps: {}".format(ctx.attr.deps))
    print("copts: {}".format(ctx.attr.copts))
    print("toolchains: {}".format(ctx.toolchains))
    print("compiler: {}".format(ctx.toolchains["@bazel_tools//tools/cpp:toolchain_type"].compiler_executable))
    print("linker: {}".format(ctx.toolchains["@bazel_tools//tools/cpp:toolchain_type"].ld_executable))
    print("objcopy: {}".format(ctx.toolchains["@bazel_tools//tools/cpp:toolchain_type"].objcopy_executable))

    src = ctx.attr.src.files.to_list()[0]
    compiler_path = ctx.toolchains["@bazel_tools//tools/cpp:toolchain_type"].compiler_executable
    linker_path = ctx.toolchains["@bazel_tools//tools/cpp:toolchain_type"].ld_executable
    objcopy_path = ctx.toolchains["@bazel_tools//tools/cpp:toolchain_type"].objcopy_executable

    # Compile.
    ctx.actions.run(
        # outputs = [ctx.outputs.obj],
        # inputs = [src],
        # executable = "{compiler} -c -mcpu=cortex-m3 -mthumb --std=c++17 -O2 -fno-rtti -fno-exceptions -Iinclude/cmsis -Iinclude/stm32f1x {cc_bin} -o {obj_out}".format(
        #     compiler=compiler_path,
        #     copts=ctx.attr.copts,
        #     cc_bin=src.path,
        #     obj_out=ctx.outputs.obj.path,
        # ),
        executable = "{compiler} --version".format(
            compiler=compiler_path
        )
    )

    # # Link.
    # ctx.action(
    #     command = "".format(
    #
    #     )
    #     inputs = [],
    #     outputs = [ctx.outputs.elf],
    # )
    #
    # # Objcopy.
    # ctx.action(
    #     command = "".format(
    #
    #     ),,
    #     inputs = [],
    #     outputs = [ctx.outputs.bin],
    # )

cc_firmware = rule(
    implementation = _cc_firmware_impl,
    fragments = ["cpp"],
    attrs = {
        "src": attr.label(allow_single_file = True),
        "deps": attr.label_list(),
        "copts": attr.string_list(),
    },
    outputs = {
        # "obj": "%{name}.o",
        # "elf": "%{name}.elf",
        # "bin": "%{name}.bin",
    },
    toolchains = ["@bazel_tools//tools/cpp:toolchain_type"]
)
