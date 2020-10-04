library(tercen)
library(dplyr)
library(Biostrings)

options("tercen.workflowId" = "a77770c3923fad0ca99b77fa8905471d")
options("tercen.stepId"     = "d872747a-94bb-4b0b-8e56-2cd055f17238")

seq2tab <- function(df) {
  df_out <- data.frame(
    letter = strsplit(df[[1]], "")[[1]],
    .ri = df$.ri[1],
    stringsAsFactors = FALSE
  )
  df_out$position <- 1:nrow(df_out)
  df_out$presence <- as.numeric(df_out$letter != "-")
  return(df_out)  
}

ctx <- tercenCtx()

seqs <- ctx$rselect(ctx$rnames[[grep("sequence", ctx$rnames)]]) %>%
  mutate(.ri = seq(0, nrow(.) - 1)) %>%
  group_by(.ri) %>%
  do(seq2tab(.)) %>%
  ctx$addNamespace() %>%
  ctx$save()
