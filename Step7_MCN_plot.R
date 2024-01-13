library(circlize)
rm(list = ls())
new=read.table("***/TMT_Correlated_with_MCN.txt",head=TRUE);
#new=read.table("***/MCN_Difference.txt",head=TRUE);
mat <- as.matrix(new)

rownames(mat) = c(paste0("A", 1:2), paste0("B", 1:2), paste0("C", 1:2),paste0("D", 1:2), paste0("E", 1:2), paste0("F", 1:2), paste0("G", 1:2)) 
colnames(mat) = c(paste0("A", 1:2), paste0("B", 1:2), paste0("C", 1:2),paste0("D", 1:2), paste0("E", 1:2), paste0("F", 1:2), paste0("G", 1:2))
nm <- unique(unlist(dimnames(mat)))
group <- structure(gsub("\\d", "", nm), names = nm)
circos.clear()
grid.col <- structure(
  c(rep("#f27970", 2), rep("#bb9727", 2), rep("#54b345", 2),rep("#32b897", 2), rep("#05b9e2", 2), rep("#8983bf", 2),rep("#c76da2", 2)),
  names = c(paste0("A", 1:2), paste0("B", 1:2), paste0("C", 1:2),paste0("D", 1:2), paste0("E", 1:2), paste0("F", 1:2), paste0("G", 1:2))
)

chordDiagram(mat, group = group, grid.col = grid.col,
             symmetric = FALSE,scale = FALSE,col = ifelse(mat > 0, "#fb8072", "#80b1d3"),
             big.gap = 6, small.gap = 1,
             link.lwd = 1, link.lty = 2, link.border = "#bbbbbb",
             
             annotationTrack = c("grid", "axis"),preAllocateTracks = list(track.height = mm_h(4),track.margin = c(mm_h(4), 0)))
circos.track(
  track.index = 2, 
  panel.fun = function(x, y) {
    sector.index = get.cell.meta.data("sector.index")
    xlim = get.cell.meta.data("xlim")
    ylim = get.cell.meta.data("ylim")
    circos.text(
      mean(xlim), mean(ylim),
      sector.index, cex = 0.6,
      niceFacing = TRUE
    )
  }, 
  bg.border = NA
)
highlight.sector(
  paste0("A", 1:2), track.index = 1, col = "#f27970", 
  text = "VN", cex = 0.8, text.col = "white", 
  niceFacing = TRUE
)
highlight.sector(
  paste0("B", 1:2), track.index = 1, col = "#bb9727", 
  text = "SMN", cex = 0.8, text.col = "white", 
  niceFacing = TRUE
)
highlight.sector(
  paste0("C", 1:2), track.index = 1, col = "#54b345", 
  text = "DAN", cex = 0.8, text.col = "white", 
  niceFacing = TRUE
)
highlight.sector(
  paste0("D", 1:2), track.index = 1, col = "#32b897", 
  text = "VAN", cex = 0.8, text.col = "white", 
  niceFacing = TRUE
)
highlight.sector(
  paste0("E", 1:2), track.index = 1, col = "#05b9e2", 
  text = "LN", cex = 0.8, text.col = "white", 
  niceFacing = TRUE
)
highlight.sector(
  paste0("F", 1:2), track.index = 1, col = "#8983bf", 
  text = "FPN", cex = 0.8, text.col = "white", 
  niceFacing = TRUE
)
highlight.sector(
  paste0("G", 1:2), track.index = 1, col = "#c76da2", 
  text = "DMN", cex = 0.8, text.col = "white", 
  niceFacing = TRUE
)
circos.clear()




