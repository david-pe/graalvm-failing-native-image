package org.graaljs_formatter.benchmarks

/*
How to run this benchmark:

  bazel run //org/graaljs_formatter/benchmark:benchmark
*/

import org.openjdk.jmh.annotations._
import org.graaljs_formatter.formatters.{DateFormatOptions, IntlFormatter, MoneyFormatOptions}

import java.text.NumberFormat
import java.time.LocalDate
import java.time.format.{DateTimeFormatter, FormatStyle}
import java.util.concurrent.TimeUnit
import java.util.{Currency, Locale}

@Warmup(iterations = 1, time = 4, timeUnit = TimeUnit.MILLISECONDS)
@Measurement(iterations = 3, time = 4, timeUnit = TimeUnit.MILLISECONDS)
@State(Scope.Benchmark)
@BenchmarkMode(Array(Mode.All))
@Fork(jvmArgsAppend = Array("-Xms2g","-Xmx2g","-XX:+UseG1GC", "-Dpolyglot.engine.WarnInterpreterOnly=false"))
class FormatterBenchmark {

  val now = LocalDate.now()
  val dateFormatOptions = DateFormatOptions("fr-FR", dateStyle = "long")
  val moneyFormatOptions = MoneyFormatOptions("fr-FR", "EUR")

  val javaDateFormatter = DateTimeFormatter.ofLocalizedDate(FormatStyle.LONG)
  val javaNumberFormatter = NumberFormat.getInstance(Locale.FRENCH)
  javaNumberFormatter.setCurrency(Currency.getInstance("EUR"))

  @Benchmark
  def formatDateWithIntl(): Unit =
    IntlFormatter.formatDate(now.toEpochDay, dateFormatOptions)(IntlFormatter.dateJs)

  @Benchmark
  def formatDateWithJava(): Unit =
    now.format(javaDateFormatter)

  @Benchmark
  def formatMoneyWithIntl(): Unit =
    IntlFormatter.formatCurrency("130.55", moneyFormatOptions)(IntlFormatter.moneyJs)

  @Benchmark
  def formatMoneyWithJava(): Unit =
    javaNumberFormatter.format(103.55)

}

