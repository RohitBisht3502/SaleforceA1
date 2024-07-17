public class AccountDetailsController {



    // fetching all opportunity related to an account
    @AuraEnabled
    public static List<Opportunity>  getOpportunityRelatedToAccountId(Id selectedAccountId){
        try {
            return [Select Id,AccountId,Name,StageName,Amount from Opportunity where AccountId = : selectedAccountId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    // fetching all contacts related to an account
    @AuraEnabled
    public static List<Contact> getContactRelatedToAccountId(Id selectedAccountId){
        try {
            return [Select Id,AccountId,Name,Email,Phone,Department, Description from Contact where AccountId =: selectedAccountId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    // fetching all contacts related to an accounts
    @AuraEnabled
    public static List<Contact> getContactsRelatedToAccountId(Id selectedAccountId){
        try {
            return [Select Id,AccountId,Name,Email from Contact where AccountId =: selectedAccountId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    // fetching all accounts
    @AuraEnabled
    public static List<Account> getAllAccounts(){
        try {
            return [Select Id,Name from Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static Contact getContactDetails(Id contactId) {
        return [SELECT Id, Name, Phone, Email FROM Contact WHERE Id = :contactId LIMIT 1];
    }
    

    @AuraEnabled(cacheable=true)
    public static List<Map<String, Object>> getContactListBasedOnName(String contactName) {
        try {
            contactName = '%' + contactName + '%';
            List<Contact> contacts = [SELECT Id, Name, Account.Name FROM Contact WHERE Name LIKE :contactName];
            
            List<Map<String, Object>> contactList = new List<Map<String, Object>>();
            for (Contact contact : contacts) {
                Map<String, Object> contactMap = new Map<String, Object>();
                contactMap.put('Id', contact.Id);
                contactMap.put('Name', contact.Name);
                contactMap.put('AccountName', contact.Account != null ? contact.Account.Name : null);
                contactList.add(contactMap);
            }
            return contactList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void updateAccountsName(Id accountId,String updatedName){
        try {
            Account accObj=[Select Id,Name from Account where Id = :accountId];
            accObj.Name=updatedName;
            update accObj;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Account> getAccountListBasedOnName(String accName){
        try {
            accName = '%'+accName+'%';
            return [Select Id, Name from Account where Name LIKE: accName];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
    }

    @AuraEnabled
    public static void deleteAccountsByIds(List<Id> accountIds){
        try {
            List<Account> accList=[Select Id from Account where Id in : accountIds];
            delete accList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}