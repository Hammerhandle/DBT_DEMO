with cte as (
    select
        to_timestamp(started_at),
        date(to_timestamp(started_at)) as date_started_at,
        hour(to_timestamp(started_at)) as hour_started_at,
        dayname(to_timestamp(started_at)) as dayofweek,
        case when dayofweek in ('Sat','Sun') then 'weekend' else 'businessday' end as day_type,
        {{get_season(started_at)}} as season_of_year

    from
        {{ ref('stage_bike') }}
    where
        started_at != 'started_at'    
)

-- CTE2 as (
-- stuff from CTE
-- ),
-- CTE3 as (
-- stuff from CTE2
-- ),
select *
from cte