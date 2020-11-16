Class msg.basic.reponse Extends (Ens.Response, %JSON.Adaptor)
{

Property codeRetour As %String;

Property libErreur As %String;

Storage Default
{
<Data name="reponseDefaultData">
<Subscript>"reponse"</Subscript>
<Value name="1">
<Value>codeRetour</Value>
</Value>
<Value name="2">
<Value>libErreur</Value>
</Value>
</Data>
<DefaultData>reponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
