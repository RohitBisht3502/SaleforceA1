public class AccountTrigger1Handler {
    
    public static void accountDeletion(List<Account> oldList){
        for(Account accObj : [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :oldList]) {
            
            accObj.addError('Cannot delete account with related opportunities.');
        }
    }
    public static void onInsertAfter(Map<Id,Account> newMap){
        futureClass(newMap.keySet());
    }
    
    public static void onUpdateAfter(Map<Id,Account> newMap){
        updateCountsInAccount(newMap.keySet());
    }
    
    @Future
    public static void updateCountsInAccount(Set<Id> accountIds){
        List<Account> accList=[Select Id,Name,(Select Id from Opportunities) from Account where id IN: accountIds];
        for(Account accObj : accList){
            accObj.Count_of_Opportunity__c=accObj.Opportunities.size();
        }
        update accList;
    }
    
    @Future
    public static void futureClass(Set<Id> accountIds){
        List<Account> accList=[Select Id,Name from Account where ID IN : accountIds];
        List<Contact> contactList=new List<Contact>();
        for(Account accObj : accList){
            Contact newContact =new Contact();
            newContact.AccountId=accObj.Id;
            newContact.LastName=accObj.Name;
            contactList.add(newContact);
            
        }
        insert contactList;
    }

}