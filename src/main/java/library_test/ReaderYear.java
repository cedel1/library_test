package library_test;

import javax.persistence.*;

/**
 * 
 * @author Lukas Riha <cedel@centrum.cz>
 *
 * Class representing combination of year and number of Readers born that year
 */
public class ReaderYear {

    private String year;
    private int count;

    /*public ReaderYear() {
    }*/

    public ReaderYear(String year, int count) {
        this.year = year;
        this.count = count;
    }

    /**
     * @return the year
     */
    @Id
    @Column(name="year", length=4)
    public String getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(String year) {
        this.year = year;
    }

    /**
     * @return the count
     */
    @Column(name="count")
    public int getCount() {
        return count;
    }

    /**
     * @param count the count to set
     */
    public void setCount(int count) {
        this.count = count;
    }

    /**
     * @return the String representation of this class
     */
    @Override
    public String toString() {
        String res = this.getYear() + ": " + this.getCount();
        return res;
    }
}
