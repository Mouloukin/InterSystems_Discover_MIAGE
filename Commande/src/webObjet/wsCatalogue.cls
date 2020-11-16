Class webObjet.wsCatalogue Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property marque As %String;

Property modele As %String;

Property type As %String;

Property nbPlaces As %Integer;

Property prix As %Integer;

Storage Default
{
<Data name="wsCatalogueState">
<Value name="1">
<Value>marque</Value>
</Value>
<Value name="2">
<Value>modele</Value>
</Value>
<Value name="3">
<Value>type</Value>
</Value>
<Value name="4">
<Value>plaque</Value>
</Value>
<Value name="5">
<Value>nbPlaces</Value>
</Value>
<Value name="6">
<Value>prix</Value>
</Value>
</Data>
<State>wsCatalogueState</State>
<StreamLocation>^ANCV.SVCMER.We84B2.wsCatalogueS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
