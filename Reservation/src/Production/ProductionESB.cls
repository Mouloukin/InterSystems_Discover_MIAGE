Class Production.ProductionReservation Extends Ens.Production
{
XData ProductionDefinition
{
<Production Name="Production.ProductionReservation">
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="Voiture" 
        ClassName="BO.Voiture" 
        PoolSize="1" Enabled="true" Foreground="false" InactivityTimeout="0">
  </Item>
</Production>
}
}