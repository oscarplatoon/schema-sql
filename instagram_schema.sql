drop table if exists users cascade;
drop table if exists posts cascade;
drop table if exists likes cascade;
drop table if exists comments cascade;
drop table if exists follows cascade;

create table users (
  id serial primary key,
  name varchar(64) not null,
  email varchar(64) not null
);

create table posts (
  id serial primary key,
  content varchar(255) not null,
  image_url varchar(64),
  user_id int
);

create table likes (
  id serial primary key,
  post_id int,
  user_id int,
  like_status bool not null
);

create table comments (
  id serial primary key,
  content varchar(255) not null,
  post_id int,
  user_id int
);

create table follows (
  id serial primary key,
  user_followed_id int,
  user_following_id int,
  follow_status bool not null
);

ALTER TABLE posts
ADD CONSTRAINT fk_posts_users_id
FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE comments
ADD CONSTRAINT fk_comments_posts_id
FOREIGN KEY (post_id) REFERENCES posts(id);

ALTER TABLE comments
ADD CONSTRAINT fk_comments_users_id
FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE likes
ADD CONSTRAINT fk_likes_posts_id
FOREIGN KEY (post_id) REFERENCES posts(id);

ALTER TABLE likes
ADD CONSTRAINT fk_likes_users_id
FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE follows
ADD CONSTRAINT fk_follows_users_id
FOREIGN KEY (user_followed_id) REFERENCES users(id);

ALTER TABLE follows
ADD CONSTRAINT fk_follows_users_2_id
FOREIGN KEY (user_following_id) REFERENCES users(id);