public class MaxOpportunity {
    
    public static void solve(){
        Opportunity maxOpportunity=[Select Name ,Amount from Opportunity ORDER by Amount DESC NULLS LAST LIMIT 1];
        System.debug(maxOpportunity.name+' : '+maxOpportunity.Amount);
    }
    
     public static void byUsingMaxFunction(){
         
         
       List<Opportunity> list1=[Select Name,Amount from Opportunity];
       Decimal max=0;
       String res='';
       for(Opportunity oppo : list1){
             if(oppo.Amount>max){
                 res=oppo.Name;
                 max=oppo.Amount;
             }
           
         }
      /*   for(Opportunity oppo : list1){
             if(oppo.Amount==max){
                 res=oppo.Name;
             }
           
         } */
         System.debug(res +' ' +max);
      
    }

}