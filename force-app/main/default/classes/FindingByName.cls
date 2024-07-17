public class FindingByName {
    public static List<WrapperInfoAccountContact> wrapperList {get; set;}
    
    public static List<WrapperInfoAccountContact> solve(String searchName){
        
        String objectType;
        String name;
        String lastName;
        String typeOfAccount;
        wrapperList=new List<WrapperInfoAccountContact>();
        
        String sName= searchName+'%';
        List<Account> accList     = [Select Id, Name,Type from Account where Name like :sName];
        List<Contact> contactList = [Select Id, FirstName, LastName from Contact where Name like :sName];
        
        if(contactList!=null){
            for(Contact contactObj : contactList){
                objectType='Contact';
                if(contactObj.FirstName!=null){
                    name=contactObj.FirstName;
                }else name=' ';
                lastName=contactObj.LastName;
                wrapperList.add(new WrapperInfoAccountContact(objectType, name, lastName)); 
            }
            
        }
        
        
        if(accList!=null){
            for(Account accObj : accList){
                objectType='Account';
                name=accObj.Name;
                typeOfAccount=accObj.Type;
                wrapperList.add(new WrapperInfoAccountContact(objectType, name, typeOfAccount)); 
            }
        }
        
        
        return wrapperList;
        
    }

}