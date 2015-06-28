
    drop table if exists customer;

    drop table if exists member;

    drop table if exists orders;

    drop table if exists order_item;

    drop table if exists order_process;

    drop table if exists user;

    create table customer (
        id bigint not null auto_increment,
        version bigint not null,
        primary key (id)
    ) ENGINE=InnoDB;

    create table member (
        id bigint not null auto_increment,
        version bigint not null,
        primary key (id)
    ) ENGINE=InnoDB;

    create table orders (
        id bigint not null auto_increment,
        version bigint not null,
        primary key (id)
    ) ENGINE=InnoDB;

    create table order_item (
        id bigint not null auto_increment,
        version bigint not null,
        item_price double precision not null,
        order_description varchar(255) not null,
        order_name varchar(255) not null,
        primary key (id)
    ) ENGINE=InnoDB;

    create table order_process (
        id bigint not null auto_increment,
        version bigint not null,
        primary key (id)
    ) ENGINE=InnoDB;

    create table user (
        id bigint not null auto_increment,
        version bigint not null,
        primary key (id)
    ) ENGINE=InnoDB;
