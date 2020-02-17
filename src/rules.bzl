# load("//bazel/toolchains:toolchain_config.bzl", "arm_toolchain_config")
load("//bazel/toolchains:BUILD", "arm_cc_toolchain")

def _cc_firmware_impl(ctx):
    print("cc_firmware rule!!!")
    print("src: {}".format(ctx.attr.src.files.to_list()[0]))
    print("deps: {}".format(ctx.attr.deps))
    print("copts: {}".format(ctx.attr.copts))
    print("compiler: {}".format(arm_cc_toolchain[CcToolchainConfigInfo]))

    src = ctx.attr.src.files.to_list()[0]

    # # Compile.
    # ctx.actions.run(
    #     outputs = [ctx.outputs.obj],
    #     inputs = [src],
    #     executable = "".format(
    #
    #     ),
    # )

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
)
