Class BO.Catalogue Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method getCatalogue(pRequest As msg.getCatalogueDmde, Output pResponse As msg.getCatalogueRpse) As %Status
{

    set pResponse = ##class(msg.getCatalogueRpse).%New()
    
    set sql = "select marque, modele, type , nbPlaces , prix from data.Catalogue"

    set statement=##class(%SQL.Statement).%New() 
	do statement.%Prepare(sql)
	set SQLrequest = statement.%Execute()
    While SQLrequest.%Next(){
        set item = ##class(webObjet.wsCatalogue).%New()
        set item.marque = SQLrequest.%Get("marque")
        set item.type = SQLrequest.%Get("type")
        set item.modele = SQLrequest.%Get("modele")
        set item.nbPlaces = SQLrequest.%Get("nbPlaces")
        set item.prix = SQLrequest.%Get("prix")
        do pResponse.catalogue.Insert(item)
    }
    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

Method ajouterVoitureCatalogue(pRequest As msg.ajouterVoitureCatalogueDmde, Output pResponse As msg.ajouterVoitureCatalogueRpse) As %Status
{

    set pResponse = ##class(msg.ajouterVoitureCatalogueRpse).%New()
    
    set voiture = ##class(data.Catalogue).%New()
    do ##class(Transform.WsCatalogueToCatalogue).Transform(pRequest.voiture,.voiture)
    set tsc = voiture.%Save()

    set pResponse.codeRetour = tsc

    Quit $$$OK
}

Method consulterVoitureCatalogue(pRequest As msg.consulterVoitureCatalogueDmde, Output pResponse As msg.consulterVoitureCatalogueRpse) As %Status
{

    set pResponse = ##class(msg.consulterVoitureCatalogueRpse).%New()
    if (##class(data.Catalogue).consulterParMarqueModeleExists(pRequest.marque, pRequest.modele, .idCatalogue)){
        set catalogue = ##class(data.Catalogue).%OpenId(idCatalogue)
        do ##class(Transform.CatalogueToWsCatalogue).Transform(catalogue,.wsCatalogue)
        set pResponse.voiture = wsCatalogue
        set pResponse.codeRetour = "OK" 
    }
    else {
        set pResponse.codeRetour = "KO"
        set pResponse.libErreur = "Voiture inexistante au catalogue"

    }
    Quit $$$OK
}

ClassMethod ajouterVoitureCatalogueInit(pRequest As msg.ajouterVoitureCatalogueDmde, Output pResponse As msg.ajouterVoitureCatalogueRpse) As %Status
{

    set pResponse = ##class(msg.ajouterVoitureCatalogueRpse).%New()
    
    set voiture = ##class(data.Catalogue).%New()
    do ##class(Transform.WsCatalogueToCatalogue).Transform(pRequest.voiture,.voiture)
    set tsc = voiture.%Save()

    set pResponse.codeRetour = tsc

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.getCatalogueDmde">
        <Method>getCatalogue</Method>
    </MapItem>
    <MapItem MessageType="msg.ajouterVoitureCatalogueDmde">
        <Method>ajouterVoitureCatalogue</Method>
    </MapItem>
    <MapItem MessageType="msg.consulterVoitureCatalogueDmde">
        <Method>consulterVoitureCatalogue</Method>
    </MapItem>
</MapItems>
}

}
