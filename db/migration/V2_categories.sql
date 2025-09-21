create table if not exists public.categories(
	category_id int generated always as identity primary key,
	user_id int not null references public.users(user_id) on delete cascade,
	category_name varchar(255) not null,
	created_at timestamptz default now() not null,

	-- Prevent same category name in the same user
	unique (user_id, category_name)
);

insert into categories (user_id, category_name) values(
	1,'Food'
)

select * from categories;