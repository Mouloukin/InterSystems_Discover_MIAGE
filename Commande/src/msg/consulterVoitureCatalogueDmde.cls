Class msg.consulterVoitureCatalogueDmde Extends Ens.Request
{

Property marque As %String;

Property modele As %String;

Storage Default
{
<Data name="consulterVoitureCatalogueDmdeDefaultData">
<Subscript>"consulterVoitureCatalogueDmde"</Subscript>
<Value name="1">
<Value>marque</Value>
</Value>
<Value name="2">
<Value>modele</Value>
</Value>
</Data>
<DefaultData>consulterVoitureCatalogueDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
