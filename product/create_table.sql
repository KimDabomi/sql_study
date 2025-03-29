create table product
(
    product_name char(4) not null
        primary key,
    cost         int     not null,
    make_date    date    null,
    company      char(5) null,
    amount       int     not null
);
