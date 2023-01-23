--  Users Table 
 CREATE TABLE users(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    account_type VARCHAR(50) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc') NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc')
 );
 
-- Billings Table 
 CREATE TABLE billings(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id),
    address JSON NOT NULL,
    credit_card JSON NOT NULL,
    history JSON,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc') NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc')
 );
INSERT INTO billings(user_id, address, credit_card) values(1, '[{},{},{},{}]', '[{},{},{},{}]');
INSERT INTO billings(user_id, address, credit_card) values(2, '[{"H-no" : "1-72","city" : "Khammam","State" : "Telangana","country" :"India"}]', '[{"Card No" : "12345328649793"}]');


-- Templates Table  
 CREATE TABLE templates(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image TEXT NOT NULL,
    html TEXT NOT NULL,
    css TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc') NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc')
 );
insert into templates (name, image, html, css) values ('Florencia', 'http://dummyimage.com/230x100.png/dddddd/000000', '<h1>fbrydell0</h1>', 'color:red;');


-- Websites Table 
 CREATE TABLE websites(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id),
    name VARCHAR(255) NOT NULL,
    template_id BIGINT NOT NULL REFERENCES templates(id),
    domain VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc') NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc')
 );
insert into templates (user_id, name, template_id, domain) values ('1', 'Ekdham Brand', 3, 'www.ekdham.com');


-- Site Settings Table 
CREATE TABLE site_settings(
   website_id BIGINT NOT NULL REFERENCES websites(id),
   title TEXT NOT NULL,
   logo TEXT,
   favicon TEXT
);
insert into site_settings (website_id, title, logo, favicon) values (1, 'Ekdham', 'logo.png','favicon.io');


-- Pages Table 
 CREATE TABLE pages(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    website_id BIGINT NOT NULL REFERENCES websites(id),
    name VARCHAR(255) NOT NULL,
    content TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc') NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc')
 );
insert into pages (website_id, name, content) values (1, 'Homepage','Hello World!');


-- Elements Table 
 CREATE TABLE elements(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    page_id BIGINT NOT NULL REFERENCES pages(id),
    type TEXT,
    content TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc') NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc')
 );

 insert into elements (page_id, type, content) values (1, 'TEXT','This is TEXT Type!');


-- Media Table 
 CREATE TABLE media(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id),
    type TEXT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    url TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc') NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc')
 );

 insert into media(user_id, type, file_name, url) values(1, 'IMG', 'logo.png', 'http://dummyimage.com/230x100.png/dddddd/000000');


-- Analytics Table 
 CREATE TABLE analytics(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    website_id BIGINT NOT NULL REFERENCES websites(id),
    visitors INT,
    page_views INT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc') NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc')
 );

 insert into analytics(website_id, visitors, page_views) values(1, 1000, 1500);

-- Page Analytics 
CREATE TABLE page_analytics(
   id BIGSERIAL NOT NULL PRIMARY KEY,
   page_id BIGINT NOT NULL REFERENCES pages(id),
   views INT,
   created_at TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc') NOT NULL
);

insert into page_analytics (page_id, views) values(1, 1000);

