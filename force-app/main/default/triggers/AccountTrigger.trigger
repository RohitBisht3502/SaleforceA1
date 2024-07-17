trigger AccountTrigger on Account (before insert, after insert,before update, after update,before delete,after delete) {

    if(Trigger.isDelete && Trigger.isBefore){
     // AccountTriggerHandler.onDeletionOfAccount(Trigger.old);
    }
    
    if(Trigger.isInsert && Trigger.isBefore){
       // AccountTriggerHandler.onBeforeInsert(Trigger.new);
    }
     
    if(Trigger.isInsert && Trigger.isAfter){
       //  AccountTriggerHandler.insertAccountAndCreateContact(Trigger.newMap);
        
        
        
        // create an opportunity whenever an account is created and updated
      //  AccountTriggerHandler.onInsertAccountOpportunityCreated(Trigger.newMap);
        
        
        
    }
    
    
    
    if(Trigger.isUpdate && Trigger.isAfter){
      //  AccountTriggerHandler.onUpdatingAccountOwnerThenUpdateInRelatedContact(Trigger.oldMap, Trigger.newMap);
    //  AccountTriggerHandler.onInsertAccountOpportunityCreated(Trigger.newMap);
    
       // AccountTriggerHandler.onUpdateOfBillingCityUpdateContactMailingCity(Trigger.new,Trigger.oldMap,Trigger.newMap);
    }
    
    if(Trigger.isUpdate && Trigger.isBefore){
       // AccountTriggerHandler.onBeforeUpdate(Trigger.newMap);
    }
    
    if(Trigger.isDelete && Trigger.isBefore){
      //  AccountTriggerHandler.onDeletingAccountAssociatedContactErrorMessage(Trigger.oldMap); 
    }
    // create an opportunity whenever an account is created and updated
    

}