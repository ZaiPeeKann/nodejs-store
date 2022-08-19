--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-08-19 18:26:55

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 66069)
-- Name: basket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket (
    id integer NOT NULL,
    person_id integer
);


ALTER TABLE public.basket OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 66117)
-- Name: basket_device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_device (
    id integer NOT NULL,
    basket_id integer,
    device_id integer
);


ALTER TABLE public.basket_device OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 66116)
-- Name: basket_device_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basket_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basket_device_id_seq OWNER TO postgres;

--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 223
-- Name: basket_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basket_device_id_seq OWNED BY public.basket_device.id;


--
-- TOC entry 217 (class 1259 OID 66068)
-- Name: basket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basket_id_seq OWNER TO postgres;

--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 217
-- Name: basket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basket_id_seq OWNED BY public.basket.id;


--
-- TOC entry 212 (class 1259 OID 66017)
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 66016)
-- Name: brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brand_id_seq OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 211
-- Name: brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_id_seq OWNED BY public.brand.id;


--
-- TOC entry 216 (class 1259 OID 66050)
-- Name: device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device (
    id integer NOT NULL,
    name character varying(255),
    price numeric(20,5),
    rating double precision,
    img character varying(255),
    type_id integer,
    brand_id integer
);


ALTER TABLE public.device OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 66049)
-- Name: device_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_id_seq OWNER TO postgres;

--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 215
-- Name: device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_id_seq OWNED BY public.device.id;


--
-- TOC entry 220 (class 1259 OID 66084)
-- Name: device_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_info (
    id integer NOT NULL,
    device_id integer,
    title character varying(255),
    description character varying(255)
);


ALTER TABLE public.device_info OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 66083)
-- Name: device_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_info_id_seq OWNER TO postgres;

--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 219
-- Name: device_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_info_id_seq OWNED BY public.device_info.id;


--
-- TOC entry 214 (class 1259 OID 66040)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255),
    role character varying(255),
    nickname character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 66039)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 213
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 222 (class 1259 OID 66098)
-- Name: rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rating (
    id integer NOT NULL,
    person_id integer,
    device_id integer,
    rate integer
);


ALTER TABLE public.rating OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 66097)
-- Name: rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_id_seq OWNER TO postgres;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 221
-- Name: rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rating_id_seq OWNED BY public.rating.id;


--
-- TOC entry 210 (class 1259 OID 66010)
-- Name: type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.type OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 66009)
-- Name: type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_id_seq OWNER TO postgres;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 209
-- Name: type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_id_seq OWNED BY public.type.id;


--
-- TOC entry 3203 (class 2604 OID 66072)
-- Name: basket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket ALTER COLUMN id SET DEFAULT nextval('public.basket_id_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 66120)
-- Name: basket_device id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_device ALTER COLUMN id SET DEFAULT nextval('public.basket_device_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 66020)
-- Name: brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 66053)
-- Name: device id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device ALTER COLUMN id SET DEFAULT nextval('public.device_id_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 66087)
-- Name: device_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_info ALTER COLUMN id SET DEFAULT nextval('public.device_info_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 66043)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 66101)
-- Name: rating id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating ALTER COLUMN id SET DEFAULT nextval('public.rating_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 66013)
-- Name: type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type ALTER COLUMN id SET DEFAULT nextval('public.type_id_seq'::regclass);


--
-- TOC entry 3379 (class 0 OID 66069)
-- Dependencies: 218
-- Data for Name: basket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket (id, person_id) FROM stdin;
9	9
\.


--
-- TOC entry 3385 (class 0 OID 66117)
-- Dependencies: 224
-- Data for Name: basket_device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket_device (id, basket_id, device_id) FROM stdin;
\.


--
-- TOC entry 3373 (class 0 OID 66017)
-- Dependencies: 212
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (id, name) FROM stdin;
1	Apple
\.


--
-- TOC entry 3377 (class 0 OID 66050)
-- Dependencies: 216
-- Data for Name: device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device (id, name, price, rating, img, type_id, brand_id) FROM stdin;
1	iPhone 12 pro	80000.00000	\N	8b25747a-54c4-449a-839a-71c279e4f0df.jpg	1	1
\.


--
-- TOC entry 3381 (class 0 OID 66084)
-- Dependencies: 220
-- Data for Name: device_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_info (id, device_id, title, description) FROM stdin;
\.


--
-- TOC entry 3375 (class 0 OID 66040)
-- Dependencies: 214
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, email, password, role, nickname) FROM stdin;
9	email@gmail.com	password	USER	nickname
\.


--
-- TOC entry 3383 (class 0 OID 66098)
-- Dependencies: 222
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rating (id, person_id, device_id, rate) FROM stdin;
\.


--
-- TOC entry 3371 (class 0 OID 66010)
-- Dependencies: 210
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type (id, name) FROM stdin;
1	Smartphone
\.


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 223
-- Name: basket_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_device_id_seq', 1, false);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 217
-- Name: basket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_id_seq', 9, true);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 211
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 1, true);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 215
-- Name: device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_id_seq', 1, true);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 219
-- Name: device_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_info_id_seq', 1, false);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 213
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 9, true);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 221
-- Name: rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rating_id_seq', 1, false);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 209
-- Name: type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_id_seq', 1, true);


--
-- TOC entry 3222 (class 2606 OID 66122)
-- Name: basket_device basket_device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_device
    ADD CONSTRAINT basket_device_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 66115)
-- Name: basket basket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 66022)
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 66091)
-- Name: device_info device_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_info
    ADD CONSTRAINT device_info_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 66057)
-- Name: device device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 66047)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3220 (class 2606 OID 66103)
-- Name: rating rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 66015)
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 66123)
-- Name: basket_device basket_device_basket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_device
    ADD CONSTRAINT basket_device_basket_id_fkey FOREIGN KEY (basket_id) REFERENCES public.basket(id);


--
-- TOC entry 3230 (class 2606 OID 66128)
-- Name: basket_device basket_device_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_device
    ADD CONSTRAINT basket_device_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.device(id);


--
-- TOC entry 3225 (class 2606 OID 66139)
-- Name: basket basket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3224 (class 2606 OID 66063)
-- Name: device device_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(id);


--
-- TOC entry 3226 (class 2606 OID 66092)
-- Name: device_info device_info_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_info
    ADD CONSTRAINT device_info_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.device(id);


--
-- TOC entry 3223 (class 2606 OID 66058)
-- Name: device device_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(id);


--
-- TOC entry 3228 (class 2606 OID 66109)
-- Name: rating rating_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.device(id);


--
-- TOC entry 3227 (class 2606 OID 66104)
-- Name: rating rating_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2022-08-19 18:26:56

--
-- PostgreSQL database dump complete
--

