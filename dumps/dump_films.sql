--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.22
-- Dumped by pg_dump version 9.6.22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: directors; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.directors (
    id integer NOT NULL,
    name text NOT NULL,
    CONSTRAINT valid_name CHECK (((length(name) >= 1) AND ("position"(name, ' '::text) > 0)))
);


ALTER TABLE public.directors OWNER TO "ec2-user";

--
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.directors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_id_seq OWNER TO "ec2-user";

--
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.directors_id_seq OWNED BY public.directors.id;


--
-- Name: films; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.films (
    title character varying(255) NOT NULL,
    year integer NOT NULL,
    genre character varying(100) NOT NULL,
    duration integer NOT NULL,
    director_id integer NOT NULL,
    CONSTRAINT title_length CHECK ((length((title)::text) >= 1)),
    CONSTRAINT year_range CHECK (((year >= 1900) AND (year <= 2100)))
);


ALTER TABLE public.films OWNER TO "ec2-user";

--
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.directors ALTER COLUMN id SET DEFAULT nextval('public.directors_id_seq'::regclass);


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.directors VALUES (1, 'John McTiernan');
INSERT INTO public.directors VALUES (2, 'Michael Curtiz');
INSERT INTO public.directors VALUES (3, 'Francis Ford Coppola');
INSERT INTO public.directors VALUES (4, 'Michael Anderson');
INSERT INTO public.directors VALUES (5, 'Tomas Alfredson');
INSERT INTO public.directors VALUES (6, 'Mike Nichol');


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.directors_id_seq', 6, true);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.films VALUES ('Die Hard', 1988, 'action', 132, 1);
INSERT INTO public.films VALUES ('Casablanca', 1942, 'drama', 102, 2);
INSERT INTO public.films VALUES ('The Conversation', 1974, 'thriller', 113, 3);
INSERT INTO public.films VALUES ('The Godfather', 1972, 'crime', 175, 3);
INSERT INTO public.films VALUES ('1984', 1956, 'scifi', 90, 4);
INSERT INTO public.films VALUES ('Tinker Tailor Soldier Spy', 2011, 'espionage', 127, 5);
INSERT INTO public.films VALUES ('The Birdcage', 1996, 'comedy', 118, 6);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: films title_unique; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT title_unique UNIQUE (title);


--
-- Name: films films_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.directors(id);


--
-- PostgreSQL database dump complete
--

