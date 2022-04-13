load("@io_bazel_rules_scala//scala:scala_maven_import_external.bzl", import_external = "scala_maven_import_external")

def dependencies():
    import_external(
        name = "org_openjdk_jmh_jmh_core",
        artifact = "org.openjdk.jmh:jmh-core:1.22",
        licenses = [],
        server_urls = ["https://repo1.maven.org/maven2/"],
        artifact_sha256 = "f1d27fbec504a8964ade7ff5fdafe31aa9e9a4532e3e852d3987f3414e643dfb",
        srcjar_sha256 = "29c653a37030155adcbd3c7f017603a5030777dc286b80081067773d07b4d9cb",
        deps = [
            "@net_sf_jopt_simple",
            "@org_apache_commonse",
        ],
    )

    import_external(
        name = "net_sf_jopt_simple",
        artifact = "net.sf.jopt-simple:jopt-simple:5.0.4",
        licenses = [],
        server_urls = ["https://repo1.maven.org/maven2/"],
        artifact_sha256 = "df26cc58f235f477db07f753ba5a3ab243ebe5789d9f89ecf68dd62ea9a66c28",
        srcjar_sha256 = "06b283801a5a94ef697b7f2c79a048c4e2f848b3daddda61cab74d882bdd97a5",
    )

    import_external(
        name = "org_apache_commonse",
        artifact = "org.apache.commons:commons-math3:3.6.1",
        licenses = [],
        server_urls = ["https://repo1.maven.org/maven2/"],
        artifact_sha256 = "1e56d7b058d28b65abd256b8458e3885b674c1d588fa43cd7d1cbb9c7ef2b308",
        srcjar_sha256 = "e2ff85a3c360d56c51a7021614a194f3fbaf224054642ac535016f118322934d",
    )

    import_external(
        name = "com_propensive_mercator_2_12",
        artifact = "com.propensive:mercator_2.12:0.3.0",
        licenses = [],
        server_urls = ["https://repo1.maven.org/maven2/"],
    )

    import_external(
            name = "com_propensive_magnolia_2_12",
            artifact = "com.propensive:magnolia_2.12:0.17.0",
            licenses = [],
            server_urls = ["https://repo1.maven.org/maven2/"],
        )

    import_external(
        name = "org_scalacheck_scalacheck_2_12",
        artifact = "org.scalacheck:scalacheck_2.12:1.16.0",
        licenses = [],
        server_urls = ["https://repo1.maven.org/maven2/"],
    )
