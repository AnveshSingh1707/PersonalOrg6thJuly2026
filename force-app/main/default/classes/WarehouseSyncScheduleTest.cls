@isTest
public class WarehouseSyncScheduleTest {
    
    public static testmethod void test()
    {
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());   		
        String CRON_EXP =  '0 0 0 4 6 ? 2021';
        Test.startTest();
        
        String job = System.schedule('testScheduledWarehouseSync', CRON_EXP, new WarehouseSyncSchedule());
        
        Test.stopTest();
        
        CronTrigger cron = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :job];
        
        System.assertEquals(CRON_EXP,cron.CronExpression);
        System.assertEquals(0, cron.TimesTriggered);
    }

}