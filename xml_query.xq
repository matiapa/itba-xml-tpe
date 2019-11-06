<result>
{

for $serie in doc("data.xml")//series
where max($serie/obs/@TIME_PERIOD) - min($serie/obs/@TIME_PERIOD) >= $years  <!-- NO FUNCIONA -->
return <serie>
 <freq>{ doc("metadata.xml")/metadata/cl_freqs/cl_freq[@id = $serie/@FREQ.282]/text() }</freq>




</serie>

}
