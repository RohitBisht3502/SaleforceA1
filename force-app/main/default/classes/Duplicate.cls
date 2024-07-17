public class Duplicate {
    public static void duplicateInString(String str){
        Map<String,Integer> hm  =  new Map<String,Integer>();
        
        for(Integer i=0;i<str.length();i++){
            String ch = str.substring(i,i+1);
            if(hm.containsKey(ch)){
                hm.put(ch,hm.get(ch)+1);
            }else{
                hm.put(ch,1);
            }
        }
        
        for(String ch:hm.keySet()){
            Integer frq=hm.get(ch);
            if(frq>1){
                System.debug(ch+'   '+ frq);
            }
        }
        
    }
}