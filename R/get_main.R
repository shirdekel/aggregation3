##' @title Get main experiment trials

##' @param randomize_order
##'
##' @param gambles
##'
##' @return
##' @author Shir Dekel
##' @export
get_main <- function(gambles, randomize_order = TRUE) {

  instructions_experiment3 <-
    get_instructions_experiment4() %>%
    .[["naive"]] %>%
    .[["timeline"]]

  projects <-
    get_projects_experiment3(gambles)

  trials_experiment3 <-
    get_trials_experiment3(
      projects,
      randomize_order
    )

  main <-
    instructions_experiment3 %>%
    append(
      trials_experiment3 %>%
        flatten()
    ) %>%
    build_timeline() %>%
    flatten()

  return(main)

}
