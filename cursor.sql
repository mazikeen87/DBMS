create or replace procedure Proc_grade
is
	old_id in old_emp.old_id%type;
	new_id in new_emp.new_id%type;
	name in old_emp%type;
	salary in old_emp%type;
	
	cursor c is select old_id,name,salary	from old_emp;
	cursor c1 (id_no integer) is select new_id from new_emp where new_id=id_no;
	
	begin
	dbms_output.putline('copying data from from old employee to new employee table');
	open c();
	if c%notfound;
	then dbms_output.putline('no data found');
	
	else
	loop
	fetch c into old_emp,name,salary
	exit when c%notfound
	
	open c1(old_id);
	fetch c1 into new_id;
	
	if c1%notfound then
		insert into new_emp values(old_id,name,salary);
	dbms_output.putline('data copied to new table');
	end if;
	close c1;
	end loop;
	end if;
	close c;
end;
