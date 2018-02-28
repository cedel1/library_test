package library_test;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2018-02-26T23:49:52.449+0100")
@StaticMetamodel(Author.class)
public class Author_ {
	public static volatile SingularAttribute<Author, Long> id;
	public static volatile SingularAttribute<Author, String> name;
	public static volatile ListAttribute<Author, Book> books;
}
