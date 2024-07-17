public class MaxWater {
    public static void maximumWater(){
        List<Integer> list1=new List<Integer>();
        list1.add(10);
        list1.add(11);
        list1.add(10);
        list1.add(12);
        list1.add(10);
        list1.add(15);
        list1.add(9);
        list1.add(7);
        Integer max=0;
        Integer left=0;
        Integer right=list1.size()-1;
        while(left<=right){
            if(list1.get(left)<=list1.get(right-1)){
                max=math.max(max,list1.get(left)*list1.get(right-1));
                left++;
            }else{
                max=math.max(max,list1.get(left)*list1.get(right-1));
                right--;
            }
        }
        System.debug(max);
        
    }

}