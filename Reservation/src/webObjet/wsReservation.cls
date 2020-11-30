Class webObjet.wsReservation Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property voiture As webObjet.wsVoiture;

Property startDate As %TimeStamp;

Property endDate As %TimeStamp;

Storage Default
{
<Data name="wsReservationState">
<Value name="1">
<Value>voiture</Value>
</Value>
<Value name="2">
<Value>startDate</Value>
</Value>
<Value name="3">
<Value>endDate</Value>
</Value>
</Data>
<Data name="wsVoitureCommandeState">
<Value name="1">
<Value>voiture</Value>
</Value>
<Value name="2">
<Value>startDate</Value>
</Value>
<Value name="3">
<Value>endDate</Value>
</Value>
</Data>
<State>wsReservationState</State>
<StreamLocation>^webObjet.wsReservationS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
