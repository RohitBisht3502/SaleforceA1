public class OpportunityTriggerHandler {
    
    // trigger handler when an opportunity is insert and we have to set Hot Opportunity in its description
    public static void onInsertionUpdateDescription(List<Opportunity> newList){
        for(Opportunity oppObj : newList){
            if(oppObj.Amount>=10000 && oppObj.Amount<=25000){
                oppObj.Description='Hot Opportunit';
            }
        }
    }
    public static boolean isMatched(Decimal rollUp,Decimal count){
        if(rollUp==count) return true;
        else return false;
    }
    
    public static void onUpdatingOppInAccountUpdateCount(Map<Id, Opportunity> oldMap, Map<Id, Opportunity> newMap, List<Opportunity> oldList, List<Opportunity> newList) {
    Set<Id> accountIds = new Set<Id>();
    List<Account> accList = new List<Account>();

    for (Opportunity oppObj : oldList) {
        Opportunity newOpp = newMap.get(oppObj.Id);
        if (oppObj.AccountId != newOpp.AccountId) {
            // Add both the old and new Account Ids for the affected Opportunities
            if (oppObj.AccountId != null) accountIds.add(oppObj.AccountId);
            if (newOpp.AccountId != null) accountIds.add(newOpp.AccountId);
        } else if (oppObj.AccountId != null) {
            accountIds.add(oppObj.AccountId);
        }
    }

    // Query the accounts once
    accList = [SELECT Id, Name, Count_of_Opportunity__c, (SELECT Id, Name FROM Opportunities) FROM Account WHERE Id IN :accountIds];

    for (Account accObj : accList) {
        Integer count = accObj.Opportunities.size();
        accObj.Count_of_Opportunity__c = count;
    }

    // Update the accounts with the new opportunity counts
    update accList;
}

    
  /*  public static void onUpdatingOppInAccountUpdateCount(Map<Id,Opportunity> oldMap,Map<Id,Opportunity> newMap,List<Opportunity> oldList,List<Opportunity> newList){
        Set<Id> accountIds =new Set<Id>();
       // Set<Id> accountChangedIds =new Set<Id>();
        List<Opportunity> insertList=new List<Opportunity>();
        List<Opportunity> deleteList=new List<Opportunity>();
        for(Opportunity oppObj : oldList){
            if(oppObj.AccountId!=newMap.get(oppObj.Id).AccountId){
               insertList.add(newMap.get(oppObj.Id));
               deleteList.add(oppObj);
              //  accountChangedIds.add(oppObj.AccountId);
                
            }else if(oppObj.AccountId!=null) accountIds.add(oppObj.AccountId);
        }
        
        onInsertingOppInAccountUpdateCount(insertList);
        onDeletingOppInAccountUpdateCount(deleteList);
        
        List<Account> accList=[Select Id, Name, Count_of_Opportunity__c,(Select Id,Name from Opportunities) from Account where Id in : accountIds];
        
        for(Account accObj : accList){
            Integer count=0;
            for(Opportunity oppObj : accObj.Opportunities){
                count++;
            }
            accObj.Count_of_Opportunity__c=count;
            

        }
        
        // for updating a opp account 
        
    /*    for(Account accObj : [Select Id, Name, Count_of_Opportunity__c,(Select Id,Name from Opportunities) from Account where Id in : accountChangedIds]){
            Integer count=0;
            for(Opportunity oppObj : accObj.Opportunities){
                count++;
            }
            accObj.Count_of_Opportunity__c=count;
            

        } */
        
        
    //    update accList;
      
  //  } 
    public static void onDeletingOppInAccountUpdateCount(List<Opportunity> oldList){
        Set<Id> accountIds =new Set<Id>();
        for(Opportunity oppObj : oldList){
            if(oppObj.AccountId!=null){
                accountIds.add(oppObj.AccountId);
            }
        }
        
        List<Account> accList=[Select Id, Name, Count_of_Opportunity__c,(Select Id,Name from Opportunities) from Account where Id in : accountIds];
        
        for(Account accObj : accList){
            Integer count=0;
            for(Opportunity oppObj : accObj.Opportunities){
                count++;
            }
            accObj.Count_of_Opportunity__c=count;
            

        }
        
        update accList;
    }
    public static void onInsertingOppInAccountUpdateCount(List<Opportunity> newList){
        Set<Id> accountIds =new Set<Id>();
        for(Opportunity oppObj : newList){
            if(oppObj.AccountId!=null){
                accountIds.add(oppObj.AccountId);
            }
        }
        List<Account> accList=[Select Id, Name, Count_of_Opportunity__c,(Select Id,Name from Opportunities) from Account where Id in : accountIds];
        
        for(Account accObj : accList){
            Integer count=0;
            for(Opportunity oppObj : accObj.Opportunities){
                count++;
            }
            accObj.Count_of_Opportunity__c=count;
            

        }
        
        update accList;
      
        
        
    }
    
    public static void onDeleteOpportunityOnlySystemAdmin(Map<Id,Opportunity> oldMap){
        Profile adminProfile =[Select Id from Profile Where Name = 'System Administrator' limit 1];
        
        List<Opportunity> oppList=oldMap.values();
        for(Opportunity oppObj : oppList ){
            if(System.UserInfo.getProfileId()!=adminProfile.Id && (oppObj.StageName=='Closed' || oppObj.StageName=='Closed Won')){
                oppObj.addError('You dont have access to delete this opportunity');
            }
        }
        
        
        
    }
    
    public static void onUpdateOfTotalOpportunityAmountInAccount(List<Opportunity> oppNewList,Map<Id,Opportunity> newMap){
        List<Opportunity> closedWonOppList=new List<Opportunity>();
        for(Opportunity oppObj  : oppNewList){
            if(oppObj.StageName=='Closed Won') closedWonOppList.add(oppObj);
        }
        
        Set<Id> accountIds=new Set<Id>();
        for(Opportunity oppObj : closedWonOppList){
            accountIds.add(oppObj.AccountId);
        }
        
        List<Account> accList=[Select Id,(Select Amount,StageName from Opportunities where StageName='Closed Won' ) from Account where Id in :accountIds];
        
        for(Account accObj : accList){
            Decimal totalAmount =0;
            for(Opportunity oppObj : accObj.Opportunities){
                totalAmount+=oppObj.Amount;
            }
            accObj.Total_Opportunity_Amount__c=totalAmount;
        }
        
        update accList; 
        
        
        
        
        
    }
    
   

}