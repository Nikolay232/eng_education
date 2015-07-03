SET search_path = 'eng_education';

BEGIN;
/*
CREATE TABLE "profile_userprofile" (
    "id" serial NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL UNIQUE REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED,
    "theme_id" integer UNIQUE
)
;

GRANT SELECT, UPDATE, INSERT, DELETE ON profile_userprofile TO role_rw;
GRANT SELECT ON profile_userprofile TO role_ro;
GRANT SELECT, UPDATE ON profile_userprofile_id_seq TO role_rw;

-- The following references should be added but depend on non-existent tables:
-- ALTER TABLE "profile_userprofile" ADD CONSTRAINT "theme_id_refs_id_a2236d5d" FOREIGN KEY ("theme_id") REFERENCES "theme_theme" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE TABLE "theme_theme" (
    "id" serial NOT NULL PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "publish" boolean NOT NULL
)
;

GRANT SELECT, UPDATE, INSERT, DELETE ON theme_theme TO role_rw;
GRANT SELECT ON theme_theme TO role_ro;
GRANT SELECT, UPDATE ON theme_theme_id_seq TO role_rw;

CREATE INDEX "theme_theme_title_like" ON "theme_theme" ("title" text_pattern_ops);
*/
CREATE TABLE "words_word_theme" (
    "id" serial NOT NULL PRIMARY KEY,
    "word_id" integer NOT NULL,
    "theme_id" integer NOT NULL REFERENCES "theme_theme" ("id") DEFERRABLE INITIALLY DEFERRED,
    UNIQUE ("word_id", "theme_id")
)
;

GRANT SELECT, UPDATE, INSERT, DELETE ON words_word_theme TO role_rw;
GRANT SELECT ON words_word_theme TO role_ro;
GRANT SELECT, UPDATE ON words_word_theme_id_seq TO role_rw;

CREATE TABLE "words_word" (
    "id" serial NOT NULL PRIMARY KEY,
    "eng" text NOT NULL,
    "rus" text NOT NULL,
    "publish" boolean NOT NULL
)
;

GRANT SELECT, UPDATE, INSERT, DELETE ON words_word TO role_rw;
GRANT SELECT ON words_word TO role_ro;
GRANT SELECT, UPDATE ON words_word_id_seq TO role_rw;

ALTER TABLE "words_word_theme" ADD CONSTRAINT "word_id_refs_id_aa9b0f0d" FOREIGN KEY ("word_id") REFERENCES "words_word" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "words_word_theme_word_id" ON "words_word_theme" ("word_id");
CREATE INDEX "words_word_theme_theme_id" ON "words_word_theme" ("theme_id");

COMMIT;
