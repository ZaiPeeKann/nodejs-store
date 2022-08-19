CREATE TABLE person (
    id SERIAL primary key not null,
    nickname varchar(255),
    email VARCHAR(255),
    password VARCHAR(255),
    role VARCHAR(255)
);

CREATE TABLE basket (
    id serial,
    person_id int,
    foreign key (person_id) references person (id)
);

create table basket_device (
    id serial primary key,
    basket_id int,
    device_id int,
    foreign key (basket_id) references basket (id),
    foreign key (device_id) references device (id)
);

create table device (
    id SERIAL primary key,
    name VARCHAR(255),
    price DECIMAL(20,5),
    rating float,
    img VARCHAR(255),
    type_id int,
    brand_id int,
    foreign key (type_id) references type (id),
    foreign key (brand_id) references brand (id)
);

create table type (
    id serial primary key,
    name VARCHAR(255)
);

create table brand (
    id serial primary key,
    name VARCHAR(255)
);

create table device_info (
    id serial primary key,
    device_id int,
    title VARCHAR(255),
    description varchar(255),
    foreign key (device_id) references device (id)
);

create table rating (
    id serial primary key,
    person_id int,
    device_id int,
    rate int,
    foreign key (person_id) references person (id),
    foreign key (device_id) references device (id)
);