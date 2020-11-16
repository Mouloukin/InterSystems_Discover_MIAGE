Class msg.suppVoitureDmde Extends Ens.Request
{

Property plaque As %String;

Storage Default
{
<Data name="ajouterVoitureDmdeDefaultData">
<Subscript>"suppVoitureDmde"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
</Data>
<DefaultData>suppVoitureDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
