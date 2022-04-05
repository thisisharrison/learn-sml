use "section1/assignment/hw1.sml";

(* Q1 *)
val month_older = is_older((2022, 1, 1), (2022, 2, 1)) = true;
val date_older = is_older((2022, 1, 1), (2022, 1, 31)) = true;
val year_older = is_older((2022, 1, 31), (2023, 1, 31)) = true;

(* Q2 *)
val days_in_jan = number_in_month([(2022, 1, 31), (2022, 1, 1), (2022, 2, 1)], 1) = 2;

(* Q3 *)
val days_in_jan_feb = number_in_months([(2022, 1, 31), (2022, 1, 1), (2022, 2, 1)], [1, 2]) = 3;
val days_in_jan_feb_2 = number_in_months([(2022, 1, 31), (2022, 1, 1), (2022, 2, 1), (2022, 2, 2), (2022, 12, 1)], [1, 2]) = 4;

(* Q4 *)
val dates_in_jan = dates_in_month([(2022, 1, 31), (2022, 1, 1), (2022, 2, 1)], 1) = [(2022, 1, 31), (2022, 1, 1)];
val dates_in_feb = dates_in_month([(2022, 2, 14), (2022, 1, 1), (2022, 2, 1)], 2) = [(2022, 2, 14), (2022, 2, 1)];

(* Q5 *)
val dates_in_winter = dates_in_months([(2022, 11, 21), (2022, 12, 22), (2023, 1, 23), (2022, 7, 1)], [11, 12, 1]) = [(2022, 11, 21), (2022, 12, 22), (2023, 1, 23)];
val dates_in_summer = dates_in_months([(2022, 6, 21), (2022, 12, 22), (2023, 1, 23), (2022, 7, 1)], [6, 7]) = [(2022, 6, 21), (2022, 7, 1)];

(* Q6 *)
val hello = get_nth(["hello", "world"], 1) = "hello";
val world = get_nth(["hello", "world"], 2) = "world";

(* Q7 *)
val christmas = date_to_string((2022, 12, 24)) = "December 24, 2022";

(* Q8 *)
val idx_one = number_before_reaching_sum(10, [2, 3, 5, 7, 9]) = 2;
val idx_three = number_before_reaching_sum(20, [2, 3, 5, 7, 9]) = 4;
val idx_four = number_before_reaching_sum(100, [2, 3, 5, 7, 9]) = 5;

(* Q9 *)
val january = what_month(18) = 1;
val october = what_month(280) = 10;

(* Q10 *)
val one_day_till_march = month_range(59,62) = [2,3,3,3];

(* Q11 *)
val graduation = oldest([(2015, 5, 1), (2017, 8, 1), (2019, 6, 1), (2020, 4, 1)]) = SOME (2015, 5, 1);

(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *);

val test1 = is_older ((1,2,3),(2,3,4)) = true;

val test2 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1;

val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3;

val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)];

val test5 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)];

val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there";

val test7 = date_to_string (2013, 6, 1) = "June 1, 2013";

val test8 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3;

val test9 = what_month 70 = 3;

val test10 = month_range (31, 34) = [1,2,2,2];

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31);

