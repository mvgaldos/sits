context("Log")
test_that("Log", {
    #skip_on_cran()
    library(sits)
    no_err <- sits_log_show_errors()
    expect_equal(no_err, "No errors to report")

    sits:::.sits_log_error("abc")


    err <- sits_log_show_errors()
    err_abc <- dplyr::filter(err, grepl("abc", error))
    expect_true(nrow(err_abc) > 0)

    no_deb <- sits_log_show_debug()
    expect_equal(no_deb, "No debug msgs to report")

    sits:::.sits_log_debug("def")
    deb <- sits_log_show_debug()
    deb_def <- dplyr::filter(deb, grepl("def", debug))
    expect_true(nrow(deb_def) > 0)

    expect_error(sits:::.sits_log_csv(NULL), "Cannot save NULL CSV data")
    expect_error(sits:::.sits_log_data(NULL), "Cannot save NULL data")

    sits:::.sits_log_data(1, "abc.rda")
    sits:::.sits_log_data(2, "abc.rda")

    dirname(sits:::sits.env$debug_file) %>%
        paste0("/abc.rda") %>%
        file.remove() %>%
        expect_true()
})
test_that("Mem", {
    m <- sits:::.sits_mem_used()
    expect_true (m > 0.0)

})

