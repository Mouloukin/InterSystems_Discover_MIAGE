/// 
Class BP.SortirVoitureParc Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.sortirVoitureParcDmde' response='msg.sortirVoitureParcRpse' height='2000' width='2000' >
<context>
<property name='nbFutureReservation' type='%Integer' instantiate='0' />
</context>
<sequence xend='200' yend='800' >
<call name='Nombre de futures réservations' target='Reservation' async='0' xpos='200' ypos='250' >
<request type='msg.haveFutureReservationDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.haveFutureReservationRpse' >
<assign property="context.nbFutureReservation" value="callresponse.nbResa" action="set" />
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
<if name='Future Réservation ?' condition='context.nbFutureReservation=0' xpos='200' ypos='350' xend='200' yend='700' >
<true>
<call name='Supprimer réservation' target='Reservation' async='0' xpos='470' ypos='500' >
<request type='msg.suppReservationByPlaqueDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.suppReservationByPlaqueRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
<call name='Supprimer voiture' target='Voiture' async='0' xpos='470' ypos='600' >
<request type='msg.suppVoitureDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.suppVoitureRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
</true>
<false>
<assign name="Assigner code retour" property="response.codeRetour" value="&quot;KO&quot;" action="set" xpos='200' ypos='500' />
<assign name="Assigner lib erreur" property="response.libErreur" value="&quot;La voiture a des réservations&quot;" action="set" xpos='200' ypos='600' />
</false>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
