@isTest
public class AccountProcessorTest {
    
    @testSetup
    static void setup() {
        // Create test data: accounts and contacts
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            accounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert accounts;
        
        List<Contact> contacts = new List<Contact>();
        for (Account acc : [SELECT Id FROM Account]) {
            for (Integer j = 0; j < 2; j++) {
                contacts.add(new Contact(LastName = 'Test Contact ' + j, AccountId = acc.Id));
            }
        }
        insert contacts;
    }

    @isTest
    static void testCountContacts() {
        // Get the accounts created in testSetup
        List<Account> accounts = [SELECT Id FROM Account];
        List<Id> accountIds = new List<Id>();
        for (Account acc : accounts) {
            accountIds.add(acc.Id);
        }
        
        // Call the future method
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        // Verify that the Number_Of_Contacts__c field is updated correctly
        List<Account> updatedAccounts = [SELECT Id, Number_Of_Contacts__c FROM Account];
        for (Account acc : updatedAccounts) {
            System.assertEquals(2, acc.Number_Of_Contacts__c, 'Each account should have 2 contacts.');
        }
    }

    @isTest
    static void testCountContactsNoContacts() {
        // Create an account with no contacts
        Account acc = new Account(Name = 'No Contacts Account');
        insert acc;
        
        // Call the future method
        Test.startTest();
        AccountProcessor.countContacts(new List<Id>{acc.Id});
        Test.stopTest();
        
        // Verify that the Number_Of_Contacts__c field is updated correctly
        Account updatedAcc = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(0, updatedAcc.Number_Of_Contacts__c, 'The account should have 0 contacts.');
    }
}