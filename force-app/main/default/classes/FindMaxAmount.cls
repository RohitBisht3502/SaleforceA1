public class FindMaxAmount {
    public static void solve(){
        
        Decimal sum=0;
        
        Decimal max=0;
        
        String accountName;
        
        List<Account> listOfAccount=[Select Name, (Select Amount from Opportunities) from Account];
        
        for(Account acc: listOfAccount){
            
            for (Opportunity opp : acc.Opportunities){
                if (opp.Amount != null){
                    sum+=opp.Amount;
                }
            }
            
            if(sum>max){
                max=sum;
                accountName=acc.Name;
            }
        }
        System.debug(accountName+'  '+max);
    }

}