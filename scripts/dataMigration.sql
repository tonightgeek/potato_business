alter table orders add column is_member_first_order bit not null default false;

alter table goods add inventory integer DEFAULT 0;

alter table orders add order_series varchar(20);

alter table goods add column need_drink bit not NULL;
alter table goods add column need_sauce bit not NULL;