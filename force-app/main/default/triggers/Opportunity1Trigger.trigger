trigger Opportunity1Trigger on Opportunity (before insert,after insert,after update,after delete) {
    if(Trigger.isInsert && Trigger.isAfter){
        Opportunity1TriggerHandler.onInsertionUpdateCount(Trigger.new);
    }

    if(Trigger.isUpdate && Trigger.isAfter){
        Opportunity1TriggerHandler.onUpdationUpdateCount(Trigger.newMap,Trigger.oldMap);
    }
    if(Trigger.isDelete && Trigger.isAfter){
        Opportunity1TriggerHandler.onDeletionUpdateCount(Trigger.old);
    }

}