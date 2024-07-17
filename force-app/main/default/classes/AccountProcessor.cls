public class AccountProcessor {
    
    @Future
    public static void countContacts(List<Id> accountIds){
        List<Account> accList=[Select Id ,Number_Of_Contacts__c,(Select Id from Contacts) from Account where Id in : accountIds];
        for(Account accObj : accList){
            accObj.Number_Of_Contacts__c=accObj.Contacts.size();
        }
        update accList;
    }

}