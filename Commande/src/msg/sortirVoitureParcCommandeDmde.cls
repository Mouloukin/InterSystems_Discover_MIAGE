Class msg.sortirVoitureParcCommandeDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property plaque As %String;

Storage Default
{
<Data name="sortirVoitureParcCommandeDmdeDefaultData">
<Subscript>"sortirVoitureParcCommandeDmde"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
</Data>
<DefaultData>sortirVoitureParcCommandeDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
