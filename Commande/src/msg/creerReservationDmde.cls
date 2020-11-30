Class msg.creerReservationDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property nom As %String;

Property categorie As %String;

Property plaque As %String;

Storage Default
{
<Data name="creerReservationDmdeDefaultData">
<Subscript>"creerReservationDmde"</Subscript>
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
<DefaultData>creerReservationDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
