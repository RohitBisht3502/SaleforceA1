trigger ContactTrigger on Contact (before insert,after insert,before update,after update,before delete,after delete) {

    if(Trigger.isInsert && Trigger.isAfter){
        //ContactTriggerHandler.onInsertOfContactUpdateCountsInAccount(Trigger.new);
    }
    
    if(Trigger.isUpdate && Trigger.isAfter){
        
    }
    
    if(Trigger.isDelete && Trigger.isAfter){
        
    }
}