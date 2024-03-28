#' Epiparameter Dashboard
#'
#' @param ... Not used
#' @importFrom epiparameter epidist_db get_citation
#' @importFrom shiny shinyApp fluidPage titlePanel markdown sidebarLayout
#' sidebarPanel mainPanel selectInput plotOutput textOutput verbatimTextOutput
#' renderPlot renderText renderPrint
#' @importFrom shinythemes shinytheme
#' @return
#' A shiny app that visualises epidemiological parameters.
#' @export
#'
#' @examples
#' \dontrun{
#' epiparameterDashboard()
#' }
epiparameterDashboard <- function(...) {
epiparameter_data <- epiparameter_data
# Define UI for app that draws a histogram ----
ui <- shiny::fluidPage(
    theme = shinythemes::shinytheme("superhero"),
    # App title ----
    shiny::titlePanel("A Dashboard for Visualising Epidemiological Parameters"),
    shiny::markdown(
      "This dashboard provides a quick way to visualise some epidemiological
      parameters reported in the literature. It harnesses the epidemiological
      database, classes, and methods provided in the
      [epiparameter](epiverse-trace/epiparameter) package.

      This is a minimum viable product in very early stages with endless room
      for improvement. If you have any feedback, please feel free to open an
      issue or discussion on the package's
      [GitHub repository](github.com/jamesmbaazam/epiparameterDashboard)."
    ),
    # Sidebar panel for inputs ----
    shiny::sidebarLayout(
      # Input: Slider for the number of bins ----
      shiny::sidebarPanel(
        shiny::selectInput(
          "disease",
          "Disease",
          choices = epiparameter_data$unique_diseases,
          selected = "COVID-19"
        ),
        shiny::selectInput(
          "delay_dist",
          "Delay Distribution",
          choices = epiparameter_data$unique_epidists,
          selected = "incubation period"
        )
      ),
      shiny::mainPanel(
        shiny::plotOutput("plot"),
        shiny::textOutput("citation_header"),
        shiny::verbatimTextOutput("citation")
      )
    )
  )
  # Define server logic required to draw a histogram ----
  server <- function(input, output) {
    # This expression that generates a histogram is wrapped in a call
    # to renderPlot to indicate that:
    #
    # 1. It is "reactive" and therefore should be automatically
    #    re-executed when inputs (input$bins) change
    # 2. Its output type is a plot
    edist <- shiny::reactive({
      epiparameter::epidist_db(
        disease = input$disease,
        epi_dist = input$delay_dist,
        single_epidist = TRUE
      )
    })
    # output
    output$plot <- shiny::renderPlot({
      edist <- edist()
      plot(edist)
    })
    output$citation_header <- shiny::renderText({
      print("Citation")
    })
    output$citation <- shiny::renderPrint({
      edist_citation <- epiparameter::get_citation(edist())
          print(edist_citation)
    })
  }

shiny::shinyApp(ui, server)
}
