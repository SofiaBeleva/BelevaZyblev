create table test_transaction (a1 int)
	begin transaction tr1 
		insert into  test_transaction values (11)
		begin transaction tr2 
			INSERT INTO test_transaction VALUES (22) 
			begin transaction tr3 
				INSERT INTO test_transaction VALUES (33)
				select * from test_transaction
				select 'Вложенность транзакций', @@TRANCOUNT
			rollback transaction
select * from test_transaction
select 'Вложенность транзакций', @@TRANCOUNT
