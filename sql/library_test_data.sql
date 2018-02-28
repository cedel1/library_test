--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.7
-- Dumped by pg_dump version 9.6.7

-- Started on 2018-02-27 23:45:52 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 3131 (class 0 OID 16388)
-- Dependencies: 186
-- Data for Name: Author; Type: TABLE DATA; Schema: public; Owner: lib_test
--

INSERT INTO "Author" (id, name) VALUES (1, 'testauthor1');
INSERT INTO "Author" (id, name) VALUES (2, 'testauthor2');
INSERT INTO "Author" (id, name) VALUES (3, 'testauthor3');
INSERT INTO "Author" (id, name) VALUES (4, 'testauthor4');


--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 185
-- Name: Author_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lib_test
--

SELECT pg_catalog.setval('"Author_author_id_seq"', 4, true);


--
-- TOC entry 3133 (class 0 OID 16396)
-- Dependencies: 188
-- Data for Name: Book; Type: TABLE DATA; Schema: public; Owner: lib_test
--

INSERT INTO "Book" (id, name, fk_author) VALUES (1, 'testbook1_author1', 1);
INSERT INTO "Book" (id, name, fk_author) VALUES (2, 'testbook2_author1', 1);
INSERT INTO "Book" (id, name, fk_author) VALUES (3, 'testbook1 author2', 2);
INSERT INTO "Book" (id, name, fk_author) VALUES (4, 'testbook2 author2', 2);
INSERT INTO "Book" (id, name, fk_author) VALUES (5, 'testbook1 author3', 3);


--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 187
-- Name: Book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lib_test
--

SELECT pg_catalog.setval('"Book_id_seq"', 5, true);


--
-- TOC entry 3135 (class 0 OID 16409)
-- Dependencies: 190
-- Data for Name: Reader; Type: TABLE DATA; Schema: public; Owner: lib_test
--

INSERT INTO "Reader" (id, name, birthday) VALUES (1, 'reader1', '2018-02-26 13:32:50.986583');
INSERT INTO "Reader" (id, name, birthday) VALUES (2, 'reader2', '2000-01-01 00:00:00');
INSERT INTO "Reader" (id, name, birthday) VALUES (3, 'reader3', '1976-05-05 00:00:00');
INSERT INTO "Reader" (id, name, birthday) VALUES (4, 'reader4', '1976-01-01 00:00:00');
INSERT INTO "Reader" (id, name, birthday) VALUES (5, 'reader5', '2011-12-01 23:45:15.456');


--
-- TOC entry 3136 (class 0 OID 16415)
-- Dependencies: 191
-- Data for Name: Reader_book; Type: TABLE DATA; Schema: public; Owner: lib_test
--

INSERT INTO "Reader_book" (fk_book, fk_reader) VALUES (1, 1);
INSERT INTO "Reader_book" (fk_book, fk_reader) VALUES (1, 2);
INSERT INTO "Reader_book" (fk_book, fk_reader) VALUES (1, 3);
INSERT INTO "Reader_book" (fk_book, fk_reader) VALUES (1, 4);
INSERT INTO "Reader_book" (fk_book, fk_reader) VALUES (2, 3);
INSERT INTO "Reader_book" (fk_book, fk_reader) VALUES (2, 4);
INSERT INTO "Reader_book" (fk_book, fk_reader) VALUES (3, 1);
INSERT INTO "Reader_book" (fk_book, fk_reader) VALUES (3, 3);
INSERT INTO "Reader_book" (fk_book, fk_reader) VALUES (4, 1);
INSERT INTO "Reader_book" (fk_book, fk_reader) VALUES (5, 2);


--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 189
-- Name: Reader_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lib_test
--

SELECT pg_catalog.setval('"Reader_id_seq"', 5, true);


-- Completed on 2018-02-27 23:45:52 CET

--
-- PostgreSQL database dump complete
--

