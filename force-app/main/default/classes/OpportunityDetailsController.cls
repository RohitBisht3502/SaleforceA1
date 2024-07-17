public with sharing class OpportunityDetailsController {
    public OpportunityDetailsController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getAllOpportunity(){
        try {
            return [Select Id,Name,StageName,CloseDate from Opportunity];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void updateAccountDetails(Object accountData){
            List<Opportunity> oppList =(List<Opportunity>) JSON.deserialize(JSON.serialize(accountData), List<Opportunity>.class);
            if(!oppList.isEmpty()){
                update oppList;
            }

    }
}