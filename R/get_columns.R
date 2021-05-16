##' @title Get condition allocation columns

##' @return
##' @author Shir Dekel
##' @export
get_columns <- function() {
  columns <-
    insert_property(
      subject = insert_javascript("jsPsych.randomization.randomID(15)"),
      thesis_project = "aggregation",
      experiment = "experiment3",
      sample = "prolific",
      similarity = insert_javascript("similarity_condition"),
      awareness = "naive",
      presentation = "separate",
      distribution = "absent",
      project_variation = insert_javascript("project_variation_condition"),
      PROLIFIC_PID = insert_javascript("urlvar.PROLIFIC_PID"),
      STUDY_ID = insert_javascript("urlvar.STUDY_ID"),
      SESSION_ID = insert_javascript("urlvar.SESSION_ID")
    )

  return(columns)
}
