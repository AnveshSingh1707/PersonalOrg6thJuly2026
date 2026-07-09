<aura:application extends="force:slds">
  <!-- Create attribute to store lookup value as a sObject--> 
  <aura:attribute name="selectedLookUpRecords" type="sObject[]" default="[]"/>
 
  <c:reUsableMultiSelectLookup objectAPIName="product"
                               IconName="standard:product"
                               lstSelectedRecords="{!v.selectedLookUpRecords}"
                               label="Type Product Name"/>
   <!-- here c: is org. namespace prefix-->
</aura:application>