#' @title Wrangle, Summarize, and Graph Frequency Survey Question Data
#' 
#' @description Calculate number of responses for frequency questions and make a simple stacked barplot. Makes the answer categories into a factor if they are not already (uses the order of the corresponding "__value" column if one is found in the data).
#' 
#' @param df (data.frame) Table of survey data containing the response of interest
#' @param q (character) Name of column (in `df`) containing question data of interest
#' 
#' importFrom magrittr %>%
#' 
graph_select_all <- function(df = NULL, q = NULL){

df <- svy_v01
  q <- "AIUse_reasons"

  # Error checks for 'df'
  if(is.null(df) || "data.frame" %in% class(df) != TRUE)
    stop("'df' must be provided as a dataframe-like object")

  # Error checks for 'q'
  if(is.null(q) || length(q) != 1 || is.character(q) != TRUE || q %in% names(df) != TRUE)
    stop("'q' must match a single column name in 'df'")
  
  # Remove NAs in relevant question
  df_v02 <- df[!is.na(df[[q]]),]

  # Pare down columns
  df_v03 <- dplyr::select(.data = df_v02, ResponseId, dplyr::all_of(q))

  # Handle difference between commas in actual response text versus collapsing char
  df_v04 <- df_v03 %>% 
    dplyr::rename_with(.fn = ~ gsub(pattern = q, replacement = "question", x = .)) %>% 
    dplyr::mutate(question = gsub(", ", "___", question)) %>% 
    dplyr::mutate(question = gsub(",", ";", question)) %>% 
    dplyr::mutate(question = gsub("___", ", ", question))

  # Count number of boxes checked per question
  delim_ct <- stringr::str_count(string = df_v04$question, pattern = ";")
  max_delim <- max(delim_ct, na.rm = TRUE)

  # Get one row per 'checked box' in original question
  df_v05 <- df_v04 %>% 
    tidyr::separate_wider_delim(cols = -ResponseId, delim = ";",
      names = c(paste0("box", 1:(max_delim + 1))), too_few = "align_start") %>% 
    tidyr::pivot_longer(cols = dplyr::starts_with("box")) %>% 
    dplyr::select(-name) %>% 
    dplyr::filter(!is.na(value))

  # Do generally-needed tidying of those responses
  df_v06 <- df_v05 %>% 
    dplyr::mutate(value = gsub(pattern = "’", replacement = "'", x = value))
    
  # Summarize response data
  df_v07 <- df_v06 %>% 
    dplyr::mutate(total_respondents = length(unique(ResponseId))) %>% 
    dplyr::group_by(value, total_respondents) %>% 
    dplyr::summarize(unique_respondents = length(unique(ResponseId)),
      .groups = "drop") %>% 
    dplyr::mutate(percent = round((unique_respondents / total_respondents) * 100, digits = 1)) %>% 
    dplyr::arrange(dplyr::desc(percent))
  
  # Create a graph
  simp_graph <- ggplot2::ggplot(data = df_v07, aes(x = percent, y = value, fill = value, color = "x")) +
    ggplot2::geom_bar(stat = "identity") +
    ggplot2::scale_color_manual(values = "#000") +
    ggplot2::guides(color = "none")

  # Return it
  return(simp_graph) }

# End ----
