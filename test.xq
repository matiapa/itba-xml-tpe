declare variable $years as xs:integer external;

declare function local:toYear($period as xs:string?) as xs:decimal? {
	let $anos := xs:int(substring($period, 1, 4))
	let $interval := if (string-length($period) = 4) then 0 else xs:int(substring-after($period, 'Q'))
	return $anos+0.1*$interval
};

<result>
	{
	for $serie in doc("data.xml")//Series
	return <a>{max($serie/Obs/local:toYear(@TIME_PERIOD))}</a>
	}
</result>



