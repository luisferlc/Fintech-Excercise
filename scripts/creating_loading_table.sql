-- Creating main table
create table fintech_user (
	user_id int,
	churn bool,
	age int,
	housing varchar,
	credit_score int,
	deposits int,
	withdrawal int,
	purchases_partners int,
	purchases int,
	cc_taken int,
	cc_recommended int,
	cc_disliked	int,
	cc_liked int,
	cc_application_begin int,
	app_downloaded bool,
	web_user bool,
	app_web_user bool,
	ios_user bool,
	android_user bool,
	registered_phones int,
	payment_type varchar,
	waiting_4_loan bool,
	cancelled_loan bool,
	received_loan bool,
	rejected_loan bool,
	zodiac_sign varchar,
	rewards_earned int,
	reward_rate float,
	is_referred bool
);

-- Loading data
copy fintech_user from 'D:\Documentos\Fintech Play\archive\Fintech_user.csv' CSV header
-- Duplicates on user_id:
select count(*) from fintech_user;
select count(distinct user_id) from fintech_user;
--- Create a table with uniques ids:
create table fintech_user_f as (select row_number() over(order by user_id) as row_id, * from fintech_user);
select * from fintech_user_f;
-- Deleting duplicates to add primary key:
delete
from fintech_user_f as t1
using fintech_user_f as t2
where t1.user_id = t2.user_id
and t1.row_id > t2.row_id

select * from fintech_user_f;
select count(distinct user_id) from fintech_user;

-- Add PK and delete what doesnt help us anymore:
drop table fintech_user;
alter table fintech_user_f add primary key (user_id);
alter table fintech_user_f drop column row_id;

