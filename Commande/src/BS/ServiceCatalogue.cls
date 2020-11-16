Class BS.ServiceCatalogue Extends Ens.BusinessService
{

/// Name of the WebService
Parameter SERVICENAME = "ServiceCatalogue";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
    set tsc = $CASE(pHint,
        "GetCatalogue":..GetCatalogue(pInput,.pOutput),
	 	: $$$ERROR($$$NotImplemented)
    )
    Quit tsc
}

Method GetCatalogue(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    set tsc = ..SendRequestSync("Catalogue",pInput,.pOutput)
    Quit $$$OK
}

}
