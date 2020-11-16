Class BS.ServiceFichierVoitureCommande Extends Ens.BusinessService
{

Property Adapter As EnsLib.File.InboundAdapter;

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Method OnProcessInput(pInput As %File, pOutput As %RegisteredObject) As %Status
{

    set line = pInput.ReadLine()

    set msg = ##class(msg.creerVoitureCommandeDmde).%New()
    set msg.voiture.marque = $PIECE(line,";",1)
    set msg.voiture.modele = $PIECE(line,";",2)
    set msg.voiture.categorie = $PIECE(line,";",3)
    set msg.voiture.plaque = $PIECE(line,";",4)
    set msg.voiture.couleur = $PIECE(line,";",5)
    set msg.voiture.nbPlaces = $PIECE(line,";",6)

    do ..SendRequestSync("CommandeVoiture",msg, .response)

    Return $$$OK
}

}
