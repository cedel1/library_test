package library_test;

import java.sql.Timestamp;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2018-02-26T22:01:47.034+0100")
@StaticMetamodel(Reader.class)
public class Reader_ {
	public static volatile SingularAttribute<Reader, Long> id;
	public static volatile SingularAttribute<Reader, Timestamp> birthday;
	public static volatile SingularAttribute<Reader, String> name;
	public static volatile ListAttribute<Reader, Book> books;
}
