package org.graaljs_formatter.formatters

import org.graalvm.polyglot.{Context, Value}

object IntlFormatter {

  private val defaultContext = Context.newBuilder("js").option("js.intl-402", "true").build()

  def dateJs: Value = defaultContext.eval("js", DATE_JS_CODE)

  def moneyJs = defaultContext.eval("js", MONEY_JS_CODE)

  val MONEY_JS_CODE =
    """
      |(function formatCurrency(amount, locale, currency) {
      |    const formatted = new Intl.NumberFormat(locale, { style: 'currency', currency }).format(amount);
      |    // console.log('formatted: ', formatted);
      |    return formatted;
      | })"""
      .stripMargin

  val DATE_JS_CODE =
    """
      |(function formatCurrency(date, locale, dateStyle) {
      |    const formatted = new Intl.DateTimeFormat(locale, { dateStyle }).format(date);
      |    // console.log('formatted: ', formatted);
      |    return formatted;
      | })"""
      .stripMargin

  def formatCurrency(amount: String, options: MoneyFormatOptions)(implicit js: Value = moneyJs) =
    js.execute(amount, options.locale, options.currency).toString


  def formatDate(date: Long, options: DateFormatOptions)(implicit js: Value = dateJs) =
    js.execute(date.toString, options.locale, options.dateStyle).toString

}
