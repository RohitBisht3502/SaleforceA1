public class LeadProcessor {
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator([Select Id from Lead]);        
    }
  
    
    public void execute(Database.BatchableContext bc,List<Lead> scope){
      
        
        
    }
    
    public void finish(Database.BatchableContext bc){
        
    }
}