fun is_older (d1: int * int * int, d2: int * int * int) = 
    if (#1 d1) < (#1 d2)
    then true
    else if (#2 d1) < (#2 d2) andalso (#1 d1) <= (#1 d2)
    then true
    else if (#3 d1) < (#3 d2) andalso (#1 d1) <= (#1 d2)
    then true
    else false

fun is_older_2 (date1 : int * int * int, date2 : int * int * int) =
    let 
        val y1 = #1 date1
        val m1 = #2 date1
        val d1 = #3 date1
        val y2 = #1 date2
        val m2 = #2 date2
        val d2 = #3 date2
    in
        y1 < y2 orelse (y1=y2 andalso m1 < m2)
                orelse (y1=y2 andalso m1=m2 andalso d1 < d2)
    end 

fun number_in_month (dates: (int * int * int) list, month: int ) = 
    if null dates
    then 0
    else if (#2 (hd dates)) = month
    then 1 + number_in_month(tl dates, month)
    else 0 + number_in_month(tl dates, month)

fun number_in_months (dates: (int * int * int) list, months: int list ) =
    if null dates orelse null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month (dates: (int * int * int) list, month: int ) = 
    if null dates
    then []
    else 
        let 
            val tl_months = dates_in_month(tl dates, month)
        in 
            if #2 (hd dates) = month
            then (hd dates)::tl_months
            else tl_months
        end

fun dates_in_months (dates: (int * int * int) list, month: int list ) = 
    if null dates orelse null month
    then []
    else dates_in_month(dates, hd month) @ dates_in_months(dates, tl month)

fun get_nth (xs: string list, n: int) = 
    if n = 1
    then hd xs
    else get_nth(tl xs, n - 1)

fun date_to_string (date: int * int * int) = 
    let 
        val months = ["January", "February", "March", "April",
"May", "June", "July", "August", "September", "October", "November", "December"]
    in 
        let
            val idx = (#2 date)
        in
            get_nth(months, idx)^" "^Int.toString(#3 date)^", "^Int.toString(#1 date)
        end
    end

fun number_before_reaching_sum (sum: int, xs: int list) = 
    let 
        fun find_index(sum: int, xs: int list, idx: int) = 
            if null xs
            then idx
            else if sum - (hd xs) <= 0
            then idx
            else find_index(sum - (hd xs), tl xs, idx + 1)
    in 
        find_index(sum, xs, 0)
    end

fun number_before_reaching_sum_2 (sum : int, lst : int list) =
    if sum <= hd lst
    then 0
    else 1 + number_before_reaching_sum(sum - hd lst, tl lst)

fun what_month (day: int) = 
    let 
        val days_of_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in 
        number_before_reaching_sum(day, days_of_months) + 1
    end

fun month_range (d1: int, d2: int) = 
    (* instead of evaluating d1 and d2, decrement d2 until less than d1 *)
    if d1 > d2
    then []
    else month_range(d1, d2 - 1) @ what_month(d2)::[]

fun month_range_2 (day1 : int, day2 : int) =
    if day1 > day2
    then []
    else what_month day1 :: month_range(day1 + 1, day2)

fun oldest (dates: (int * int * int) list) = 
    if null dates
    then NONE
    else 
        let
          fun no_empty_dates(xs: (int * int * int) list) = 
            if null (tl xs) 
            then hd xs
            else 
                let
                  val tl_ans = no_empty_dates(tl xs)
                in
                (* xs is not empty, has at least two *)
                  if is_older(hd xs, hd (tl xs))
                  then hd xs
                  else tl_ans
                end
        in
          SOME (no_empty_dates(dates))
        end
