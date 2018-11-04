drop database if exists bank_db;
create database bank_db;
use bank_db;

create table accounts (
	id					int 					not null primary key auto_increment,
    account_holder 		varchar(30)				not null,
    balance 			decimal(14,2)			not null default 0,
    fees				decimal(14,2)			not null default 0
);

create table transactions (
	id					int 					not null primary key auto_increment,
    amount 				decimal(14,2)			not null default 0,
    txn_type 			varchar(15)				not null,
    account_ID 			int 					not null
);

alter table transactions
	add constraint `Fk_accountID`
    foreign Key (account_ID) references accounts(id)
    on update cascade;

insert into accounts (account_holder, balance, fees) 
	values
		('Gary Henderson', 8888.00, 250.00),
		('Meagan Hansen', 5444.00, 175.00),
		('Nick Law', 3333.00, 88.00),
		('Yelena Lapina', 3322.00, 88.00);
           
insert into transactions (amount, txn_type, account_ID)
	values 
		(500.00,'Deposit', 3),
		(-200.00,'Withdrawal', 4),
		(200.00,'Deposit', 4),
		(248.00,'Deposit', 1);
