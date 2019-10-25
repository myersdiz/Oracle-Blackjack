# Oracle-Blackjack

Dealer and player rules will be sourced from Wikipedia.

https://en.wikipedia.org/wiki/Blackjack

Scripts should be compiled in the following order.
* blackjack DDL.sql
* play_blackjack.sql

For this project we will be following the prime + modifier + class pattern for naming tables and columns, abbreviating where appropriate.

* https://kb.iu.edu/d/bctf

Here is additional reference materials for SQL and PL/SQL.

* https://www.tutorialspoint.com/sql_certificate/index.htm
* https://www.tutorialspoint.com/plsql/index.htm

Here's an interesting article on blackjack simulations.

* https://digitalcommons.usu.edu/cgi/viewcontent.cgi?article=1528&context=gradreports

Sample output:

```Player (278) : 6|4|Clubs|4|0
Player (278) : 69|10|Hearts|10|0
Player (278) : 36|7|Clubs|7|0
Dealer (278) : 58|Jack|Diamonds|10|0
Dealer (278) : 43|3|Spades|3|0
Dealer (278) : 94|8|Spades|8|0
Player card score: 21/21/21 (21)
Dealer card score: 21/21/21 (21)
           Result: Push
 
Player (279) : 28|Ace|Clubs|11|1
Player (279) : 82|10|Diamonds|10|0
Dealer (279) : 81|7|Hearts|7|0
Dealer (279) : 5|3|Spades|3|0
Dealer (279) : 89|Queen|Hearts|10|0
 
    !!! BLACKJACK !!!
```
