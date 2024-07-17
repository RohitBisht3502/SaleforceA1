@isTest
public class OpportunityTriggerHandlerTest {
    
    @isTest
    public static void testingOnDescription(){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=0;i<10;i++){
            Opportunity opp=new Opportunity(Name='Test Opportunity '+i, StageName='Prospecting', CloseDate=System.Today(),Amount=20000);
            oppList.add(opp);
        }
        
        Test.startTest();
        insert oppList;
        Test.stopTest();
        
        List<Opportunity> updatedList=[Select Id,Description from Opportunity where Id = : oppList[0].Id ];
        System.assertEquals('Hot Opportunity',updatedList[0].Description);
    }

}