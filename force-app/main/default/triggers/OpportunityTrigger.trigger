trigger OpportunityTrigger on Opportunity (before insert,after insert,before update,after update,before delete , after delete) {
    if(Trigger.isInsert && Trigger.isBefore){
       // OpportunityTriggerHandler.onInsertionUpdateDescription(Trigger.new);
    }
    if(Trigger.isDelete && Trigger.isBefore){
       //  OpportunityTriggerHandler.onDeleteOpportunityOnlySystemAdmin(Trigger.oldMap);
    }
    
    if(Trigger.isUpdate && Trigger.isAfter){
        // OpportunityTriggerHandler.onUpdateOfTotalOpportunityAmountInAccount(Trigger.new,Trigger.newMap);
        
        // on updating opp
        
    //   OpportunityTriggerHandler.onUpdatingOppInAccountUpdateCount(Trigger.oldMap,Trigger.newMap,Trigger.old,Trigger.old);
        
    }
    
    if(Trigger.isInsert && Trigger.isAfter){
       // OpportunityTriggerHandler.onUpdateOfTotalOpportunityAmountInAccount(Trigger.new,Trigger.newMap);
       
        
       // on insert a opportunity in account increase the count
       
     // OpportunityTriggerHandler.onInsertingOppInAccountUpdateCount(Trigger.new);
    }
    
    if(Trigger.isDelete && Trigger.isAfter){
      // OpportunityTriggerHandler.onUpdateOfTotalOpportunityAmountInAccount(Trigger.new,Trigger.newMap);
      
        // on deleting opp inside an opp
     //  OpportunityTriggerHandler.onDeletingOppInAccountUpdateCount(Trigger.old);
    }
    
    
    
}