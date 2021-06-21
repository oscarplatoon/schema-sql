DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
    user_id     serial PRIMARY KEY,
    user_name varchar(255)   NOT NULL,
    contact_phone varchar(15)  NOT NULL
);

DROP TABLE IF EXISTS posts CASCADE;

CREATE TABLE posts (
    post_id serial PRIMARY KEY,
    post_image_src varchar(255)   NOT NULL,
    post_image_thumbnail_src varchar(255)   NOT NULL,
    post_author int   NOT NULL,
    post_likes int   NOT NULL
);

DROP TABLE IF EXISTS comments CASCADE;
CREATE TABLE comments (
    comment_id serial PRIMARY KEY,
    comment_author int   NOT NULL,
    comment_likes int   NOT NULL
);

DROP TABLE IF EXISTS likes CASCADE;
CREATE TABLE likes (
    like_id serial PRIMARY KEY,
    like_timestamp TIMESTAMP   NOT NULL,
    liked_post int   NOT NULL,
    like_owner int   NOT NULL
);

DROP TABLE IF EXISTS follows CASCADE;
CREATE TABLE follows (
    follow_id serial PRIMARY KEY,
    followed_user int   NOT NULL,
    following_user int   NOT NULL
);

ALTER TABLE posts ADD CONSTRAINT fk_posts_post_author FOREIGN KEY(post_author)
REFERENCES users (user_id);

ALTER TABLE posts ADD CONSTRAINT fk_posts_post_likes FOREIGN KEY(post_likes)
REFERENCES likes (like_id);

ALTER TABLE comments ADD CONSTRAINT fk_comments_comment_author FOREIGN KEY(comment_author)
REFERENCES users (user_id);

ALTER TABLE comments ADD CONSTRAINT fk_comments_comment_likes FOREIGN KEY(comment_likes)
REFERENCES likes (like_id);

ALTER TABLE likes ADD CONSTRAINT fk_likes_liked_post FOREIGN KEY(liked_post)
REFERENCES posts (post_id);

ALTER TABLE likes ADD CONSTRAINT fk_likes_like_owner FOREIGN KEY(like_owner)
REFERENCES users (user_id);

ALTER TABLE follows ADD CONSTRAINT fk_follows_followed_user FOREIGN KEY(followed_user)
REFERENCES users (user_id);

ALTER TABLE follows ADD CONSTRAINT fk_follows_following_user FOREIGN KEY(following_user)
REFERENCES users (user_id);

