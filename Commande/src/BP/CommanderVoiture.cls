/// 
Class BP.CommanderVoiture Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.commanderVoitureDmde' response='msg.commanderVoitureRpse' height='2000' width='2000' >
<context>
<property name='plaque' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='inCatalogue' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='voitureCatalogue' type='webObjet.wsCatalogue' instantiate='0' />
<property name='voiture' type='webObjet.wsVoiture' instantiate='0' />
</context>
<sequence xend='200' yend='1000' >
<call name='Vérifier Catalogue' target='Catalogue' async='0' xpos='200' ypos='250' >
<request type='msg.consulterVoitureCatalogueDmde' >
<assign property="callrequest.marque" value="request.marque" action="set" />
<assign property="callrequest.modele" value="request.modele" action="set" />
</request>
<response type='msg.consulterVoitureCatalogueRpse' >
<assign property="context.inCatalogue" value="callresponse.codeRetour" action="set" />
<assign property="context.voitureCatalogue" value="callresponse.voiture" action="set" />
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
<if name='Dans la catalogue ?' condition='context.inCatalogue="OK"' xpos='200' ypos='350' xend='200' yend='900' >
<true>
<transform name='Catalogue to Voiture' class='Transform.WsCatalogueToWsVoiture' source='context.voitureCatalogue' target='context.voiture' xpos='470' ypos='500' />
<call name='Générer Plaque' target='Plaque' async='0' xpos='470' ypos='600' >
<request type='msg.generationPlaqueDmde' />
<response type='msg.generationPlaqueRpse' >
<assign property="context.plaque" value="callresponse.plaque" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
</response>
</call>
<call name='Ajouter voiture' target='Voiture' async='0' xpos='470' ypos='700' >
<request type='msg.creerVoitureDmde' >
<assign property="callrequest.voiture" value="context.voiture" action="set" />
<assign property="callrequest.voiture.plaque" value="context.plaque" action="set" />
<assign property="callrequest.voiture.couleur" value="request.couleur" action="set" />
</request>
<response type='msg.creerVoitureRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
<call name='Fiche voiture' target='VoitureFile' async='0' xpos='470' ypos='800' >
<request type='msg.pushVoitureFileDmde' >
<assign property="callrequest.voiture" value="context.voiture" action="set" />
<assign property="callrequest.voiture.plaque" value="context.plaque" action="set" />
<assign property="callrequest.voiture.couleur" value="request.couleur" action="set" />
</request>
<response type='msg.pushVoitureFileRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
</true>
<false>
<trace value='"pas cool"' xpos='200' ypos='500' />
</false>
</if>
</sequence>
</process>
}

}
