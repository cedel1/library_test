package library_test;

import javax.persistence.*;

/**
 * 
 * @author Lukas Riha <cedel@centrum.cz>
 *
 * Class representing Author (sans Books List) and his popularity 
 */
public class PopularAuthor {

    @Id
    @Column(name = "author_id")
    private Long author_id;

    @Column(name = "author_name")
    private String name;

    @Column(name = "author_popularity")
    private int popularity;

    /**
     * Default constructor 
     */
    /*public PopularAuthor() {
    }
     */
    /**
     * Non-Entity class constructor
     */
    public PopularAuthor(Long author_id, String author_name, int author_popularity) {
        this.author_id = author_id;
        this.name = author_name;
        this.popularity = author_popularity;
    }

    /**
     * @return the popularity
     */
    public int getPopularity() {
        return popularity;
    }

    /**
     * @param popularity the popularity to set
     */
    public void setPopularity(int popularity) {
        this.popularity = popularity;
    }

    /**
     * @return the author_id
     */
    public Long getAuthorId() {
        return author_id;
    }

    /**
     * @param authorId the authorId to set
     */
    public void setAuthorId(Long authorId) {
        this.author_id = authorId;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the String representation of this class
     */
    @Override
    public String toString() {
        String ret = ("Author: " + this.getName() + ", Popularity: " + this.getPopularity());
        return ret;
    }
}
