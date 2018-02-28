package library_test;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

/**
 * 
 * @author Lukas Riha <cedel@centrum.cz>
 *
 */
public class LibraryTest {

    public static void main(String[] args) throws Exception {
        System.out.println("Starting...");

        try {
            EntityManager entityManager = Persistence.createEntityManagerFactory("library_test").createEntityManager();
            //Since we're only querying data, transaction is not absolutely necessary
            //EntityTransaction transaction = entityManager.getTransaction();
            //transaction.begin();
            
            try {
                //Authors with at least one book
                System.out.println("Author with at least one book:");

                List<Author> authors = entityManager.createNamedQuery("Author.withBooks", Author.class).getResultList();
                for (Author a : authors) {
                    System.out.println(a.getName());
                }

            } catch (Exception e) {
                entityManager.clear();
                System.out.println("Unable to get Authors with at least one book.");
                System.out.println("The Exception is: " + e.toString());
            }

            try {
                //Number of Readers by year of birth
                System.out.println("Number of Readers by year:");

                List<ReaderYear> readeryear = entityManager.createNamedQuery("Reader.byYear", ReaderYear.class).getResultList();
                for (ReaderYear r: readeryear) {
                    System.out.println(r);
                }
            } catch (Exception e ) {
                entityManager.clear();
                System.out.println("Unable to get Num,ber of Readers by year of birth.");
                System.out.println("The Exception is: " + e.toString());
            }

            try {
                //3 most popular Authors (popularity as total number of Books read by Readers)
                System.out.println("3 most popular Authors:");

                List<PopularAuthor> popularauthors = entityManager.createNamedQuery("Author.byPopularity", PopularAuthor.class).setParameter("numlimit", 3).getResultList();
                for (PopularAuthor pa : popularauthors) {
                    System.out.println(pa);
                }
            } catch (Exception e) {
                entityManager.clear();
                System.out.println("Unable to get the 3 most popular Authors.");
                System.out.println("The Exception is: " + e.toString());
            }

            entityManager.clear();
            entityManager.close();

          //transaction.commit();
        } catch (Exception exc) {
            System.out.println("Cannot connect to the database: " + exc.toString());
        }

        System.out.println("Finished.");
        
        System.exit(0);
    }
}
