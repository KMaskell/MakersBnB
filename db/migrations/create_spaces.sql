create table spaces(
    id SERIAL PRIMARY KEY,
    name VARCHAR(60),
    description VARCHAR(300),
    price integer,
    user_id integer REFERENCES users(id));