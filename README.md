# doWhileDo


**doWhileDo** is a Swift micro-library that provides do-while-do and do-until-do loops.

The do-while-do design pattern is a variation of the while loop that executes a block of statements at least once before checking a condition. It can be useful in situations where you want to ensure that a block of statements is executed at least once, even if the condition is false from the start.

One situation where the do-while-do design pattern might be useful is when you want to repeatedly perform an operation until a certain condition is met, but you need to perform some setup or initialization before the condition can be checked.

For example, you might use a do-while-do loop to read lines from a file until you reach the end of the file, with the first block of statements reading a line from the file and the second block of statements checking if the end of the file has been reached.

Another example might be when you want to repeatedly prompt the user for input until they enter a valid response. In this case, the first block of statements might display a prompt and read the user's input, while the second block of statements checks if the input is valid.