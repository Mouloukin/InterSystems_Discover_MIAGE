Class msg.suppVoitureDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property plaque As %String;

Storage Default
{
<Data name="suppVoitureDmdeDefaultData">
<Subscript>"suppVoitureDmde"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
</Data>
<DefaultData>suppVoitureDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
