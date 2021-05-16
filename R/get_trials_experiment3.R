##' @title Get long projects distribution absent trial
##'
##' @param projects_experiment3
##'
##' @param randomize_order
##'
##' @return
##' @author Shir Dekel
##' @export
get_trials_experiment3 <- function(projects_experiment3, randomize_order) {

  similarity_condition <-
    projects_experiment3$description %>%
    names() %>%
    str_match(".*_(.*)") %>%
    .[, 2]

  # For both within- and between-industry variation
  project_variation <-
    1:length(projects_experiment3$description$similarity_low) %>%
    as.numeric()

  trials_experiment3 <-
    c(
      projects_experiment3,
      list(similarity_condition)
    ) %>%
    pmap(
      function(description_similarity, input_similarity, similarity_condition_value)
        list(
          description_similarity,
          input_similarity,
          project_variation
        ) %>%
        pmap(
          function(description_variation, input_variation, project_variation_value)
            shirthesis::get_trial_separate(
              project_description = description_variation,
              project_input = input_variation,
              distribution = "absent",
              randomize_order = randomize_order
            ) %>%
            build_timeline() %>%
            display_if(fn_data_condition(similarity == !!similarity_condition_value)) %>%
            build_timeline() %>%
            display_if(fn_data_condition(project_variation == !!project_variation_value))
        )
    )

  return(trials_experiment3)

}
