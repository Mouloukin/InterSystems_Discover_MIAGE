Class webObjet.wsVoiture Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property nom As %String;

Property categorie As %String;

Property plaque As %String;

Storage Default
{
<Data name="wsVoitureState">
<Value name="1">
<Value>nom</Value>
</Value>
<Value name="2">
<Value>categorie</Value>
</Value>
<Value name="3">
<Value>plaque</Value>
</Value>
</Data>
<State>wsVoitureState</State>
<StreamLocation>^webObjet.wsVoitureS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
