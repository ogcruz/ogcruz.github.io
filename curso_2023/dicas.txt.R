rmarkdown::render(
  "file1.Rmd",
  output_dir = file.path(uddannelse),
  output_file = paste("file1", uddannelse, ".html", sep =
                        "_"),
  output_options = list(
    html_document =
      list(
        self_contained = FALSE,
        lib_dir = file.path(uddannelse, "lib"),
        css = paste("lib", "custom_css", "custom.css",
                    sep = "/"),
        include = list(after_body = file.path(uddannelse,
                                              "footer_w_index.html"))
      )
  ),
  encoding = "UTF-8"
)


rmarkdown::render('ecologico_book.Rmd',
                  output_dir = 'docs',rmarkdown::html_document(toc = TRUE, toc_depth = 3))
