# Coding Challenge

The program accepts as arguments a list of one or more file paths (e.g. `./solution.rb file1.txt file2.txt ...`).
The program also accepts input on stdin (e.g. `cat file1.txt | ./solution.rb`).
The program outputs a list of the 100 most common three word sequences in the text, along with a count of how many times each occurred in the text.

For example:
*   231 - i will not
*   116 - i do not
*   105 - there is no
*   54 - i know not
*   37 - i am not

The program ignores punctuation, line endings, and is case insensitive (e.g. "I love\nsandwiches." should be treated the same as "(I LOVE SANDWICHES!!)")
The program is capable of processing large files and runs as fast as possible.
You should push to GitHub at least three times.


### Solution Strategy:

keywords: Sliding Frame, hash, hash map, sort

  1. Read n, n+1, n+2; while stripping punctuation and line endings
  2.   convert the 3 word string into lowercase/uppercase then hash the string, use hashed string as the key in the collection who's value is an object containing the un-hashed string and an integer representing the number of times this combination of words has appeared.
  3. Then sort the collection (descending order) by the count integer.
  4. Print the first 100 objects in the sorted collection.
