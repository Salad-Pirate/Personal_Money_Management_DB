create table if not exists public.users(
	user_id int generated always as identity primary key,
	email varchar(255) not null unique,
	password_hash varchar(255) not null,
	display_name varchar(255) not null,
	created_at timestamptz default now() not null,
	updated_at timestamptz default now() not null
);

insert into users (email,password_hash,display_name) values(
	'alice@example.com', 'alicethymefield', 'Alice'
);
select * from users;

