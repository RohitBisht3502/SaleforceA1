public class BatchClass implements Database.Batchable<sObject>{
    public Integer successCount=0;
    public Integer failedCount=0;
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator('Select Id from Account ');        
    }
  
    
    public void execute(Database.BatchableContext bc,List<Account> scope){

   
        List<Account> accList=[Select Id ,(Select Id from Opportunities) from Account where Id in : scope];
        
        for(Account accObj : accList){
            
            Integer count = accObj.Opportunities.size();
            accObj.Count_of_Opportunity__c=count;
            successCount++;
            
        }
        failedCount=accList.size()-successCount;
            
        database.SaveResult[] res=database.update(accList,false);
        for(database.SaveResult s : res){
            if(s.isSuccess()){
              //  successCount++;
            }
        }
        
        
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('success : '+successCount);
        System.debug('failed : '+failedCount);
    }

}