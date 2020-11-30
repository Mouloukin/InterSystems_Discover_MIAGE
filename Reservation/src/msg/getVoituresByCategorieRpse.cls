Class msg.getVoituresByCategorieRpse Extends msg.basic.reponse
{

Property voitures As list Of webObjet.wsVoiture;

Storage Default
{
<Data name="getVoituresByCategorieRpseDefaultData">
<Subscript>"getVoituresByCategorieRpse"</Subscript>
<Value name="1">
<Value>voitures</Value>
</Value>
</Data>
<DefaultData>getVoituresByCategorieRpseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
