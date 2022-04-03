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
val dates_in_jan = dates_in_month([(2022, 1, 31), (2022, 1, 1), (2022, 2, 1)], 1) = [31, 1]
val dates_in_feb = dates_in_month([(2022, 2, 14), (2022, 1, 1), (2022, 2, 1)], 2) = [14, 1]

(* Q5 *)
val dates_in_winter = dates_in_months([(2022, 11, 21), (2022, 12, 22), (2023, 1, 23), (2022, 7, 1)], [11, 12, 1]) = [21, 22, 23];
val dates_in_summer = dates_in_months([(2022, 6, 21), (2022, 12, 22), (2023, 1, 23), (2022, 7, 1)], [6, 7]) = [21, 1];

(* Q6 *)
val hello = get_nth(["hello", "world"], 1) = "hello"
val world = get_nth(["hello", "world"], 2) = "world"
