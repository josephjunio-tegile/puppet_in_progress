# IFClient::SnapshotSchedule_V2_1

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**schedule_id** | **Integer** | Schedule ID, read-only. | [optional] 
**retention_period** | **Integer** | Maximum period to retain snapshots Schedule Interval Type | Retention Period Unit     Minutes             | Days     Hourly              | Days     Daily               | Weeks     Weekly              | Months     Monthly             | Years  | [optional] 
**schedule_interval_type** | **String** | Type of schedule interval, possible values are  Minute, Hour, Day, Week, Month  | [optional] 
**repeat_interval** | **Integer** | How often the schedule should recur    Schedule Interval Type | Retention Interval      Minutes             | in Minutes      Hourly              | in Hours      Daily               | in Days      Weekly              | in Weeks      Monthly             | in Months  | [optional] 
**start_date** | **String** | Start Date for scheduling a snapshot in future. Should be specified in YYYY-MM-DD format. Start date can be either current date or a date in future.  | [optional] 
**start_time** | **String** | FIXME--- check Date format Start time for the schedule, should be in 24HR HH:MM format. The date can not be a past date.  | [optional] 
**end_time** | **String** | End time for the schedule, should be in 24HR HH:MM format. This is applicable only for Minutes and Hourly Schedule  interval types.  | [optional] 
**days_of_week** | **String** | Days of the Week This is for the Weekly Schedule interval types Should be specified in comma-separated numbers and each number specifying day of the week.  Sunday:1, Monday:2, Tuesday:3 and so on.  E.g   For Weekdays Only      : 2,3,4,5,6   For Weekend Only       : 1,7   For Mon-Wednesday only : 2,4  | [optional] 
**day_of_month** | **Integer** | Day of the Month This is for the Monthly Schedule interval types and the value indicates the date of each month when the schedule should be run.  If the specified date does not exist in the next month, the job will  not run and will be scheduled to next month, depending on the repeat  interval specified. E.g, Not each month has 31st, so the job will be skipped for those  months.  Either this field or weekdayOfMonth can be specified, not both  | [optional] 
**weekday_of_month** | **String** | Weekday of the Month, should be in W:D format. This is for the Monthly Schedule interval types. Sunday:1, Monday:2, Tuesday:3 and so on. E.g.   2nd Monday of the Month   : 2:2  4th Thursday of the Month : 4:5  This field could also contain the value \&quot;LAST\&quot; to indicate for  the job to run on last day of the month.  Either this field or the dayOfWeek can be specified, not both  | [optional] 
**dataset_path** | **String** | Dataset path, can be a a project, LUN or a share Should not be a replica dataset.  | [optional] 
**quiesce** | **String** | Quiesce \&quot;on\&quot; or \&quot;off\&quot; | [optional] 


