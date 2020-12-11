# Day10 Planning

## Day 10 Part 2

### Example 1

chain:     [1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 19]
distances: [1, 3, 1, 1, 1,  3,  1,  1,  3,  1,  3]

### Example 2

chain:     [1, 2, 3, 4, 7, 8, 9, 10, 11, 14, 17, 18, 19, 20, 23, 24, 25, 28, 31, 32,
33, 34, 35, 38, 39, 42, 45, 46, 47, 48, 49]
distances: [1, 1, 1, 1, 3, 1, 1,  1,  1,  3,  3,  1,  1,  1,  3,  1,  1,  3,  3,  1,
 1,  1,  1,  3,  1,  3,  3,  1,  1,  1,  1]

#### Looking forward?

Conditions for possible removal:

1. The n+2 number is < 3 away

#### Looking backward?

Conditions for possible removal:

##### Distance is 3

1. n[-1] == 1
2. n[-2] + n[-1] == 2

##### Distance is 2

1. n[-1] == 1

#### Shortest possible chain?

Create the shortest possible chain, is it then n! where n is the number of missing elements?
