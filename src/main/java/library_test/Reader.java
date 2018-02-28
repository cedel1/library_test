package library_test;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;

/**
 * The persistent class for the "Reader" database table.
 * 
 * @author Lukas Riha <cedel@centrum.cz>
 * 
 */
@Entity
@Table(name="\"Reader\"")
@SqlResultSetMapping(name = "ReaderYearMapping",
classes = {
        @ConstructorResult(
                targetClass = library_test.ReaderYear.class,
                columns = {
                        @ColumnResult(name = "year", type = String.class),
                        @ColumnResult(name = "count", type = int.class)
                }
                )
}
        )
public class Reader implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy=GenerationType.TABLE)
    private Long id;

    private Timestamp birthday;

    private String name;

    //bi-directional many-to-many association to Book
    @ManyToMany
    @JoinTable(
            name="\"Reader_book\""
            , joinColumns={
                    @JoinColumn(name="fk_reader")
            }
            , inverseJoinColumns={
                    @JoinColumn(name="fk_book")
            }
            )
    private List<Book> books;

    /**
     * default constructor
     */
    public Reader() {
    }

    /**
     * 
     * @return Long Reader Id
     */
    public Long getId() {
        return this.id;
    }

    /**
     * 
     * @param Long id  - Reader id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 
     * @return Timestamp  - Reader's birthday
     */
    public Timestamp getBirthday() {
        return this.birthday;
    }

    /**
     * 
     * @param Timestamp birthday - Reader's birthday
     */
    public void setBirthday(Timestamp birthday) {
        this.birthday = birthday;
    }

    /**
     * 
     * @return String name - Reader's name
     */
    public String getName() {
        return this.name;
    }

    /**
     * 
     * @param String name - Reader's name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Represents Books read by Reader
     * @return List of Book objects
     */
    public List<Book> getBooks() {
        return this.books;
    }

    /**
     * Asociates Books in list to Reader
     * @param List<Book> - books
     */
    public void setBooks(List<Book> books) {
        this.books = books;
    }

}