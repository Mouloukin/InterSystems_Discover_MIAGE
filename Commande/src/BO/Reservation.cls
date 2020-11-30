Class BO.Reservation Extends EnsLib.REST.Operation
{

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method creerVoitureReservation(pRequest As msg.creerReservationDmde, Output pResponse As msg.creerReservationRpse) As %Status
{
    
    set pResponse = ##class(msg.creerReservationRpse).%New()
    set httpRequest = ##class(%Net.HttpRequest).%New()
    do ..ObjectToJSONStream(pRequest, .EntityBody)
    set httpRequest.EntityBody = EntityBody

    set tsc = ..Adapter.SendFormDataArray(.httpResponse, "POST", httpRequest)

    do ..JSONStreamToObject(httpResponse.Data,.pResponse,"msg.creerReservationRpse",1)

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.creerReservationDmde">
        <Method>creerVoitureReservation</Method>
    </MapItem>
</MapItems>
}

}
