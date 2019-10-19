SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE blackjack_pkg
AS
   --Types
   TYPE hand IS RECORD (
      deck_num                         card_deck.deck_num%TYPE
     ,card                             card_deck.card%TYPE
     ,suit                             card_deck.suit%TYPE
     ,value1                           card_deck.value1%TYPE
     ,value2                           card_deck.value2%TYPE
    );

   TYPE dealer_hand IS TABLE OF hand INDEX BY PLS_INTEGER;
   TYPE player_hand IS TABLE OF hand INDEX BY PLS_INTEGER;

   PROCEDURE play_blackjack (
      p_num_card_decks                    INTEGER DEFAULT 8
     ,p_num_of_players                    INTEGER DEFAULT 1
   );
END;
/

CREATE OR REPLACE PACKAGE BODY blackjack_pkg
AS
   PROCEDURE play_blackjack (
      p_num_card_decks                    INTEGER DEFAULT 8
     ,p_num_of_players                    INTEGER DEFAULT 1
   )
   AS
      --Cursors
      CURSOR c_card_deck
      IS
      SELECT deck_num
            ,card
            ,suit
            ,value1
            ,value2
        FROM card_deck
      ORDER BY random_num;

      --Local Variables
      v_dealer_hand                       dealer_hand;
      v_player_hand                       player_hand;

      v_game_num                          INTEGER := 0;

      v_dealer_hand_card_cnt              INTEGER := 0;
      v_player_hand_card_cnt              INTEGER := 0;
      v_total_card_cnt                    INTEGER := 0;

      v_dealer_card_score                 INTEGER := 0;
      v_player_card_score                 INTEGER := 0;

      v_dealer_ace_cnt                    INTEGER := 0;
      v_player_ace_cnt                    INTEGER := 0;

      v_game_result_cd                    CHAR(1) := NULL;
   BEGIN
   --   v_dealer_hand.COUNT;
   --   v_dealer_hand.EXISTS(i);
   --   v_dealer_hand.DELETE;
   --   v_dealer_hand.DELETE(i);
   --   v_dealer_hand(i).suit;
   --   v_dealer_hand(i).card;

      --Create a card desk
      create_card_deck(p_num_card_decks);

      --Shuffle the card desk
      shuffle_card_deck;

      OPEN c_card_deck;

      << game_loop >>
      LOOP
         v_total_card_cnt := v_total_card_cnt + v_dealer_hand_card_cnt + v_player_hand_card_cnt;

         IF v_total_card_cnt / (p_num_card_decks * 52) >= 0.50 THEN
            EXIT game_loop;
         END IF;

         v_game_num := v_game_num + 1;
         v_dealer_hand_card_cnt := 0;
         v_player_hand_card_cnt := 0;
         v_dealer_hand.DELETE;
         v_player_hand.DELETE;
         v_game_result_cd := NULL;

         << initial_deal >>
         FOR i in 1 .. 4
         LOOP
            IF i IN (1,3) THEN
               v_player_hand_card_cnt := v_player_hand_card_cnt + 1;

               FETCH c_card_deck INTO
                  v_player_hand(v_player_hand_card_cnt).deck_num
                 ,v_player_hand(v_player_hand_card_cnt).card
                 ,v_player_hand(v_player_hand_card_cnt).suit
                 ,v_player_hand(v_player_hand_card_cnt).value1
                 ,v_player_hand(v_player_hand_card_cnt).value2;
               EXIT WHEN c_card_deck%NOTFOUND;
            ELSE
               v_dealer_hand_card_cnt := v_dealer_hand_card_cnt + 1;

               FETCH c_card_deck INTO
                  v_dealer_hand(v_dealer_hand_card_cnt).deck_num
                 ,v_dealer_hand(v_dealer_hand_card_cnt).card
                 ,v_dealer_hand(v_dealer_hand_card_cnt).suit
                 ,v_dealer_hand(v_dealer_hand_card_cnt).value1
                 ,v_dealer_hand(v_dealer_hand_card_cnt).value2;
               EXIT WHEN c_card_deck%NOTFOUND;
            END IF;
         END LOOP;

         << player_loop >>
         LOOP
            v_player_ace_cnt := 0;
            v_player_card_score := 0;

            FOR i IN 1 .. v_player_hand.COUNT
            LOOP
               IF v_player_hand(i).card = 'Ace' THEN
                  v_player_ace_cnt := v_player_ace_cnt + 1;
               END IF;

               v_player_card_score := v_player_hand(i).value1 + v_player_card_score;
            END LOOP;

            IF v_player_card_score >= 17 THEN
               EXIT player_loop;
            ELSE
               v_player_hand_card_cnt := v_player_hand_card_cnt + 1;

               FETCH c_card_deck INTO
                  v_player_hand(v_player_hand_card_cnt).deck_num
                 ,v_player_hand(v_player_hand_card_cnt).card
                 ,v_player_hand(v_player_hand_card_cnt).suit
                 ,v_player_hand(v_player_hand_card_cnt).value1
                 ,v_player_hand(v_player_hand_card_cnt).value2;
               EXIT WHEN c_card_deck%NOTFOUND;
            END IF;
         END LOOP;

         --Player busted
         IF v_player_card_score > 21 THEN
            v_game_result_cd := 'L';
         ELSE
            << dealer_loop >>
            LOOP
               v_dealer_ace_cnt := 0;
               v_dealer_card_score := 0;

               FOR i IN 1 .. v_dealer_hand.COUNT
               LOOP
                  IF v_dealer_hand(i).card = 'Ace' THEN
                     v_dealer_ace_cnt := v_dealer_ace_cnt + 1;
                  END IF;

                  v_dealer_card_score := v_dealer_hand(i).value1 + v_dealer_card_score;
               END LOOP;

               IF v_dealer_card_score >= 17 THEN
                  EXIT dealer_loop;
               ELSE
                  v_dealer_hand_card_cnt := v_dealer_hand_card_cnt + 1;

                  FETCH c_card_deck INTO
                     v_dealer_hand(v_dealer_hand_card_cnt).deck_num
                    ,v_dealer_hand(v_dealer_hand_card_cnt).card
                    ,v_dealer_hand(v_dealer_hand_card_cnt).suit
                    ,v_dealer_hand(v_dealer_hand_card_cnt).value1
                    ,v_dealer_hand(v_dealer_hand_card_cnt).value2;
                  EXIT WHEN c_card_deck%NOTFOUND;
               END IF;
            END LOOP;

            --Dealer busts OR player wins
            IF v_dealer_card_score > 21 OR v_player_card_score > v_dealer_card_score THEN
               v_game_result_cd := 'W';
            --Tie score
            ELSIF v_dealer_card_score = v_player_card_score THEN
               v_game_result_cd := 'P';
            --Dealer wins
            ELSE
               v_game_result_cd := 'L';
            END IF;
         END IF;

         --DBMS_OUTPUT player cards
         FOR i IN 1 .. v_player_hand.COUNT
         LOOP
            dbms_output.put_line (
               'Player (' || v_game_num || ') : ' ||
               v_player_hand(i).deck_num || '|' ||
               v_player_hand(i).card || '|' ||
               v_player_hand(i).suit || '|' ||
               v_player_hand(i).value1 || '|' ||
               v_player_hand(i).value2
            );
         END LOOP;

         --DBMS_OUTPUT dealer cards
         FOR i IN 1 .. v_dealer_hand.COUNT
         LOOP
            dbms_output.put_line (
               'Dealer (' || v_game_num || ') : ' ||
               v_dealer_hand(i).deck_num || '|' ||
               v_dealer_hand(i).card || '|' ||
               v_dealer_hand(i).suit || '|' ||
               v_dealer_hand(i).value1 || '|' ||
               v_dealer_hand(i).value2
            );
         END LOOP;

         dbms_output.put_line ('Result: ' || v_game_result_cd);
      END LOOP;

      CLOSE c_card_deck;
   END;
END;
/

BEGIN
   blackjack_pkg.play_blackjack (8, 1);
END;
/