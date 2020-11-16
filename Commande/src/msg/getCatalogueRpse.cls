Class msg.getCatalogueRpse Extends (msg.basic.reponse, %JSON.Adaptor)
{

Property catalogue As list Of webObjet.wsCatalogue;

Storage Default
{
<Data name="creerVoitureRpseDefaultData">
<Subscript>"creerVoitureRpse"</Subscript>
<Value name="1">
<Value>catalogue</Value>
</Value>
</Data>
<DefaultData>creerVoitureRpseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
