# Oracle-Blackjack

Dealer and player rules will be sourced from Wikipedia.

https://en.wikipedia.org/wiki/Blackjack

Scripts should be compiled in the following order.
* create_card_deck.sql
* shuffle_card_deck.sql
* play_blackjack.sql

For this project we will be following the prime + modifier + class pattern for naming tables and columns, abbreviating where appropriate.

* https://kb.iu.edu/d/bctf

Here is additional reference materials for SQL and PL/SQL.

* https://www.tutorialspoint.com/sql_certificate/index.htm
* https://www.tutorialspoint.com/plsql/index.htm

Here's an interesting article on blackjack simulations.

* https://digitalcommons.usu.edu/cgi/viewcontent.cgi?article=1528&context=gradreports

Sample output:

Player (438) : 72|2|Clubs|2|0
Player (438) : 46|Queen|Spades|10|0
Player (438) : 35|2|Hearts|2|0
Player (438) : 94|3|Spades|3|0
Dealer (438) : 88|3|Clubs|3|0
Dealer (438) : 92|9|Diamonds|9|0
Dealer (438) : 70|6|Spades|6|0
Player card score: 17/17/17 (17)
Dealer card score: 18
           Result: L
 
Player (439) : 54|Ace|Hearts|11|1
Player (439) : 93|10|Diamonds|10|0
Dealer (439) : 60|4|Clubs|4|0
Dealer (439) : 26|Queen|Hearts|10|0
Dealer (439) : 73|Queen|Spades|10|0
 
    !!! BLACKJACK !!! 
