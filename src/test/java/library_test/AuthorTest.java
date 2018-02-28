package library_test;
import static org.junit.Assert.*;

import java.util.Collections;
import java.util.List;

import javax.persistence.OneToMany;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;

import library_test.Author;
import library_test.Book;

/**
 * @author Lukas Riha <cedel@centrum.cz>
 *
 */
public class AuthorTest {
    private Author author;

    /**
     * @throws java.lang.Exception
     */
    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
    }

    /**
     * @throws java.lang.Exception
     */
    @AfterClass
    public static void tearDownAfterClass() throws Exception {
    }

    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        author = new Author(); 
    }

    /**
     * @throws java.lang.Exception
     */
    @After
    public void tearDown() throws Exception {
    }

    /**
     * Test method for {@link library_test.Author#Author()}.
     */
    @Test
    public final void testAuthor_constructor() {
        assertNotNull("Instance Author nebyla vytvorena!", author);
    }

    /**
     * Test method for {@link library_test.Author#getId()}.
     */
    @Test
    public final void testGetId() {
        assertNull("Author.id is not null!", author.getId());
    }

    /**
     * Test method for {@link library_test.Author#setId(java.lang.Long)}.
     */
    @Test
    public final void testSetId() {
        author.setId((long) 32);
        assertTrue("Setting of Author Id not successfull:", (long) 32 == author.getId());
    }

    /**
     * Test method for {@link library_test.Author#getName()}.
     */
    @Test
    public final void testGetName() {
        assertNull("Author.name is not null!", author.getName());
    }

    /**
     * Test method for {@link library_test.Author#setName(java.lang.String)}.
     */
    @Ignore("Not yet implemented")
    @Test
    public final void testSetName() {
        fail("Not yet implemented"); // TODO
    }

    /**
     * Test method for {@link library_test.Author#getBooks()}.
     */
    @Test
    public final void testGetBooks() {
        assertEquals("Author.books is not null!", author.getBooks(), null);
    }

    /**
     * Test method for {@link library_test.Author#setBooks(java.util.List)}.
     */
    @Ignore("Not yet implemented")
    @Test
    public final void testSetBooks() {
        fail("Not yet implemented"); // TODO
    }

    /**
     * Test method for {@link library_test.Author#addBook(library_test.Book)}.
     */
    @Ignore("Not yet implemented")
    @Test
    public final void testAddBook() {
        fail("Not yet implemented"); // TODO
    }

    /**
     * Test method for {@link library_test.Author#removeBook(library_test.Book)}.
     */
    @Ignore("Not yet implemented")
    @Test
    public final void testRemoveBook() {
        fail("Not yet implemented"); // TODO
    }

}
