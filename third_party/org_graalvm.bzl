load("@io_bazel_rules_scala//scala:scala_maven_import_external.bzl", import_external = "scala_maven_import_external")

def dependencies():
    import_external(
        name = "org_graalvm_sdk_2_0_0_2",
        artifact = "org.graalvm.sdk:graal-sdk:22.0.0.2",
        licenses = [],
        server_urls = ["https://repo1.maven.org/maven2/"],
        artifact_sha256 = "843f8ff4825824861a4a67fa0c9828f381a3954d389eca16c4235c37779f6dc7",
        srcjar_sha256 = "ee3b1e5eb05f888b15e298c7b2e4112d15727091f85c1648cb9f9a61b9918382",
        deps = [
            "@org_graalvm_truffle_2_0_0_2",
            "@org_graalvm_js_2_0_0_2",
        ],
    )

    import_external(
        name = "org_graalvm_truffle_2_0_0_2",
        artifact = "org.graalvm.truffle:truffle-api:22.0.0.2",
        artifact_sha256 = "0cf8cc1f99d9881ddc37a7e5de78304f08e5cbfe1ae7e8da67eec9722a1d8f3b",
        srcjar_sha256 = "5c1d3bd6e337eea670e6844f1a13191c1d48fa5717859abe5a460b1442765bb6",
        licenses = [],
        server_urls = ["https://repo1.maven.org/maven2/"],
    )

    import_external(
        name = "org_graalvm_js_2_0_0_2",
        artifact = "org.graalvm.js:js:22.0.0.2",
        artifact_sha256 = "d6e66cf2ce0b1b498d19e72f6973e3b15296e3cde77beb0eebc28f5711a808d4",
        srcjar_sha256 = "4a4adf8e936ae3dd44a93e55d5fa8e7cde8a25d1fbdb048c735a045027031827",
        licenses = [],
        server_urls = ["https://repo1.maven.org/maven2/"],
    )

