Class Transform.WsVoitureToVoiture Extends Ens.DataTransformDTL [ DependsOn = (webObjet.wsVoiture, data.Voiture) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='webObjet.wsVoiture' targetClass='data.Voiture' create='new' language='objectscript' >
<assign value='source.nom' property='target.nom' action='set' />
<assign value='source.categorie' property='target.categorie' action='set' />
<assign value='source.plaque' property='target.plaque' action='set' />
</transform>
}

}
