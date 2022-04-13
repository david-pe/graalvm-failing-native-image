# graalvm-failing-native-image

steps to reproduce (with GraalVM 22.0.0.2 Java 11 CE):

1. to check all is in order `bazel run //org/graaljs_formatter/benchmarks:benchmark`
2. to build the deployable jar `bazel build //org/graaljs_formatter/benchmarks:benchmark_deploy.jar`
3. then, `native-image -jar  bazel-bin/org/graaljs_formatter/benchmarks/benchmark_deploy.jar`
4. run `./benchmark_deploy`- *it should run fine*
5. now for the issue run with `language:js`: `native-image  --language:js -jar  bazel-bin/org/graaljs_formatter/benchmarks/benchmark_deploy.jar`
6. then run `./benchmark_deploy` to see: 
```Exception in thread "main" java.lang.ExceptionInInitializerError
        at org.openjdk.jmh.runner.options.CommandLineOptions.<init>(CommandLineOptions.java:99)
        at org.openjdk.jmh.Main.main(Main.java:41) 
        Caused by: java.lang.IllegalArgumentException: int is not a value type at joptsimple.internal.Reflection.findConverter(Reflection.java:66) 
        at org.openjdk.jmh.runner.options.IntegerValueConverter.<clinit>(IntegerValueConverter.java:35)... 2 more

