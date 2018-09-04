create database peak;

use peak;

create table chrom (
	  chrom varchar(255), 
	  start int,
          end int,
          len int,	
	  abs_sumit int,
          pileup int,
          pvalue int,
          enrich int,
          qvalue int,	
	  name varchar(255),
	  file_name varchar(255)
	 ); 


ALTER TABLE chrom ADD INDEX selectIndx (chrom, start, end, file_name);
