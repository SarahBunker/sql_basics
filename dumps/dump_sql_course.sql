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
-- Name: birds; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.birds (
    id integer NOT NULL,
    name character varying(50),
    length numeric(3,1),
    wingspan numeric(3,1),
    family character varying(50),
    extinct boolean
);


ALTER TABLE public.birds OWNER TO "ec2-user";

--
-- Name: birds_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.birds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.birds_id_seq OWNER TO "ec2-user";

--
-- Name: birds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.birds_id_seq OWNED BY public.birds.id;


--
-- Name: colors; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.colors (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.colors OWNER TO "ec2-user";

--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colors_id_seq OWNER TO "ec2-user";

--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.colors_id_seq OWNED BY public.colors.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.employees (
    first_name character varying(100),
    last_name character varying(100),
    department character varying(100) DEFAULT 'unassigned'::character varying NOT NULL,
    vacation_remaining integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.employees OWNER TO "ec2-user";

--
-- Name: evens; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.evens
    START WITH 2
    INCREMENT BY 2
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evens OWNER TO "ec2-user";

--
-- Name: films; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.films (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    year integer NOT NULL,
    genre character varying(100) NOT NULL,
    director character varying(255) NOT NULL,
    duration integer NOT NULL,
    CONSTRAINT director_name CHECK (((length((director)::text) >= 1) AND ("position"((director)::text, ' '::text) > 0))),
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
    id integer NOT NULL,
    item character varying(50),
    prep_time integer,
    ingredient_cost numeric(4,2),
    sales integer,
    menu_price numeric(4,2)
);


ALTER TABLE public.menu_items OWNER TO "ec2-user";

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.menu_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_items_id_seq OWNER TO "ec2-user";

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- Name: more_colors; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.more_colors (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.more_colors OWNER TO "ec2-user";

--
-- Name: people; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.people (
    id integer NOT NULL,
    given_name text NOT NULL,
    middle_initial text,
    surname text NOT NULL,
    street text NOT NULL,
    city text NOT NULL,
    state character varying(2) NOT NULL,
    zipcode character varying(5) NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    telephone character varying(12) NOT NULL,
    birthday date NOT NULL,
    occupation text NOT NULL,
    company text
);


ALTER TABLE public.people OWNER TO "ec2-user";

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_id_seq OWNER TO "ec2-user";

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.user_roles (
    id integer NOT NULL,
    role character varying(50),
    user_id integer NOT NULL
);


ALTER TABLE public.user_roles OWNER TO "ec2-user";

--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_roles_id_seq OWNER TO "ec2-user";

--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO "ec2-user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "ec2-user";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: weather; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.weather (
    date date NOT NULL,
    low integer NOT NULL,
    high integer NOT NULL,
    rainfall numeric(6,3) DEFAULT 0
);


ALTER TABLE public.weather OWNER TO "ec2-user";

--
-- Name: birds id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.birds ALTER COLUMN id SET DEFAULT nextval('public.birds_id_seq'::regclass);


--
-- Name: colors id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.colors ALTER COLUMN id SET DEFAULT nextval('public.colors_id_seq'::regclass);


--
-- Name: films id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.films ALTER COLUMN id SET DEFAULT nextval('public.films_id_seq'::regclass);


--
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- Name: people id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);


--
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: birds; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.birds VALUES (1, 'Spotted Towhee', 21.6, 26.7, 'Emberizidae', false);
INSERT INTO public.birds VALUES (2, 'American Robin', 25.5, 36.0, 'Turdidae', false);
INSERT INTO public.birds VALUES (3, 'Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true);
INSERT INTO public.birds VALUES (4, 'Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true);
INSERT INTO public.birds VALUES (5, 'Common Kestrel', 35.5, 73.5, 'Falconidae', false);


--
-- Name: birds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.birds_id_seq', 5, true);


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.colors VALUES (1, 'red');
INSERT INTO public.colors VALUES (2, 'green');
INSERT INTO public.colors VALUES (3, 'blue');
INSERT INTO public.colors VALUES (5, 'yellow');
INSERT INTO public.colors VALUES (6, 'orange');


--
-- Name: colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.colors_id_seq', 6, true);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.employees VALUES ('Leonardo', 'Ferreira', 'finance', 14);
INSERT INTO public.employees VALUES ('Sara', 'Mikaelsen', 'operations', 14);
INSERT INTO public.employees VALUES ('Lian', 'Ma', 'marketing', 13);
INSERT INTO public.employees VALUES ('Haiden', 'Smith', 'unassigned', 0);


--
-- Name: evens; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.evens', 6, true);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.films VALUES (1, 'Die Hard', 1988, 'action', 'John McTiernan', 132);
INSERT INTO public.films VALUES (2, 'Casablanca', 1942, 'drama', 'Michael Curtiz', 102);
INSERT INTO public.films VALUES (3, 'The Conversation', 1974, 'thriller', 'Francis Ford Coppola', 113);
INSERT INTO public.films VALUES (4, '1984', 1956, 'scifi', 'Michael Anderson', 90);
INSERT INTO public.films VALUES (5, 'Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127);
INSERT INTO public.films VALUES (6, 'The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);
INSERT INTO public.films VALUES (7, '28 Days Later', 2002, 'horror', 'Danny Boyle', 113);
INSERT INTO public.films VALUES (8, 'The Godfather', 1972, 'crime', 'Francis Ford Coppola', 175);
INSERT INTO public.films VALUES (9, '12 Angry Men', 1957, 'drama', 'Sidney Lumet', 96);
INSERT INTO public.films VALUES (10, 'Interstellar', 2014, 'scifi', 'Christopher Nolan', 169);
INSERT INTO public.films VALUES (11, 'Midnight Special', 2016, 'scifi', 'Jeff Nicols', 111);
INSERT INTO public.films VALUES (12, 'Home Alone', 1990, 'comedy', 'John Wilden Hughes, Jr.', 102);
INSERT INTO public.films VALUES (13, 'Hairspray', 1988, 'comedy', 'John Waters', 92);
INSERT INTO public.films VALUES (14, 'Godzilla', 1998, 'scifi', 'Roland Emmerich', 139);
INSERT INTO public.films VALUES (15, 'Godzilla', 2014, 'scifi', 'Gareth Edwards', 123);
INSERT INTO public.films VALUES (16, 'Wayne''s World', 1992, 'comedy', 'Penelope Spheeris', 95);
INSERT INTO public.films VALUES (17, 'Bourne Identity', 2002, 'espionage', 'Doug Liman', 118);


--
-- Name: films_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.films_id_seq', 17, true);


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.menu_items VALUES (1, 'omelette', 10, 1.50, 182, 7.99);
INSERT INTO public.menu_items VALUES (2, 'tacos', 5, 2.00, 254, 8.99);
INSERT INTO public.menu_items VALUES (3, 'oatmeal', 1, 0.50, 79, 5.99);


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 3, true);


--
-- Data for Name: more_colors; Type: TABLE DATA; Schema: public; Owner: ec2-user
--



--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: ec2-user
--



--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.people_id_seq', 10001, true);


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.user_roles VALUES (1, 'Admin', 2);
INSERT INTO public.user_roles VALUES (2, 'Member', 3);
INSERT INTO public.user_roles VALUES (3, 'Admin', 1);
INSERT INTO public.user_roles VALUES (4, 'Member', 4);
INSERT INTO public.user_roles VALUES (5, 'Editor', 5);


--
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.user_roles_id_seq', 5, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.users VALUES (1, 'Alex');
INSERT INTO public.users VALUES (2, 'Jess');
INSERT INTO public.users VALUES (3, 'Jin');
INSERT INTO public.users VALUES (4, 'Paulo');
INSERT INTO public.users VALUES (5, 'Sarah');


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.weather VALUES ('2016-03-07', 29, 32, 0.000);
INSERT INTO public.weather VALUES ('2016-03-08', 23, 31, 0.000);
INSERT INTO public.weather VALUES ('2016-03-09', 17, 28, 0.000);
INSERT INTO public.weather VALUES ('2016-03-01', 34, 43, 0.117);
INSERT INTO public.weather VALUES ('2016-03-02', 32, 44, 0.117);
INSERT INTO public.weather VALUES ('2016-03-03', 31, 47, 0.156);
INSERT INTO public.weather VALUES ('2016-03-04', 33, 42, 0.078);
INSERT INTO public.weather VALUES ('2016-03-05', 39, 46, 0.273);
INSERT INTO public.weather VALUES ('2016-03-06', 32, 43, 0.078);


--
-- Name: birds birds_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.birds
    ADD CONSTRAINT birds_pkey PRIMARY KEY (id);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- Name: colors id_unique; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT id_unique UNIQUE (id);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: more_colors more_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.more_colors
    ADD CONSTRAINT more_colors_pkey PRIMARY KEY (id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

