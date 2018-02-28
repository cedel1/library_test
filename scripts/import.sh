#!/bin/bash
SERVER_DEF="localhost"
PORT_DEF="5432"
USER_DEF="postgres"
DATABASE_DEF="library_test"
DELIMITER_DEF=";"
HEADER_DEF="Y"
PATH_DEF="/tmp/db_import/"
TABLES=("Author" "Reader" "Book" "Reader_book")

askforheader() {
echo -n "Do the CSV files contain header row? (Y/N): "
while read -e -r -n 1 -s ANSWER; do
  if [[ $ANSWER = [YyNn] ]]; then
    [[ $ANSWER = [Yy] ]] && RETVAL=0
    [[ $ANSWER = [Nn] ]] && RETVAL=1
    break
  fi
done

return $RETVAL
}

askpermission() {
echo -n "Proceed importing data? (Y/N): "
while read -e -r -n 1 -s ANSWER; do
  if [[ $ANSWER = [YyNn] ]]; then
    [[ $ANSWER = [Yy] ]] && RETVAL=0
    [[ $ANSWER = [Nn] ]] && RETVAL=1
    break
  fi
done

return $RETVAL
}

command -v psql >/dev/null 2>&1 || { echo >&2 "psql needs to be installed and on your PATH.  Aborting."; exit 1; }
read -i $SERVER_DEF -e -p "Enter PostgreSQL address ($SERVER_DEF): " SERVER
read -i $PORT_DEF -e -p "Enter PostgreSQL server port ($PORT_DEF): " PORT
read -i $DATABASE_DEF -e -p "Enter PostgreSQL database ($DATABASE_DEF): " DATABASE
read -i $USER_DEF -e -p "Enter PostgreSQL user ($USER_DEF): " USER
read -i $PATH_DEF -e -p "Enter CSV files path ($PATH_DEF): " PATH_FIN
read -i $DELIMITER_DEF -e -p "Enter CSV files delimiter ($DELIMITER_DEF): " DELIMITER
if askforheader; then
	HEADER="HEADER"
else
	HEADER=""
fi

if askpermission; then
	for i in ${TABLES[@]};
		do
			echo "psql -U $USER -p $PORT $PASSWORD -h $SERVER -d $DATABASE -c 'COPY \"$i\" FROM '$PATH_FIN$i.csv' DELIMITERS '$DELIMITER' CSV $HEADER'"
			psql -U $USER -p $PORT -h $SERVER $DATABASE -c "COPY \"$i\" FROM '$PATH_FIN$i.csv' DELIMITERS '$DELIMITER' CSV $HEADER"
		done
else
	echo "Shutting down."
fi

echo ""
echo "Finished."


