 
 CREATE TABLE users(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    account_type VARCHAR(50) NOT NULL,
    billing_info VARCHAR(50),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
 );

INSERT INTO users(first_name, last_name, email, password, account_type, billing_info, created_at, updated_at)
VALUES('Pramodh', 'Jangam', 'pramodhjangam@fmail.com', 'Pramodh@123', 'Free', ' available', '20-01-2023');



 CREATE TABLE templates(
    template_id BIGSERIAL NOT NULL PRIMARY KEY,
    template_name VARCHAR(50) NOT NULL,
    preview_img TEXT NOT NULL,
    html_content TEXT NOT NULL,
    css_content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
 );


 CREATE TABLE websites(
    website_id BIGSERIAL NOT NULL PRIMARY KEY,
    id BIGINT NOT NULL REFERENCES users(id),
    website_name VARCHAR(50) NOT NULL,
    template_id BIGINT NOT NULL REFERENCES templates(template_id),
    domain VARCHAR(50),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
 );

 CREATE TABLE pages(
    page_id BIGSERIAL NOT NULL PRIMARY KEY,
    website_id BIGINT NOT NULL REFERENCES websites(website_id),
    page_name VARCHAR(50) NOT NULL,
    content TEXT,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
 );

 CREATE TABLE elements(
    element_id BIGSERIAL PRIMARY KEY,
    page_id BIGINT NOT NULL REFERENCES pages(page_id),
    element_type TEXT,
    element_content TEXT,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
 );

 CREATE TABLE media(
    media_id BIGSERIAL PRIMARY KEY,
    id BIGINT NOT NULL REFERENCES users(id),
    media_type TEXT,
    file_name VARCHAR(50),
    media_url TEXT,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
 );

 CREATE TABLE analytics(
    analytics_id BIGSERIAL PRIMARY KEY,
    website_id BIGINT NOT NULL REFERENCES websites(website_id),
    visitors INT,
    page_views INT,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
 );

 




