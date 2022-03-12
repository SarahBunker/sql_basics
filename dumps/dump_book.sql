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
-- Name: albums; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.albums (
    id integer NOT NULL,
    name character varying(100),
    released date,
    genra character varying(100),
    label character varying(100),
    singer_id integer
);


ALTER TABLE public.albums OWNER TO "ec2-user";

--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.albums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO "ec2-user";

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: animals; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.animals (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    binomial_name character varying(100) NOT NULL,
    max_weight_kg numeric(10,4),
    max_age_years integer,
    conservation_status character(2),
    class character varying(100),
    phylum character varying(100),
    kingdom character varying(100)
);


ALTER TABLE public.animals OWNER TO "ec2-user";

--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animals_id_seq OWNER TO "ec2-user";

--
-- Name: animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.animals_id_seq OWNED BY public.animals.id;


--
-- Name: celebrities; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.celebrities (
    id integer NOT NULL,
    first_name character varying(80) NOT NULL,
    occupation character varying(150),
    date_of_birth date NOT NULL,
    deceased boolean DEFAULT false NOT NULL,
    last_name character varying(100)
);


ALTER TABLE public.celebrities OWNER TO "ec2-user";

--
-- Name: continents; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.continents (
    id integer NOT NULL,
    continent_name character varying(50)
);


ALTER TABLE public.continents OWNER TO "ec2-user";

--
-- Name: continents_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.continents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.continents_id_seq OWNER TO "ec2-user";

--
-- Name: continents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.continents_id_seq OWNED BY public.continents.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    capital character varying NOT NULL,
    population integer,
    continent_id integer
);


ALTER TABLE public.countries OWNER TO "ec2-user";

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO "ec2-user";

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: famous_people_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.famous_people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.famous_people_id_seq OWNER TO "ec2-user";

--
-- Name: famous_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.famous_people_id_seq OWNED BY public.celebrities.id;


--
-- Name: singers; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.singers (
    id integer NOT NULL,
    name character varying(50),
    deceased boolean,
    date_of_birth date
);


ALTER TABLE public.singers OWNER TO "ec2-user";

--
-- Name: singers_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.singers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.singers_id_seq OWNER TO "ec2-user";

--
-- Name: singers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.singers_id_seq OWNED BY public.singers.id;


--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: animals id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.animals ALTER COLUMN id SET DEFAULT nextval('public.animals_id_seq'::regclass);


--
-- Name: celebrities id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.celebrities ALTER COLUMN id SET DEFAULT nextval('public.famous_people_id_seq'::regclass);


