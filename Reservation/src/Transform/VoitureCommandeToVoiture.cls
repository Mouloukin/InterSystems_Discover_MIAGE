Class Transform.VoitureCommandeToVoiture Extends Ens.DataTransformDTL [ DependsOn = (msg.creerVoitureCommandeDmde, msg.creerVoitureDmde) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='msg.creerVoitureCommandeDmde' targetClass='msg.creerVoitureDmde' create='new' language='objectscript' >
<assign value='source.voiture.marque_source.voiture.modele' property='target.nom' action='set' />
<assign value='source.voiture.categorie' property='target.categorie' action='set' />
<assign value='source.voiture.plaque' property='target.plaque' action='set' />
</transform>
}

}
