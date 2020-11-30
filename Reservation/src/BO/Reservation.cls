Class BO.Reservation Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method getAvailablesVoitures(pRequest As msg.getAvailableVoitureDmde, Output pResponse As msg.getAvailableVoitureRpse) As %Status
{
    set pResponse = ##class(msg.getAvailableVoitureRpse).%New()

    set sql = "select plaque from data.Voiture where categorie = '"_pRequest.categorie_"' and plaque not in ("
    set sql = sql_" SELECT voiture->plaque FROM data.Reservation where voiture->categorie = '"_pRequest.categorie_"'"
    set sql = sql_" and ((startDate >= '"_pRequest.startDate_"' and startDate <= '"_pRequest.endDate_"' ) "
    set sql = sql_" or (endDate >= '"_pRequest.startDate_"' and endDate <= '"_pRequest.endDate_"' ) "
    set sql = sql_" or (startDate <= '"_pRequest.startDate_"' and endDate >= '"_pRequest.endDate_"' ) "
    set sql = sql_" or (startDate >= '"_pRequest.startDate_"' and endDate <= '"_pRequest.endDate_"' )) "
    set sql = sql_" ) "

    $$$TRACE(sql)

    set statement=##class(%SQL.Statement).%New() 
	do statement.%Prepare(sql)
	set SQLrequest = statement.%Execute()
    do SQLrequest.%Next()
    set plaque = SQLrequest.%Get("plaque")

    $$$TRACE(plaque)

    set pResponse.plaque = plaque
    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.getAvailableVoitureDmde">
        <Method>getAvailablesVoitures</Method>
    </MapItem>
</MapItems>
}

}
