DROP PROCEDURE shuffle_card_deck;

CREATE OR REPLACE PROCEDURE shuffle_card_deck
AS
BEGIN
   UPDATE card_deck
      SET random_num = dbms_random.random();

   COMMIT;
END;
/

BEGIN
   shuffle_card_deck;
END;
/

SELECT *
   FROM card_deck
ORDER BY random_num
;