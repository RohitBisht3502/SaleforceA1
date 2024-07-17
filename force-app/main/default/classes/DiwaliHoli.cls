public class DiwaliHoli {
    public static void main(Integer year,String festival){
        
        Map<YearAndFest, Date> festivalMap = new Map<YearAndFest, Date>();

        // Adding festivals for the year 2020
        festivalMap.put(new YearAndFest(2020, 'Diwali'), Date.newInstance(2020, 11, 14));
        festivalMap.put(new YearAndFest(2020, 'Holi'), Date.newInstance(2020, 3, 10));
        
        // Adding festivals for the year 2021
        festivalMap.put(new YearAndFest(2021, 'Diwali'), Date.newInstance(2021, 11, 4));
        festivalMap.put(new YearAndFest(2021, 'Holi'), Date.newInstance(2021, 3, 29));

        // Creating the key to search in the map
        YearAndFest searchKey = new YearAndFest(year, festival);
        
        System.debug(festivalMap.get(searchKey));
    }
}