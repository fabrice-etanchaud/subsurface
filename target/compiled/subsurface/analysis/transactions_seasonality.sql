select
    date_part('month', transaction_date) as month_number
    ,to_char(transaction_date, 'MON') as month_label
    ,transfer_label
    ,count(*) as transactions_count
from
    "@fab4"."f_land_values"
group by
    1, 2, 3
order by
    3, 1