create table if not exists public.wallets(
	wallet_id int generated always as identity primary key,
	user_id int not null references public.users(user_id) on delete cascade,
	wallet_name varchar(255) not null,
	starting_balance numeric(12,2) not null default 0,
	wallet_type varchar(255) not null,
	created_at timestamptz default now() not null,

	-- Prevent same wallet name in the same user
	unique (user_id, wallet_name),
	constraint unique_wallets_user_pair unique(user_id, wallet_id)
);

insert into wallets(user_id, wallet_name, wallet_type) values
(
	1,'Wallet_1','Cash'
),
(
    2,'first_wallet','Savings'
);

select * from wallets;