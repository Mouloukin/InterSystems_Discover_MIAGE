Class webObjet.wsVoiture Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property marque As %String;

Property modele As %String;

Property categorie As %String;

Property plaque As %String;

Property couleur As %String;

Property nbPlaces As %Integer;

Storage Default
{
<Data name="wsVoitureState">
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
<Value>couleur</Value>
</Value>
<Value name="6">
<Value>nbPlaces</Value>
</Value>
<Value name="7">
<Value>categorie</Value>
</Value>
</Data>
<State>wsVoitureState</State>
<StreamLocation>^webObjet.wsVoitureS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
