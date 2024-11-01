#' ---------------------------
#' Example: A one-pager on snailfish
#' ---------------------------

# Run report! ------------------------------------------------------------------

citations <- data.frame(year = 2021:2024, 
                        citation = c("@2021NEBS2022", "@2022NEBS2023", "@2023NEBS", "@2024EBS"))

for (report_year in c(2021:2024)) { # A few years to cycle through
  quarto::quarto_render(  # render the quarto document
    input = here::here("code", "parent.qmd"), 
    output_format = "html", 
    output_file = paste0("report_",report_year,".html"),
    execute_params = list(report_year = report_year, 
                          citation = citations$citation[citations$year == report_year])) # subset data for the iterating year
  
  # Create copy of files to the sub directory
  file.copy(from = here::here(paste0("report_",report_year,".html")),
            to = here::here("code", paste0("report_",report_year,".html")), 
            overwrite = TRUE)
  file.remove(from = here::here(paste0("report_",report_year,".html")))
}
