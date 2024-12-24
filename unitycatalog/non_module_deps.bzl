load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def _non_module_dependencies_impl(_):
    new_git_repository(
        name = "unitycatalog",
        remote = "https://github.com/unitycatalog/unitycatalog.git",
        tag = "v0.2.1",
        build_file_content = """
filegroup(
    name = "all_files",
    srcs = glob(["**/*"]),
    visibility = ["//visibility:public"],
)
""",
    )

non_module_dependencies = module_extension(
    implementation = _non_module_dependencies_impl,
)