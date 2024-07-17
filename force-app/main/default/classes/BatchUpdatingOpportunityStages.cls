public class BatchUpdatingOpportunityStages implements Database.Batchable<sObject>{
    // Scenario:
    // Your organization needs to update the stage of all opportunities that have been in the "Negotiation"
    //  stage for more than 30 days to "Closed - Lost".
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator([Select Id ,StageName from Opportunity where StageName = 'Negotiation' AND CloseDate<LAST_N_DAYS:30]);        
    }
  
    
    public void execute(Database.BatchableContext bc,List<Opportunity> scope){
        
        for(Opportunity oppObj : scope){
            oppObj.StageName='Closed - Lost';
        }
        Database.update(scope,false);
        
        
    }
    
    public void finish(Database.BatchableContext bc){
        
    }

}