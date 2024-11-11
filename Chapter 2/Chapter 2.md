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

**Exercises**

1.  Top Base Stealers in the Hall of Fame
    a.  See C2.R for coding portions of this exercise\
    b.  
    c.  
    d.  
    e.  ![](images/clipboard-2653578909.png)\
        There are three data points that stand out on this graph. The uppermost data point, which corresponds to Max Carey, has a higher base stealing success rate than the other players assessed. The rightmost point, which corresponds to Rickey Henderson, has far more stolen bases per game than any of the other players. This makes sense given his high stolen base count. Finally, the lowest point on the chart corresponds to Lou Brock, who had the lowest success rate on steals compared to the other players.\
2.  Character, Factor, and Logical Variables in R\
    a.  
    b.  
    c.  The outputs differ in the order the variables are listed. The first output is in alphabetical order (Double, Out, Single, Walk) and the second output is in the order we specified (Out, Walk, Single, Double), i.e. quality of outcome.\
    d.  The first statement - [outcomes == "Walk"]{.underline} - is a logical comparison that is tested on every value in the outcomes vector. It outputs a vector of boolean values that are the result of the comparison on each value.\
        \
        The second statement - [sum(outcomes == "Walk")]{.underline} - uses the first expression as the input to a sum function. In this case, the sum function counts all "TRUE" values in the vector. More generally, it counts the number of plate appearances that resulted in a walk. Its output is 1.\
3.  Pitchers in the 350-Wins Club\
    1.  
