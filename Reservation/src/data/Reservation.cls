Class data.Reservation Extends (%Persistent, %JSON.Adaptor)
{

Property voiture As data.Voiture;

Property startDate As %TimeStamp;

Property endDate As %TimeStamp;

Storage Default
{
<Data name="ReservationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>voiture</Value>
</Value>
<Value name="3">
<Value>startDate</Value>
</Value>
<Value name="4">
<Value>endDate</Value>
</Value>
</Data>
<DataLocation>^data.ReservationD</DataLocation>
<DefaultData>ReservationDefaultData</DefaultData>
<IdLocation>^data.ReservationD</IdLocation>
<IndexLocation>^data.ReservationI</IndexLocation>
<StreamLocation>^data.ReservationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
