load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "arm_none_eabi",
    url = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-win32.zip?revision=20c5df9c-9870-47e2-b994-2a652fb99075&la=en&hash=347C07EEEB848CC8944F943D8E1EAAB55A6CA0BC",
    sha256 = "e4c964add8d0fdcc6b14f323e277a0946456082a84a1cc560da265b357762b62",
    build_file = "//:arm_none_eabi.BUILD",
#    strip_prefix = "bin",
)

register_toolchains(
    "//bazel/toolchains:windows_cc_toolchain",
    "//bazel/toolchains:arm_cc_toolchain",
)
