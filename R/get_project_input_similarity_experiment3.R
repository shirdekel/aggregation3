##' @title Get long project input with similarity conditions

##' @param gambles
##'
##' @param label_similarity
##' @param project_detail_components_experiment3
##' @param project_components_experiment3
##'
##' @return
##' @author Shir Dekel
##' @export
get_project_input_similarity_experiment3 <- function(
  gambles,
  project_detail_components_experiment3,
  project_components_experiment3,
  label_similarity) {
  project_detail_components_input_experiment3 <-
    list(
      get_project_detail_components_input_experiment3(
        project_detail_components_experiment3
      ) %>%
        transpose(),
      get_project_detail_components_input_experiment3(
        project_detail_components_experiment3
      )
    ) %>%
    set_names(label_similarity)

  project_input_similarity_low_experiment3 <-
    map(
      project_detail_components_input_experiment3$similarity_low,
      ~ shirthesis::get_project_input(
        type = project_components_experiment3$similarity_low$type,
        detail = .x,
        gambles
      )
    )

  project_input_similarity_high_experiment3 <-
    project_components_experiment3$similarity_high %>%
    map2(
      project_detail_components_input_experiment3$similarity_high,
      ~ shirthesis::get_project_input(
        type = .x$type,
        detail = .y,
        gambles = gambles
      )
    )

  project_input_similarity_experiment3 <-
    list(
      project_input_similarity_low_experiment3,
      project_input_similarity_high_experiment3
    ) %>%
    set_names(label_similarity)

  return(project_input_similarity_experiment3)
}
