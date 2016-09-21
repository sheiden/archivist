-- Reset database:

drop table if exists "snapshots";
drop table if exists "changes";
drop table if exists "fragments";
drop table if exists "documents";
drop table if exists "sessions";
drop table if exists "users";

-- Users:
CREATE TABLE "users" (
  "userId" text UNIQUE PRIMARY KEY,
  email text UNIQUE,
  name text,
  created timestamp,
  "loginKey" text UNIQUE
);

CREATE UNIQUE INDEX login_key_index ON users("loginKey");

-- Sessions:
CREATE TABLE "sessions" (
  "sessionToken" text UNIQUE PRIMARY KEY,
  "userId" text REFERENCES users ON DELETE CASCADE,
  -- ex timestamp
  created timestamp
);

-- Documents:
CREATE TABLE "documents" (
  "documentId" text UNIQUE PRIMARY KEY,
  "schemaName" text,
  "schemaVersion" text,
  info jsonb,
  version integer,
  title text,
  annotations text[],
  "updatedAt" timestamp,
  "updatedBy" text REFERENCES users ON DELETE SET DEFAULT,
  "userId" text REFERENCES users ON DELETE SET DEFAULT
);

CREATE UNIQUE INDEX document_id_index ON documents("documentId");

-- Changes:
CREATE TABLE "changes" (
  "documentId" text REFERENCES documents ON DELETE CASCADE,
  version integer,
  data jsonb,
  "createdAt" timestamp,
  "userId" text REFERENCES users ON DELETE SET DEFAULT,
  PRIMARY KEY("documentId", version)
);

-- Index so we can query by documentId and or userId (needed to extract collaborators)
CREATE INDEX changes_document_id_index ON changes("documentId");
CREATE INDEX changes_user_id_index ON changes("userId");
CREATE INDEX changes_document_user_idx_index ON changes("documentId", "userId");

-- Snapshots:
CREATE TABLE "snapshots" (
  "documentId" text REFERENCES documents ON DELETE CASCADE,
  version integer,
  data jsonb,
  created timestamp,
  PRIMARY KEY("documentId", version)
);

-- Fragments:
CREATE TABLE "fragments" (
  "fragmentId" text,
  "documentId" text REFERENCES documents ON DELETE CASCADE,
  -- plain text version
  content text,
  -- xml version
  markup text,
  -- array with annotations references
  annotations text[],
  -- previous fragment reference
  prev text REFERENCES fragments ON DELETE SET DEFAULT,
  -- next fragment reference
  next text REFERENCES fragments ON DELETE SET DEFAULT,
  PRIMARY KEY("fragmentId")
);