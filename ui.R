ui <- fluidPage(#theme = shinytheme("readable"),
  useShinyjs(),
  tags$head(tags$style(
    HTML(
      ".dataTable-container table td:nth-child(2) {
       width: 400px !important;
       white-space: normal !important;
       text-align: left;
}
      "
    ))),
  fluidRow(
    column(2,""),
    column(8, style = "background-color:#E9EEF3;",
           titlePanel(p("Alaska Epidemiology Methods Group CSTE Competencies Assessment",
                        style = "color:black")),
           
           # add_busy_spinner(spin = "fading-circle"),
           add_busy_bar(color = "red", height = "8px"),
           #conditionalPanel("input$submit == 0",
           # sidebarLayout(
           #     sidebarPanel(width = 8,
           helpText(HTML("<p style = 'color: black;'><b>About this survey:</b></p>
                          <p style = 'color: black;'>The Council of State and Territorial
                         Epidemiologists (CSTE) program has revised the applied core competencies 
                         that applied epidemiologists should master. CSTE recently 
                         updated <a href='cste_core_competencies_final.pdf' target='_blank'> these competencies</a>.
                         
                         The first four, Data Analytics and Assessment Skills, Public Health 
                         Sciences Skills, Communication Skills, Community Partnership Skills 
                         are considered core to the practice of applied epidemiology. The last three, 
                         Management and Finance Skills, Leadership and Systems Thinking Skills, 
                         and Policy Development and Program Planning Skills are still important 
                         certain roles, but not necessarily for all applied epidemiology roles. 
                         These are referred to as 'professional' domains, to distinguish them 
                         from the “core” domains. The CSTE also developed 
                         <a href='AEC Pilot_Self Assessment.pdf' target='_blank'> self assessment</a> and 
                         <a href='AEC Pilot_Supervisor Assessment.pdf' target='_blank'> supervisors assessment</a>.</p>
                         
                         <p style = 'color: black;'>The epidemiology methods group will be aligning the monthly 
                         meetings and trainings with these competencies. This survey 
                         is a condensed version of the CSTE Applied Epidemiology assessment. </p>
                         
                         <p style = 'color: black;'><b>NOTE: the survey will time out after 15min of inactivity...it should take less than 5min to complete!</b></p>")),
           conditionalPanel(condition = "input.next1 == 0",
           wellPanel(
             fluidRow(
               p("Demographics:"),
               column(width = 6,
                      textInput("name", "First and last name:"),
                      textInput("email", "Email:")
               ),
               column(width = 6,
                      textInput("title", "Title:"),
                      selectizeInput(inputId = "Organization", label = "Organization:",
                                     choices = c("","ANTHC","AKDOH","Other"),
                                     options = list(maxItems = 1, placeholder = 'Select Organization'),
                                     selected = ""),
                      
                      
               )
             ),
             actionButton(inputId = "next1", label = "Next")
           )
           ),
           
           #### Rate competency ###########################################################
           conditionalPanel(condition = "input.next1 != 0",
                            wellPanel(
                              fluidRow(
                                helpText(HTML("<p style = 'color: black;'><b>Please rate your ABILITY in the following competency areas below:</b>
                          For each question rate your ABILITY between Beginner and Advanced.</p>")),
                                helpText(HTML("<p style = 'color: black;'><b>1. Data Analytics and Assessment Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group1", 
                                                                     rowIDs = (c(as.matrix(cste_comps %>% 
                                                                                             filter(Group == 1) %>% 
                                                                                             select(Question))
                                                                     )
                                                                     ),
                                                                     rowLLabels = c(as.matrix(cste_comps %>%
                                                                                                filter(Group == 1) %>%
                                                                                                select(Description_short))
                                                                     ),
                                                                     #rowRLabels = c("Excellent", "Disagree"),
                                                                     choices = c("Beginner","Low Intermediate","High Intermedicate","Advanced"),
                                                                     selected = rep(3, 8),
                                                                     rowIDsName = "G1",
                                                                     labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                ),
                                hr(style = "border-top: 10px solid #E9EEF3;"),
                                helpText(HTML("<p style = 'color: black;'><b>2. Public Health Sciences Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group2", rowIDs = (c(as.matrix(cste_comps %>% filter(Group == 2) %>% select(Question))
                                  )),
                                  rowLLabels = c(as.matrix(cste_comps %>% filter(Group == 2) %>% select(Description_short))),
                                  #rowRLabels = c("Excellent", "Disagree"),
                                  choices = c("Beginner","Low Intermediate","High Intermedicate","Advanced"),
                                  selected = rep(3, 3),
                                  rowIDsName = "G2",
                                  labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                ),
                                hr(style = "border-top: 10px solid #E9EEF3;"),
                                helpText(HTML("<p style = 'color: black;'><b>3. Communication Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group3", rowIDs = (c(as.matrix(cste_comps %>% filter(Group == 3) %>% select(Question))
                                  )),
                                  rowLLabels = c(as.matrix(cste_comps %>% filter(Group == 3) %>% select(Description_short))),
                                  #rowRLabels = c("Excellent", "Disagree"),
                                  choices = c("Beginner","Low Intermediate","High Intermedicate","Advanced"),
                                  selected = rep(3, 5),
                                  rowIDsName = "G3",
                                  labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                ),
                                hr(style = "border-top: 10px solid #E9EEF3;"),
                                helpText(HTML("<p style = 'color: black;'><b>4. Community Partnership Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group4", rowIDs = (c(as.matrix(cste_comps %>% filter(Group == 4) %>% select(Question))
                                  )),
                                  rowLLabels = c(as.matrix(cste_comps %>% filter(Group == 4) %>% select(Description_short))),
                                  #rowRLabels = c("Excellent", "Disagree"),
                                  choices = c("Beginner","Low Intermediate","High Intermedicate","Advanced"),
                                  selected = rep(3, 3),
                                  rowIDsName = "G4",
                                  labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                ),
                                hr(style = "border-top: 10px solid #E9EEF3;"),
                                helpText(HTML("<p style = 'color: black;'><b>5. Management and Finance Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group5", rowIDs = (c(as.matrix(cste_comps %>% filter(Group == 5) %>% select(Question))
                                  )),
                                  rowLLabels = c(as.matrix(cste_comps %>% filter(Group == 5) %>% select(Description_short))),
                                  #rowRLabels = c("Excellent", "Disagree"),
                                  choices = c("Beginner","Low Intermediate","High Intermedicate","Advanced"),
                                  selected = rep(3, 5),
                                  rowIDsName = "G5",
                                  labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                ),
                                hr(style = "border-top: 10px solid #E9EEF3;"),
                                helpText(HTML("<p style = 'color: black;'><b>6. Leadership and Systems Thinking Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group6", rowIDs = (c(as.matrix(cste_comps %>% filter(Group == 6) %>% select(Question))
                                  )),
                                  rowLLabels = c(as.matrix(cste_comps %>% filter(Group == 6) %>% select(Description_short))),
                                  #rowRLabels = c("Excellent", "Disagree"),
                                  choices = c("Beginner","Low Intermediate","High Intermedicate","Advanced"),
                                  selected = rep(3, 4),
                                  rowIDsName = "G6",
                                  labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                ),
                                hr(style = "border-top: 10px solid #E9EEF3;"),
                                helpText(HTML("<p style = 'color: black;'><b>7. Policy and Development and Program Planning Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group7", rowIDs = (c(as.matrix(cste_comps %>% filter(Group == 7) %>% select(Question))
                                  )),
                                  rowLLabels = c(as.matrix(cste_comps %>% filter(Group == 7) %>% select(Description_short))),
                                  #rowRLabels = c("Excellent", "Disagree"),
                                  choices = c("Beginner","Low Intermediate","High Intermedicate","Advanced"),
                                  selected = rep(3, 5),
                                  rowIDsName = "G7",
                                  labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                )
                              ) # end fluid row
                            ), # end wellpanel
                            
                            
                            #### Rate competency ###########################################################
                            wellPanel(
                              fluidRow(
                                helpText(HTML("<p style = 'color: black;'><b>Please rate your INTEREST in the epi-methods group covering the competency area during a 
                     monthly meeting:</b>
                          For each question rate your INTEREST between Not Interested and Interested.</p>")),
                                helpText(HTML("<p style = 'color: black;'><b>1. Data Analytics and Assessment Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group1a", rowIDs = paste0(c(as.matrix(cste_comps %>% filter(Group == 1) %>% select(Question))),".a"),
                                  rowLLabels = c(as.matrix(cste_comps %>% filter(Group == 1) %>% select(Description_short))),
                                  #rowRLabels = c("Excellent", "Disagree"),
                                  choices = c("Not Interested","Neutral","Interested"),
                                  selected = rep(3, 8),
                                  rowIDsName = "GI1",
                                  labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                ),
                                hr(style = "border-top: 10px solid #E9EEF3;"),
                                helpText(HTML("<p style = 'color: black;'><b>2. Public Health Sciences Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group2a", rowIDs = paste0(c(as.matrix(cste_comps %>% filter(Group == 2) %>% select(Question))),".a"),
                                  rowLLabels = c(as.matrix(cste_comps %>% filter(Group == 2) %>% select(Description_short))),
                                  #rowRLabels = c("Excellent", "Disagree"),
                                  choices = c("Not Interested","Neutral","Interested"),
                                  selected = rep(3, 3),
                                  rowIDsName = "GI2",
                                  labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                ),
                                hr(style = "border-top: 10px solid #E9EEF3;"),
                                helpText(HTML("<p style = 'color: black;'><b>3. Communication Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group3a", rowIDs = paste0(c(as.matrix(cste_comps %>% filter(Group == 3) %>% select(Question))),".a"),
                                  rowLLabels = c(as.matrix(cste_comps %>% filter(Group == 3) %>% select(Description_short))),
                                  #rowRLabels = c("Excellent", "Disagree"),
                                  choices = c("Not Interested","Neutral","Interested"),
                                  selected = rep(3, 5),
                                  rowIDsName = "GI3",
                                  labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                ),
                                hr(style = "border-top: 10px solid #E9EEF3;"),
                                helpText(HTML("<p style = 'color: black;'><b>4a. Community Partnership Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group4a", rowIDs = paste0(c(as.matrix(cste_comps %>% filter(Group == 4) %>% select(Question))),".a"),
                                  rowLLabels = c(as.matrix(cste_comps %>% filter(Group == 4) %>% select(Description_short))),
                                  #rowRLabels = c("Excellent", "Disagree"),
                                  choices = c("Not Interested","Neutral","Interested"),
                                  selected = rep(3, 3),
                                  rowIDsName = "GI4",
                                  labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                ),
                                hr(style = "border-top: 10px solid #E9EEF3;"),
                                helpText(HTML("<p style = 'color: black;'><b>5. Management and Finance Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group5a", rowIDs = paste0(c(as.matrix(cste_comps %>% filter(Group == 5) %>% select(Question))),".a"),
                                  rowLLabels = c(as.matrix(cste_comps %>% filter(Group == 5) %>% select(Description_short))),
                                  #rowRLabels = c("Excellent", "Disagree"),
                                  choices = c("Not Interested","Neutral","Interested"),
                                  selected = rep(3, 5),
                                  rowIDsName = "GI5",
                                  labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                ),
                                hr(style = "border-top: 10px solid #E9EEF3;"),
                                helpText(HTML("<p style = 'color: black;'><b>6. Leadership and Systems Thinking Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group6a", rowIDs = paste0(c(as.matrix(cste_comps %>% filter(Group == 6) %>% select(Question))),".a"),
                                  rowLLabels = c(as.matrix(cste_comps %>% filter(Group == 6) %>% select(Description_short))),
                                  #rowRLabels = c("Excellent", "Disagree"),
                                  choices = c("Not Interested","Neutral","Interested"),
                                  selected = rep(3, 4),
                                  rowIDsName = "GI6",
                                  labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                ),
                                hr(style = "border-top: 10px solid #E9EEF3;"),
                                helpText(HTML("<p style = 'color: black;'><b>7. Policy and Development and Program Planning Skills</b></p>")),
                                tags$div(
                                  shinyRadioMatrix::radioMatrixInput(inputId = "Group7a", rowIDs = paste0(c(as.matrix(cste_comps %>% filter(Group == 7) %>% select(Question))),".a"),
                                  rowLLabels = c(as.matrix(cste_comps %>% filter(Group == 7) %>% select(Description_short))),
                                  #rowRLabels = c("Excellent", "Disagree"),
                                  choices = c("Not Interested","Neutral","Interested"),
                                  selected = rep(3, 5),
                                  rowIDsName = "GI7",
                                  labelsWidth = list("20px", "50px")
                                  ),
                                  style = "color: black; font-size: 12px;"
                                )
                              ) # end fluid row
                            ), # end wellpanel
                            
                            #### Last page -----------------------------------------------------------------
                            wellPanel(
                              fluidRow(
                                radioButtons(inputId = "lead", label = "Are you willing to lead a session?",
                                             choices = c("Yes","No","Maybe"), inline = TRUE,
                                             selected = NULL),
                              ),
                              fluidRow(align = "center",width = 12,
                                       hr(),
                                       helpText(HTML("<p style = 'color: black;'><b>Click the button below to submit survey (this may take a moment to compile)!</b></p>")),
                                       actionButton("submit","Submit"),
                                       br(),br(),
                                       helpText(HTML("<p style = 'color: #36648B; font-size: 10px'>**This survey was created using RShiny**"))
                              )                 
                            )
           )
           #), # end major conditional panel
           
           #helpText(HTML("<p><b>BIG BOY</b></p>"))           
    ), # end column
    column(2,"")
  )
)
