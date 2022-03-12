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


--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO "ec2-user";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: books; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.books (
    id integer DEFAULT nextval('public.books_id_seq'::regclass) NOT NULL,
    title character varying(100) NOT NULL,
    author character varying(100) NOT NULL
);


ALTER TABLE public.books OWNER TO "ec2-user";

--
-- Name: books_categories; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.books_categories (
    book_id integer NOT NULL,
    category_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.books_categories OWNER TO "ec2-user";

--
-- Name: books_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.books_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_categories_id_seq OWNER TO "ec2-user";

--
-- Name: books_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.books_categories_id_seq OWNED BY public.books_categories.id;


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO "ec2-user";

--
-- Name: categories; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.categories (
    id integer DEFAULT nextval('public.categories_id_seq'::regclass) NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.categories OWNER TO "ec2-user";

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
-- Name: directors_films; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.directors_films (
    id integer NOT NULL,
    film_id integer NOT NULL,
    director_id integer NOT NULL
);


ALTER TABLE public.directors_films OWNER TO "ec2-user";

--
-- Name: directors_films_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.directors_films_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_films_id_seq OWNER TO "ec2-user";

--
-- Name: directors_films_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.directors_films_id_seq OWNED BY public.directors_films.id;


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
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    year integer NOT NULL,
    genre character varying(100) NOT NULL,
    duration integer NOT NULL,
    CONSTRAINT title_length CHECK ((length((title)::text) >= 1)),
    CONSTRAINT year_range CHECK (((year >= 1900) AND (year <= 2100)))
);


ALTER TABLE public.films OWNER TO "ec2-user";

--
-- Name: films_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.films_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.films_id_seq OWNER TO "ec2-user";

--
-- Name: films_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.films_id_seq OWNED BY public.films.id;


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.menu_items (
    item text,
    prep_time integer,
    ingredient_cost numeric(4,2),
    sales integer,
    menu_price numeric(4,2)
);


ALTER TABLE public.menu_items OWNER TO "ec2-user";

--
-- Name: moons; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.moons (
    id integer NOT NULL
);


ALTER TABLE public.moons OWNER TO "ec2-user";

--
-- Name: moons_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.moons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_id_seq OWNER TO "ec2-user";

--
-- Name: moons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.moons_id_seq OWNED BY public.moons.id;


--
-- Name: planets; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.planets (
    id integer NOT NULL,
    name character varying(50),
    len_to_sun numeric(6,2),
    system_id integer,
    habitable boolean DEFAULT false,
    CONSTRAINT optional_constraint_name CHECK ((length((name)::text) > 0))
);


ALTER TABLE public.planets OWNER TO "ec2-user";

--
-- Name: planets_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.planets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_id_seq OWNER TO "ec2-user";

--
-- Name: planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.planets_id_seq OWNED BY public.planets.id;


--
-- Name: systems; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.systems (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.systems OWNER TO "ec2-user";

--
-- Name: systems_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.systems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.systems_id_seq OWNER TO "ec2-user";

--
-- Name: systems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.systems_id_seq OWNED BY public.systems.id;


--
-- Name: books_categories id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.books_categories ALTER COLUMN id SET DEFAULT nextval('public.books_categories_id_seq'::regclass);


--
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.directors ALTER COLUMN id SET DEFAULT nextval('public.directors_id_seq'::regclass);


--
-- Name: directors_films id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.directors_films ALTER COLUMN id SET DEFAULT nextval('public.directors_films_id_seq'::regclass);


--
-- Name: films id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.films ALTER COLUMN id SET DEFAULT nextval('public.films_id_seq'::regclass);


--
-- Name: moons id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.moons ALTER COLUMN id SET DEFAULT nextval('public.moons_id_seq'::regclass);


--
-- Name: planets id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.planets ALTER COLUMN id SET DEFAULT nextval('public.planets_id_seq'::regclass);


--
-- Name: systems id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.systems ALTER COLUMN id SET DEFAULT nextval('public.systems_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.books VALUES (1, 'A Tale of Two Cities', 'Charles Dickens');
INSERT INTO public.books VALUES (2, 'Harry Potter', 'J. K. Rowling');
INSERT INTO public.books VALUES (3, 'Einstein: His Life and Universe', 'Walter Isaacson');
INSERT INTO public.books VALUES (4, 'Sally Ride: America''s First Woman in Space', 'Lynn Sherr');
INSERT INTO public.books VALUES (5, 'Jane Eyre', 'Charlotte Brontë');
INSERT INTO public.books VALUES (6, 'Vij''s: Elegant and Inspired Indian Cuisine', 'Meeru Dhalwala and Vikram Vij');


--
-- Data for Name: books_categories; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.books_categories VALUES (1, 2, 1);
INSERT INTO public.books_categories VALUES (1, 4, 2);
INSERT INTO public.books_categories VALUES (2, 2, 3);
INSERT INTO public.books_categories VALUES (2, 3, 4);
INSERT INTO public.books_categories VALUES (3, 1, 5);
INSERT INTO public.books_categories VALUES (3, 5, 6);
INSERT INTO public.books_categories VALUES (3, 6, 7);
INSERT INTO public.books_categories VALUES (4, 5, 8);
INSERT INTO public.books_categories VALUES (4, 1, 9);
INSERT INTO public.books_categories VALUES (4, 7, 10);
INSERT INTO public.books_categories VALUES (5, 2, 11);
INSERT INTO public.books_categories VALUES (5, 4, 12);
INSERT INTO public.books_categories VALUES (6, 8, 13);
INSERT INTO public.books_categories VALUES (6, 1, 14);
INSERT INTO public.books_categories VALUES (6, 9, 15);


--
-- Name: books_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.books_categories_id_seq', 15, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.books_id_seq', 6, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.categories VALUES (1, 'Nonfiction');
INSERT INTO public.categories VALUES (2, 'Fiction');
INSERT INTO public.categories VALUES (3, 'Fantasy');
INSERT INTO public.categories VALUES (4, 'Classics');
INSERT INTO public.categories VALUES (5, 'Biography');
INSERT INTO public.categories VALUES (6, 'Physics');
INSERT INTO public.categories VALUES (7, 'Space Exploration');
INSERT INTO public.categories VALUES (8, 'Cookbook');
INSERT INTO public.categories VALUES (9, 'South Asia');


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.categories_id_seq', 9, true);


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.directors VALUES (1, 'John McTiernan');
INSERT INTO public.directors VALUES (2, 'Michael Curtiz');
INSERT INTO public.directors VALUES (3, 'Francis Ford Coppola');
INSERT INTO public.directors VALUES (4, 'Michael Anderson');
INSERT INTO public.directors VALUES (5, 'Tomas Alfredson');
INSERT INTO public.directors VALUES (6, 'Mike Nichols');
INSERT INTO public.directors VALUES (7, 'Sidney Lumet');
INSERT INTO public.directors VALUES (8, 'Penelope Spheeris');
INSERT INTO public.directors VALUES (9, 'Joel Coen');
INSERT INTO public.directors VALUES (10, 'Ethan Coen');
INSERT INTO public.directors VALUES (11, 'Frank Miller');
INSERT INTO public.directors VALUES (12, 'Robert Rodriguez');


--
-- Data for Name: directors_films; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.directors_films VALUES (1, 1, 1);
INSERT INTO public.directors_films VALUES (2, 2, 2);
INSERT INTO public.directors_films VALUES (3, 3, 3);
INSERT INTO public.directors_films VALUES (4, 4, 4);
INSERT INTO public.directors_films VALUES (5, 5, 5);
INSERT INTO public.directors_films VALUES (6, 6, 6);
INSERT INTO public.directors_films VALUES (7, 7, 3);
INSERT INTO public.directors_films VALUES (8, 8, 7);
INSERT INTO public.directors_films VALUES (9, 9, 8);
INSERT INTO public.directors_films VALUES (10, 10, 4);
INSERT INTO public.directors_films VALUES (11, 11, 9);
INSERT INTO public.directors_films VALUES (12, 12, 9);
INSERT INTO public.directors_films VALUES (13, 12, 10);
INSERT INTO public.directors_films VALUES (14, 13, 11);
INSERT INTO public.directors_films VALUES (15, 13, 12);
INSERT INTO public.directors_films VALUES (16, 14, 12);


--
-- Name: directors_films_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.directors_films_id_seq', 16, true);


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.directors_id_seq', 12, true);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.films VALUES (1, 'Die Hard', 1988, 'action', 132);
INSERT INTO public.films VALUES (2, 'Casablanca', 1942, 'drama', 102);
INSERT INTO public.films VALUES (3, 'The Conversation', 1974, 'thriller', 113);
INSERT INTO public.films VALUES (4, '1984', 1956, 'scifi', 90);
INSERT INTO public.films VALUES (5, 'Tinker Tailor Soldier Spy', 2011, 'espionage', 127);
INSERT INTO public.films VALUES (6, 'The Birdcage', 1996, 'comedy', 118);
INSERT INTO public.films VALUES (7, 'The Godfather', 1972, 'crime', 175);
INSERT INTO public.films VALUES (8, '12 Angry Men', 1957, 'drama', 96);
INSERT INTO public.films VALUES (9, 'Wayne''s World', 1992, 'comedy', 95);
INSERT INTO public.films VALUES (10, 'Let the Right One In', 2008, 'horror', 114);
INSERT INTO public.films VALUES (11, 'Fargo', 1996, 'comedy', 98);
INSERT INTO public.films VALUES (12, 'No Country for Old Men', 2007, 'western', 122);
INSERT INTO public.films VALUES (13, 'Sin City', 2005, 'crime', 124);
INSERT INTO public.films VALUES (14, 'Spy Kids', 2001, 'scifi', 88);


--
-- Name: films_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.films_id_seq', 14, true);


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.menu_items VALUES ('omelette', 10, 1.50, 182, 7.99);
INSERT INTO public.menu_items VALUES ('tacos', 5, 2.00, 254, 8.99);
INSERT INTO public.menu_items VALUES ('oatmeal', 1, 0.50, 79, 5.99);


--
-- Data for Name: moons; Type: TABLE DATA; Schema: public; Owner: ec2-user
--



--
-- Name: moons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.moons_id_seq', 1, false);


--
-- Data for Name: planets; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.planets VALUES (1, 'Mercury', 0.39, NULL, false);
INSERT INTO public.planets VALUES (2, 'Venus', 0.72, NULL, false);
INSERT INTO public.planets VALUES (5, 'Jupiter', 5.20, NULL, false);
INSERT INTO public.planets VALUES (7, 'Uranus', 19.20, NULL, false);
INSERT INTO public.planets VALUES (8, 'Neptune', 30.06, NULL, false);
INSERT INTO public.planets VALUES (4, 'Mars', 1.52, NULL, false);
INSERT INTO public.planets VALUES (6, 'Saturn', 9.54, NULL, false);
INSERT INTO public.planets VALUES (3, 'Earth', 1.00, NULL, true);


--
-- Name: planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.planets_id_seq', 8, true);


--
-- Data for Name: systems; Type: TABLE DATA; Schema: public; Owner: ec2-user
--



--
-- Name: systems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.systems_id_seq', 1, false);


--
-- Name: books_categories books_categories_book_id_category_id_key; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.books_categories
    ADD CONSTRAINT books_categories_book_id_category_id_key UNIQUE (book_id, category_id);


--
-- Name: books_categories books_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.books_categories
    ADD CONSTRAINT books_categories_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: directors_films directors_films_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.directors_films
    ADD CONSTRAINT directors_films_pkey PRIMARY KEY (id);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- Name: moons moons_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.moons
    ADD CONSTRAINT moons_pkey PRIMARY KEY (id);


--
-- Name: systems systems_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_pkey PRIMARY KEY (id);


--
-- Name: films title_unique; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT title_unique UNIQUE (title);


--
-- Name: books_categories books_categories_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.books_categories
    ADD CONSTRAINT books_categories_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON DELETE CASCADE;


--
-- Name: books_categories books_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.books_categories
    ADD CONSTRAINT books_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: directors_films directors_films_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.directors_films
    ADD CONSTRAINT directors_films_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.directors(id);


--
-- Name: directors_films directors_films_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.directors_films
    ADD CONSTRAINT directors_films_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.films(id);


--
-- Name: planets planets_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_system_id_fkey FOREIGN KEY (system_id) REFERENCES public.systems(id);


--
-- PostgreSQL database dump complete
--

