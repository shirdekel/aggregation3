##' @title Parse condition allocation JS code for E3

##' @return
##' @author Shir Dekel
##' @export
get_condition_allocation <- function() {

  1:10 %>%
    str_c(collapse = ", ") %>%
    str_c(
      "project_variation_condition = jsPsych.randomization.sampleWithReplacement([",
      .,
      "], 1)"
    ) %>%
    c(
    "similarity_condition = jsPsych.randomization.sampleWithoutReplacement(['low', 'high'], 1)[0]",
    "urlvar = jsPsych.data.urlVariables()",
    "if typeof urlvar.similarity != 'undefined' then similarity_condition = urlvar.similarity",
    "if typeof urlvar.project_variation != 'undefined' then project_variation_condition = urlvar.project_variation"
  ) %>%
    coffee_compile(bare = TRUE)

}
