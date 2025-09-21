create table if not exists public.transactions(
	transaction_id int generated always as identity primary key,
	user_id int not null references public.users(user_id),

	category_id int not null,
	payment_method_id int not null,
	wallet_id int not null,

	transaction_type varchar(15) not null 
		check(transaction_type in ('income', 'expense')),
	

	occured_at timestamptz not null,
	transaction_location varchar(255),
	note varchar(255),

	-- Prevent user use category, payment_method, wallet form other user
	constraint fk_transactions_categories
		foreign key (user_id, category_id)
		references public.categories(user_id, category_id)
		on delete cascade,

	constraint fk_transactions_payment_methods
		foreign key (user_id, payment_method_id)
		references public.payment_methods(user_id, payment_method_id)
		on delete cascade,

	constraint fk_transactions_wallets
		foreign key (user_id, wallet_id)
		references public.wallets(user_id, wallet_id)
		on delete cascade
);

insert into transactions(
	user_id, category_id, payment_method_id, wallet_id,
	transaction_type, occured_at
) values(
	1, 1, 1, 1, 'income','2025-09-22 00:05:47.391999+07'
);

select * from transactions;