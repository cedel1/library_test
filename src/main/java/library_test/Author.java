package library_test;

import java.io.Serializable;
import java.util.List;

import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;

/**
 *
 * The persistent class for the "Reader" database table. 
 *
 * @author Lukas Riha <cedel@centrum.cz>
 *
 */
@Entity
@Table(name="\"Author\"")
@SqlResultSetMapping(name = "PopularAuthorMapping",
classes = {
        @ConstructorResult(
                targetClass = library_test.PopularAuthor.class,
                columns = {
                        @ColumnResult(name = "author_id", type = Long.class),
                        @ColumnResult(name = "author_name", type = String.class),
                        @ColumnResult(name = "author_popularity", type = int.class)
                }
                )
}
        )
public class Author implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy=GenerationType.TABLE)
    private Long id;

    private String name;

    //bi-directional many-to-one association to Book
    @OneToMany(mappedBy="author")
    private List<Book> books;

    /**
     * default constructor
     */
    public Author() {
    }

    /**
     * 
     * @return Long Id - AUthor's Id
     */
    public Long getId() {
        return this.id;
    }

    /**
     * 
     * @param id - Author Id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 
     * @return String name - Author name
     */
    public String getName() {
        return this.name;
    }

    /**
     * 
     * @param name String - Set Author name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 
     * @return List<Book> - Books by Author
     */
    public List<Book> getBooks() {
        return this.books;
    }

    /**
     * 
     * @param books List<Book> - Set a list of Books to Author
     */
    public void setBooks(List<Book> books) {
        this.books = books;
    }

    /**
     * Add a Book to Author's list of Books
     * @param book Book
     * @return Book
     */
    public Book addBook(Book book) {
        getBooks().add(book);
        book.setAuthor(this);

        return book;
    }

    /**
     * Remove a book from Author's list of Books
     * @param book Book
     * @return Book
     */
    public Book removeBook(Book book) {
        getBooks().remove(book);
        book.setAuthor(null);

        return book;
    }

}