Class BS.ServiceVoiture Extends Ens.BusinessService
{

/// Name of the WebService
Parameter SERVICENAME = "ServiceVoiture";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
    set tsc = $CASE(pHint,
        "CommandeVoiture":..CommandeVoiture(pInput,.pOutput),
        "SortirVoitureParc":..SortirVoitureParc(pInput,.pOutput),
        : $$$ERROR($$$NotImplemented)
    )
    Quit tsc
}

Method CommandeVoiture(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    set tsc = ..SendRequestSync("CommanderVoiture",pInput,.pOutput)
    Quit $$$OK
}

Method SortirVoitureParc(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    $$$TRACE("HELLO")
    set tsc = ..SendRequestSync("SortirVoitureParc",pInput,.pOutput)
    Quit $$$OK
}

}
