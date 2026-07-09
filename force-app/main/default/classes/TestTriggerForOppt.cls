@IsTest
public class TestTriggerForOppt{
    public static testMethod void myUnitTest() {
        RecordsTriggerForOppt.recordCreationOppt();
        List<Opportunity> opp = [Select id from Opportunity where Name='Test'];
        List<Id> lstId = new List<Id>();
        for(Opportunity oppt : opp ){
            lstId.add(oppt.id);
        }
        List<OpportunityLineItem> newlstOli = [Select id,Name from OpportunityLineItem where OpportunityId In :lstId];
        System.debug('newlstOli'+newlstOli);
        System.assertEquals(newlstOli.size(),100);
    }
}