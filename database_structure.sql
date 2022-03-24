create database if not exists notebook;

create table if not exists users
(
    id       int  not null auto_increment primary key,
    username text not null,
    password text not null
);

create table if not exists groups(
    id                              int not null auto_increment primary key,
    title                           text default 'unnamed',
    user_id                         int not null,
    parent_group_id                 int not null,
    foreign key (user_id)           references users(id),
    foreign key (parent_group_id)   references groups(id)
);


create table notes (
    id                      int not null auto_increment primary key,
    title                   text default 'note',
    description             text default '',
    group_id                int not null,
    foreign key (group_id)  references groups(id)
);
