Class App.InstallerCommande
{

XData setup
{
<Manifest>
  <Default Name="SourceDir" Value="/opt/irisapp/Commande/src"/>

  <Namespace Name="COMMANDE" Code="COMMANDE" Data="COMMANDE" Create="yes" Ensemble="1">
    <Configuration>
      <Database Name="COMMANDE" Dir="/opt/irisapp/commande/data" Create="yes"/>
    </Configuration>
    <Import File="${SourceDir}" Flags="ck" Recurse="1"/>
  </Namespace>
</Manifest>
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  #; Let XGL document generate code for this method. 
  do ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "setup")
}

}
