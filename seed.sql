create database board_room;

create table users (
    user_id serial primary key,
    email text,
    username text,
    digested_password text,
    avatar_url text
);

create_user("debbie@debbie.com", "debbiepaterson", "paterson", "https://avataaars.io/?avatarStyle=Circle&topType=LongHairStraight&accessoriesType=Blank&hairColor=BrownDark&facialHairType=Blank&clotheType=BlazerShirt&eyeType=Default&eyebrowType=Default&mouthType=Default&skinColor=Light")

create_user("jakob@home.com", "jakobwollner", "wollner", "https://avataaars.io/?avatarStyle=Circle&topType=LongHairStraight&accessoriesType=Blank&hairColor=BrownDark&facialHairType=Blank&clotheType=BlazerShirt&eyeType=Default&eyebrowType=Default&mouthType=Default&skinColor=Light")


create table gear_items (
    item_id serial primary key,
    name text,
    item_description text,
    image_url text,
    purchase_location text,
    last_used_location text,
    owner_id INTEGER
);


insert into gear_items (name, item_description, image_url, purchase_location, last_used_location, owner_id) values ('Burton Stylus Snowboard', 'This is my burton snowboard', 'https://images.evo.com/imgp/700/162050/670796/burton-stylus-snowboard-women-s-2020-.jpg', 'The Board Room, Montreal', 'Mt. Hotham, Victoria', 1);

insert into gear_items (name, item_description, image_url, purchase_location, last_used_location, owner_id) values ('Burton Stylus Snowboard', 'This is my burton snowboard', 'https://images.evo.com/imgp/700/162050/670796/burton-stylus-snowboard-women-s-2020-.jpg', 'The Board Room, Montreal', 'Mt. Hotham, Victoria', 1);

insert into gear_items (name, item_description, image_url, purchase_location, last_used_location, owner_id) values ('Rossignol Rebel Snowboard', 'This is my other snowboard', 'https://images.evo.com/imgp/700/162050/670796/burton-stylus-snowboard-women-s-2020-.jpg', 'Board Factory, Wellington', 'Falls Creek, Victoria', 1);


create table comments (
    comment_id serial primary key,
    gear_item_id INTEGER,
    content text,
    owner_id INTEGER,
    date_time_posted DATE NOT NULL DEFAULT CURRENT_DATE);

insert into comments (gear_item_id, content, owner_id) values (1, 'Great board - used this one last season.', 1);

insert into comments (gear_item_id, content, owner_id) values (1, 'Great jacket - looks cool - is it warm enough for the mountain?', 2);

insert into comments (gear_item_id, content, owner_id) values (2, 'I used this at Hakuba! Was sooo goodoodddd', 1);

insert into comments (gear_item_id, content, owner_id) values (2, 'Whhhhahahahaha sooo cool', 2);


UPDATE link
    SET last_update = DEFAULT
    WHERE
        last_update IS NULL;


alter table dishes add column image_url text;
alter table dishes add column user_id INTEGER;

ALTER TABLE comments 
RENAME COLUMN date_time_posted TO date_posted;
