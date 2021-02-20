select count(*) from proteins;

explain select * from proteins where pid like "5HT2C_HUMA%";

create index idx1 on proteins(pid);

#Birden fazla unique index olabilir ama birden fazla pk olamaz.
#Pk null olamaz ama unique indexte olabilir.
create unique index idx2 on proteins(accession);
#composite index
create unique index idx3 on proteins(accession,pid);

#Implicit indexes are pk and fk.

alter table proteins add constraint acc_pk primary key(accession);

alter table proteins drop index idx3;

 