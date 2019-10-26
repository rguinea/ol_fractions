# Prerequisites
Having `ruby` installed.
Note: I used version 2.3.7. 

# How to run

1. Clone the repo by doing by clicking `clone` on the button above or run `git@github.com:rguinea/ol_fractions.git` in your console
2. Open up your favorite terminal and navigate to the project directory
3. There are two files you can run:
    - `main.rb`
    - `test.rb`
Both are run with the command `ruby [filename]`.

#### Main
If you run the `main.rb` file, a program will indefinetly ask you for a fraction operation to be ran. The format in which you need to input the fractions is: 

`> fraction1 operation fraction2`

`fraction1` and `fraction2` are fractions with the following format
`[(whole_part)_](numerator)/(denominator)`

All three `whole_part`, `numerator` and `denominator` must be integers.

`operation` must be one of the following: `+`,`-`,`*`,`/`

#### Test
The test file will a set of tests predefined. Fell free to add your own assertions on the `test.rb` file if you want to test some more edge cases. 
