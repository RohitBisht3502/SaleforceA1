@isTest
public class AccountTrigger1Test {
    
    
    @isTest
    static void testingOnInsertionOfAccountCreateContact(){
        List<Account> accList=new List<Account>();
        Map<Id,Account> accMap=new Map<Id,Account>();
        for(Integer i=0;i<10;i++){
            
            Account accObj=new Account(Name='testt '+i);
            accMap.put(accObj.Id,accObj);
            accList.add(accObj);
        }
        insert accList;
        
      
        
    }
    
    
    
    static void testingOnUpdationOfAccount(){
        List<Account> accList =new List<Account>();
        
        Map<Id,Account> accMap=new Map<Id,Account>([Select Id,Name from Account LIMIT 10]);
        
        for(Account accObj : accMap.values()){
            
            accObj.Name = accObj.Name + 'test';
            
            accList.add(accObj);
        }
        update accList;
        
        Test.startTest();
        AccountTrigger1Handler.onUpdateAfter(accMap);
        Test.stopTest();
    }
    
    
    
    
    static void testingOnDeletionOfAccountRelatedToOpportunity(){
        
        Account acct = new Account(Name='Test123 Account');
        insert acct;
        Opportunity opp = new Opportunity(
        Name=acct.Name + ' Opportunity',
        StageName='Prospecting',
        CloseDate=System.today().addMonths(1),
        AccountId=acct.Id);
        insert opp;
        List<Account> list1=new List<Account>();
        list1.add(acct);
        Test.startTest();
        AccountTrigger1Handler.accountDeletion(list1);
        Test.stopTest();
        
     
    }
}