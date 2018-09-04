args = commandArgs(trailingOnly=TRUE)


for (file_name in args) {

	read_path = paste("./", file_name, ".txt", sep="")
	df = read.csv(read_path,header=TRUE,sep="\t")


	print(head(df))


	df$insert <- paste("insert into peak.chrom values ('", df$chr, "',", df$start, ",",df$end, ",", df$length, ",", df$abs_summit, ",", df$pileup, ",", df$X.log10.pvalue., ",", df$fold_enrichment, ",", df$X.log10.qvalue., ",'", df$name, "',", "'", file_name, "'", ");", sep="")

	print(head(df))

	save_path = paste("./", file_name, "_insert.sql", sep="")
	write.table(df$insert, save_path, sep="\t", quote=FALSE, row.names=FALSE, col.names = FALSE)
}