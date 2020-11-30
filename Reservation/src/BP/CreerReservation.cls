/// 
Class BP.CreerReservation Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.creerDemandeReservationDmde' response='msg.creerDemandeReservationRpse' height='2000' width='2000' >
<context>
<property name='wsVoiture' type='webObjet.wsVoiture' instantiate='0' />
<property name='dispo' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='700' >
<call name='Vérifier la disponibilité' target='Reservation' async='0' xpos='200' ypos='250' >
<request type='msg.getAvailableVoitureDmde' >
<assign property="callrequest.categorie" value="request.categorie" action="set" />
<assign property="callrequest.startDate" value="request.startDate" action="set" />
<assign property="callrequest.endDate" value="request.endDate" action="set" />
</request>
<response type='msg.getAvailableVoitureRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.wsVoiture" value="callresponse.voiture" action="set" />
<assign property="context.dispo" value="callresponse.codeRetour" action="set" />
</response>
</call>
<if name='Dispo ?' condition='context.dispo="OK"' xpos='200' ypos='350' xend='200' yend='600' >
<true>
<call name='Ajouter la réservation' target='Reservation' async='0' xpos='335' ypos='500' >
<request type='msg.creerReservationDmde' >
<assign property="callrequest.voiture" value="context.wsVoiture" action="set" />
<assign property="callrequest.startDate" value="request.startDate" action="set" />
<assign property="callrequest.endDate" value="request.endDate" action="set" />
</request>
<response type='Ens.Response' />
</call>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
