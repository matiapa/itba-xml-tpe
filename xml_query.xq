<result>
	{
	for $serie in doc("data.xml")//Series
	where max($serie/obs/@TIME_PERIOD) - min($serie/obs/@TIME_PERIOD) >= $years  <!-- NO FUNCIONA -->
	return
	<serie>
		<freq>{ doc("metadata.xml")/metadata/cl_freqs/cl_freq[@id = $serie/@FREQ.282]/text() }</freq>
		<activity>{ doc("metadata.xml")/metadata/cl_activities/cl_activity[@id = $serie/@ACTIVITY.282]/text()}</activity>
		<area>{ doc("metadata.xml")/metadata/cl_areas/cl_area[@id = $serie/@REF_AREA.282]/text() }</area>
		<values>
			{
			for $obs in $serie/Obs
		    return
		  	<item>
				<obs_status>{ doc("metadata.xml")/metadata/cl_obs_status[@id = $serie/@OBS_STATUS]/text() }</obs_status>
				<obs>{ $serie/@OBS_VALUE }</obs>
			</item>
			}
		</values>
	</serie>
	}
</result>
