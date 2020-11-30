Class msg.sortirVoitureParcDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property plaque As %String;

Storage Default
{
<Data name="sortirVoitureParcDmdeDefaultData">
<Subscript>"sortirVoitureParcDmde"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
</Data>
<DefaultData>sortirVoitureParcDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
