public with sharing class CaseController {
    public CaseController() {

    }

    @AuraEnabled
    public static Case getCase(Id caseId){
        try {
            return [Select Id,Subject,Description,Status from Case where Id =: caseId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}