Class BO.Reservation Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method getAvailablesVoitures(pRequest As msg.getAvailableVoitureDmde, Output pResponse As msg.getAvailableVoitureRpse) As %Status
{
    set pResponse = ##class(msg.getAvailableVoitureRpse).%New()

    set sql = "select nom, categorie, plaque from data.Voiture where categorie = '"_pRequest.categorie_"' and plaque not in ("
    set sql = sql_" SELECT voiture->plaque FROM data.Reservation where voiture->categorie = '"_pRequest.categorie_"'"
    set sql = sql_" and ((startDate >= '"_pRequest.startDate_"' and startDate <= '"_pRequest.endDate_"' ) "
    set sql = sql_" or (endDate >= '"_pRequest.startDate_"' and endDate <= '"_pRequest.endDate_"' ) "
    set sql = sql_" or (startDate <= '"_pRequest.startDate_"' and endDate >= '"_pRequest.endDate_"' ) "
    set sql = sql_" or (startDate >= '"_pRequest.startDate_"' and endDate <= '"_pRequest.endDate_"' )) "
    set sql = sql_" ) "

    set statement=##class(%SQL.Statement).%New() 
	do statement.%Prepare(sql)
	set SQLrequest = statement.%Execute()
    do SQLrequest.%Next()
    set plaque = SQLrequest.%Get("plaque")

    if $FIND(plaque,"-") = 0 {
        set pResponse.codeRetour = "KO"
        set pResponse.libErreur = "Pas de voiture disponible"
    } else {
        set pResponse.voiture.nom = SQLrequest.%Get("nom")
        set pResponse.voiture.categorie = SQLrequest.%Get("categorie")
        set pResponse.voiture.plaque = plaque
        set pResponse.codeRetour = "OK"
    }

    Quit $$$OK
}

Method creerReservation(pRequest As msg.creerReservationDmde, Output pResponse As msg.creerReservationRpse) As %Status
{
    set pResponse = ##class(msg.getAvailableVoitureRpse).%New()
    set reservation = ##class(data.Reservation).%New()
    //do ##class(Transform.WsVoitureToVoiture).Transform(pRequest.voiture,.voiture)
    do ##class(data.Voiture).consulterParPlaqueExists(pRequest.voiture.plaque, .id)
    set reservation.voiture = ##class(data.Voiture).%OpenId(id)
    set reservation.startDate = pRequest.startDate
    set reservation.endDate = pRequest.endDate

    set tsc = reservation.%Save(0)

    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

Method haveFutureReservation(pRequest As msg.haveFutureReservationDmde, Output pResponse As msg.haveFutureReservationRpse) As %Status
{
    set pResponse = ##class(msg.haveFutureReservationRpse).%New()
    set sql = "select count(*) as nbResa from data.Reservation where voiture->plaque = '"_pRequest.plaque_"' "
    set sql = sql_"and endDate>NOW()"

    set statement=##class(%SQL.Statement).%New() 
	do statement.%Prepare(sql)
	set SQLrequest = statement.%Execute()
    do SQLrequest.%Next()
    set pResponse.nbResa = SQLrequest.%Get("nbResa")

    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

Method suppReservation(pRequest As msg.suppReservationByPlaqueDmde, Output pResponse As msg.suppReservationByPlaqueRpse) As %Status
{
    set pResponse = ##class(msg.suppReservationByPlaqueRpse).%New()
    set sql = "delete from data.Reservation where voiture->plaque = '"_pRequest.plaque_"'"

    set statement=##class(%SQL.Statement).%New() 
	do statement.%Prepare(sql)
	set SQLrequest = statement.%Execute()

    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.getAvailableVoitureDmde">
        <Method>getAvailablesVoitures</Method>
    </MapItem>
    <MapItem MessageType="msg.creerReservationDmde">
        <Method>creerReservation</Method>
    </MapItem>
    <MapItem MessageType="msg.haveFutureReservationDmde">
        <Method>haveFutureReservation</Method>
    </MapItem>
    <MapItem MessageType="msg.suppReservationByPlaqueDmde">
        <Method>suppReservation</Method>
    </MapItem>
</MapItems>
}

}
