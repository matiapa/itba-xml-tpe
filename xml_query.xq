<result>
{

for $serie in doc("data.xml")//series
where max($serie/obs/@TIME_PERIOD) - min($serie/obs/@TIME_PERIOD) >= $years  <!-- NO FUNCIONA -->
return <serie>
 <freq>{ doc("metadata.xml")/metadata/cl_freqs/cl_freq[@id = $serie/@FREQ.282]/text() }</freq>
<activity>{ doc("metadata.xml")/metadata/cl_activities/cl_activity[@id = $serie/@ACTIVITY.282]/text()}</activity>
<area>{ doc("metadata.xml")/metadata/cl_areas/cl_area[@id = $serie/@REF_AREA.282]/text() }</area>



</serie>

}
