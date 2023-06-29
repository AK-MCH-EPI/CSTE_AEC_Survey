server <- function(input,output,session) 
{
  
  results <- reactive({
    dat <- data.frame(name = input$name,
                      email = input$email,
                      title = input$title,
                      leader = input$lead,
                      organization = input$Organization)
    list(dat = dat)
  })
  
  observeEvent(input$submit, {
    disable(id = "submit")
    
    ## makes the list from the groups to a dataframe - if some elements are skipped.
    g1 <- data.frame(replace(input$Group1, lengths(input$Group1)== 0, NA))
    g2 <- data.frame(replace(input$Group2, lengths(input$Group2)== 0, NA))
    g3 <- data.frame(replace(input$Group3, lengths(input$Group3)== 0, NA))
    g4 <- data.frame(replace(input$Group4, lengths(input$Group4)== 0, NA))
    g5 <- data.frame(replace(input$Group5, lengths(input$Group5)== 0, NA))
    g6 <- data.frame(replace(input$Group6, lengths(input$Group6)== 0, NA))
    g7 <- data.frame(replace(input$Group7, lengths(input$Group7)== 0, NA))
  
    g1a <- data.frame(replace(input$Group1a, lengths(input$Group1a)== 0, NA))
    g2a <- data.frame(replace(input$Group2a, lengths(input$Group2a)== 0, NA))
    g3a <- data.frame(replace(input$Group3a, lengths(input$Group3a)== 0, NA))
    g4a <- data.frame(replace(input$Group4a, lengths(input$Group4a)== 0, NA))
    g5a <- data.frame(replace(input$Group5a, lengths(input$Group5a)== 0, NA))
    g6a <- data.frame(replace(input$Group6a, lengths(input$Group6a)== 0, NA))
    g7a <- data.frame(replace(input$Group7a, lengths(input$Group7a)== 0, NA))
    # d1 <- cbind(g1a,g2a,g3a,g4a,g5a,g6a,g7a)
    # colnames(d1) <- paste(colnames(d1),"a",sep=".")
    
    #bind responses for submission
    dat1 <- (cbind(TS = Sys.time(),results(),g1,g2,g3,g4,g5,g6,g7,g1a,g2a,g3a,g4a,g5a,g6a,g7a))
    
    #append to sheet. gs4_create("EpiMethodsSvy", sheets = svy_data) 
    sheet_append(ss = sheetdat, data = dat1, sheet = "svy_data")
    
    showModal(modalDialog(
      title = "You're a ROCK STAR",
      "Thanks for completing this short survey. You can exit and close the browser!"
    ))
    
  })
  
  
}
