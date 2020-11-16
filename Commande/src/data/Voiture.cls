Class data.Voiture Extends (%Persistent, %JSON.Adaptor)
{

Property marque As %String;

Property modele As %String;

Property categorie As %String(VALUELIST = "'2 places', 'Cabriolet', 'Berline', 'Monospace', '4x4', '7 places'");

Property plaque As %String(MAXLEN = 9, MINLEN = 9);

Property couleur As %String;

Property nbPlaces As %Integer;

Index consulterParPlaque On plaque;

Storage Default
{
<Data name="VoitureDefaultData">
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
<Value>couleur</Value>
</Value>
<Value name="7">
<Value>nbPlaces</Value>
</Value>
<Value name="8">
<Value>categorie</Value>
</Value>
</Data>
<DataLocation>^data.VoitureD</DataLocation>
<DefaultData>VoitureDefaultData</DefaultData>
<IdLocation>^data.VoitureD</IdLocation>
<IndexLocation>^data.VoitureI</IndexLocation>
<StreamLocation>^data.VoitureS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
