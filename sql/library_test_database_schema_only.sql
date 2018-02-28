--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.7
-- Dumped by pg_dump version 9.6.7

-- Started on 2018-02-27 23:41:43 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE library_test;
--
-- TOC entry 3134 (class 1262 OID 16385)
-- Name: library_test; Type: DATABASE; Schema: -; Owner: lib_test
--

CREATE DATABASE library_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE library_test OWNER TO lib_test;

\connect library_test

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13368)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 16388)
-- Name: Author; Type: TABLE; Schema: public; Owner: lib_test
--

CREATE TABLE "Author" (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE "Author" OWNER TO lib_test;

--
-- TOC entry 185 (class 1259 OID 16386)
-- Name: Author_author_id_seq; Type: SEQUENCE; Schema: public; Owner: lib_test
--

CREATE SEQUENCE "Author_author_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Author_author_id_seq" OWNER TO lib_test;

--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 185
-- Name: Author_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lib_test
--

ALTER SEQUENCE "Author_author_id_seq" OWNED BY "Author".id;


--
-- TOC entry 188 (class 1259 OID 16396)
-- Name: Book; Type: TABLE; Schema: public; Owner: lib_test
--

CREATE TABLE "Book" (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    fk_author bigint NOT NULL
);


ALTER TABLE "Book" OWNER TO lib_test;

--
-- TOC entry 187 (class 1259 OID 16394)
-- Name: Book_id_seq; Type: SEQUENCE; Schema: public; Owner: lib_test
--

CREATE SEQUENCE "Book_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Book_id_seq" OWNER TO lib_test;

--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 187
-- Name: Book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lib_test
--

ALTER SEQUENCE "Book_id_seq" OWNED BY "Book".id;


--
-- TOC entry 190 (class 1259 OID 16409)
-- Name: Reader; Type: TABLE; Schema: public; Owner: lib_test
--

CREATE TABLE "Reader" (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    birthday timestamp without time zone NOT NULL
);


ALTER TABLE "Reader" OWNER TO lib_test;

--
-- TOC entry 191 (class 1259 OID 16415)
-- Name: Reader_book; Type: TABLE; Schema: public; Owner: lib_test
--

CREATE TABLE "Reader_book" (
    fk_book bigint NOT NULL,
    fk_reader bigint NOT NULL
);


ALTER TABLE "Reader_book" OWNER TO lib_test;

--
-- TOC entry 189 (class 1259 OID 16407)
-- Name: Reader_id_seq; Type: SEQUENCE; Schema: public; Owner: lib_test
--

CREATE SEQUENCE "Reader_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Reader_id_seq" OWNER TO lib_test;

--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 189
-- Name: Reader_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lib_test
--

ALTER SEQUENCE "Reader_id_seq" OWNED BY "Reader".id;


--
-- TOC entry 2996 (class 2604 OID 16391)
-- Name: Author id; Type: DEFAULT; Schema: public; Owner: lib_test
--

ALTER TABLE ONLY "Author" ALTER COLUMN id SET DEFAULT nextval('"Author_author_id_seq"'::regclass);


--
-- TOC entry 2997 (class 2604 OID 16399)
-- Name: Book id; Type: DEFAULT; Schema: public; Owner: lib_test
--

ALTER TABLE ONLY "Book" ALTER COLUMN id SET DEFAULT nextval('"Book_id_seq"'::regclass);


--
-- TOC entry 2998 (class 2604 OID 16412)
-- Name: Reader id; Type: DEFAULT; Schema: public; Owner: lib_test
--

ALTER TABLE ONLY "Reader" ALTER COLUMN id SET DEFAULT nextval('"Reader_id_seq"'::regclass);


--
-- TOC entry 3001 (class 2606 OID 16393)
-- Name: Author pk_author; Type: CONSTRAINT; Schema: public; Owner: lib_test
--

ALTER TABLE ONLY "Author"
    ADD CONSTRAINT pk_author PRIMARY KEY (id);


--
-- TOC entry 3004 (class 2606 OID 16401)
-- Name: Book pk_book; Type: CONSTRAINT; Schema: public; Owner: lib_test
--

ALTER TABLE ONLY "Book"
    ADD CONSTRAINT pk_book PRIMARY KEY (id);


--
-- TOC entry 3006 (class 2606 OID 16414)
-- Name: Reader pk_reader; Type: CONSTRAINT; Schema: public; Owner: lib_test
--

ALTER TABLE ONLY "Reader"
    ADD CONSTRAINT pk_reader PRIMARY KEY (id);


--
-- TOC entry 3008 (class 2606 OID 16419)
-- Name: Reader_book pk_reader_book; Type: CONSTRAINT; Schema: public; Owner: lib_test
--

ALTER TABLE ONLY "Reader_book"
    ADD CONSTRAINT pk_reader_book PRIMARY KEY (fk_book, fk_reader);


--
-- TOC entry 2999 (class 1259 OID 16430)
-- Name: Author_pk_idx; Type: INDEX; Schema: public; Owner: lib_test
--

CREATE UNIQUE INDEX "Author_pk_idx" ON "Author" USING btree (id);


--
-- TOC entry 3002 (class 1259 OID 16431)
-- Name: book_fk_author_idx; Type: INDEX; Schema: public; Owner: lib_test
--

CREATE INDEX book_fk_author_idx ON "Book" USING btree (fk_author);


--
-- TOC entry 3009 (class 1259 OID 16432)
-- Name: readerbook_fk_idx; Type: INDEX; Schema: public; Owner: lib_test
--

CREATE INDEX readerbook_fk_idx ON "Reader_book" USING btree (fk_book, fk_reader);


--
-- TOC entry 3010 (class 2606 OID 16402)
-- Name: Book fk_author; Type: FK CONSTRAINT; Schema: public; Owner: lib_test
--

ALTER TABLE ONLY "Book"
    ADD CONSTRAINT fk_author FOREIGN KEY (fk_author) REFERENCES "Author"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3012 (class 2606 OID 16425)
-- Name: Reader_book fk_reader_book_book; Type: FK CONSTRAINT; Schema: public; Owner: lib_test
--

ALTER TABLE ONLY "Reader_book"
    ADD CONSTRAINT fk_reader_book_book FOREIGN KEY (fk_book) REFERENCES "Book"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3011 (class 2606 OID 16420)
-- Name: Reader_book fk_reader_book_reader; Type: FK CONSTRAINT; Schema: public; Owner: lib_test
--

ALTER TABLE ONLY "Reader_book"
    ADD CONSTRAINT fk_reader_book_reader FOREIGN KEY (fk_reader) REFERENCES "Reader"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-02-27 23:41:43 CET

--
-- PostgreSQL database dump complete
--

