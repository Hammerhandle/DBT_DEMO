with bike as (
    select
		RIDE_ID,
		replace(STARTED_AT,'"','') as started_at,
		replace(ENDED_AT,'"','') as ended_at,
		START_STATION_NAME,
		START_STATIO_ID,
		END_STATION_NAME,
		END_STATION_ID,
		START_LAT,
		START_LNG,
		END_LAT,
		END_LNG,
		MEMBER_CSUAL
    from {{source('demo','bike')}}
    where ride_id != 'bikeid'
)
select  * from bike