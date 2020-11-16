Class data.Voiture Extends (%Persistent, %JSON.Adaptor)
{

Property nom As %String;

Property categorie As %String(VALUELIST = "'2 places', 'Cabriolet', 'Berline', 'Monospace', '4x4', '7 places'");

Property plaque As %String(MAXLEN = 9, MINLEN = 9);

Storage Default
{
<Data name="VoitureDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>nom</Value>
</Value>
<Value name="3">
<Value>categorie</Value>
</Value>
<Value name="4">
<Value>plaque</Value>
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