--
-- Name: continents id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.continents ALTER COLUMN id SET DEFAULT nextval('public.continents_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: singers id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.singers ALTER COLUMN id SET DEFAULT nextval('public.singers_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.albums VALUES (1, 'Born to Run', '1975-08-25', 'Rock and Roll', 'Columbia', 1);
INSERT INTO public.albums VALUES (2, 'Purple Rain', '1984-06-25', 'Pop, R&B, Rock', 'Warner Bros', 4);
INSERT INTO public.albums VALUES (3, 'Born in the USA', '1984-06-04', 'Rock and roll, pop', 'Columbia', 1);
INSERT INTO public.albums VALUES (4, 'Madonna', '1983-07-27', 'Dance-pop, post-disco', 'Warner Bros', 3);
INSERT INTO public.albums VALUES (5, 'True Blue', '1986-06-30', 'Dance-pop, Pop', 'Warner Bros', 3);
INSERT INTO public.albums VALUES (6, 'Elvis', '1956-10-19', 'Rock and roll, Rhythm and Blues', 'RCA Victor', 2);
INSERT INTO public.albums VALUES (7, 'Sing o'' the Time', '1987-03-30', 'Pop, R&B, Rock, Funk', 'Paisley Park, Warner Bros', 4);
INSERT INTO public.albums VALUES (8, 'G. I. Blues', '1960-10-01', 'Rock and roll, Pop', 'RCA Victor', 2);


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.albums_id_seq', 8, true);


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.animals VALUES (1, 'Dove', 'Columbidae Columbiformes', 2.0000, 15, 'LC', 'Aves', 'Chordata', 'Animalia');
INSERT INTO public.animals VALUES (2, 'Golden Eagle', 'Aquila Chrysaetos', 6.3500, 24, 'LC', 'Aves', 'Chordata', 'Animalia');
INSERT INTO public.animals VALUES (3, 'Peregrine Falcon', 'Falco Peregrinus', 1.5000, 15, 'LC', 'Aves', 'Chordata', 'Animalia');
INSERT INTO public.animals VALUES (4, 'Pigeon', 'Columbidae Columbiformes', 2.0000, 15, 'LC', 'Aves', 'Chordata', 'Animalia');
INSERT INTO public.animals VALUES (5, 'Kakapo', 'Strigops habroptila', 4.0000, 60, 'CR', 'Aves', 'Chordata', 'Animalia');


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.animals_id_seq', 5, true);


--
-- Data for Name: celebrities; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.celebrities VALUES (1, 'Bruce', 'singer and songwriter', '1949-09-23', false, 'Springsteen');
INSERT INTO public.celebrities VALUES (3, 'Frank', 'Singer, Actor', '1915-12-12', true, 'Sinatra');
INSERT INTO public.celebrities VALUES (5, 'Madonna', 'Singer, Actress', '1958-08-16', false, NULL);
INSERT INTO public.celebrities VALUES (6, 'Prince', 'Singer, Songwriter, Musician, Actor', '1958-06-07', true, NULL);
INSERT INTO public.celebrities VALUES (2, 'Scarlett', 'Actress', '1984-11-22', false, 'Johansson');
INSERT INTO public.celebrities VALUES (7, 'Elvis', 'Singer, Musician, Actor', '1935-08-01', true, 'Presley');


--
-- Data for Name: continents; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.continents VALUES (1, 'Africa');
INSERT INTO public.continents VALUES (2, 'Asia');
INSERT INTO public.continents VALUES (3, 'Europe');
INSERT INTO public.continents VALUES (4, 'North America');
INSERT INTO public.continents VALUES (5, 'South America');


--
-- Name: continents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.continents_id_seq', 5, true);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.countries VALUES (1, 'Brazil', 'Brasilia', 208385000, 5);
INSERT INTO public.countries VALUES (2, 'Egypt', 'Cairo', 96308900, 1);
INSERT INTO public.countries VALUES (3, 'France', 'Paris', 67158000, 3);
INSERT INTO public.countries VALUES (4, 'Germany', 'Berlin', 82349400, 3);
INSERT INTO public.countries VALUES (5, 'Japan', 'Tokyo', 126672000, 2);
INSERT INTO public.countries VALUES (6, 'USA', 'Washington D.C.', 325365189, 4);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.countries_id_seq', 10, true);


--
-- Name: famous_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.famous_people_id_seq', 7, true);


--
-- Data for Name: singers; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.singers VALUES (1, 'Bruce Springsteen', false, '1949-09-23');
INSERT INTO public.singers VALUES (2, 'Elvis Presley', true, '1935-08-01');
INSERT INTO public.singers VALUES (3, 'Madonna', false, '1958-08-16');
INSERT INTO public.singers VALUES (4, 'Prince', true, '1958-06-07');


--
-- Name: singers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.singers_id_seq', 4, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: continents continents_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.continents
    ADD CONSTRAINT continents_pkey PRIMARY KEY (id);


--
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- Name: singers singers_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.singers
    ADD CONSTRAINT singers_pkey PRIMARY KEY (id);


--
-- Name: albums albums_singer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_singer_id_fkey FOREIGN KEY (singer_id) REFERENCES public.singers(id) ON DELETE CASCADE;


--
-- Name: countries countries_continent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_continent_id_fkey FOREIGN KEY (continent_id) REFERENCES public.continents(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

