This project/exercise is for the following problem/question:

At the local grocery store items are sold by quantity. For example Milk costs $3.97. However sometimes there is a sale and then consumers can buy n items for the price of one.

This week the pricing table at the local grocery store looks like this:

```
Item     Unit price        Sale price
--------------------------------------
Milk      $3.97            2 for $5.00
Bread     $2.17            3 for $6.00
Banana    $0.99
Apple     $0.89
```

At the cash counter the items are accepted in any order. So at the cash counter the order of items can be in the order of Bread, Banana, Milk, Apple, Bread and then Milk. Notice that quantity of the Milk is 2 and this week there is a sale on milk if 2 bottles of milk are purchased. So the price applied for milk should be $5.00.

Also note that if the user buys three bottles of milk then for the first two bottles of milk the user should get the sale price and on the third bottle of milk the user should get the unit price.

Task
The task is to build a program which when executed would ask the user to list all the items purchased in any order. Once the user has listed all the items, print the receipt. The receipt should list the number of items purchased, the individual item total, total cost of all items and the amount saved. You need to build a solution for the given items and you do not need to worry about items which would be added in future