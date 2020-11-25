Class Transform.WsCatalogueToWsVoiture Extends Ens.DataTransformDTL [ DependsOn = (webObjet.wsCatalogue, webObjet.wsVoiture) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='webObjet.wsCatalogue' targetClass='webObjet.wsVoiture' create='new' language='objectscript' >
<assign value='source.marque' property='target.marque' action='set' />
<assign value='source.modele' property='target.modele' action='set' />
<assign value='source.nbPlaces' property='target.nbPlaces' action='set' />
<if condition='source.nbPlaces=2' >
<true>
<assign value='"2 places"' property='target.categorie' action='set' />
</true>
<false>
<if condition='source.nbPlaces=7' >
<true>
<assign value='"7 places"' property='target.categorie' action='set' />
</true>
<false>
<assign value='source.type' property='target.categorie' action='set' />
</false>
</if>
</false>
</if>
</transform>
}

}
