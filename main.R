library(tercen)
library(dplyr)
library(Biostrings)

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
