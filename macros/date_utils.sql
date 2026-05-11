{% macro function1(x) %}
case when to_timestamp({{x}}) < current_date then 'past' else 'future' end 
{% endmacro %}

{% macro get_season(started_at) %}
case
    when month(to_timestamp(started_at)) in (12,1,2) then 'winter'
    when month(to_timestamp(started_at)) in (3,4,5) then 'spring'
    when month(to_timestamp(started_at)) in (6,7,8) then 'summer'
    else 'autumn'
end
{% endmacro %}