# LEL 09 March 2025: added "time" and long versions of dates

date insert: insert(user.time_format("%Y-%m-%d"))
date insert long: insert(user.time_format("%d %B %Y"))
date insert smash: insert(user.time_format("%Y%m%d"))
date insert long UTC: insert(user.time_format_utc("%d %B %Y"))
date insert UTC: insert(user.time_format_utc("%Y-%m-%d"))
date insert smash UTC: insert(user.time_format_utc("%Y%m%d"))

(timestamp | datetime) insert: insert(user.time_format("%Y-%m-%d %H:%M:%S"))
(timestamp | datetime) insert high (resolution | res): insert(user.time_format("%Y-%m-%d %H:%M:%S.%f"))
(timestamp | datetime) insert UTC: insert(user.time_format_utc("%Y-%m-%d %H:%M:%S"))
(timestamp | datetime) insert high (resolution | res) UTC: insert(user.time_format_utc("%Y-%m-%d %H:%M:%S.%f"))

time insert: insert(user.time_format("%H:%M:%S"))
time insert UTC: insert(user.time_format_utc("%H:%M:%S"))
time insert high (resolution | res): insert(user.time_format("%H:%M:%S.%f"))
time insert high (resolution | res) UTC: insert(user.time_format_utc("%H:%M:%S.%f"))