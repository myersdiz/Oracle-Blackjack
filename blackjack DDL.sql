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
