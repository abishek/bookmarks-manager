-- written for postgresql
--
-- Create the database.
CREATE DATABASE bookmarks;
-- Create a User
CREATE USER bookmarksuser WITH ENCRYPTED PASSWORD 'bookmarkspass';
-- Grant all privileges on database to user
GRANT ALL PRIVILEGES ON DATABASE bookmarks TO bookmarksuser;

-- Create Bookmarks table
CREATE TABLE IF NOT EXISTS bookmarks (
    "id" SERIAL,
    "bookmark" VARCHAR(500) NOT NULL,
    "created" TIMESTAMPTZ NOT NULL,
    "updated" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY("id")
);

-- Create Tags table
CREATE TABLE IF NOT EXISTS tags (
    "id" SERIAL,
    "label" VARCHAR(100) NOT NULL UNIQUE,
    "updated" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY("id")
);

-- Create BookmarkTags table to connect the two
CREATE TABLE IF NOT EXISTS bookmarktags (
    "tag_id" INT,
    "bookmark_id" INT,
    CONSTRAINT fk_tag_id FOREIGN KEY(tag_id) REFERENCES tags(id),
    CONSTRAINT fk_bookmark_id FOREIGN KEY(bookmark_id) REFERENCES bookmarks(id),
    UNIQUE (tag_id, bookmark_id)
);
