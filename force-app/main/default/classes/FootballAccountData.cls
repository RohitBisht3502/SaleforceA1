public with sharing class FootballAccountData {
    public FootballAccountData() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountDetails(){
        List<Account> accountList=[Select Id,Name from Account];
        return accountList;
    }
}