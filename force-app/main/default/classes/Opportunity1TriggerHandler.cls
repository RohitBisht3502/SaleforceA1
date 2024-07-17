public with sharing class Opportunity1TriggerHandler {
    public Opportunity1TriggerHandler() {

    }

    public static void onInsertionUpdateCount(List<Opportunity> oppNewList){
        Set<Id> accountIds=new Set<Id>();

        for(Opportunity oppObj : oppNewList){
            accountIds.add(oppObj.AccountId);
        }

        countOfOpportunity(accountIds);
    }

    public static void onUpdationUpdateCount(Map<Id,Opportunity> newMap ,Map<Id,Opportunity> oldMap){
        Set<Id> accountIds=new Set<Id>();
        for(Opportunity oppObj : newMap.values()){
            // on this case if opportunity is updated in a way to change account then we have to track old accountId also
            if(oppObj.AccountId!=null && oppObj.AccountId!=oldMap.get(oppObj.Id).AccountId){
                accountIds.add(oldMap.get(oppObj.Id).AccountId);
            }
            // track of new account Id 
            if(oppObj.AccountId!=null) accountIds.add(oppObj.AccountId);
            
        }
        countOfOpportunity(accountIds);
    }

    public static void onDeletionUpdateCount(List<Opportunity> oldList){
        Set<Id> accountIds =new Set<Id>();
        for(Opportunity oppObj : oldList){
            if(oppObj.AccountId!=null){
                accountIds.add(oppObj.AccountId);
            }
        }
        countOfOpportunity(accountIds);
        
    }
    public static void countOfOpportunity(Set<Id> accountIds){
        List<Account> accList=[Select Id, Count_of_Opportunity__c,(SELECT Id from Opportunities) from Account where Id in:accountIds];
        for(Account accObj : accList){
            accObj.Count_of_Opportunity__c =accObj.Opportunities.size();
        }
        update accList;

    }

   
}