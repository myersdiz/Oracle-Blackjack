DROP TABLE card_deck;

CREATE TABLE card_deck (
   deck_num                         INTEGER
  ,card                             VARCHAR2(5)
  ,suit                             VARCHAR2(8)
  ,value1                           INTEGER
  ,value2                           INTEGER
  ,random_num                       NUMBER
 --123456789012345678901234567890

  ,CONSTRAINT card_deck_pk PRIMARY KEY (deck_num, card, suit)
);

CREATE OR REPLACE PROCEDURE create_card_deck (p_deck_num INTEGER DEFAULT 1)
AS
   --Types are similar to arrays in other languages
   TYPE card_type IS TABLE OF VARCHAR2(5) INDEX BY PLS_INTEGER;
   TYPE suit_type IS TABLE OF VARCHAR2(8) INDEX BY PLS_INTEGER;
   TYPE value_type IS TABLE OF INTEGER INDEX BY PLS_INTEGER;

   card        card_type;
   suit        suit_type;
   value1      value_type;
   value2      value_type;
BEGIN
   card(1) := '2';
   card(2) := '3';
   card(3) := '4';
   card(4) := '5';
   card(5) := '6';
   card(6) := '7';
   card(7) := '8';
   card(8) := '9';
   card(9) := '10';
   card(10) := 'Jack';
   card(11) := 'Queen';
   card(12) := 'King';
   card(13) := 'Ace';

   suit(1) := 'Hearts';
   suit(2) := 'Diamonds';
   suit(3) := 'Spades';
   suit(4) := 'Clubs';

   value1(1) := 2;
   value1(2) := 3;
   value1(3) := 4;
   value1(4) := 5;
   value1(5) := 6;
   value1(6) := 7;
   value1(7) := 8;
   value1(8) := 9;
   value1(9) := 10;
   value1(10) := 10;
   value1(11) := 10;
   value1(12) := 10;
   value1(13) := 11;

   value2(1) := 0;
   value2(2) := 0;
   value2(3) := 0;
   value2(4) := 0;
   value2(5) := 0;
   value2(6) := 0;
   value2(7) := 0;
   value2(8) := 0;
   value2(9) := 0;
   value2(10) := 0;
   value2(11) := 0;
   value2(12) := 0;
   value2(13) := 1;

   EXECUTE IMMEDIATE 'TRUNCATE TABLE card_deck';

   --Loop through number of decks
   FOR v_deck_num IN 1 .. p_deck_num
   LOOP

      --Loop through number of cards
      FOR v_card_num IN 1 .. 13
      LOOP

         --Loop through number of suits
         FOR v_suit_num IN 1 .. 4
         LOOP
            INSERT INTO card_deck (
               deck_num
              ,card
              ,suit
              ,value1
              ,value2
              ,random_num
            ) VALUES (
               v_deck_num
              ,card(v_card_num)
              ,suit(v_suit_num)
              ,value1(v_card_num)
              ,value2(v_card_num)
              ,dbms_random.random()
            );
         END LOOP;
      END LOOP;
   END LOOP;

   COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/

BEGIN
   create_card_deck (2);
END;
/

SELECT *
  FROM card_deck
ORDER BY random_num
;