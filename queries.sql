-- Gets website site settings  with id =1 
SELECT title, logo, favicon FROM websites
JOIN site_settings ON websites.id = site_settings.website_id
WHERE websites.id = 1;


-- QUERY 1 
-- 1) Renders the entire Homepage of the user Vladamir with user id =1;
SELECT elements.type, elements.content, site_settings.title, site_settings.logo, site_settings.favicon, pages.name, pages.created_at, users.first_name, users.id FROM elements
JOIN pages ON elements.page_id = pages.id
JOIN websites ON pages.website_id = websites.id
JOIN users ON websites.user_id = users.id 
JOIN site_settings ON websites.id = site_settings.website_id
WHERE pages.name = 'Homepage' AND users.id =1;

-- QUERY 2 
-- 2) Creates a Basic JSON Sitemap for the website  
SELECT 
    row_to_json(t) as json_sitemap
FROM (
    SELECT 
        website_id,
        name,
        created_at,
        updated_at
    FROM pages
    WHERE website_id = 1
) t;


-- QUERY 3 
-- Gets the page views of the each page in the website. 
SELECT pages.name, SUM(page_analytics.views) as views FROM page_analytics
JOIN pages ON page_analytics.page_id = pages.id
GROUP BY pages.name;

-- a) Gets the Most Visited Page in the entire website.
SELECT pages.name, SUM(page_analytics.views) as views FROM page_analytics
JOIN pages ON page_analytics.page_id = pages.id
GROUP BY pages.name
ORDER BY views DESC
LIMIT 1;

-- b) Change in percentage of view trend 
-- Pending , will update as soon as possible 










