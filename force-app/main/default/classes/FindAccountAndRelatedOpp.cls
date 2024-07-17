public class FindAccountAndRelatedOpp {
    
    public Map<String ,List<Opportunity>> solve(List<String> accountIds){
        
        Map<String ,List<Opportunity>> mp = new Map<String ,List<Opportunity>>();
            
        
        for(String accId : accountIds){
            
            Account accObj                = [Select Id ,(Select Id from Opportunities ) from Account where Id= :accId];
            
            List<Opportunity> oppList=new List<Opportunity>();
            
            for(Opportunity oppObject : accObj.Opportunities){
                oppList.add(oppObject);
            }
            
            mp.put(accId,oppList);
            
        }
        
        return mp;    
        
    }

}