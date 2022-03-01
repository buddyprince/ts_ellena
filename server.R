library(shiny)
shinyServer(function(input, output, session) {
  observe({
    file = input$data_upload$datapath
    #file = "C:/Users/buddy/Desktop/ellena/test.csv" #test
    if (!(is.null(file))){
      col_names = names(read_data((file)))
    
      updateSelectInput(session, "select_1",
                        label = paste("Select column"),
                        choices = col_names       
      )
    }
    
    output$table_1 = renderDataTable(
      read_data((input$data_upload$datapath)),
      #read_data(("C:/Users/buddy/Desktop/ellena/test.csv")), #test
      options = list(scrollX = T, pageLength = 10)
    )
    
    output$plot_1 = renderPlot(
      plot(ts_decompose(read_data(input$data_upload$datapath)[input$select_1], fre=input$slider_1))
    )
    
  })
  

    

  
  
  
  
  
  
})
