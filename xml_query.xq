declare variable $years as xs:integer external;

declare function local:toYear($var as xs:string?) as xs:integer? {
	let $anos := substring-before($var, '-')
	let $interval := if (string-length($var) = 4) then 0 else substring-after($var, 'Q')
	return int($anos)+0.1*int($interval)
};

<result>
	{
	for $serie in doc("data_short.xml")//Series
	where max($serie/Obs/local:toYear(@TIME_PERIOD)) - min(local:toYear($serie/Obs/@TIME_PERIOD)) >= $years
	return
	<serie>
		<freq>{ doc("metadata.xml")/metadata/cl_freqs/cl_freq[@id = $serie/@FREQ.282]/text() }</freq>
		<activity>{ doc("metadata.xml")/metadata/cl_activities/cl_activity[@id = $serie/@ACTIVITY.282]/text()}</activity>
		<area>{ doc("metadata.xml")/metadata/cl_areas/cl_area[@id = $serie/@REF_AREA.282]/text() }</area>
		<values>
			{
			for $obs in $serie/Obs
			order by $obs/@TIME_PERIOD
		    return
		  	<item TIME_PERIOD="{$obs/@TIME_PERIOD}">
				<obs_status>{ doc("metadata.xml")/metadata/cl_obs_statuses/cl_obs_status[@id = $obs/@OBS_STATUS]/text() }</obs_status>
				<obs>{ string($obs/@OBS_VALUE) }</obs>
			</item>
			}
		</values>
	</serie>
	}
</result>



