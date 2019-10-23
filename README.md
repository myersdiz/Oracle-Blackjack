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

```Player (43) : 9|4|Clubs|4|0
Player (43) : 8|7|Hearts|7|0
Player (43) : 4|3|Clubs|3|0
Player (43) : 10|6|Diamonds|6|0
Dealer (43) : 5|3|Spades|3|0
Dealer (43) : 4|7|Hearts|7|0
Dealer (43) : 4|6|Clubs|6|0
Dealer (43) : 5|7|Spades|7|0
Player card score: 20/20/20 (20)
Dealer card score: 23/23/23 (23)
           Result: Win
 
Player (44) : 7|Jack|Spades|10|0
Player (44) : 10|Ace|Hearts|11|1
Dealer (44) : 4|7|Clubs|7|0
Dealer (44) : 7|King|Diamonds|10|0
 
    !!! BLACKJACK !!!    
 
Player card score: 11/11/21 (21)
Dealer card score: 17/17/17 (17)
           Result: Win
```
