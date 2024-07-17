public class Solve {
    
    public static void operationsOnList(){
        List<Integer> list1=new List<Integer>();
        list1.add(1);
        list1.add(2);
        list1.add(3);
        list1.add(4);
        
        // for getting element from list
        for(Integer i=0;i<list1.size();i++){
            System.debug(list1.get(i));
        }
        
        // removing 
        Integer index=2;
        list1.remove(index);
        // is element present in list or not
        Integer ele=2;
        if(list1.contains(ele)){
            System.debug('Is present');
        }else{
            System.debug('Not present');
        }
        
    }

}