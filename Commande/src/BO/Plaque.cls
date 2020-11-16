Class BO.Plaque Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method generationPlaque(pRequest As msg.generationPlaqueDmde, Output pResponse As msg.generationPlaqueRpse) As %Status
{
    set pResponse = ##class(msg.generationPlaqueRpse).%New()
    set pResponse.codeRetour = "OK"
    
    set plaqueEnCours = ^plaque

    set debut = $PIECE(plaqueEnCours,"-",1)
    set numero = $PIECE(plaqueEnCours,"-",2)
    set fin = $PIECE(plaqueEnCours,"-",3)

    set numero = numero + 1

    if numero = 1000 {
        set numero = 1
        //Augmenter les lettres au bout
        if ($EXTRACT(fin,2,2) = "Z"){
            if ($EXTRACT(fin,1,1) = "Z"){
                if ($EXTRACT(debut,2,2) = "Z"){
                   if ($EXTRACT(debut,1,1) = "Z"){
                       set pResponse.codeRetour = "KO"
                       set pResponse.libErreur = "Plus de plaque disponible"
                   } 
                   else{
                       set fin = "AA"
                       set debut = $CHAR($ASCII($EXTRACT(debut,1,1))+1)_"A"
                   }
                }
                else{
                    set fin = "AA"
                    set debut = $EXTRACT(debut,1,1)_$CHAR($ASCII($EXTRACT(debut,2,2))+1)
                }
            }
            else{
                set fin = $CHAR($ASCII($EXTRACT(fin,1,1))+1)_"A"
            }
        }
        else{
            set fin = $EXTRACT(fin,1,1)_$CHAR($ASCII($EXTRACT(fin,2,2))+1)
        }
    }

    set ^plaque = debut_"-"_$REPLACE($JUSTIFY(numero,3)," ","0")_"-"_fin

    set pResponse.plaque = ^plaque
    Return $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.generationPlaqueDmde">
        <Method>generationPlaque</Method>
    </MapItem>
</MapItems>
}

}
