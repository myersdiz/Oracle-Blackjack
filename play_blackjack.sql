SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE play_blackjack (
   p_num_card_decks                    INTEGER DEFAULT 8
  ,p_num_of_players                    INTEGER DEFAULT 1
)
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

   v_dealer_hand_card_cnt              INTEGER := 0;
   v_player_hand_card_cnt              INTEGER := 0;
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

   LOOP
      v_dealer_hand_card_cnt := v_dealer_hand_card_cnt + 1;

      FETCH c_card_deck INTO
         v_dealer_hand(v_dealer_hand_card_cnt).deck_num
        ,v_dealer_hand(v_dealer_hand_card_cnt).card
        ,v_dealer_hand(v_dealer_hand_card_cnt).suit
        ,v_dealer_hand(v_dealer_hand_card_cnt).value1
        ,v_dealer_hand(v_dealer_hand_card_cnt).value2;
      EXIT WHEN c_card_deck%NOTFOUND;

   END LOOP;

   CLOSE c_card_deck;

   FOR i IN 1 .. v_dealer_hand.COUNT
   LOOP
      dbms_output.put_line(
         v_dealer_hand(i).deck_num || '|' ||
         v_dealer_hand(i).card || '|' ||
         v_dealer_hand(i).suit || '|' ||
         v_dealer_hand(i).value1 || '|' ||
         v_dealer_hand(i).value2
      );
   END LOOP;
END;
/

BEGIN
   play_blackjack (8, 1);
END;
/