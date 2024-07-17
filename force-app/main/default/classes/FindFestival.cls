public class FindFestival {
     public static void main(Integer year,String festival){
        
        Map<String, Date> hm = new Map<String, Date>();
         
        hm.put('2020_Diwali', Date.newInstance(2020, 11, 14));
        hm.put('2020_Holi', Date.newInstance(2020, 3, 10));
        
        hm.put('2021_Diwali', Date.newInstance(2021, 11, 4));
        hm.put('2021_Holi', Date.newInstance(2021, 3, 29));
        
        hm.put('2022_Diwali', Date.newInstance(2022, 10, 14));
        hm.put('2022_Holi', Date.newInstance(2022, 4, 3));
        
        hm.put('2023_Diwali', Date.newInstance(2023, 11, 4));
        hm.put('2023_Holi', Date.newInstance(2023, 3, 29));
         
        hm.put('2024_Diwali', Date.newInstance(2024, 11, 4));
        hm.put('2024_Holi', Date.newInstance(2024, 3, 15));
        
        hm.put('2025_Diwali', Date.newInstance(2025, 11, 5));
        hm.put('2025_Holi', Date.newInstance(2025, 3, 2));
         

       
        String key = year + '_' + festival;
         
         if(hm.containsKey(key)){
             System.debug(hm.get(key));
         }else{
             System.debug('Not found');
         }
    }

}