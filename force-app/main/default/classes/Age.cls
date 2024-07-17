public class Age {
    public static Integer calculateAge(Date dob){
        Date currentDate		= Date.today();        
        Integer birthYear		= dob.year();
        Integer birthMonth		= dob.month();
        Integer birthDay		= dob.year();        
        Integer currentYear		= currentDate.year();
        Integer currentMonth	= currentDate.month();
        Integer currentDay		= currentDate.day();        
        Integer age				= currentYear - birthYear;

        if(birthMonth>currentMonth){
            age--;
        }else if(birthMonth == currentMonth){
            if(birthDay > currentDay){
                age--;
            }
        }
        return age;
    }
    
  
}