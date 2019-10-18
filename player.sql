DROP TABLE player;

CREATE TABLE player (

     player_num      INTEGER
    ,player_desc     VARCHAR2(10) NOT NULL
    ,CONSTRAINT player_pk PRIMARY KEY (player_num)
    
);

INSERT INTO player VALUES (1, 'Player 1');
INSERT INTO player VALUES (2, 'Player 2');
INSERT INTO player VALUES (3, 'Player 3');
INSERT INTO player VALUES (4, 'Player 4');

COMMIT;