public class MappingClass {
    public static void main(Integer year){
        Map<Integer,List<Map<String,Date>>> hm=new  Map<Integer,List<Map<String,Date>>>();

        // 2020
        List<Map<String,Date>> l1=new List<Map<String,Date>>();

        Map<String,Date> m1=new Map<String,Date>();
        m1.put('Diwali',Date.newInstance(2020, 11, 14));
        m1.put('Holi',Date.newInstance(2020, 6, 12));
        l1.add(m1);
        l1.add(m1);
        hm.put(2020, l1);

        
        // //
        // // 2021
       
        List<Map<String,Date>> l2=new List<Map<String,Date>>();

        Map<String,Date> m2=new Map<String,Date>();
        m2.put('Diwali',Date.newInstance(2021, 11, 12));
        m2.put('Holi',Date.newInstance(2021, 3, 13));
        l2.add(m2);
        l2.add(m2);
        hm.put(2021, l2);

        // // 2022
        List<Map<String,Date>> l3=new List<Map<String,Date>>();

        Map<String,Date> m3=new Map<String,Date>();
        m3.put('Diwali',Date.newInstance(2022, 11, 3));
        m3.put('Holi',Date.newInstance(2022, 3, 1));
        l3.add(m3);
        l3.add(m3);
        hm.put(2022, l3);

        // // 2023
        List<Map<String,Date>> l4=new List<Map<String,Date>>();

        Map<String,Date> m4=new Map<String,Date>();
        m4.put('Diwali',Date.newInstance(2023, 11, 16));
        m4.put('Holi',Date.newInstance(2023, 3, 15));
        l4.add(m4);
        l4.add(m4);
         hm.put(2023, l4);


        // // 2024
        List<Map<String,Date>> l5=new List<Map<String,Date>>();

        Map<String,Date> m5=new Map<String,Date>();
        m5.put('Diwali',Date.newInstance(2024, 11, 1));
        m5.put('Holi',Date.newInstance(2024, 3, 25));
        l5.add(m5);
        l5.add(m5);
        hm.put(2024, l5);


        // // 2025
        List<Map<String,Date>> l6=new List<Map<String,Date>>();

        Map<String,Date> m6=new Map<String,Date>();
        m6.put('Diwali',Date.newInstance(2025, 10, 21));
        m6.put('Holi',Date.newInstance(2025, 3, 14));
        l6.add(m6);
        l6.add(m6);
        hm.put(2025, l6);
        
        System.debug(hm.get(year));
    }

}