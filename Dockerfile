ARG IMAGE=intersystems/iris:2019.1.0S.111.0
ARG IMAGE=store/intersystems/irishealth:2019.3.0.308.0-community
ARG IMAGE=store/intersystems/iris-community:2019.3.0.309.0
ARG IMAGE=store/intersystems/iris-community:2019.4.0.379.0
ARG IMAGE=store/intersystems/iris-community:2020.1.0.197.0
ARG IMAGE=intersystemsdc/iris-community:2020.1.0.209.0-zpm
ARG IMAGE=intersystemsdc/iris-community:2020.1.0.215.0-zpm
ARG IMAGE=intersystemsdc/iris-community:2020.2.0.204.0-zpm
FROM $IMAGE

USER root

WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp

USER irisowner

COPY  InstallerReservation.cls .
COPY  InstallerCommande.cls .
COPY  Reservation Reservation
COPY  Commande Commande 
COPY irissession.sh /
SHELL ["/irissession.sh"]

RUN \
  do $SYSTEM.OBJ.Load("InstallerCommande.cls", "ck") \
  do $SYSTEM.OBJ.Load("InstallerReservation.cls", "ck") \
  set sc = ##class(App.InstallerCommande).setup() \
  set sc = ##class(App.InstallerReservation).setup() \
  zn "COMMANDE" \
  do InsertData^Init.initData() \
  set ^plaque = "AA-001-AA" \
  zn "%SYS" \
  write "Create web application ..." \
  set webName = "/api/reservation" \
  set webProperties("DispatchClass") = "BS.API" \
  set webProperties("NameSpace") = "RESERVATION" \
  set webProperties("Enabled") = 1 \
  set webProperties("AutheEnabled") = 32 \
  set sc = ##class(Security.Applications).Create(webName, .webProperties) \
  write sc \
  write "Web application "_webName_" has been created!" \
  write "Create web application ..." \
  set webName = "/api/commande" \
  set webProperties("DispatchClass") = "BS.API" \
  set webProperties("NameSpace") = "COMMANDE" \
  set webProperties("Enabled") = 1 \
  set webProperties("AutheEnabled") = 32 \
  set sc = ##class(Security.Applications).Create(webName, .webProperties) \
  write sc \
  write "Web application "_webName_" has been created!"

# bringing the standard shell back
SHELL ["/bin/bash", "-c"]
CMD [ "-l", "/usr/irissys/mgr/messages.log" ]
