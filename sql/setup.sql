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
    "note" TEXT,
    "created" TIMESTAMPTZ NOT NULL,
    "updated" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY("id")
);
