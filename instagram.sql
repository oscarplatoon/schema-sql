-- # Instagram
-- createdb instagram
-- psql instagram
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS comments CASCADE;
DROP TABLE IF EXISTS likes CASCADE;
DROP TABLE IF EXISTS follows CASCADE;

CREATE TABLE users (
    id  SERIAL PRIMARY KEY,
    Name varchar(120)   NOT NULL,
    Address1 varchar(250),
    city varchar(50),
    state varchar(50),
    zipcode int
);

CREATE TABLE posts (
    id  SERIAL PRIMARY KEY,
    user_id int NOT NULL REFERENCES users(id),
    message varchar(250)   NOT NULL,
    time timestamp   NOT NULL,
    image_url varchar(255) not null
);

CREATE TABLE comments (
    id  SERIAL  PRIMARY KEY,
    from_user_id int   NOT NULL REFERENCES users(id),
    to_post_id int  NOT NULL REFERENCES posts(id),
    time timestamptz   NULL,
    message varchar(255) NOT NULL
);

CREATE TABLE follows (
    id  SERIAL  PRIMARY KEY,
    from_user_id int   NOT NULL REFERENCES users(id),
    to_user_idv int  NOT NULL REFERENCES users(id)
);

CREATE TABLE likes (
    id  SERIAL PRIMARY KEY,
    from_user_id int   NOT NULL REFERENCES users(id),
    to_post_id int REFERENCES posts(id),
    to_comment_id int REFERENCES comments(id)
    );

