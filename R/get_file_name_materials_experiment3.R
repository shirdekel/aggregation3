##' @title Get E3 screenshot file names

##' @return
##' @author Shir Dekel
##' @export
get_file_name_materials_experiment3 <- function() {

  # Clean project type names
  project_type_clean <-
    get_project_components_experiment3() %>%
    .[["type"]] %>%
    str_replace_all(" ", "-")

  file_name_materials_experiment3 <-
  c(
    str_c(
      "instructions",
      1:3
    ),
    str_c(
      "project_choice",
      project_type_clean,
      sep = "_"
    ),
    "project_expectation",
    "project_number",
    "porfolio_binary",
    "porfolio_number"
  )

  return(file_name_materials_experiment3)

}
