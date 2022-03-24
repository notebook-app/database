create database notebook;

create table if not exists users
(
    id       bigserial primary key,
    username text not null,
    password text not null
);

create table if not exists groups(
    id                              bigserial primary key,
    title                           text default 'unnamed',
    user_id                         bigint not null,
    parent_group_id                 bigint not null,
    foreign key (user_id)           references users(id),
    foreign key (parent_group_id)   references groups(id)
);


create table notes (
    id                      bigserial primary key,
    title                   text default 'note',
    description             text default '',
    group_id                bigint not null,
    foreign key (group_id)  references groups(id)
);
