SET search_path = 'eng_education';

BEGIN;

ALTER TABLE words_word ADD COLUMN amount integer default 0;

COMMIT;
