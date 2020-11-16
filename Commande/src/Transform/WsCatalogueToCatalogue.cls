Class Transform.WsCatalogueToCatalogue Extends Ens.DataTransformDTL [ DependsOn = (webObjet.wsCatalogue, data.Catalogue) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='webObjet.wsCatalogue' targetClass='data.Catalogue' create='new' language='objectscript' >
<assign value='source.marque' property='target.marque' action='set' />
<assign value='source.modele' property='target.modele' action='set' />
<assign value='source.type' property='target.type' action='set' />
<assign value='source.nbPlaces' property='target.nbPlaces' action='set' />
<assign value='source.prix' property='target.prix' action='set' />
</transform>
}

}
