**Chapter 2: Introduction to R**

This chapter is a general introduction to the R environment.

**Notes**

Core principles of the Tidyverse:

-   Rows in a data frame should correspond to the same observational unit

-   Columns should represent variables about an observational unit

-   A tidy data frame would not contain:

    -   A "totals" row

    -   Labels for the rows stored as row names instead of variables

    -   Two columns that contain the same type of information about the same observational unit

-   Most packages use data frames (data.frame), but this book prefers tibble, a similar object with additional functionality

Important Tidyverse packages:

-   dplyr Package

    -   Comprehensive package for data manipulation

    -   Five key "verbs":

        -   select(): choose a subset of the columns

        -   filter(): choose a subset of the rows based on logical criteria

        -   arrange(): sort the rows based on the values of columns

        -   mutate(): add or modify the definition of a column

        -   summarize(): collapse a data frame down to a single row (per group) by aggregating vectors into single values. Often used in conjunction with group_by().

    -   Other functions:

        -   inner_join(), left_join(), etc: merge two data frames by matching corresponding values

        -   rename()

        -   count()

        -   bind_rows()

        -   pull()

-   ggplot2

    -   Graphics package with a consistent syntax

    -   Uses the + operator to combine elements

-   tidyr

    -   Additional data manipulation operations

-   readr

    -   Data import

-   purrr

    -   Iteration

-   stringr

    -   For working with text

-   lubridate

    -   For working with dates

-   forcats

    -   For working with factors

The pipe operator

-   The pipe operator: "\|\>"

-   Allows you to create pipelines of functions. Meant to be easier to read than nested functions

-   Takes what comes before it and inserts it as the first argument into the next function

    -   The following two lines are equivalent:

        -   outer_function(inner_function(x), y)

        -   x \|\> inner_function() \|\> outer_function(y)

-   Note: The "\|\>" operator replaced the legacy "%\>%" operator
