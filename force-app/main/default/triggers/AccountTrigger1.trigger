trigger AccountTrigger1 on Account (after insert) {

    if(Trigger.isInsert && Trigger.isAfter){
     //   AccountTrigger1Handler.onInsertAfter(Trigger.newMap);
    }
    if(Trigger.isUpdate && Trigger.isAfter){
      // AccountTrigger1Handler.onUpdateAfter(Trigger.newMap);
        
    }
    if(Trigger.isDelete && Trigger.isBefore){
       // AccountTrigger1Handler.accountDeletion(Trigger.old);
    }
}