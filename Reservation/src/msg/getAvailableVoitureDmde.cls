Class msg.getAvailableVoitureDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property categorie As %String;

Property startDate As %TimeStamp;

Property endDate As %TimeStamp;

Storage Default
{
<Data name="getAvailableVoitureDmdeDefaultData">
<Subscript>"getAvailableVoitureDmde"</Subscript>
<Value name="1">
<Value>categorie</Value>
</Value>
<Value name="2">
<Value>startDate</Value>
</Value>
<Value name="3">
<Value>endDate</Value>
</Value>
</Data>
<DefaultData>getAvailableVoitureDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
