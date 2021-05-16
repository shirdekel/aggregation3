##' @title Get long projects
##'
##' @param gambles
##'
##' @return
##' @author Shir Dekel
##' @export
get_projects_experiment3 <- function(gambles) {

  label_similarity <- c("similarity_low", "similarity_high")

  project_detail_components_experiment3 <-
    get_project_detail_components_experiment3()

  project_detail_experiment3 <-
    get_project_detail_experiment3(project_detail_components_experiment3)

  project_components_experiment3 <-
    list(
      get_project_components_experiment3(),
      get_project_components_experiment3() %>%
        transpose() %>%
        simplify()
    ) %>%
    set_names(label_similarity)


  project_description_similarity_experiment3 <-
    get_project_description_similarity_experiment3(
      gambles,
      project_detail_experiment3,
      project_components_experiment3,
      label_similarity
    )

  project_input_similarity_experiment3 <-
    get_project_input_similarity_experiment3(
      gambles,
      project_detail_components_experiment3,
      project_components_experiment3,
      label_similarity
    )

  projects_experiment3 <-
    list(
      description = project_description_similarity_experiment3,
      input = project_input_similarity_experiment3
    )

  return(projects_experiment3)

}
