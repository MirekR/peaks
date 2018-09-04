with tolerance_tab as (select 5 /* this number can be change to whatever to reflect desired tolerance*/ as tol) 
select t1.* 
  from peak.chrom t1 
  where exists (select 1 
  				from peak.chrom t2  
  				join tolerance_tab t
  				where t2.chrom = t1.chrom  
  				and t2.start between t1.start - t.tol and t1.start + t.tol 
  				and t2.end between t1.end - t.tol and t1.end + t.tol 
  				and t1.file_name != t2.file_name) 
  order by chrom asc, start asc, end asc;
