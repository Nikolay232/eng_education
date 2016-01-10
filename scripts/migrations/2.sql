SET search_path = 'eng_education';

BEGIN;

UPDATE words_word_theme SET theme_id = 15 WHERE theme_id > 15 and theme_id < 20;

COMMIT;
