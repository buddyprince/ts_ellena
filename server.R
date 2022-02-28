library(shiny)
shinyServer(function(input, output) {
  
  output$table_1 = renderDataTable(
    read_data((input$data_upload$datapath)),
    options = list(scrollX = T, pageLength = 10)
  )
  
  output$plot_1 = renderPlot(
    plot(ts_decompose(read_data(input$data_upload$datapath)))
  )
  
  
})
