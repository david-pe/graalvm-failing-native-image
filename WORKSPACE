# WORKSPACE
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

skylib_version = "1.2.1"

http_archive(
    name = "bazel_skylib",
    sha256 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c",
    type = "tar.gz",
    url = "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/{}/bazel-skylib-{}.tar.gz".format(skylib_version, skylib_version),
)

rules_scala_version = "3dd5d8110d56cfc19722532866cbfc039a6a9612"

http_archive(
    name = "io_bazel_rules_scala",
    sha256 = "d805d4c3e288f87909c0eba177facc2d945f1eeb67f4bd78e96afc51fa25e03c",
    strip_prefix = "rules_scala-%s" % rules_scala_version,
    type = "zip",
    url = "https://github.com/bazelbuild/rules_scala/archive/%s.zip" % rules_scala_version
)

#load("@bazel_tools//tools/jdk:local_java_repository.bzl", "local_java_repository")
#
#local_java_repository(
#  name = "additionaljdk",          # Can be used with --java_runtime_version=additionaljdk, --java_runtime_version=11 or --java_runtime_version=additionaljdk_11
#  version = "11",                    # Optional, if not set it is autodetected
#  java_home = "/Library/Java/JavaVirtualMachines/graalvm-ce-java11-22.0.0.2/Contents/Home/",  # Path to directory containing bin/java
#)

# Stores Scala version and other configuration
# 2.12 is a default version, other versions can be use by passing them explicitly:
# scala_config(scala_version = "2.11.12")
load("@io_bazel_rules_scala//:scala_config.bzl", "scala_config")

scala_config()

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")

scala_repositories()

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")

scala_register_toolchains()

# optional: setup ScalaTest toolchain and dependencies
load("@io_bazel_rules_scala//testing:scalatest.bzl", "scalatest_repositories", "scalatest_toolchain")

scalatest_repositories()

scalatest_toolchain()

load("//third_party:org_graalvm.bzl", com_graalvm_deps = "dependencies")

com_graalvm_deps()

load("//third_party:org_openjdk_jmh.bzl",
com_jmh_deps = "dependencies")

com_jmh_deps()

load("@io_bazel_rules_scala//jmh:jmh.bzl", "jmh_repositories")

jmh_repositories()
