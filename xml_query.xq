declare variable $years as xs:integer external;

declare function local:toYear($var as xs:string?, xs:int) {
	if string-length($var)=4
		return $var
	let $anos := substring-befor($var, '-');
	let $interval := substring-after($var, '-');
	return $anos+0.1*$interval
}

<result>
	{
	for $serie in doc("data_short.xml")//Series
	where max(toYear($serie/Obs/@TIME_PERIOD)) - min(toYear($serie/Obs/@TIME_PERIOD)) >= $years
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



