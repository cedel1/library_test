package library_test;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * The persistent class for the "Book" database table.
 * 
 * @author Lukas Riha <cedel@centrum.cz>
 * 
 */
@Entity
@Table(name="\"Book\"")
public class Book implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy=GenerationType.TABLE)
    private Long id;

    private String name;

    //bi-directional many-to-one association to Author
    @ManyToOne
    @JoinColumn(name="fk_author")
    private Author author;

    //bi-directional many-to-many association to Reader
    @ManyToMany(mappedBy="books")
    private List<Reader> readers;

    /**
     * default constructor
     */
    public Book() {
    }

    /**
     * 
     * @return Long id
     */
    public Long getId() {
        return this.id;
    }

    /**
     * 
     * @param id Long
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 
     * @return
     */
    public String getName() {
        return this.name;
    }

    /**
     * Set Author's name
     * @param name String
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 
     * @return Author
     */
    public Author getAuthor() {
        return this.author;
    }

    /**
     * 
     * @param author
     */
    public void setAuthor(Author author) {
        this.author = author;
    }

    /**
     * Return a List of Reader'đ that read this book
     * @return List<Reader>
     */
    public List<Reader> getReaders() {
        return this.readers;
    }

    /**
     * Set a List of Readers that read this book  
     * @param readers
     */
    public void setReaders(List<Reader> readers) {
        this.readers = readers;
    }

}