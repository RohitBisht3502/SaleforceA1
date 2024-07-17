public class WrapperInfoAccountContact {
    public String objectType{get; set;}
    public String name{get; set;}
    public String lastName{get; set;}
    
    public WrapperInfoAccountContact(String objectType,String name,String lastName){
        this.objectType=objectType;
        this.name=name;
        this.lastName=lastName;
    }

}