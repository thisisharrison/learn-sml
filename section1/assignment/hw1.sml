fun is_older (d1: int * int * int, d2: int * int * int) = 
    if (#1 d1) < (#1 d2)
    then true
    else if (#2 d1) < (#2 d2)
    then true
    else if (#3 d1) < (#3 d2)
    then true
    else false

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
            then (#3 (hd dates))::tl_months
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
