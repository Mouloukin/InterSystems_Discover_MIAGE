Class BO.SortirVoitureReservation Extends EnsLib.REST.Operation
{

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method sortirVoitureParcReservation(pRequest As msg.sortirVoitureParcReservationDmde, Output pResponse As msg.sortirVoitureParcReservationRpse) As %Status
{
    
    set pResponse = ##class(msg.sortirVoitureParcReservationDmde).%New()
    set httpRequest = ##class(%Net.HttpRequest).%New()
    do ..ObjectToJSONStream(pRequest, .EntityBody)
    set httpRequest.EntityBody = EntityBody

    set tsc = ..Adapter.SendFormDataArray(.httpResponse, "POST", httpRequest)

    do ..JSONStreamToObject(httpResponse.Data,.pResponse,"msg.sortirVoitureParcReservationRpse",1)

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.sortirVoitureParcReservationDmde">
        <Method>sortirVoitureParcReservation</Method>
    </MapItem>
</MapItems>
}

}
