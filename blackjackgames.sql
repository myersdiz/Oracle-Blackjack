/*Unique game identifier (primary key)
Game start date
Game end date
Number of decks used
Number of players
Number of hands to be played
Percent of cards remaining to perform a reshuffle*/

CREATE TABLE blackjack(
     game_num       INTEGER
    ,start_date     DATE NOT NULL
    ,end_date       DATE
    ,num_of_decks   INTEGER NOT NULL
    ,num_of_players INTEGER NOT NULL
    ,hands_played   INTEGER NOT NULL
    ,card_reshuffle NUMBER(3,2) NOT NULL
    ,CONSTRAINT blackjack_PK PRIMARY KEY (game_num)
);

DELETE FROM blackjack;
DROP SEQUENCE game_num_seq;
CREATE SEQUENCE GAME_NUM_SEQ INCREMENT BY 1 START WITH 1 NOCACHE ORDER;
INSERT INTO blackjack VALUES (game_num_seq.nextval, SYSDATE, NULL, 4, 4, 100, 0.50);

SELECT GAME_NUM_SEQ.NEXTVAL FROM DUAL;





