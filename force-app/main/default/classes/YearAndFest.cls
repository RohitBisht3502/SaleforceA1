public class YearAndFest {
    public Integer year;
    public String festival;
    public YearAndFest(Integer year,String festival){
        this.year=year;
        this.festival=festival;
    }
    
    // Overriding equals method
    public Boolean equals(Object obj) {
        if (obj == null || !(obj instanceof YearAndFest)) {
            return false;
        }
        YearAndFest other = (YearAndFest) obj;
        return this.year == other.year && this.festival == other.festival;
    }

    // Overriding hashCode method
    public Integer hashCode() {
        return (String.valueOf(year) + festival).hashCode();
    }
}