##' @title Get long project descriptions for similarity conditions

##' @param gambles
##'
##' @param label_similarity
##' @param project_detail_experiment3
##' @param project_components_experiment3
##'
##' @return
##' @author Shir Dekel
##' @export
get_project_description_similarity_experiment3 <- function(gambles,
                                                           project_detail_experiment3,
                                                           project_components_experiment3,
                                                           label_similarity) {

  project_description_similarity_low_experiment3 <-
    project_detail_experiment3 %>%
    transpose() %>%
    map(
      ~ gambles %>%
        get_project_description_experiment3(
          project_components_experiment3$similarity_low,
          .x
        )
    )

  project_description_similarity_high_experiment3 <-
    list(
      project_components_experiment3$similarity_high,
      project_detail_experiment3
    ) %>%
    pmap(
      ~ gambles %>%
        get_project_description_experiment3(
          .x,
          .y
        )
    )

  project_description_similarity_experiment3 <-
    list(
      project_description_similarity_low_experiment3,
      project_description_similarity_high_experiment3
    ) %>%
    set_names(label_similarity)

  return(project_description_similarity_experiment3)

}
