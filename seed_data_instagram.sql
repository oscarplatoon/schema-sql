insert into users(name, email) values ('joe', 'joe@example.com');
insert into users(name, email) values ('kelly', 'kelly@example.com');
insert into posts(content, user_id) values ('Hello kelly', 1);
insert into posts(content, user_id) values ('Hello joe', 2);
insert into likes(post_id, user_id, like_status) values (1, 2, true);
