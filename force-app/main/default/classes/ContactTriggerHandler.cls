public class ContactTriggerHandler {
    
    public static void onInsertOfContactUpdateCountsInAccount(List<Contact> contactList){
        Map<Id,Integer> accountCountMp=new Map<Id,Integer>();
        
        for(Contact contactObj : contactList){
            Id accountId=contactObj.AccountId;
            if(!accountCountMp.containsKey(accountId)){
                accountCountMp.put(accountId,1);
            }else{
                Integer old=accountCountMp.get(accountId);
                accountCountMp.put(accountId,old+1);
            }
        }
        
        List<Account> accList=[Select Id,Count_of_Contact__c from Account where Id in : accountCountMp.keySet()];
        
        for(Account accountObj : accList){
            if(accountObj.Count_of_Contact__c==null){
                accountObj.Count_of_Contact__c=1;
            }else 
            accountObj.Count_of_Contact__c+= accountCountMp.get(accountObj.Id);
            
        }
        update accList;
    }

}