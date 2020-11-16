Class data.Catalogue Extends (%Persistent, %JSON.Adaptor)
{

Property marque As %String;

Property modele As %String;

Property type As %String(VALUELIST = "'Cabriolet', 'Berline', 'Monospace', '4x4'");

Property nbPlaces As %Integer;

Property prix As %Integer;

Index consulterParMarqueModele On (marque, modele);

Storage Default
{
<Data name="CatalogueDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>marque</Value>
</Value>
<Value name="3">
<Value>modele</Value>
</Value>
<Value name="4">
<Value>type</Value>
</Value>
<Value name="5">
<Value>plaque</Value>
</Value>
<Value name="6">
<Value>nbPlaces</Value>
</Value>
<Value name="7">
<Value>prix</Value>
</Value>
</Data>
<DataLocation>^data.CatalogueD</DataLocation>
<DefaultData>CatalogueDefaultData</DefaultData>
<IdLocation>^data.CatalogueD</IdLocation>
<IndexLocation>^data.CatalogueI</IndexLocation>
<StreamLocation>^data.CatalogueS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
