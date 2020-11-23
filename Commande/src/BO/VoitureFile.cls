Class BO.VoitureFile Extends Ens.BusinessOperation
{

Property Adapter As EnsLib.File.OutboundAdapter;

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method getFileVoiture(pRequest As msg.pushVoitureFileDmde, Output pResponse As msg.pushVoitureFileRpse) As %Status
{
    set pResponse = ##class(msg.suppVoitureRpse).%New()
    Set stream=##class(%FileBinaryStream).%New()
    do stream.Write(pRequest.voiture.marque_";"_pRequest.voiture.modele_";"_pRequest.voiture.categorie_";"_pRequest.voiture.plaque_";"_pRequest.voiture.couleur_";"_pRequest.voiture.nbPlaces)
    set ..Adapter.FilePath = "/tmp/"
    set tsc = ..Adapter.PutStream("fichierVoiture"_$TR($TR($ZDT($ZDTH($ZTS,-3),3,9),":/-","")," ","_")_".csv", stream)

    if tsc{
        set pResponse.codeRetour = "OK"
    } else {
        set pResponse.codeRetour = "KO"
    }
    
    
    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.pushVoitureFileDmde">
        <Method>getFileVoiture</Method>
    </MapItem>
</MapItems>
}

}
