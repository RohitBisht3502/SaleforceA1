public class DatbaseInsert {
    public void solve(){
        Account a = new Account(name = 'Acme1');
        Database.SaveResult[] lsr = Database.insert( new Account[]{a, new Account(Name = 'Acme2')},false);
    }

}