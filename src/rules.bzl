load("//bazel/toolchains:toolchain_config.bzl", "arm_toolchain_config")

def _cc_firmware_impl(ctx):
    toolchain_path = "@bazel_tools//tools/cpp:toolchain_type"
    toolchain_provider = ctx.toolchains[toolchain_path]

    print("cc_firmware rule!!!")
    print("src: {}".format(ctx.attr.src.files.to_list()[0].path))
    print("deps: {}".format(ctx.attr.deps))
    print("copts: {}".format(ctx.attr.copts))
    print("toolchains: {}".format(ctx.toolchains))
    print("compiler: {}".format(toolchain_provider.compiler_executable))
    print("linker: {}".format(toolchain_provider.ld_executable))
    print("objcopy: {}".format(toolchain_provider.objcopy_executable))

    src = ctx.attr.src.files.to_list()[0]
    compiler_path = toolchain_provider.compiler_executable
    linker_path = toolchain_provider.ld_executable
    objcopy_path = toolchain_provider.objcopy_executable

    compile_flags = "-c -mcpu=cortex-m3 -mthumb --std=c++17 -O2 -fno-rtti -fno-exceptions"
    # compile_flags = "-c -O2 -fno-rtti -fno-exceptions"
    link_flags = "-mcpu=cortex-m3 -mthumb -Tlinkerscript.ld -nostartfiles"

    # Compile.
    ctx.actions.run(
        outputs = [ctx.outputs.obj],
        inputs = [src],
        # executable = "{compiler} {copts} {cc_bin} -o {obj_out}".format(
        executable = "{compiler} {cc_bin} -o {obj_out}".format(
            compiler = compiler_path,
            copts = compile_flags + ' ' + ' '.join(ctx.attr.copts),
            cc_bin = src.path,
            obj_out = ctx.outputs.obj.path,
        ),
    )

    # # Link.
    # ctx.action(
    #     outputs = [ctx.outputs.elf],
    #     inputs = [ctx.outputs.obj],
    #     command = "{compiler} {linkopts} {obj_in} -o {elf_out}".format(
    #         compiler = compiler_path,
    #         linkopts = link_flags + ' ' + ' '.join(ctx.attr.linkopts),
    #         obj_in = ctx.outputs.obj.path,
    #         elf_out = ctx.outputs.elf.path,
    #     )
    # )
    #
    # # Objcopy.
    # ctx.action(
    #     outputs = [ctx.outputs.bin],
    #     inputs = [ctx.outputs.elf],
    #     command = "{objcopy} -O binary {elf_in} {bin_out}".format(
    #         objcopy = objcopy_path,
    #         elf_in = ctx.outputs.elf.path,
    #         bin_out = ctx.outputs.bin.path,
    #     ),
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
        "obj": "%{name}.o",
        # "elf": "%{name}.elf",
        # "bin": "%{name}.bin",
    },
    toolchains = ["@bazel_tools//tools/cpp:toolchain_type"]
)
