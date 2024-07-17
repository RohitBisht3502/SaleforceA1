public class SoqlInsideApex {
    public void solve(){
        // first name =last name
        List<Contact> contactList=[Select FirstName, LastName, AccountId from Contact where AccountId!=null];
        
        for(Contact contactObj : contactList){
            contactObj.FirstName=contactObj.LastName;
        }
        update contactList;
        
    }
    
    public void solve1(){
        
        List<Contact> contactList=[Select FirstName, Account.Name from Contact where AccountId!=null];
        
        for(Contact contactObj : contactList){
            contactObj.FirstName=contactObj.Account.Name;
        }
        
        update contactList;
    }
    
    public void solve2(){
        List<Account> listOfAccount=[Select Id, (Select Amount from Opportunities) from Account];
        
        Map<Id,Decimal> mp=new Map<Id,Decimal>();
         
        Decimal sum=0;
        
        for(Account acc: listOfAccount){
            
            for (Opportunity opp : acc.Opportunities){
                if (opp.Amount != null){
                    sum+=opp.Amount;
                }
            }
            
            mp.put(acc.Id,sum);
                        
        }
        
        System.debug(mp);
           
        
    }
    
    public void solve3(){
        
        List<Contact> listOfContact=[Select Id from Contact where AccountId=null];
        
        
        
        Account newAccount;
        
        // so i iterate through contact and creating a new account for it and assigned that account to that contact
        for(Contact contactObj : listOfContact){
            
            newAccount=new Account();
            
            newAccount.Name=contactObj.Id;
           
        }
        
        insert newAccount;
        
        for(Contact contactObj : listOfContact){
            
            contactObj.AccountId=newAccount.Id;
        }
        update listOfContact;
        
    }
    
    public void createAccountAndAssignedToContact(){
        
        List<Contact> listOfContact   = [Select Id from Contact where AccountId=null];       
        Map<Id,Account> mp         = new Map<Id,Account>();
        List<Account> accountList     = new List<Account>();
        
        for(Contact contactObj: listOfContact){
            
            Account newAccount        = new Account(Name = contactObj.Id);
            mp.put(contactObj.Id,newAccount);
            accountList.add(newAccount);
        }
        
        if(!accountList.isEmpty()) insert accountList;
        
        for(Contact contactObj : listOfContact){
            contactObj.AccountId=mp.get(contactObj.Id).Id;
        }
        
        if(!listOfContact.isEmpty()) update listOfContact;      
        
    }
    
    
    // user search contact if there is no contact of that search then create a new contact of that search name
    public List<Contact> getAndCreateContact(String searchName, Boolean isCreated){
        
        List<Contact> contactList 	= new List<Contact>();
        
        contactList					= [Select Id, Name from Contact where Name= :searchName];
        
        if(contactList.isEmpty() && isCreated==true){
            Contact newContact = new Contact();
            newContact.LastName=searchName;
            contactList.add(newContact);
            insert contactList;
            return contactList;
        }
        
        return contactList;
        
        
    }
    
    /* Create 2 Fields on Account, Total No of Opportunities and Total No of Contacts. 
     * Create a Apex method which will take Account Id as input, and 
     * accordingly find the Account and update the newly created 2 fields for searched Account record. 
     */
    
    public void countOfContactAndOpportunityInAccount(String accountId){
        
        Integer countOfContact     = 0;
        Integer countOfOpportunity = 0;
        Account accAndContactAndOpportunity  = [Select Id, (Select Id from contacts ), (Select Id from Opportunities) from Account where Id = :accountId];
        // Account accAndOpportunity  = [Select Id, (Select Id from Opportunities ) from Account where Id = :accountId];
        
        for(Opportunity oppObj : accAndContactAndOpportunity.Opportunities ){
            countOfOpportunity++;
        }
        
        for(Contact contactObj : accAndContactAndOpportunity.Contacts ){
            countOfContact++;
        }
        
        // UPDATING COUNT OF CONTACT AND OPPORTUNITY
        
        accAndContactAndOpportunity.Count_of_Contact__c=countOfContact;
        accAndContactAndOpportunity.Count_of_Opportunity__c=countOfOpportunity;
        
        
        update accAndContactAndOpportunity;
        
    }
    

}