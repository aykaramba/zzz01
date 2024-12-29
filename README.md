
# PROBLEM - checkedp is behaving in an unexpected way.

1) Problem definition - I am testing lexical scope with check boxes. I created 5 check boxes, stored them in an array and I created a simple button that loops over the array and checks if a checkbox is checked.  If check boxes are checked we uncheck them, otherwise we check them.
2) Expected behaviour - If some boxes are checked uncheck the checkbox, otherwise check the rest.  If all boxes are unchecked, check all boxes.  If all boxes checked, uncheck them.
3) Purpose - To test lexical scope and logic of the loop.

.. however, there is a problem:

4) The moment that a user manuall interacts (checks / unchecks) a checkbox, the loop will succesfully loop over the array but the "(setf (checkedp (..)) t) stops working. The array is full, the loop loops over the array, i can get the array length, but simple user interaction disables the ability of the loop to change the state of the check box.  I cannot figure why this is happening with the IF operator.
5) Here is a video demonstration of the issue:

 https://github.com/user-attachments/assets/219efb61-36fc-4cfd-8623-3b898a02cd80

 6) QUESTION: The button can (setf (checkedp ...)) just fine in the loop UNTIL the user interacts with the checkbox.  After the interaction, the loop still iterates over the array but the setf no longer seems to be able to act on the item in the array.

Any suggestions as to why this might be happening?


