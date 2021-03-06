##' @title Get post experiment trials E3

##' @return
##' @author Shir Dekel
##' @export
get_post_experiment <- function() {

  trial_project_expectation <-
    get_trial_project_expectation()

  trial_project_number <-
    shirthesis::get_trial_project_number()

  trial_portfolio_binary <-
    shirthesis::get_trial_portfolio_binary(
      distribution = "absent"
    )

  trial_portfolio_number <-
    shirthesis::get_trial_portfolio_number(
      distribution = "absent"
    )

  ## debrief <-
  ##   get_debrief()

  trial_end <-
    shirthesis::get_trial_end()

  post_experiment <-
    build_timeline(
      trial_project_expectation,
      trial_project_number,
      trial_portfolio_binary,
      trial_portfolio_number,
      ## debrief,
      trial_end
    )

  return(post_experiment)

}
