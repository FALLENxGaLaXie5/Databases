select MOD_MANUFACTURER, MOD_NAME, "Josh" as 'Query Executor', now() as 'Query Date'
from model
order by MOD_MANUFACTURER asc;