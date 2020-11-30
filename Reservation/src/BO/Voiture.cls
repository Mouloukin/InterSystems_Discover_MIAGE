Class BO.Voiture Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method creerVoiture(pRequest As msg.creerVoitureDmde, Output pResponse As msg.creerVoitureRpse) As %Status
{
    
    set pResponse = ##class(msg.creerVoitureRpse).%New()
    set voiture = ##class(data.Voiture).%New()
    set voiture.nom = pRequest.nom
    set voiture.categorie = pRequest.categorie
    set voiture.plaque = pRequest.plaque
    set tsc = voiture.%Save()

    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

Method suppVoiture(pRequest As msg.suppVoitureDmde, Output pResponse As msg.suppVoitureRpse) As %Status
{
    set pResponse = ##class(msg.suppVoitureRpse).%New()
    set voiture = ##class(data.Voiture).consulterParPlaqueExists(pRequest.plaque, .id)
    if voiture = 1{
        set tsc = ##class(data.Voiture).%DeleteId(id)
        set pResponse.codeRetour = "OK"
    } else {
        set pResponse.codeRetour = "KO"
    }

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
