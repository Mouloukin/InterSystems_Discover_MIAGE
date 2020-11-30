Class msg.haveFutureReservationDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property plaque As %String;

Storage Default
{
<Data name="getVoituresByCategorieDmdeDefaultData">
<Subscript>"getVoituresByCategorieDmde"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
</Data>
<DefaultData>getVoituresByCategorieDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
