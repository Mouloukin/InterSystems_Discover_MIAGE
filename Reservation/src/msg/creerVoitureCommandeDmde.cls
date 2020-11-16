Class msg.creerVoitureCommandeDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property voiture As webObjet.wsVoitureCommande;

Storage Default
{
<Data name="creerVoitureCommandeDmdeDefaultData">
<Subscript>"creerVoitureCommandeDmde"</Subscript>
<Value name="1">
<Value>voiture</Value>
</Value>
</Data>
<DefaultData>creerVoitureCommandeDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
