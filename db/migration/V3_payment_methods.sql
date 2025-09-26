create table if not exists public.payment_methods(
	payment_method_id int generated always as identity primary key,
	user_id int not null references public.users(user_id) on delete cascade,
	payment_method_name varchar(255) not null,
	color_hex varchar(7) not null,
	created_at timestamptz default now() not null,

	-- Prevent same payment method name in the same user
	unique (user_id,payment_method_name),
	constraint unique_payment_methods_user_pair unique(user_id, payment_method_id)
);

insert into payment_methods (user_id, payment_method_name, color_hex) values
(
	1,'Cash','#000000'
),
(
    2,'Visa', '#000000'
);

select * from payment_methods;