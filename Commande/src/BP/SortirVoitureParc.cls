/// 
Class BP.SortirVoitureParc Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.sortirVoitureParcCommandeDmde' response='msg.sortirVoitureParcCommandeRpse' height='2000' width='2000' >
<context>
<property name='successReservation' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='700' >
<call name='Supprimer voiture Réservation' target='SortirVoitureReservation' async='0' xpos='200' ypos='250' >
<request type='msg.sortirVoitureParcReservationDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.sortirVoitureParcReservationRpse' >
<assign property="context.successReservation" value="callresponse.codeRetour" action="set" />
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
<if name='Réussi ?' condition='context.successReservation="OK"' xpos='200' ypos='350' xend='200' yend='600' >
<true>
<call name='Supprimer voiture' target='Voiture' async='0' xpos='335' ypos='500' >
<request type='msg.suppVoitureDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.suppVoitureRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
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
