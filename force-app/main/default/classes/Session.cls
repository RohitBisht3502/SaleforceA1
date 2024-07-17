public class Session {
     Integer a;
     Integer b;
     Integer c;
    public Session(Integer a,Integer b){
        this.a=a;
        this.b=b;
    }
    
    public Session(Integer a,Integer b,Integer c){
        this.a=a;
        this.b=b;
        this.c=c;
    }

    public void sum(){
        Integer sumOfAB=a+b;
        System.debug(sumOfAB);
    }
    
     public void sum1(){
        Integer sumOfAB=a+b+c;
        System.debug(sumOfAB);
    }

}