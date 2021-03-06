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
-- Name: customers; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.customers OWNER TO "ec2-user";

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO "ec2-user";

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: email_addresses; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.email_addresses (
    customer_id integer NOT NULL,
    customer_email character varying(50) NOT NULL
);


ALTER TABLE public.email_addresses OWNER TO "ec2-user";

--
-- Name: email_addresses_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.email_addresses_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_addresses_customer_id_seq OWNER TO "ec2-user";

--
-- Name: email_addresses_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.email_addresses_customer_id_seq OWNED BY public.email_addresses.customer_id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.order_items OWNER TO "ec2-user";

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO "ec2-user";

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    order_status character varying(20)
);


ALTER TABLE public.orders OWNER TO "ec2-user";

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO "ec2-user";

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE public.products (
    id integer NOT NULL,
    product_name character varying(50),
    product_cost numeric(4,2) DEFAULT 0,
    product_type character varying(20),
    product_loyalty_points integer
);


ALTER TABLE public.products OWNER TO "ec2-user";

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO "ec2-user";

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: email_addresses customer_id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.email_addresses ALTER COLUMN customer_id SET DEFAULT nextval('public.email_addresses_customer_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.customers VALUES (1, 'James Bergman');
INSERT INTO public.customers VALUES (2, 'Natasha O''Shea');
INSERT INTO public.customers VALUES (3, 'Aaron Muller');


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.customers_id_seq', 3, true);


--
-- Data for Name: email_addresses; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.email_addresses VALUES (2, 'natasha@osheafamily.com');
INSERT INTO public.email_addresses VALUES (1, 'james1998@email.com');


--
-- Name: email_addresses_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.email_addresses_customer_id_seq', 1, true);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.order_items VALUES (1, 1, 3);
INSERT INTO public.order_items VALUES (2, 1, 5);
INSERT INTO public.order_items VALUES (3, 1, 6);
INSERT INTO public.order_items VALUES (4, 1, 8);
INSERT INTO public.order_items VALUES (5, 2, 2);
INSERT INTO public.order_items VALUES (6, 2, 5);
INSERT INTO public.order_items VALUES (7, 2, 7);
INSERT INTO public.order_items VALUES (8, 3, 4);
INSERT INTO public.order_items VALUES (9, 3, 2);
INSERT INTO public.order_items VALUES (10, 3, 5);
INSERT INTO public.order_items VALUES (11, 3, 5);
INSERT INTO public.order_items VALUES (12, 3, 6);
INSERT INTO public.order_items VALUES (13, 3, 10);
INSERT INTO public.order_items VALUES (14, 3, 9);
INSERT INTO public.order_items VALUES (15, 4, 1);
INSERT INTO public.order_items VALUES (16, 4, 5);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.order_items_id_seq', 16, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.orders VALUES (1, 1, 'In Progress');
INSERT INTO public.orders VALUES (2, 2, 'Placed');
INSERT INTO public.orders VALUES (3, 2, 'Completed');
INSERT INTO public.orders VALUES (4, 3, 'Placed');


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.orders_id_seq', 4, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO public.products VALUES (1, 'LS Burger', 3.00, 'Burger', 10);
INSERT INTO public.products VALUES (2, 'LS Cheeseburger', 3.50, 'Burger', 15);
INSERT INTO public.products VALUES (3, 'LS Chicken Burger', 4.50, 'Burger', 20);
INSERT INTO public.products VALUES (4, 'LS Double Deluxe Burger', 6.00, 'Burger', 30);
INSERT INTO public.products VALUES (5, 'Fries', 1.20, 'Side', 3);
INSERT INTO public.products VALUES (6, 'Onion Rings', 1.50, 'Side', 5);
INSERT INTO public.products VALUES (7, 'Cola', 1.50, 'Drink', 5);
INSERT INTO public.products VALUES (8, 'Lemonade', 1.50, 'Drink', 5);
INSERT INTO public.products VALUES (9, 'Vanilla Shake', 2.00, 'Drink', 7);
INSERT INTO public.products VALUES (10, 'Chocolate Shake', 2.00, 'Drink', 7);
INSERT INTO public.products VALUES (11, 'Strawberry Shake', 2.00, 'Drink', 7);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('public.products_id_seq', 11, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: email_addresses email_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.email_addresses
    ADD CONSTRAINT email_addresses_pkey PRIMARY KEY (customer_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: email_addresses email_addresses_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.email_addresses
    ADD CONSTRAINT email_addresses_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

