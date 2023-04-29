# How to Compile

1. ```main.lex``` is the main file containing the flex code.
2. Run `cd` into the repository, then run `flex main.lex` to generate a `lex.yy.c` file.
3. Run `gcc lex.yy.c` to compile the generated C program to `a.out`

# How to Run

1. All `.easy` testcases are stored in the `testcases` directory.
2. To run, `cd` into the repository, then run `./a.out < path_to_file`, where `path_to_file` is the path to the target `.easy` file.
3. For example, to pass the `reserved_test.easy` file as input to the generated lexer program, run the following command:
    ```
    ./a.out < testcases/reserved_test.easy
    ```

# Expected Output
Passing the `reserved_test.easy` file to the generated lexer program will yield the following output (showing first 30 lines)
```
Line 6:       Identifier               middle
              Math Operator            =
              Numerical Literal        2
Line 8:       Reserved Word            go
              Reserved Word            to
              Identifier               jmp_point
Line 10:      Reserved Word            exit
Line 12:      Reserved Word            if
              Reserved Word            true
              Reserved Word            then
```

# Interpreting the output
Each captured token in the source code input file corresponds to a row in the output of the generated lexer program, where each row contains 3 columns:

1. Line Number
   - This shows what line in the source code input file the captured token was encountered.
   - For rows where the line number is blank, this means that the token was encountered in the same line of the source code input file on the row above. For example, in the output snippet in the 'Expected Output' section, the first 3 token captured by the lexer are encountered on line 6 of the input file.
2. Token Classification
    - This shows the token classification of the captured token.
    - All types of classification are shown below:
        - String Literal
        - Reserved Word
        - Separator
        - Comparison Operator
        - Math Operator
        - Logical Operator
        - Identifier
        - Numerical Literal
3. Token
   - This displays the actual captured token.