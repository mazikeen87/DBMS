create or replace procedure Proc_grade
is
	begin
	for ZCust in (select * from ZCust)
	loop
	if(ZCust.total_purchase<=20000 and ZCust.total_purchase>10000)
		then
		insert into XCategory values(ZCust.cust_id,ZCust.name,'platinum');
	end if;
	if(ZCust.total_purchase<=10000 and ZCust.total_purchase>5000)
		then
		insert inton ZCategory values (ZCust.cust_id,ZCust.name,'gold');
	end if;
	if(ZCust.total_purchase<=5000 and ZCust.total_purchase>2000)
		then
		insert into ZCategory values(ZCust.cust_id,ZCust.name,'silver');
	end if;
	end loop;
	end;

