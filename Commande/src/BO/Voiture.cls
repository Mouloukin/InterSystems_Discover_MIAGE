Class BO.Voiture Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method creerVoiture(pRequest As msg.creerVoitureDmde, Output pResponse As msg.creerVoitureRpse) As %Status
{
    
    set pResponse = ##class(msg.creerVoitureRpse).%New()
    set voiture = ##class(data.Voiture).%New()
    do ##class(Transform.WsVoitureToVoiture).Transform(pRequest.voiture,.voiture)
    set tsc = voiture.%Save()

    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

Method suppVoiture(pRequest As msg.suppVoitureDmde, Output pResponse As msg.suppVoitureRpse) As %Status
{
    set pResponse = ##class(msg.suppVoitureRpse).%New()
    set plaque = pRequest.plaque
    set voiture = ##class(data.Voiture).consulterParPlaqueExists(plaque, .id)
    if voiture = 1{
        set tsc = ##class(data.Voiture).%DeleteId(id)
        $$$TRACE(tsc)
        set pResponse.codeRetour = "OK"
    } else {
        set pResponse.codeRetour = "KO"
    }
    //##class(data.Voiture).%DeleteID(id)

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.creerVoitureDmde">
        <Method>creerVoiture</Method>
    </MapItem>
     <MapItem MessageType="msg.suppVoitureDmde">
        <Method>suppVoiture</Method>
    </MapItem>
</MapItems>
}

}
