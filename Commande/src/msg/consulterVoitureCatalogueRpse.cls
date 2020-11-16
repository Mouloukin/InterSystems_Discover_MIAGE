Class msg.consulterVoitureCatalogueRpse Extends msg.basic.reponse
{

Property voiture As webObjet.wsCatalogue;

Storage Default
{
<Data name="consulterVoitureCatalogueRpseDefaultData">
<Subscript>"consulterVoitureCatalogueRpse"</Subscript>
<Value name="1">
<Value>voiture</Value>
</Value>
</Data>
<DefaultData>consulterVoitureCatalogueRpseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
