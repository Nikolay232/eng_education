SET search_path = 'eng_education';

BEGIN;

CREATE TABLE "verbs_verb" (
    "id" serial NOT NULL PRIMARY KEY,
    "infinitive" varchar(255) NOT NULL UNIQUE,
    "past_simple" varchar(255) NOT NULL,
    "past_participle" varchar(255) NOT NULL,
    "rus" varchar(255) NOT NULL,
    "publish" boolean NOT NULL
)
;

GRANT SELECT, UPDATE, INSERT, DELETE ON verbs_verb TO role_rw;
GRANT SELECT ON verbs_verb TO role_ro;
GRANT SELECT, UPDATE ON verbs_verb_id_seq TO role_rw;

CREATE INDEX "verbs_word_infinitive_like" ON "verbs_word" ("infinitive" varchar_pattern_ops);

COMMIT;
