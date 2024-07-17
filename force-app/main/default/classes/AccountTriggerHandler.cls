public class AccountTriggerHandler {

    public static void onDeletionOfAccount(List<Account> oldList){
        for(Account accObj : oldList){
            Integer oppCount=[Select COUNT() from Opportunity where AccountId =: accObj.Id];
            if(oppCount>0){
                accObj.addError('You can delete this Account because it is associated with opportunity Rohit ');
            }
        }
    }
    // on insert a new Account create a new contact for it
    
    public static void insertAccountAndCreateContact(Map<Id,Account> newMap){
        List<Contact> contactList= new List<Contact>();
        
        for(Id key : newMap.keySet()){
            Contact newContact =new Contact(LastName=newMap.get(key).Name,AccountId=key);
            contactList.add(newContact);
        }
        
        insert contactList;
    }
    
    //on updating a account owner then also change owner in its related contact also
    
    public static void onUpdatingAccountOwnerThenUpdateInRelatedContact(Map<Id,Account> oldMap,Map<Id,Account> newMap){
        System.debug('hello');
        List<Id> accountIds= new List<Id>();
        
        List<Account> newAccountList=newMap.values();
        
        // got all id whose owner is changed
        for(Account accObj : newAccountList){ 
            if(accObj.OwnerId!=oldMap.get(accObj.Id).OwnerId){
                accountIds.add(accObj.Id);
            }
        }
        
        List<Contact> contactList=[Select Id, OwnerId, AccountId from Contact where AccountId in : accountIds];
        
        for(Contact contactObj : contactList){
            contactObj.OwnerId =newMap.get(contactObj.AccountId).OwnerId;
        }
        System.debug(contactList);
        update contactList;
    }
    
    
    // On creating a account opportunity is created
    // on creation of account
    
    public static void onInsertAccountOpportunityCreated(Map<Id,Account> newMap){
        
        List<Id> accountIds =new List<Id>();
        
        List<Account> accountList=newMap.values();
        
        for(Account accObj : accountList){
            if(accObj.Industry==System.label.Account_Type){
                accountIds.add(accObj.Id);
            }
        }
        
        List<Opportunity> oppList=new List<Opportunity>();
        
        for(Id accId : accountIds){
            Account acc=newMap.get(accId);
            Opportunity oppObj =new Opportunity(Name = acc.Name,AccountId=acc.Id, StageName='Prospecting' , Amount = 0, CloseDate=System.Today()+90);
            oppList.add(oppObj);
        }
        insert oppList;
    }
    
    public static void onDeletingAccountAssociatedContactErrorMessage(Map<Id,Account> oldMap){
        List<Account> accList=oldMap.values();
        
        Map<Id,Account> accMap=new Map<Id,Account>([Select Id,(Select Id from Contacts) from Account where Id in : oldMap.keySet()]);
        
        for(Account accObj : accList){
            if(!accMap.get(accObj.Id).Contacts.isEmpty()){
                
                accObj.addError('You can not delete this account because it is assosciated with Contact ');
                
            }
        }
    }
    
    public static void onUpdateOfBillingCityUpdateContactMailingCity(List<Account> newList,Map<Id,Account> oldMap,Map<Id,Account> newMap){
        Set<Id> accountIds=new Set<Id>();
        for(Account accObj : newList){
            if(accObj.BillingCity!=oldMap.get(accObj.Id).BillingCity){
                accountIds.add(accObj.Id);
            } 
        }
        
        List<Contact> contactList=[Select Id, MailingCity,AccountId from Contact where AccountId in : accountIds];
        
        for(Contact contactObj : contactList){
            contactObj.MailingCity=newMap.get(contactObj.AccountId).BillingCity;
        }
        
        if(!contactList.isEmpty()){
            update contactList;
        }
        
    }
    
   
    
    /* public static void onBeforeInsert(List<Account> newList){                
        for(Account accObj: newList){
            if(accObj.ShippingState=='Delhi' || accObj.ShippingState=='Haryana' || accObj.ShippingState=='Punjab' || accObj.ShippingState=='Uttarakhand' ){
                accObj.WhichRegion__c='North';
            }else if(accObj.ShippingState=='Kerala' || accObj.ShippingState=='Karnataka' ){
                accObj.WhichRegion__c='South';
            }else if(accObj.ShippingState=='Gujarat' || accObj.ShippingState=='Rajasthan' ){
                accObj.WhichRegion__c='West';
            }else if(accObj.ShippingState=='Bihar' || accObj.ShippingState=='Sikkim' || accObj.ShippingState=='West Bengal'){
                accObj.WhichRegion__c='East';
            }        
        }
          
    }
    
    public static void onBeforeUpdate(Map<Id,Account> newMap){
        for(Id key: newMap.keySet()){
            if(newMap.get(key).ShippingState=='Delhi' || newMap.get(key).ShippingState=='Haryana' || newMap.get(key).ShippingState=='Punjab' || newMap.get(key).ShippingState=='Uttarakhand' ){
                newMap.get(key).WhichRegion__c='North';
            }else if(newMap.get(key).ShippingState=='Kerala' || newMap.get(key).ShippingState=='Karnataka' ){
                newMap.get(key).WhichRegion__c='South';
            }else if(newMap.get(key).ShippingState=='Gujarat' || newMap.get(key).ShippingState=='Rajasthan' ){
                newMap.get(key).WhichRegion__c='West';
            }else if(newMap.get(key).ShippingState=='Bihar' || newMap.get(key).ShippingState=='Sikkim' || newMap.get(key).ShippingState=='West Bengal'){
                newMap.get(key).WhichRegion__c='East';
            }        
        }
        
    } */

}