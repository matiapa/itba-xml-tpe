(: Mínima cantidad de años necesaria a tener en registro para el levantamiento de la información del nodo :)
declare variable $years as xs:integer external;

(: Función auxiliar 'rightTimeFormat'
Valida que TIME_PERIOD se encuentre en un formato que nuestro programa procese :)

declare function local:rightTimeFormat($serie as node()) as xs:boolean {
	let $freq := string($serie/@FREQ.282)
	return $freq="A" or $freq="Q"
};

(: Función auxiliar 'yearToInt'
El formato para TIME_PERIOD puede ser anual o con una especificación por cuatrimestres.
En el último caso se toma el número de cuatrimestre como parte decimal para la precisión del cálculo de años intermedios más adelante :)
declare function local:yearToInt($period as xs:string?) as xs:decimal? {
	let $anos := xs:int(substring($period, 1, 4))
	let $interval := if (string-length($period) = 4) then 0 else xs:int(substring-after($period, 'Q'))
	return $anos+0.1*$interval
};

(: ################################################################################################################################## :)
let $data := doc("data.xml")//DataSet
return
if (count($data//*)=0) then 
	(error(xs:QName("ERROR"), "No data found"))
else
<result>{
	for $serie in doc("data_empty.xml")//Series
	where local:rightTimeFormat($serie) and (max($serie/Obs/local:yearToInt(@TIME_PERIOD)) - min($serie/Obs/local:yearToInt(@TIME_PERIOD)) >= $years)
	order by doc("metadata.xml")/metadata/cl_areas/cl_area[@id = $serie/@REF_AREA.282]/text()
	return
    	<serie>
        	<freq>{ doc("metadata.xml")/metadata/cl_freqs/cl_freq[@id = $serie/@FREQ.282]/text() }</freq>
		<activity>{ doc("metadata.xml")/metadata/cl_activities/cl_activity[@id = $serie/@ACTIVITY.282]/text()}</activity>
		<area>{ doc("metadata.xml")/metadata/cl_areas/cl_area[@id = $serie/@REF_AREA.282]/text() }</area>
		<values>{
			for $obs in $serie/Obs
			order by $obs/@TIME_PERIOD
			return
				<item TIME_PERIOD="{$obs/@TIME_PERIOD}">
					<obs_status>{ doc("metadata.xml")/metadata/cl_obs_statuses/cl_obs_status[@id = $obs/@OBS_STATUS]/text() }</obs_status>
					<obs>{ string($obs/@OBS_VALUE) }</obs>
				</item>
		}</values>
    	</serie>
}</result>

