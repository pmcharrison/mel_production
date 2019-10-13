
# setup
# dir = "/Users/sebsilas/Desktop/data-programming/coursework"
# setwd(dir)
library(psychTestR)
library(htmltools)


# create a page type for playing back midi


midi_page <- function(body,
                      admin_ui = NULL,
                      on_complete = NULL) {
  ui <- div(
    shiny::tags$head(tags$script(src="https://eartrainer.app/melodic-production/js/midi.js")),
    body
  )
  psychTestR::page(ui = ui, admin_ui = admin_ui, on_complete = on_complete)
}


# define a page to play midi
mid_1 <- midi_page(actionButton(
  "button",
  "Play Melody", 
  onclick="MIDIjs.play('https://www.eartrainer.app/melodic-production/stimuli/Berkowitz1.mid');"
)) 


# create the timeline
timeline <- list(
  mid_1,
  final_page("The end")
)

# run the test
test <- make_test(elts = timeline)
shiny::runApp(test)
