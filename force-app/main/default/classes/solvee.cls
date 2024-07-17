public class solvee {
    public static void operationsOnSet(){
        Set<Integer> set1=new Set<Integer>();
        
        // add in set
        set1.add(10);
        set1.add(20);
        set1.add(30);
        set1.add(50);
        set1.add(60);
        set1.add(70);
        set1.add(100);
        set1.add(120);
        set1.add(200);
        
     
        
        // contains
        Integer element = 50;
        if(set1.contains(element)){
            System.debug('Present');
        }else{
            System.debug('Not Present');
        }
        // particular index
      
        //remove
        
        System.debug(set1.remove(200));
        
        
    }

}