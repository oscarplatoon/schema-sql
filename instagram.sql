# Instagram
User
-
id PK int
name string
username string
email string
password string
post_id int FK - Post.id
Post
- 
id PK int
content image
date date
comment_id int FK - Comment.id
like_id int FK - Like.id
Comment
-
id PK int
text string
Like
-
id PK int
number int
Follow
-
id PK int
user_id int FK - User.id