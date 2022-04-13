package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_scala//jmh:jmh.bzl", "scala_benchmark_jmh")

scala_benchmark_jmh(
    name = "benchmark",
    srcs = ["FormatterBenchmark.scala"],
    deps = [
        "//org/graaljs_formatter/formatters:intl_formatter",
        "@com_propensive_magnolia_2_12",
        "@com_propensive_mercator_2_12",
        "@org_graalvm_sdk_2_0_0_2",
        "@org_openjdk_jmh_jmh_core",
        "@org_scalacheck_scalacheck_2_12",
    ],
)
