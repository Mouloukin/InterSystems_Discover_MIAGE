Class msg.creerVoitureDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property nom As %String;

Property categorie As %String;

Property plaque As %String;

Storage Default
{
<Data name="creerVoitureDmdeDefaultData">
<Subscript>"creerVoitureDmde"</Subscript>
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
<DefaultData>creerVoitureDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
