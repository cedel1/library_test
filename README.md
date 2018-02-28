# library_test
Java/JPA/Maven/Shell Scripts test

1. There's a Maven pom.xml in topmost directory to build the app with Maven. Included is whole project from Eclipse.
2. sql dir contains sql files to recreate database, complete with sample data, structure without data or just data. Created with PostgreSQL 9.6.7-1 from Fedora 27 install.
3. scripts/db_import dir contains the same sample data (as the sql scripts) in individual .csv files
4. scripts dir contains import.sh (Bash) script to import the sample .csv files into database. It assumes the files (sans file-type suffix) have the same name as target tables. Apart from that, it should lead you through the process of import.

CAVEAT: The .csv files have to be copied to a location where the database server can acess them, such as /tmp/db_import/ .
