public class Soql {
    public static void solve(){
        List<Contact> listOfContact= [SELECT FirstName,LastName from Contact Limit 2];
        for(Contact con: listOfContact){
            System.debug(con.FirstName+'  '+con.LastName);
        }
    }

}