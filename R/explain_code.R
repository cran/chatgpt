#' ChatGPT: Explain Code
#'
#' @param code The code to be explained by ChatGPT. If not provided, it will use what's copied on
#'   the clipboard.
#'
#' @examples
#' \dontrun{
#' cat(explain_code("for (i in 1:10) {\n  print(i ** 2)\n}"))
#' }
#'
#' @importFrom clipr read_clip
#'
#' @return A character value with the response generated by ChatGPT.
#'
#' @export
#'
explain_code <- function(code = clipr::read_clip(allow_non_interactive = TRUE)) {
  code <- paste(gsub('"', "'", code), collapse = "\n")
  prompt <- paste0('Explain the following R code: "', code, '"')
  parse_response(gpt_get_completions(prompt))
}
