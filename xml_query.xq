<result>
{

for $serie in doc("data.xml")//Series
where max($serie/obs/@TIME_PERIOD) - min($serie/obs/@TIME_PERIOD) >= $years  <!-- NO FUNCIONA -->
return <serie>
 <freq>{ doc("metadata.xml")/metadata/cl_freqs/cl_freq[@id = $serie/@FREQ.282]/text() }</freq>



 <values>
 { for $obs in $serie/Obs
   return
  	<item>
		<obs_status>{ doc("metadata.xml")/metadata/cl_obs_status[@id = $serie/@OBS_STATUS]/text() }</obs_status>
		<obs>{ $serie/@OBS_VALUE }</obs>
	</item>
}
 </values>

</serie>

}
