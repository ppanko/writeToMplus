##
writeToMplus <- function(dataList, dataDir, miFolder,
                         listName = "dataList.txt",
                         nameName = "dataNames.txt",
                         missing = "-9999",
                         ...)
{
  dir.create(file.path(dataDir, miFolder))
  fileNames <- vector("character", length(dataList))
  ##
  for(i in seq_along(dataList)) {
    ##
    fileNames[i] <- file.path(miFolder, paste0("data_", i, ".dat"))
    ##
    write.table(
      x    = dataList[[i]],
      file = file.path(dataDir, fileNames[i]),
      row.names = FALSE,
      col.names = FALSE,
      quote = FALSE,
      na = missing,
      ...
    )
    cat("Wrote", i, "\n")
  }
  ##
  write.table(
    x    = fileNames,
    file = file.path(dataDir, listName),
    row.names = FALSE,
    col.names = FALSE,
    quote = FALSE
  )
  ##
  write.table(
    x    = names(dataList[[1]]),
    file = file.path(dataDir, nameName),
    row.names = FALSE,
    col.names = FALSE,
    quote = FALSE
  )
}
