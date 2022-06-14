--
-- PostgreSQL database dump
--

-- Dumped from database version 11.16 (Debian 11.16-0+deb10u1)
-- Dumped by pg_dump version 11.16 (Debian 11.16-0+deb10u1)

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

ALTER TABLE ONLY public.huesped_push_tokens DROP CONSTRAINT fkmr4u6cwn25gn8um3emcf519lg;
ALTER TABLE ONLY public.facturas DROP CONSTRAINT fkks11dlpkrred6an8o8simxxut;
ALTER TABLE ONLY public.reservas DROP CONSTRAINT fkj1dyoxal4rnhdcxo4mv6bcivc;
ALTER TABLE ONLY public.reservas DROP CONSTRAINT fkgqrp4r80giaq2op07c9h4iuht;
ALTER TABLE ONLY public.alojamientos DROP CONSTRAINT fkdfbnht5i649pc5fokrjn1d1ul;
ALTER TABLE ONLY public.password_reset_token DROP CONSTRAINT fkc0h3g4hnddsx4ugpu1vq6umu0;
ALTER TABLE ONLY public.habitaciones DROP CONSTRAINT fkb0ywyg5ou6wl42wbhm2wx1av;
ALTER TABLE ONLY public.reservas DROP CONSTRAINT fkaufff82mr36lu96eflhv1wws8;
ALTER TABLE ONLY public.alojamientos DROP CONSTRAINT fk8dnsuwlxyr1f54xorojl3c0es;
ALTER TABLE ONLY public.usuarios DROP CONSTRAINT fk7sd0hlifblas68uskxf3ffox7;
ALTER TABLE ONLY public.habitaciones DROP CONSTRAINT fk3r01d8gor8vve49otwqd5hlix;
ALTER TABLE ONLY public.dt_direccion DROP CONSTRAINT fk19wm130mnm9eqg2vmxp3x9n5m;
ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
ALTER TABLE ONLY public.reservas DROP CONSTRAINT reservas_pkey;
ALTER TABLE ONLY public.recuperaciones DROP CONSTRAINT recuperaciones_pkey;
ALTER TABLE ONLY public.password_reset_token DROP CONSTRAINT password_reset_token_pkey;
ALTER TABLE ONLY public.habitaciones DROP CONSTRAINT habitaciones_pkey;
ALTER TABLE ONLY public.facturas DROP CONSTRAINT facturas_pkey;
ALTER TABLE ONLY public.dt_servicios DROP CONSTRAINT dt_servicios_pkey;
ALTER TABLE ONLY public.dt_pais DROP CONSTRAINT dt_pais_pkey;
ALTER TABLE ONLY public.dt_direccion DROP CONSTRAINT dt_direccion_pkey;
ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_pkey;
ALTER TABLE ONLY public.alojamientos DROP CONSTRAINT alojamientos_pkey;
ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reservas ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.recuperaciones ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.habitaciones ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.facturas ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.dt_servicios ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.dt_pais ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.dt_direccion ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.calificaciones ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.alojamientos ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.usuarios_id_seq;
DROP TABLE public.usuarios;
DROP SEQUENCE public.reservas_id_seq;
DROP TABLE public.reservas;
DROP SEQUENCE public.recuperaciones_id_seq;
DROP TABLE public.recuperaciones;
DROP TABLE public.password_reset_token;
DROP TABLE public.huesped_push_tokens;
DROP SEQUENCE public.hibernate_sequence;
DROP SEQUENCE public.habitaciones_id_seq;
DROP TABLE public.habitaciones;
DROP SEQUENCE public.facturas_id_seq;
DROP TABLE public.facturas;
DROP SEQUENCE public.dt_servicios_id_seq;
DROP TABLE public.dt_servicios;
DROP SEQUENCE public.dt_pais_id_seq;
DROP TABLE public.dt_pais;
DROP SEQUENCE public.dt_direccion_id_seq;
DROP TABLE public.dt_direccion;
DROP SEQUENCE public.calificaciones_id_seq;
DROP TABLE public.calificaciones;
DROP SEQUENCE public.alojamientos_id_seq;
DROP TABLE public.alojamientos;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alojamientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alojamientos (
    id integer NOT NULL,
    activo boolean,
    descripcion character varying(255),
    nombre character varying(255),
    anfitrion_id integer,
    alojamiento_dir integer
);


ALTER TABLE public.alojamientos OWNER TO postgres;

--
-- Name: alojamientos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alojamientos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alojamientos_id_seq OWNER TO postgres;

--
-- Name: alojamientos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alojamientos_id_seq OWNED BY public.alojamientos.id;


--
-- Name: calificaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calificaciones (
    id integer NOT NULL,
    calificacion_anfitrion integer NOT NULL,
    calificacion_huesped integer NOT NULL,
    fecha_resena timestamp without time zone,
    resena character varying(255)
);


ALTER TABLE public.calificaciones OWNER TO postgres;

--
-- Name: calificaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calificaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calificaciones_id_seq OWNER TO postgres;

--
-- Name: calificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calificaciones_id_seq OWNED BY public.calificaciones.id;


--
-- Name: dt_direccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dt_direccion (
    id integer NOT NULL,
    calle character varying(255),
    ciudad character varying(255),
    numero character varying(255),
    pais integer
);


ALTER TABLE public.dt_direccion OWNER TO postgres;

--
-- Name: dt_direccion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dt_direccion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dt_direccion_id_seq OWNER TO postgres;

--
-- Name: dt_direccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dt_direccion_id_seq OWNED BY public.dt_direccion.id;


--
-- Name: dt_pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dt_pais (
    id integer NOT NULL,
    nombre character varying(255)
);


ALTER TABLE public.dt_pais OWNER TO postgres;

--
-- Name: dt_pais_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dt_pais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dt_pais_id_seq OWNER TO postgres;

--
-- Name: dt_pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dt_pais_id_seq OWNED BY public.dt_pais.id;


--
-- Name: dt_servicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dt_servicios (
    id integer NOT NULL,
    aire boolean NOT NULL,
    desayuno boolean NOT NULL,
    jacuzzi boolean NOT NULL,
    parking boolean NOT NULL,
    tv_cable boolean NOT NULL,
    wifi boolean NOT NULL
);


ALTER TABLE public.dt_servicios OWNER TO postgres;

--
-- Name: dt_servicios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dt_servicios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dt_servicios_id_seq OWNER TO postgres;

--
-- Name: dt_servicios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dt_servicios_id_seq OWNED BY public.dt_servicios.id;


--
-- Name: facturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturas (
    id integer NOT NULL,
    descuento boolean,
    estado character varying(255),
    fecha timestamp without time zone,
    id_paypal character varying(255),
    monto double precision NOT NULL,
    monto_descuento double precision NOT NULL,
    reserva_id integer
);


ALTER TABLE public.facturas OWNER TO postgres;

--
-- Name: facturas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facturas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facturas_id_seq OWNER TO postgres;

--
-- Name: facturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facturas_id_seq OWNED BY public.facturas.id;


--
-- Name: habitaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habitaciones (
    id integer NOT NULL,
    camas integer NOT NULL,
    descripcion character varying(255),
    precio_noche double precision,
    alojamiento_id integer,
    servicios_id integer
);


ALTER TABLE public.habitaciones OWNER TO postgres;

--
-- Name: habitaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.habitaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitaciones_id_seq OWNER TO postgres;

--
-- Name: habitaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.habitaciones_id_seq OWNED BY public.habitaciones.id;


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: huesped_push_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.huesped_push_tokens (
    huesped_id integer NOT NULL,
    push_tokens character varying(255)
);


ALTER TABLE public.huesped_push_tokens OWNER TO postgres;

--
-- Name: password_reset_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_token (
    id integer NOT NULL,
    expiry_date timestamp without time zone,
    token character varying(255),
    user_id integer NOT NULL
);


ALTER TABLE public.password_reset_token OWNER TO postgres;

--
-- Name: recuperaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recuperaciones (
    id integer NOT NULL,
    fecha timestamp without time zone
);


ALTER TABLE public.recuperaciones OWNER TO postgres;

--
-- Name: recuperaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recuperaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recuperaciones_id_seq OWNER TO postgres;

--
-- Name: recuperaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recuperaciones_id_seq OWNED BY public.recuperaciones.id;


--
-- Name: reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas (
    id integer NOT NULL,
    cant_dias integer NOT NULL,
    estado character varying(255),
    fecha_fin timestamp without time zone,
    fecha_inicio timestamp without time zone,
    id_chat character varying(255),
    calificacion_id integer,
    habitacion_id integer,
    huesped_id integer
);


ALTER TABLE public.reservas OWNER TO postgres;

--
-- Name: reservas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservas_id_seq OWNER TO postgres;

--
-- Name: reservas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservas_id_seq OWNED BY public.reservas.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    dtype character varying(31) NOT NULL,
    id integer NOT NULL,
    activo boolean,
    apellido character varying(255),
    bloqueado boolean,
    email character varying(255),
    nombre character varying(255),
    pass character varying(60),
    calificacion_global integer,
    estado character varying(255),
    user_id integer,
    f_creacion_usuario timestamp without time zone
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: alojamientos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alojamientos ALTER COLUMN id SET DEFAULT nextval('public.alojamientos_id_seq'::regclass);


--
-- Name: calificaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones ALTER COLUMN id SET DEFAULT nextval('public.calificaciones_id_seq'::regclass);


--
-- Name: dt_direccion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dt_direccion ALTER COLUMN id SET DEFAULT nextval('public.dt_direccion_id_seq'::regclass);


--
-- Name: dt_pais id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dt_pais ALTER COLUMN id SET DEFAULT nextval('public.dt_pais_id_seq'::regclass);


--
-- Name: dt_servicios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dt_servicios ALTER COLUMN id SET DEFAULT nextval('public.dt_servicios_id_seq'::regclass);


--
-- Name: facturas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas ALTER COLUMN id SET DEFAULT nextval('public.facturas_id_seq'::regclass);


--
-- Name: habitaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones ALTER COLUMN id SET DEFAULT nextval('public.habitaciones_id_seq'::regclass);


--
-- Name: recuperaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recuperaciones ALTER COLUMN id SET DEFAULT nextval('public.recuperaciones_id_seq'::regclass);


--
-- Name: reservas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas ALTER COLUMN id SET DEFAULT nextval('public.reservas_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: alojamientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alojamientos (id, activo, descripcion, nombre, anfitrion_id, alojamiento_dir) FROM stdin;
1	t	desc_ 10022_ 1000	nombreAloj_ 10022_ 1000	10022	1001
2	t	desc_ 10023_ 1000	nombreAloj_ 10023_ 1000	10023	1002
3	t	desc_ 10023_ 1001	nombreAloj_ 10023_ 1001	10023	1003
4	t	desc_ 10025_ 1000	nombreAloj_ 10025_ 1000	10025	1004
5	t	desc_ 10026_ 1000	nombreAloj_ 10026_ 1000	10026	1005
6	t	desc_ 10026_ 1001	nombreAloj_ 10026_ 1001	10026	1006
7	t	desc_ 10028_ 1000	nombreAloj_ 10028_ 1000	10028	1007
8	t	desc_ 10029_ 1000	nombreAloj_ 10029_ 1000	10029	1008
9	t	desc_ 10029_ 1001	nombreAloj_ 10029_ 1001	10029	1009
11	t	desc_ 10032_ 1000	nombreAloj_ 10032_ 1000	10032	10011
12	t	desc_ 10032_ 1001	nombreAloj_ 10032_ 1001	10032	10012
13	t	desc_ 10034_ 1000	nombreAloj_ 10034_ 1000	10034	10013
14	t	desc_ 10035_ 1000	nombreAloj_ 10035_ 1000	10035	10014
15	t	desc_ 10035_ 1001	nombreAloj_ 10035_ 1001	10035	10015
16	t	desc_ 10037_ 1000	nombreAloj_ 10037_ 1000	10037	10016
17	t	desc_ 10038_ 1000	nombreAloj_ 10038_ 1000	10038	10017
18	t	desc_ 10038_ 1001	nombreAloj_ 10038_ 1001	10038	10018
19	t	desc_ 10040_ 1000	nombreAloj_ 10040_ 1000	10040	10019
20	t	desc_ 10041_ 1000	nombreAloj_ 10041_ 1000	10041	10020
21	t	desc_ 10041_ 1001	nombreAloj_ 10041_ 1001	10041	10021
22	t	desc_ 10043_ 1000	nombreAloj_ 10043_ 1000	10043	10022
23	t	desc_ 10044_ 1000	nombreAloj_ 10044_ 1000	10044	10023
24	t	desc_ 10044_ 1001	nombreAloj_ 10044_ 1001	10044	10024
25	t	desc_ 10046_ 1000	nombreAloj_ 10046_ 1000	10046	10025
26	t	desc_ 10047_ 1000	nombreAloj_ 10047_ 1000	10047	10026
27	t	desc_ 10047_ 1001	nombreAloj_ 10047_ 1001	10047	10027
28	t	desc_ 10049_ 1000	nombreAloj_ 10049_ 1000	10049	10028
10	f	desc_ 10031_ 1000	nombreAloj_ 10031_ 1000	10031	10010
\.


--
-- Data for Name: calificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calificaciones (id, calificacion_anfitrion, calificacion_huesped, fecha_resena, resena) FROM stdin;
351	3	4	2022-05-03 00:00:00	RESEnA 351
353	4	2	2022-05-05 00:00:00	RESEÑA 353
355	2	5	2022-05-06 00:00:00	RESEÑA 355
357	5	4	2022-05-07 00:00:00	RESEÑA 357
359	4	2	2022-05-08 00:00:00	RESEÑA 359
361	5	4	2022-05-09 00:00:00	RESEÑA 361
363	2	3	2022-05-10 00:00:00	RESEÑA 363
365	5	5	2022-05-11 00:00:00	RESEÑA 365
367	2	3	2022-05-12 00:00:00	RESEÑA 367
369	4	4	2022-05-13 00:00:00	RESEÑA 369
371	1	5	2022-05-14 00:00:00	RESEÑA 371
373	4	3	2022-05-15 00:00:00	RESEÑA 373
375	4	1	2022-05-16 00:00:00	RESEÑA 375
377	5	1	2022-05-17 00:00:00	RESEÑA 377
379	1	1	2022-05-18 00:00:00	RESEÑA 379
381	3	1	2022-05-19 00:00:00	RESEÑA 381
383	4	5	2022-05-20 00:00:00	RESEÑA 383
\.


--
-- Data for Name: dt_direccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dt_direccion (id, calle, ciudad, numero, pais) FROM stdin;
1001	calle_dir$	ciudad 1001	 1001	1
1002	calle_dir$	ciudad 1002	 1001	1
1003	calle_dir$	ciudad 1000	 1001	1
1004	calle_dir$	ciudad 1001	 1001	1
1005	calle_dir$	ciudad 1002	 1001	2
1006	calle_dir$	ciudad 1000	 1001	1
1007	calle_dir$	ciudad 1001	 1001	1
1008	calle_dir$	ciudad 1002	 1001	3
1009	calle_dir$	ciudad 1000	 1001	1
10010	calle_dir$	ciudad 1001	 1001	1
10011	calle_dir$	ciudad 1002	 1001	1
10012	calle_dir$	ciudad 1000	 1001	2
10013	calle_dir$	ciudad 1001	 1001	1
10014	calle_dir$	ciudad 1002	 1001	1
10015	calle_dir$	ciudad 1000	 1001	1
10016	calle_dir$	ciudad 1001	 1001	1
10017	calle_dir$	ciudad 1002	 1001	3
10018	calle_dir$	ciudad 1000	 1001	1
10019	calle_dir$	ciudad 1001	 1001	1
10020	calle_dir$	ciudad 1002	 1001	1
10021	calle_dir$	ciudad 1000	 1001	1
10022	calle_dir$	ciudad 1001	 1001	1
10023	calle_dir$	ciudad 1002	 1001	1
10024	calle_dir$	ciudad 1000	 1001	4
10025	calle_dir$	ciudad 1001	 1001	1
10026	calle_dir$	ciudad 1002	 1001	1
10027	calle_dir$	ciudad 1000	 1001	1
10028	calle_dir$	ciudad 1001	 1001	1
10029	calle_dir$	ciudad 1002	 1001	2
10030	calle_dir$	ciudad 1000	 1001	1
10031	calle_dir$	ciudad 1001	 1001	1
10032	calle_dir$	ciudad 1002	 1001	1
10033	calle_dir$	ciudad 1000	 1001	1
10034	calle_dir$	ciudad 1001	 1001	1
10035	calle_dir$	ciudad 1002	 1001	1
10036	calle_dir$	ciudad 1000	 1001	8
10037	calle_dir$	ciudad 1001	 1001	1
10038	calle_dir$	ciudad 1002	 1001	1
10039	calle_dir$	ciudad 1000	 1001	15
10040	calle_dir$	ciudad 1001	 1001	1
10041	calle_dir$	ciudad 1002	 1001	1
10042	calle_dir$	ciudad 1000	 1001	8
10043	calle_dir$	ciudad 1001	 1001	1
10044	calle_dir$	ciudad 1002	 1001	1
10045	calle_dir$	ciudad 1000	 1001	1
10046	calle_dir$	ciudad 1001	 1001	15
10047	calle_dir$	ciudad 1002	 1001	1
10048	calle_dir$	ciudad 1000	 1001	1
10049	calle_dir$	ciudad 1001	 1001	1
\.


--
-- Data for Name: dt_pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dt_pais (id, nombre) FROM stdin;
1	Afganistán
2	Albania
3	Alemania
4	Andorra
5	Ango
6	Antigua y Barbuda
7	Arabia Saudita
8	Argia
9	Argentina
10	Armenia
11	Australia
12	Austria
13	Azerbaiyán
14	Bahamas s
15	Bahrein
16	Bangdesh
17	Barbados
18	Barús
19	Bélgica
20	Bice
21	Benin
22	Bhután
23	Bolivia Estado Plurinacional de
24	Bosnia y Herzegovina
25	Botswana
26	Brasil
27	Brunei Darussam
28	Bulgaria
29	Burkina Faso
30	Burundi
31	Cabo Verde
32	Camboya
33	Camerún
34	Canadá
35	Chad
36	Chequia
37	Chile
38	China
39	Chipre
40	Colombia
41	Comoras s
42	Congo
43	Costa Rica
44	Côte d’Ivoire
45	Croacia
46	Cuba
47	Dinamarca
48	Djibouti
49	Dominica
50	Ecuador
51	Egipto
52	 Salvador
53	Emiratos Árabes Unidos
54	Eritrea
55	Eslovaquia
56	Eslovenia
57	España
58	Estados Unidos de América
59	Estonia
60	Eswatini
61	Etiopía
62	Federación de Rusia
63	Fiji
64	Filipinas
65	Finndia
66	Francia
67	Gabón
68	Gambia
69	Georgia
70	Ghana
71	Granada
72	Grecia
73	Guatema
74	Guinea
75	Guinea Ecuatorial
76	Guinea-Bissau
77	Guyana
78	Haití
79	Honduras
80	Hungría
81	India
82	Indonesia
83	Irán República Islámica d
84	Iraq
85	Irnda
86	Isndia
87	Iss Cook s
88	Iss Marshall s
89	Iss Salomón s
90	Isra
91	Italia
92	Jamaica
93	Japón
94	Jordania
95	Kazajstán
96	Kenya
97	Kirguistán
98	Kiribati
99	Kuwait
100	Lesotho
101	Letonia
102	Líbano
103	Liberia
104	Libia
105	Liechtenstein
106	Lituania
107	Luxemburgo
108	Madagascar
109	Masia
110	Mawi
111	Maldivas
112	Malí
113	Malta
114	Marruecos
115	Mauricio
116	Mauritania
117	México
118	Micronesia Estados Federados de
119	Mónaco
120	Mongolia
121	Montenegro
122	Mozambique
123	Myanmar
124	Namibia
125	Nauru
126	Nepal
127	Nicaragua
128	Níger
129	Nigeria
130	Niue
131	Noruega
132	Nueva Zandia
133	Omán
134	Países Bajos
135	Pakistán
136	Pau
137	Panamá
138	Papua Nueva Guinea
139	Paraguay
140	Perú
141	Polonia
142	Portugal
143	Qatar
144	Reino Unido de Gran Bretaña e Irnda d Norte
145	República Árabe Siria
146	República Centroafricana
147	República de Corea
148	República de Macedonia d Norte
149	Nombre corto: Macedonia d Norte
150	República de Moldova
151	República Democrática d Congo
152	República Democrática Popur o
153	República Dominicana
154	República Popur Democrática de Corea
155	República Unida de Tanzanía
156	Rumania
157	Rwanda
158	Saint Kitts y Nevis
159	Samoa
160	San Marino
161	San Vicente y s Granadinas
162	Santa Lucía
163	Santa Sede
164	Santo Tomé y Príncipe
165	Senegal
166	Serbia
167	Seychles
168	Sierra Leona
169	Singapur
170	Somalia
171	Sri nka
172	Sudáfrica
173	Sudán
174	Sudán d Sur
175	Suecia
176	Suiza
177	Suriname
178	Taindia
179	Tayikistán
180	Timor-Leste
181	Togo
182	Tonga
183	Trinidad y Tabago
184	Túnez
185	Turkmenistán
186	Turquía
187	Tuvalu
188	Ucrania
189	Uganda
190	Uruguay
191	Uzbekistán
192	Vanuatu
193	Venezua República Bolivariana de
194	Viet Nam
195	Yemen
196	Zambia
197	Zimbabwe
1183	Afganistán
1184	Albania
1185	Alemania
1186	Andorra
1187	Ango
1188	Antigua y Barbuda
1189	Arabia Saudita
1190	Argia
1191	Argentina
1192	Armenia
1193	Australia
1194	Austria
1195	Azerbaiyán
1196	Bahamas s
1197	Bahrein
1198	Bangdesh
1199	Barbados
1200	Barús
1201	Bélgica
1202	Bice
1203	Benin
1204	Bhután
1205	Bolivia Estado Plurinacional de
1206	Bosnia y Herzegovina
1207	Botswana
1208	Brasil
1209	Brunei Darussam
1210	Bulgaria
1211	Burkina Faso
1212	Burundi
1213	Cabo Verde
1214	Camboya
1215	Camerún
1216	Canadá
1217	Chad
1218	Chequia
1219	Chile
1220	China
1221	Chipre
1222	Colombia
1223	Comoras s
1224	Congo
1225	Costa Rica
1226	Côte d’Ivoire
1227	Croacia
1228	Cuba
1229	Dinamarca
1230	Djibouti
1231	Dominica
1232	Ecuador
1233	Egipto
1234	 Salvador
1235	Emiratos Árabes Unidos
1236	Eritrea
1237	Eslovaquia
1238	Eslovenia
1239	España
1240	Estados Unidos de América
1241	Estonia
1242	Eswatini
1243	Etiopía
1244	Federación de Rusia
1245	Fiji
1246	Filipinas
1247	Finndia
1248	Francia
1249	Gabón
1250	Gambia
1251	Georgia
1252	Ghana
1253	Granada
1254	Grecia
1255	Guatema
1256	Guinea
1257	Guinea Ecuatorial
1258	Guinea-Bissau
1259	Guyana
1260	Haití
1261	Honduras
1262	Hungría
1263	India
1264	Indonesia
1265	Irán República Islámica d
1266	Iraq
1267	Irnda
1268	Isndia
1269	Iss Cook s
1270	Iss Marshall s
1271	Iss Salomón s
1272	Isra
1273	Italia
1274	Jamaica
1275	Japón
1276	Jordania
1277	Kazajstán
1278	Kenya
1279	Kirguistán
1280	Kiribati
1281	Kuwait
1282	Lesotho
1283	Letonia
1284	Líbano
1285	Liberia
1286	Libia
1287	Liechtenstein
1288	Lituania
1289	Luxemburgo
1290	Madagascar
1291	Masia
1292	Mawi
1293	Maldivas
1294	Malí
1295	Malta
1296	Marruecos
1297	Mauricio
1298	Mauritania
1299	México
1300	Micronesia Estados Federados de
1301	Mónaco
1302	Mongolia
1303	Montenegro
1304	Mozambique
1305	Myanmar
1306	Namibia
1307	Nauru
1308	Nepal
1309	Nicaragua
1310	Níger
1311	Nigeria
1312	Niue
1313	Noruega
1314	Nueva Zandia
1315	Omán
1316	Países Bajos
1317	Pakistán
1318	Pau
1319	Panamá
1320	Papua Nueva Guinea
1321	Paraguay
1322	Perú
1323	Polonia
1324	Portugal
1325	Qatar
1326	Reino Unido de Gran Bretaña e Irnda d Norte
1327	República Árabe Siria
1328	República Centroafricana
1329	República de Corea
1330	República de Macedonia d Norte
1331	Nombre corto: Macedonia d Norte
1332	República de Moldova
1333	República Democrática d Congo
1334	República Democrática Popur o
1335	República Dominicana
1336	República Popur Democrática de Corea
1337	República Unida de Tanzanía
1338	Rumania
1339	Rwanda
1340	Saint Kitts y Nevis
1341	Samoa
1342	San Marino
1343	San Vicente y s Granadinas
1344	Santa Lucía
1345	Santa Sede
1346	Santo Tomé y Príncipe
1347	Senegal
1348	Serbia
1349	Seychles
1350	Sierra Leona
1351	Singapur
1352	Somalia
1353	Sri nka
1354	Sudáfrica
1355	Sudán
1356	Sudán d Sur
1357	Suecia
1358	Suiza
1359	Suriname
1360	Taindia
1361	Tayikistán
1362	Timor-Leste
1363	Togo
1364	Tonga
1365	Trinidad y Tabago
1366	Túnez
1367	Turkmenistán
1368	Turquía
1369	Tuvalu
1370	Ucrania
1371	Uganda
1372	Uruguay
1373	Uzbekistán
1374	Vanuatu
1375	Venezua República Bolivariana de
1376	Viet Nam
1377	Yemen
1378	Zambia
1379	Zimbabwe
1380	Afganistán
1381	Albania
1382	Alemania
1383	Andorra
1384	Ango
1385	Antigua y Barbuda
1386	Arabia Saudita
1387	Argia
1388	Argentina
1389	Armenia
1390	Australia
1391	Austria
1392	Azerbaiyán
1393	Bahamas s
1394	Bahrein
1395	Bangdesh
1396	Barbados
1397	Barús
1398	Bélgica
1399	Bice
1400	Benin
1401	Bhután
1402	Bolivia Estado Plurinacional de
1403	Bosnia y Herzegovina
1404	Botswana
1405	Brasil
1406	Brunei Darussam
1407	Bulgaria
1408	Burkina Faso
1409	Burundi
1410	Cabo Verde
1411	Camboya
1412	Camerún
1413	Canadá
1414	Chad
1415	Chequia
1416	Chile
1417	China
1418	Chipre
1419	Colombia
1420	Comoras s
1421	Congo
1422	Costa Rica
1423	Côte d’Ivoire
1424	Croacia
1425	Cuba
1426	Dinamarca
1427	Djibouti
1428	Dominica
1429	Ecuador
1430	Egipto
1431	 Salvador
1432	Emiratos Árabes Unidos
1433	Eritrea
1434	Eslovaquia
1435	Eslovenia
1436	España
1437	Estados Unidos de América
1438	Estonia
1439	Eswatini
1440	Etiopía
1441	Federación de Rusia
1442	Fiji
1443	Filipinas
1444	Finndia
1445	Francia
1446	Gabón
1447	Gambia
1448	Georgia
1449	Ghana
1450	Granada
1451	Grecia
1452	Guatema
1453	Guinea
1454	Guinea Ecuatorial
1455	Guinea-Bissau
1456	Guyana
1457	Haití
1458	Honduras
1459	Hungría
1460	India
1461	Indonesia
1462	Irán República Islámica d
1463	Iraq
1464	Irnda
1465	Isndia
1466	Iss Cook s
1467	Iss Marshall s
1468	Iss Salomón s
1469	Isra
1470	Italia
1471	Jamaica
1472	Japón
1473	Jordania
1474	Kazajstán
1475	Kenya
1476	Kirguistán
1477	Kiribati
1478	Kuwait
1479	Lesotho
1480	Letonia
1481	Líbano
1482	Liberia
1483	Libia
1484	Liechtenstein
1485	Lituania
1486	Luxemburgo
1487	Madagascar
1488	Masia
1489	Mawi
1490	Maldivas
1491	Malí
1492	Malta
1493	Marruecos
1494	Mauricio
1495	Mauritania
1496	México
1497	Micronesia Estados Federados de
1498	Mónaco
1499	Mongolia
1500	Montenegro
1501	Mozambique
1502	Myanmar
1503	Namibia
1504	Nauru
1505	Nepal
1506	Nicaragua
1507	Níger
1508	Nigeria
1509	Niue
1510	Noruega
1511	Nueva Zandia
1512	Omán
1513	Países Bajos
1514	Pakistán
1515	Pau
1516	Panamá
1517	Papua Nueva Guinea
1518	Paraguay
1519	Perú
1520	Polonia
1521	Portugal
1522	Qatar
1523	Reino Unido de Gran Bretaña e Irnda d Norte
1524	República Árabe Siria
1525	República Centroafricana
1526	República de Corea
1527	República de Macedonia d Norte
1528	Nombre corto: Macedonia d Norte
1529	República de Moldova
1530	República Democrática d Congo
1531	República Democrática Popur o
1532	República Dominicana
1533	República Popur Democrática de Corea
1534	República Unida de Tanzanía
1535	Rumania
1536	Rwanda
1537	Saint Kitts y Nevis
1538	Samoa
1539	San Marino
1540	San Vicente y s Granadinas
1541	Santa Lucía
1542	Santa Sede
1543	Santo Tomé y Príncipe
1544	Senegal
1545	Serbia
1546	Seychles
1547	Sierra Leona
1548	Singapur
1549	Somalia
1550	Sri nka
1551	Sudáfrica
1552	Sudán
1553	Sudán d Sur
1554	Suecia
1555	Suiza
1556	Suriname
1557	Taindia
1558	Tayikistán
1559	Timor-Leste
1560	Togo
1561	Tonga
1562	Trinidad y Tabago
1563	Túnez
1564	Turkmenistán
1565	Turquía
1566	Tuvalu
1567	Ucrania
1568	Uganda
1569	Uruguay
1570	Uzbekistán
1571	Vanuatu
1572	Venezua República Bolivariana de
1573	Viet Nam
1574	Yemen
1575	Zambia
1576	Zimbabwe
1577	Afganistán
1578	Albania
1579	Alemania
1580	Andorra
1581	Ango
1582	Antigua y Barbuda
1583	Arabia Saudita
1584	Argia
1585	Argentina
1586	Armenia
1587	Australia
1588	Austria
1589	Azerbaiyán
1590	Bahamas s
1591	Bahrein
1592	Bangdesh
1593	Barbados
1594	Barús
1595	Bélgica
1596	Bice
1597	Benin
1598	Bhután
1599	Bolivia Estado Plurinacional de
1600	Bosnia y Herzegovina
1601	Botswana
1602	Brasil
1603	Brunei Darussam
1604	Bulgaria
1605	Burkina Faso
1606	Burundi
1607	Cabo Verde
1608	Camboya
1609	Camerún
1610	Canadá
1611	Chad
1612	Chequia
1613	Chile
1614	China
1615	Chipre
1616	Colombia
1617	Comoras s
1618	Congo
1619	Costa Rica
1620	Côte d’Ivoire
1621	Croacia
1622	Cuba
1623	Dinamarca
1624	Djibouti
1625	Dominica
1626	Ecuador
1627	Egipto
1628	 Salvador
1629	Emiratos Árabes Unidos
1630	Eritrea
1631	Eslovaquia
1632	Eslovenia
1633	España
1634	Estados Unidos de América
1635	Estonia
1636	Eswatini
1637	Etiopía
1638	Federación de Rusia
1639	Fiji
1640	Filipinas
1641	Finndia
1642	Francia
1643	Gabón
1644	Gambia
1645	Georgia
1646	Ghana
1647	Granada
1648	Grecia
1649	Guatema
1650	Guinea
1651	Guinea Ecuatorial
1652	Guinea-Bissau
1653	Guyana
1654	Haití
1655	Honduras
1656	Hungría
1657	India
1658	Indonesia
1659	Irán República Islámica d
1660	Iraq
1661	Irnda
1662	Isndia
1663	Iss Cook s
1664	Iss Marshall s
1665	Iss Salomón s
1666	Isra
1667	Italia
1668	Jamaica
1669	Japón
1670	Jordania
1671	Kazajstán
1672	Kenya
1673	Kirguistán
1674	Kiribati
1675	Kuwait
1676	Lesotho
1677	Letonia
1678	Líbano
1679	Liberia
1680	Libia
1681	Liechtenstein
1682	Lituania
1683	Luxemburgo
1684	Madagascar
1685	Masia
1686	Mawi
1687	Maldivas
1688	Malí
1689	Malta
1690	Marruecos
1691	Mauricio
1692	Mauritania
1693	México
1694	Micronesia Estados Federados de
1695	Mónaco
1696	Mongolia
1697	Montenegro
1698	Mozambique
1699	Myanmar
1700	Namibia
1701	Nauru
1702	Nepal
1703	Nicaragua
1704	Níger
1705	Nigeria
1706	Niue
1707	Noruega
1708	Nueva Zandia
1709	Omán
1710	Países Bajos
1711	Pakistán
1712	Pau
1713	Panamá
1714	Papua Nueva Guinea
1715	Paraguay
1716	Perú
1717	Polonia
1718	Portugal
1719	Qatar
1720	Reino Unido de Gran Bretaña e Irnda d Norte
1721	República Árabe Siria
1722	República Centroafricana
1723	República de Corea
1724	República de Macedonia d Norte
1725	Nombre corto: Macedonia d Norte
1726	República de Moldova
1727	República Democrática d Congo
1728	República Democrática Popur o
1729	República Dominicana
1730	República Popur Democrática de Corea
1731	República Unida de Tanzanía
1732	Rumania
1733	Rwanda
1734	Saint Kitts y Nevis
1735	Samoa
1736	San Marino
1737	San Vicente y s Granadinas
1738	Santa Lucía
1739	Santa Sede
1740	Santo Tomé y Príncipe
1741	Senegal
1742	Serbia
1743	Seychles
1744	Sierra Leona
1745	Singapur
1746	Somalia
1747	Sri nka
1748	Sudáfrica
1749	Sudán
1750	Sudán d Sur
1751	Suecia
1752	Suiza
1753	Suriname
1754	Taindia
1755	Tayikistán
1756	Timor-Leste
1757	Togo
1758	Tonga
1759	Trinidad y Tabago
1760	Túnez
1761	Turkmenistán
1762	Turquía
1763	Tuvalu
1764	Ucrania
1765	Uganda
1766	Uruguay
1767	Uzbekistán
1768	Vanuatu
1769	Venezua República Bolivariana de
1770	Viet Nam
1771	Yemen
1772	Zambia
1773	Zimbabwe
1774	Afganistán
1775	Albania
1776	Alemania
1777	Andorra
1778	Ango
1779	Antigua y Barbuda
1780	Arabia Saudita
1781	Argia
1782	Argentina
1783	Armenia
1784	Australia
1785	Austria
1786	Azerbaiyán
1787	Bahamas s
1788	Bahrein
1789	Bangdesh
1790	Barbados
1791	Barús
1792	Bélgica
1793	Bice
1794	Benin
1795	Bhután
1796	Bolivia Estado Plurinacional de
1797	Bosnia y Herzegovina
1798	Botswana
1799	Brasil
1800	Brunei Darussam
1801	Bulgaria
1802	Burkina Faso
1803	Burundi
1804	Cabo Verde
1805	Camboya
1806	Camerún
1807	Canadá
1808	Chad
1809	Chequia
1810	Chile
1811	China
1812	Chipre
1813	Colombia
1814	Comoras s
1815	Congo
1816	Costa Rica
1817	Côte d’Ivoire
1818	Croacia
1819	Cuba
1820	Dinamarca
1821	Djibouti
1822	Dominica
1823	Ecuador
1824	Egipto
1825	 Salvador
1826	Emiratos Árabes Unidos
1827	Eritrea
1828	Eslovaquia
1829	Eslovenia
1830	España
1831	Estados Unidos de América
1832	Estonia
1833	Eswatini
1834	Etiopía
1835	Federación de Rusia
1836	Fiji
1837	Filipinas
1838	Finndia
1839	Francia
1840	Gabón
1841	Gambia
1842	Georgia
1843	Ghana
1844	Granada
1845	Grecia
1846	Guatema
1847	Guinea
1848	Guinea Ecuatorial
1849	Guinea-Bissau
1850	Guyana
1851	Haití
1852	Honduras
1853	Hungría
1854	India
1855	Indonesia
1856	Irán República Islámica d
1857	Iraq
1858	Irnda
1859	Isndia
1860	Iss Cook s
1861	Iss Marshall s
1862	Iss Salomón s
1863	Isra
1864	Italia
1865	Jamaica
1866	Japón
1867	Jordania
1868	Kazajstán
1869	Kenya
1870	Kirguistán
1871	Kiribati
1872	Kuwait
1873	Lesotho
1874	Letonia
1875	Líbano
1876	Liberia
1877	Libia
1878	Liechtenstein
1879	Lituania
1880	Luxemburgo
1881	Madagascar
1882	Masia
1883	Mawi
1884	Maldivas
1885	Malí
1886	Malta
1887	Marruecos
1888	Mauricio
1889	Mauritania
1890	México
1891	Micronesia Estados Federados de
1892	Mónaco
1893	Mongolia
1894	Montenegro
1895	Mozambique
1896	Myanmar
1897	Namibia
1898	Nauru
1899	Nepal
1900	Nicaragua
1901	Níger
1902	Nigeria
1903	Niue
1904	Noruega
1905	Nueva Zandia
1906	Omán
1907	Países Bajos
1908	Pakistán
1909	Pau
1910	Panamá
1911	Papua Nueva Guinea
1912	Paraguay
1913	Perú
1914	Polonia
1915	Portugal
1916	Qatar
1917	Reino Unido de Gran Bretaña e Irnda d Norte
1918	República Árabe Siria
1919	República Centroafricana
1920	República de Corea
1921	República de Macedonia d Norte
1922	Nombre corto: Macedonia d Norte
1923	República de Moldova
1924	República Democrática d Congo
1925	República Democrática Popur o
1926	República Dominicana
1927	República Popur Democrática de Corea
1928	República Unida de Tanzanía
1929	Rumania
1930	Rwanda
1931	Saint Kitts y Nevis
1932	Samoa
1933	San Marino
1934	San Vicente y s Granadinas
1935	Santa Lucía
1936	Santa Sede
1937	Santo Tomé y Príncipe
1938	Senegal
1939	Serbia
1940	Seychles
1941	Sierra Leona
1942	Singapur
1943	Somalia
1944	Sri nka
1945	Sudáfrica
1946	Sudán
1947	Sudán d Sur
1948	Suecia
1949	Suiza
1950	Suriname
1951	Taindia
1952	Tayikistán
1953	Timor-Leste
1954	Togo
1955	Tonga
1956	Trinidad y Tabago
1957	Túnez
1958	Turkmenistán
1959	Turquía
1960	Tuvalu
1961	Ucrania
1962	Uganda
1963	Uruguay
1964	Uzbekistán
1965	Vanuatu
1966	Venezua República Bolivariana de
1967	Viet Nam
1968	Yemen
1969	Zambia
1970	Zimbabwe
1971	Afganistán
1972	Albania
1973	Alemania
1974	Andorra
1975	Ango
1976	Antigua y Barbuda
1977	Arabia Saudita
1978	Argia
1979	Argentina
1980	Armenia
1981	Australia
1982	Austria
1983	Azerbaiyán
1984	Bahamas s
1985	Bahrein
1986	Bangdesh
1987	Barbados
1988	Barús
1989	Bélgica
1990	Bice
1991	Benin
1992	Bhután
1993	Bolivia Estado Plurinacional de
1994	Bosnia y Herzegovina
1995	Botswana
1996	Brasil
1997	Brunei Darussam
1998	Bulgaria
1999	Burkina Faso
2000	Burundi
2001	Cabo Verde
2002	Camboya
2003	Camerún
2004	Canadá
2005	Chad
2006	Chequia
2007	Chile
2008	China
2009	Chipre
2010	Colombia
2011	Comoras s
2012	Congo
2013	Costa Rica
2014	Côte d’Ivoire
2015	Croacia
2016	Cuba
2017	Dinamarca
2018	Djibouti
2019	Dominica
2020	Ecuador
2021	Egipto
2022	 Salvador
2023	Emiratos Árabes Unidos
2024	Eritrea
2025	Eslovaquia
2026	Eslovenia
2027	España
2028	Estados Unidos de América
2029	Estonia
2030	Eswatini
2031	Etiopía
2032	Federación de Rusia
2033	Fiji
2034	Filipinas
2035	Finndia
2036	Francia
2037	Gabón
2038	Gambia
2039	Georgia
2040	Ghana
2041	Granada
2042	Grecia
2043	Guatema
2044	Guinea
2045	Guinea Ecuatorial
2046	Guinea-Bissau
2047	Guyana
2048	Haití
2049	Honduras
2050	Hungría
2051	India
2052	Indonesia
2053	Irán República Islámica d
2054	Iraq
2055	Irnda
2056	Isndia
2057	Iss Cook s
2058	Iss Marshall s
2059	Iss Salomón s
2060	Isra
2061	Italia
2062	Jamaica
2063	Japón
2064	Jordania
2065	Kazajstán
2066	Kenya
2067	Kirguistán
2068	Kiribati
2069	Kuwait
2070	Lesotho
2071	Letonia
2072	Líbano
2073	Liberia
2074	Libia
2075	Liechtenstein
2076	Lituania
2077	Luxemburgo
2078	Madagascar
2079	Masia
2080	Mawi
2081	Maldivas
2082	Malí
2083	Malta
2084	Marruecos
2085	Mauricio
2086	Mauritania
2087	México
2088	Micronesia Estados Federados de
2089	Mónaco
2090	Mongolia
2091	Montenegro
2092	Mozambique
2093	Myanmar
2094	Namibia
2095	Nauru
2096	Nepal
2097	Nicaragua
2098	Níger
2099	Nigeria
2100	Niue
2101	Noruega
2102	Nueva Zandia
2103	Omán
2104	Países Bajos
2105	Pakistán
2106	Pau
2107	Panamá
2108	Papua Nueva Guinea
2109	Paraguay
2110	Perú
2111	Polonia
2112	Portugal
2113	Qatar
2114	Reino Unido de Gran Bretaña e Irnda d Norte
2115	República Árabe Siria
2116	República Centroafricana
2117	República de Corea
2118	República de Macedonia d Norte
2119	Nombre corto: Macedonia d Norte
2120	República de Moldova
2121	República Democrática d Congo
2122	República Democrática Popur o
2123	República Dominicana
2124	República Popur Democrática de Corea
2125	República Unida de Tanzanía
2126	Rumania
2127	Rwanda
2128	Saint Kitts y Nevis
2129	Samoa
2130	San Marino
2131	San Vicente y s Granadinas
2132	Santa Lucía
2133	Santa Sede
2134	Santo Tomé y Príncipe
2135	Senegal
2136	Serbia
2137	Seychles
2138	Sierra Leona
2139	Singapur
2140	Somalia
2141	Sri nka
2142	Sudáfrica
2143	Sudán
2144	Sudán d Sur
2145	Suecia
2146	Suiza
2147	Suriname
2148	Taindia
2149	Tayikistán
2150	Timor-Leste
2151	Togo
2152	Tonga
2153	Trinidad y Tabago
2154	Túnez
2155	Turkmenistán
2156	Turquía
2157	Tuvalu
2158	Ucrania
2159	Uganda
2160	Uruguay
2161	Uzbekistán
2162	Vanuatu
2163	Venezua República Bolivariana de
2164	Viet Nam
2165	Yemen
2166	Zambia
2167	Zimbabwe
2168	Afganistán
2169	Albania
2170	Alemania
2171	Andorra
2172	Ango
2173	Antigua y Barbuda
2174	Arabia Saudita
2175	Argia
2176	Argentina
2177	Armenia
2178	Australia
2179	Austria
2180	Azerbaiyán
2181	Bahamas s
2182	Bahrein
2183	Bangdesh
2184	Barbados
2185	Barús
2186	Bélgica
2187	Bice
2188	Benin
2189	Bhután
2190	Bolivia Estado Plurinacional de
2191	Bosnia y Herzegovina
2192	Botswana
2193	Brasil
2194	Brunei Darussam
2195	Bulgaria
2196	Burkina Faso
2197	Burundi
2198	Cabo Verde
2199	Camboya
2200	Camerún
2201	Canadá
2202	Chad
2203	Chequia
2204	Chile
2205	China
2206	Chipre
2207	Colombia
2208	Comoras s
2209	Congo
2210	Costa Rica
2211	Côte d’Ivoire
2212	Croacia
2213	Cuba
2214	Dinamarca
2215	Djibouti
2216	Dominica
2217	Ecuador
2218	Egipto
2219	 Salvador
2220	Emiratos Árabes Unidos
2221	Eritrea
2222	Eslovaquia
2223	Eslovenia
2224	España
2225	Estados Unidos de América
2226	Estonia
2227	Eswatini
2228	Etiopía
2229	Federación de Rusia
2230	Fiji
2231	Filipinas
2232	Finndia
2233	Francia
2234	Gabón
2235	Gambia
2236	Georgia
2237	Ghana
2238	Granada
2239	Grecia
2240	Guatema
2241	Guinea
2242	Guinea Ecuatorial
2243	Guinea-Bissau
2244	Guyana
2245	Haití
2246	Honduras
2247	Hungría
2248	India
2249	Indonesia
2250	Irán República Islámica d
2251	Iraq
2252	Irnda
2253	Isndia
2254	Iss Cook s
2255	Iss Marshall s
2256	Iss Salomón s
2257	Isra
2258	Italia
2259	Jamaica
2260	Japón
2261	Jordania
2262	Kazajstán
2263	Kenya
2264	Kirguistán
2265	Kiribati
2266	Kuwait
2267	Lesotho
2268	Letonia
2269	Líbano
2270	Liberia
2271	Libia
2272	Liechtenstein
2273	Lituania
2274	Luxemburgo
2275	Madagascar
2276	Masia
2277	Mawi
2278	Maldivas
2279	Malí
2280	Malta
2281	Marruecos
2282	Mauricio
2283	Mauritania
2284	México
2285	Micronesia Estados Federados de
2286	Mónaco
2287	Mongolia
2288	Montenegro
2289	Mozambique
2290	Myanmar
2291	Namibia
2292	Nauru
2293	Nepal
2294	Nicaragua
2295	Níger
2296	Nigeria
2297	Niue
2298	Noruega
2299	Nueva Zandia
2300	Omán
2301	Países Bajos
2302	Pakistán
2303	Pau
2304	Panamá
2305	Papua Nueva Guinea
2306	Paraguay
2307	Perú
2308	Polonia
2309	Portugal
2310	Qatar
2311	Reino Unido de Gran Bretaña e Irnda d Norte
2312	República Árabe Siria
2313	República Centroafricana
2314	República de Corea
2315	República de Macedonia d Norte
2316	Nombre corto: Macedonia d Norte
2317	República de Moldova
2318	República Democrática d Congo
2319	República Democrática Popur o
2320	República Dominicana
2321	República Popur Democrática de Corea
2322	República Unida de Tanzanía
2323	Rumania
2324	Rwanda
2325	Saint Kitts y Nevis
2326	Samoa
2327	San Marino
2328	San Vicente y s Granadinas
2329	Santa Lucía
2330	Santa Sede
2331	Santo Tomé y Príncipe
2332	Senegal
2333	Serbia
2334	Seychles
2335	Sierra Leona
2336	Singapur
2337	Somalia
2338	Sri nka
2339	Sudáfrica
2340	Sudán
2341	Sudán d Sur
2342	Suecia
2343	Suiza
2344	Suriname
2345	Taindia
2346	Tayikistán
2347	Timor-Leste
2348	Togo
2349	Tonga
2350	Trinidad y Tabago
2351	Túnez
2352	Turkmenistán
2353	Turquía
2354	Tuvalu
2355	Ucrania
2356	Uganda
2357	Uruguay
2358	Uzbekistán
2359	Vanuatu
2360	Venezua República Bolivariana de
2361	Viet Nam
2362	Yemen
2363	Zambia
2364	Zimbabwe
2365	Afganistán
2366	Albania
2367	Alemania
2368	Andorra
2369	Ango
2370	Antigua y Barbuda
2371	Arabia Saudita
2372	Argia
2373	Argentina
2374	Armenia
2375	Australia
2376	Austria
2377	Azerbaiyán
2378	Bahamas s
2379	Bahrein
2380	Bangdesh
2381	Barbados
2382	Barús
2383	Bélgica
2384	Bice
2385	Benin
2386	Bhután
2387	Bolivia Estado Plurinacional de
2388	Bosnia y Herzegovina
2389	Botswana
2390	Brasil
2391	Brunei Darussam
2392	Bulgaria
2393	Burkina Faso
2394	Burundi
2395	Cabo Verde
2396	Camboya
2397	Camerún
2398	Canadá
2399	Chad
2400	Chequia
2401	Chile
2402	China
2403	Chipre
2404	Colombia
2405	Comoras s
2406	Congo
2407	Costa Rica
2408	Côte d’Ivoire
2409	Croacia
2410	Cuba
2411	Dinamarca
2412	Djibouti
2413	Dominica
2414	Ecuador
2415	Egipto
2416	 Salvador
2417	Emiratos Árabes Unidos
2418	Eritrea
2419	Eslovaquia
2420	Eslovenia
2421	España
2422	Estados Unidos de América
2423	Estonia
2424	Eswatini
2425	Etiopía
2426	Federación de Rusia
2427	Fiji
2428	Filipinas
2429	Finndia
2430	Francia
2431	Gabón
2432	Gambia
2433	Georgia
2434	Ghana
2435	Granada
2436	Grecia
2437	Guatema
2438	Guinea
2439	Guinea Ecuatorial
2440	Guinea-Bissau
2441	Guyana
2442	Haití
2443	Honduras
2444	Hungría
2445	India
2446	Indonesia
2447	Irán República Islámica d
2448	Iraq
2449	Irnda
2450	Isndia
2451	Iss Cook s
2452	Iss Marshall s
2453	Iss Salomón s
2454	Isra
2455	Italia
2456	Jamaica
2457	Japón
2458	Jordania
2459	Kazajstán
2460	Kenya
2461	Kirguistán
2462	Kiribati
2463	Kuwait
2464	Lesotho
2465	Letonia
2466	Líbano
2467	Liberia
2468	Libia
2469	Liechtenstein
2470	Lituania
2471	Luxemburgo
2472	Madagascar
2473	Masia
2474	Mawi
2475	Maldivas
2476	Malí
2477	Malta
2478	Marruecos
2479	Mauricio
2480	Mauritania
2481	México
2482	Micronesia Estados Federados de
2483	Mónaco
2484	Mongolia
2485	Montenegro
2486	Mozambique
2487	Myanmar
2488	Namibia
2489	Nauru
2490	Nepal
2491	Nicaragua
2492	Níger
2493	Nigeria
2494	Niue
2495	Noruega
2496	Nueva Zandia
2497	Omán
2498	Países Bajos
2499	Pakistán
2500	Pau
2501	Panamá
2502	Papua Nueva Guinea
2503	Paraguay
2504	Perú
2505	Polonia
2506	Portugal
2507	Qatar
2508	Reino Unido de Gran Bretaña e Irnda d Norte
2509	República Árabe Siria
2510	República Centroafricana
2511	República de Corea
2512	República de Macedonia d Norte
2513	Nombre corto: Macedonia d Norte
2514	República de Moldova
2515	República Democrática d Congo
2516	República Democrática Popur o
2517	República Dominicana
2518	República Popur Democrática de Corea
2519	República Unida de Tanzanía
2520	Rumania
2521	Rwanda
2522	Saint Kitts y Nevis
2523	Samoa
2524	San Marino
2525	San Vicente y s Granadinas
2526	Santa Lucía
2527	Santa Sede
2528	Santo Tomé y Príncipe
2529	Senegal
2530	Serbia
2531	Seychles
2532	Sierra Leona
2533	Singapur
2534	Somalia
2535	Sri nka
2536	Sudáfrica
2537	Sudán
2538	Sudán d Sur
2539	Suecia
2540	Suiza
2541	Suriname
2542	Taindia
2543	Tayikistán
2544	Timor-Leste
2545	Togo
2546	Tonga
2547	Trinidad y Tabago
2548	Túnez
2549	Turkmenistán
2550	Turquía
2551	Tuvalu
2552	Ucrania
2553	Uganda
2554	Uruguay
2555	Uzbekistán
2556	Vanuatu
2557	Venezua República Bolivariana de
2558	Viet Nam
2559	Yemen
2560	Zambia
2561	Zimbabwe
2562	Afganistán
2563	Albania
2564	Alemania
2565	Andorra
2566	Ango
2567	Antigua y Barbuda
2568	Arabia Saudita
2569	Argia
2570	Argentina
2571	Armenia
2572	Australia
2573	Austria
2574	Azerbaiyán
2575	Bahamas s
2576	Bahrein
2577	Bangdesh
2578	Barbados
2579	Barús
2580	Bélgica
2581	Bice
2582	Benin
2583	Bhután
2584	Bolivia Estado Plurinacional de
2585	Bosnia y Herzegovina
2586	Botswana
2587	Brasil
2588	Brunei Darussam
2589	Bulgaria
2590	Burkina Faso
2591	Burundi
2592	Cabo Verde
2593	Camboya
2594	Camerún
2595	Canadá
2596	Chad
2597	Chequia
2598	Chile
2599	China
2600	Chipre
2601	Colombia
2602	Comoras s
2603	Congo
2604	Costa Rica
2605	Côte d’Ivoire
2606	Croacia
2607	Cuba
2608	Dinamarca
2609	Djibouti
2610	Dominica
2611	Ecuador
2612	Egipto
2613	 Salvador
2614	Emiratos Árabes Unidos
2615	Eritrea
2616	Eslovaquia
2617	Eslovenia
2618	España
2619	Estados Unidos de América
2620	Estonia
2621	Eswatini
2622	Etiopía
2623	Federación de Rusia
2624	Fiji
2625	Filipinas
2626	Finndia
2627	Francia
2628	Gabón
2629	Gambia
2630	Georgia
2631	Ghana
2632	Granada
2633	Grecia
2634	Guatema
2635	Guinea
2636	Guinea Ecuatorial
2637	Guinea-Bissau
2638	Guyana
2639	Haití
2640	Honduras
2641	Hungría
2642	India
2643	Indonesia
2644	Irán República Islámica d
2645	Iraq
2646	Irnda
2647	Isndia
2648	Iss Cook s
2649	Iss Marshall s
2650	Iss Salomón s
2651	Isra
2652	Italia
2653	Jamaica
2654	Japón
2655	Jordania
2656	Kazajstán
2657	Kenya
2658	Kirguistán
2659	Kiribati
2660	Kuwait
2661	Lesotho
2662	Letonia
2663	Líbano
2664	Liberia
2665	Libia
2666	Liechtenstein
2667	Lituania
2668	Luxemburgo
2669	Madagascar
2670	Masia
2671	Mawi
2672	Maldivas
2673	Malí
2674	Malta
2675	Marruecos
2676	Mauricio
2677	Mauritania
2678	México
2679	Micronesia Estados Federados de
2680	Mónaco
2681	Mongolia
2682	Montenegro
2683	Mozambique
2684	Myanmar
2685	Namibia
2686	Nauru
2687	Nepal
2688	Nicaragua
2689	Níger
2690	Nigeria
2691	Niue
2692	Noruega
2693	Nueva Zandia
2694	Omán
2695	Países Bajos
2696	Pakistán
2697	Pau
2698	Panamá
2699	Papua Nueva Guinea
2700	Paraguay
2701	Perú
2702	Polonia
2703	Portugal
2704	Qatar
2705	Reino Unido de Gran Bretaña e Irnda d Norte
2706	República Árabe Siria
2707	República Centroafricana
2708	República de Corea
2709	República de Macedonia d Norte
2710	Nombre corto: Macedonia d Norte
2711	República de Moldova
2712	República Democrática d Congo
2713	República Democrática Popur o
2714	República Dominicana
2715	República Popur Democrática de Corea
2716	República Unida de Tanzanía
2717	Rumania
2718	Rwanda
2719	Saint Kitts y Nevis
2720	Samoa
2721	San Marino
2722	San Vicente y s Granadinas
2723	Santa Lucía
2724	Santa Sede
2725	Santo Tomé y Príncipe
2726	Senegal
2727	Serbia
2728	Seychles
2729	Sierra Leona
2730	Singapur
2731	Somalia
2732	Sri nka
2733	Sudáfrica
2734	Sudán
2735	Sudán d Sur
2736	Suecia
2737	Suiza
2738	Suriname
2739	Taindia
2740	Tayikistán
2741	Timor-Leste
2742	Togo
2743	Tonga
2744	Trinidad y Tabago
2745	Túnez
2746	Turkmenistán
2747	Turquía
2748	Tuvalu
2749	Ucrania
2750	Uganda
2751	Uruguay
2752	Uzbekistán
2753	Vanuatu
2754	Venezua República Bolivariana de
2755	Viet Nam
2756	Yemen
2757	Zambia
2758	Zimbabwe
2759	Afganistán
2760	Albania
2761	Alemania
2762	Andorra
2763	Ango
2764	Antigua y Barbuda
2765	Arabia Saudita
2766	Argia
2767	Argentina
2768	Armenia
2769	Australia
2770	Austria
2771	Azerbaiyán
2772	Bahamas s
2773	Bahrein
2774	Bangdesh
2775	Barbados
2776	Barús
2777	Bélgica
2778	Bice
2779	Benin
2780	Bhután
2781	Bolivia Estado Plurinacional de
2782	Bosnia y Herzegovina
2783	Botswana
2784	Brasil
2785	Brunei Darussam
2786	Bulgaria
2787	Burkina Faso
2788	Burundi
2789	Cabo Verde
2790	Camboya
2791	Camerún
2792	Canadá
2793	Chad
2794	Chequia
2795	Chile
2796	China
2797	Chipre
2798	Colombia
2799	Comoras s
2800	Congo
2801	Costa Rica
2802	Côte d’Ivoire
2803	Croacia
2804	Cuba
2805	Dinamarca
2806	Djibouti
2807	Dominica
2808	Ecuador
2809	Egipto
2810	 Salvador
2811	Emiratos Árabes Unidos
2812	Eritrea
2813	Eslovaquia
2814	Eslovenia
2815	España
2816	Estados Unidos de América
2817	Estonia
2818	Eswatini
2819	Etiopía
2820	Federación de Rusia
2821	Fiji
2822	Filipinas
2823	Finndia
2824	Francia
2825	Gabón
2826	Gambia
2827	Georgia
2828	Ghana
2829	Granada
2830	Grecia
2831	Guatema
2832	Guinea
2833	Guinea Ecuatorial
2834	Guinea-Bissau
2835	Guyana
2836	Haití
2837	Honduras
2838	Hungría
2839	India
2840	Indonesia
2841	Irán República Islámica d
2842	Iraq
2843	Irnda
2844	Isndia
2845	Iss Cook s
2846	Iss Marshall s
2847	Iss Salomón s
2848	Isra
2849	Italia
2850	Jamaica
2851	Japón
2852	Jordania
2853	Kazajstán
2854	Kenya
2855	Kirguistán
2856	Kiribati
2857	Kuwait
2858	Lesotho
2859	Letonia
2860	Líbano
2861	Liberia
2862	Libia
2863	Liechtenstein
2864	Lituania
2865	Luxemburgo
2866	Madagascar
2867	Masia
2868	Mawi
2869	Maldivas
2870	Malí
2871	Malta
2872	Marruecos
2873	Mauricio
2874	Mauritania
2875	México
2876	Micronesia Estados Federados de
2877	Mónaco
2878	Mongolia
2879	Montenegro
2880	Mozambique
2881	Myanmar
2882	Namibia
2883	Nauru
2884	Nepal
2885	Nicaragua
2886	Níger
2887	Nigeria
2888	Niue
2889	Noruega
2890	Nueva Zandia
2891	Omán
2892	Países Bajos
2893	Pakistán
2894	Pau
2895	Panamá
2896	Papua Nueva Guinea
2897	Paraguay
2898	Perú
2899	Polonia
2900	Portugal
2901	Qatar
2902	Reino Unido de Gran Bretaña e Irnda d Norte
2903	República Árabe Siria
2904	República Centroafricana
2905	República de Corea
2906	República de Macedonia d Norte
2907	Nombre corto: Macedonia d Norte
2908	República de Moldova
2909	República Democrática d Congo
2910	República Democrática Popur o
2911	República Dominicana
2912	República Popur Democrática de Corea
2913	República Unida de Tanzanía
2914	Rumania
2915	Rwanda
2916	Saint Kitts y Nevis
2917	Samoa
2918	San Marino
2919	San Vicente y s Granadinas
2920	Santa Lucía
2921	Santa Sede
2922	Santo Tomé y Príncipe
2923	Senegal
2924	Serbia
2925	Seychles
2926	Sierra Leona
2927	Singapur
2928	Somalia
2929	Sri nka
2930	Sudáfrica
2931	Sudán
2932	Sudán d Sur
2933	Suecia
2934	Suiza
2935	Suriname
2936	Taindia
2937	Tayikistán
2938	Timor-Leste
2939	Togo
2940	Tonga
2941	Trinidad y Tabago
2942	Túnez
2943	Turkmenistán
2944	Turquía
2945	Tuvalu
2946	Ucrania
2947	Uganda
2948	Uruguay
2949	Uzbekistán
2950	Vanuatu
2951	Venezua República Bolivariana de
2952	Viet Nam
2953	Yemen
2954	Zambia
2955	Zimbabwe
2956	Afganistán
2957	Albania
2958	Alemania
2959	Andorra
2960	Ango
2961	Antigua y Barbuda
2962	Arabia Saudita
2963	Argia
2964	Argentina
2965	Armenia
2966	Australia
2967	Austria
2968	Azerbaiyán
2969	Bahamas s
2970	Bahrein
2971	Bangdesh
2972	Barbados
2973	Barús
2974	Bélgica
2975	Bice
2976	Benin
2977	Bhután
2978	Bolivia Estado Plurinacional de
2979	Bosnia y Herzegovina
2980	Botswana
2981	Brasil
2982	Brunei Darussam
2983	Bulgaria
2984	Burkina Faso
2985	Burundi
2986	Cabo Verde
2987	Camboya
2988	Camerún
2989	Canadá
2990	Chad
2991	Chequia
2992	Chile
2993	China
2994	Chipre
2995	Colombia
2996	Comoras s
2997	Congo
2998	Costa Rica
2999	Côte d’Ivoire
3000	Croacia
3001	Cuba
3002	Dinamarca
3003	Djibouti
3004	Dominica
3005	Ecuador
3006	Egipto
3007	 Salvador
3008	Emiratos Árabes Unidos
3009	Eritrea
3010	Eslovaquia
3011	Eslovenia
3012	España
3013	Estados Unidos de América
3014	Estonia
3015	Eswatini
3016	Etiopía
3017	Federación de Rusia
3018	Fiji
3019	Filipinas
3020	Finndia
3021	Francia
3022	Gabón
3023	Gambia
3024	Georgia
3025	Ghana
3026	Granada
3027	Grecia
3028	Guatema
3029	Guinea
3030	Guinea Ecuatorial
3031	Guinea-Bissau
3032	Guyana
3033	Haití
3034	Honduras
3035	Hungría
3036	India
3037	Indonesia
3038	Irán República Islámica d
3039	Iraq
3040	Irnda
3041	Isndia
3042	Iss Cook s
3043	Iss Marshall s
3044	Iss Salomón s
3045	Isra
3046	Italia
3047	Jamaica
3048	Japón
3049	Jordania
3050	Kazajstán
3051	Kenya
3052	Kirguistán
3053	Kiribati
3054	Kuwait
3055	Lesotho
3056	Letonia
3057	Líbano
3058	Liberia
3059	Libia
3060	Liechtenstein
3061	Lituania
3062	Luxemburgo
3063	Madagascar
3064	Masia
3065	Mawi
3066	Maldivas
3067	Malí
3068	Malta
3069	Marruecos
3070	Mauricio
3071	Mauritania
3072	México
3073	Micronesia Estados Federados de
3074	Mónaco
3075	Mongolia
3076	Montenegro
3077	Mozambique
3078	Myanmar
3079	Namibia
3080	Nauru
3081	Nepal
3082	Nicaragua
3083	Níger
3084	Nigeria
3085	Niue
3086	Noruega
3087	Nueva Zandia
3088	Omán
3089	Países Bajos
3090	Pakistán
3091	Pau
3092	Panamá
3093	Papua Nueva Guinea
3094	Paraguay
3095	Perú
3096	Polonia
3097	Portugal
3098	Qatar
3099	Reino Unido de Gran Bretaña e Irnda d Norte
3100	República Árabe Siria
3101	República Centroafricana
3102	República de Corea
3103	República de Macedonia d Norte
3104	Nombre corto: Macedonia d Norte
3105	República de Moldova
3106	República Democrática d Congo
3107	República Democrática Popur o
3108	República Dominicana
3109	República Popur Democrática de Corea
3110	República Unida de Tanzanía
3111	Rumania
3112	Rwanda
3113	Saint Kitts y Nevis
3114	Samoa
3115	San Marino
3116	San Vicente y s Granadinas
3117	Santa Lucía
3118	Santa Sede
3119	Santo Tomé y Príncipe
3120	Senegal
3121	Serbia
3122	Seychles
3123	Sierra Leona
3124	Singapur
3125	Somalia
3126	Sri nka
3127	Sudáfrica
3128	Sudán
3129	Sudán d Sur
3130	Suecia
3131	Suiza
3132	Suriname
3133	Taindia
3134	Tayikistán
3135	Timor-Leste
3136	Togo
3137	Tonga
3138	Trinidad y Tabago
3139	Túnez
3140	Turkmenistán
3141	Turquía
3142	Tuvalu
3143	Ucrania
3144	Uganda
3145	Uruguay
3146	Uzbekistán
3147	Vanuatu
3148	Venezua República Bolivariana de
3149	Viet Nam
3150	Yemen
3151	Zambia
3152	Zimbabwe
\.


--
-- Data for Name: dt_servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dt_servicios (id, aire, desayuno, jacuzzi, parking, tv_cable, wifi) FROM stdin;
101	t	t	t	t	t	t
102	t	t	t	f	f	t
103	t	f	f	f	t	t
104	t	t	t	f	t	t
105	t	f	t	f	f	t
106	f	f	f	t	f	t
107	t	t	f	f	f	t
108	t	t	f	f	f	t
109	t	f	f	t	t	t
110	t	f	t	t	f	t
111	f	f	f	t	f	f
112	f	f	f	t	t	f
113	f	t	f	t	f	f
114	t	t	f	t	f	t
115	f	f	t	f	f	t
116	t	t	f	t	t	f
117	f	f	f	t	t	f
118	t	t	t	t	t	t
119	f	t	t	f	t	f
120	f	t	t	f	t	t
121	t	t	f	t	f	f
122	t	f	f	t	t	f
123	f	f	f	t	t	f
124	t	t	f	f	f	f
125	f	f	f	t	f	f
126	t	f	f	t	f	t
127	t	t	f	t	f	f
128	f	t	f	f	t	f
\.


--
-- Data for Name: facturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facturas (id, descuento, estado, fecha, id_paypal, monto, monto_descuento, reserva_id) FROM stdin;
2	t	REALIZADO	2022-02-12 00:00:00.546	\N	1312	100	368
3	t	REALIZADO	2022-02-12 00:00:00.619	\N	1312	100	373
4	t	REALIZADO	2022-01-12 00:00:00.941	\N	1312	100	354
5	t	REALIZADO	2022-01-12 00:00:00.158	\N	1312	100	376
6	t	REALIZADO	2021-10-31 00:00:00.544	\N	1200	100	360
7	t	REALIZADO	2021-10-31 00:00:00.099	\N	1210	100	356
8	t	REALIZADO	2021-10-31 00:00:00.742	\N	1210	100	362
\.


--
-- Data for Name: habitaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habitaciones (id, camas, descripcion, precio_noche, alojamiento_id, servicios_id) FROM stdin;
101	2	Desc hab 101	500	1	101
102	4	Desc hab 102	1400	2	102
103	1	Desc hab 103	1200	3	103
104	1	Desc hab 104	1500	4	104
105	1	Desc hab 105	500	5	105
106	2	Desc hab 106	1250	6	106
107	2	Desc hab 107	1350	7	107
108	3	Desc hab 108	1450	8	108
109	2	Desc hab 109	1200	9	109
110	1	Desc hab 110	1150	10	110
111	3	Desc hab 111	1100	11	111
112	2	Desc hab 112	1050	12	112
113	3	Desc hab 113	750	13	113
114	1	Desc hab 114	1050	14	114
115	2	Desc hab 115	750	15	115
116	2	Desc hab 116	1500	16	116
117	4	Desc hab 117	750	17	117
118	3	Desc hab 118	1150	18	118
119	4	Desc hab 119	800	19	119
120	3	Desc hab 120	1100	20	120
121	2	Desc hab 121	1200	21	121
122	1	Desc hab 122	900	22	122
123	1	Desc hab 123	550	23	123
124	4	Desc hab 124	500	24	124
125	1	Desc hab 125	1000	25	125
126	1	Desc hab 126	850	26	126
127	2	Desc hab 127	1150	27	127
128	3	Desc hab 128	1150	28	128
\.


--
-- Data for Name: huesped_push_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.huesped_push_tokens (huesped_id, push_tokens) FROM stdin;
\.


--
-- Data for Name: password_reset_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_token (id, expiry_date, token, user_id) FROM stdin;
\.


--
-- Data for Name: recuperaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recuperaciones (id, fecha) FROM stdin;
\.


--
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas (id, cant_dias, estado, fecha_fin, fecha_inicio, id_chat, calificacion_id, habitacion_id, huesped_id) FROM stdin;
352	3	PENDIENTE	2022-03-08 00:00:00	2022-03-06 00:00:00	\N	351	116	10057
358	9	PENDIENTE	2022-04-19 00:00:00	2022-04-11 00:00:00	\N	351	102	10071
364	15	PENDIENTE	2022-05-31 00:00:00	2022-05-17 00:00:00	\N	351	101	10051
366	2	PENDIENTE	2022-05-08 00:00:00	2022-05-07 00:00:00	\N	351	117	10072
370	6	PENDIENTE	2022-06-05 00:00:00	2022-05-31 00:00:00	\N	351	118	10078
372	8	PENDIENTE	2022-06-19 00:00:00	2022-06-12 00:00:00	\N	351	111	10099
378	14	PENDIENTE	2022-07-31 00:00:00	2022-07-18 00:00:00	\N	351	120	10061
380	3	EJECUTADA	2022-07-08 00:00:00	2022-07-06 00:00:00	\N	351	121	10085
382	3	PENDIENTE	2022-07-18 00:00:00	2022-07-16 00:00:00	\N	351	114	10080
384	3	PENDIENTE	2022-07-28 00:00:00	2022-07-26 00:00:00	\N	351	109	10076
374	10	RECHAZADO	2022-07-03 00:00:00	2022-06-24 00:00:00	\N	351	125	10085
367	3	EJECUTADA	2022-05-15 00:00:00	2022-05-13 00:00:00	\N	367	120	10095
368	4	EJECUTADA	2022-05-22 00:00:00	2022-05-19 00:00:00	\N	351	119	10067
373	9	EJECUTADA	2022-06-26 00:00:00	2022-06-18 00:00:00	\N	373	124	10091
354	5	EJECUTADA	2022-03-22 00:00:00	2022-03-18 00:00:00	\N	351	122	10053
360	11	EJECUTADA	2022-05-03 00:00:00	2022-04-23 00:00:00	\N	351	108	10060
376	12	EJECUTADA	2022-07-17 00:00:00	2022-07-06 00:00:00	\N	351	125	10094
362	13	EJECUTADA	2022-05-17 00:00:00	2022-05-05 00:00:00	\N	351	128	10051
356	7	APROBADO	2022-04-05 00:00:00	2022-03-30 00:00:00	\N	351	108	10085
351	2	APROBADO	2022-03-01 00:00:00	2022-02-28 00:00:00	\N	351	128	10072
353	4	APROBADO	2022-03-15 00:00:00	2022-03-12 00:00:00	\N	353	126	10080
355	6	APROBADO	2022-03-29 00:00:00	2022-03-24 00:00:00	\N	355	103	10053
357	8	APROBADO	2022-04-12 00:00:00	2022-04-05 00:00:00	\N	357	104	10064
359	10	APROBADO	2022-04-26 00:00:00	2022-04-17 00:00:00	\N	359	126	10088
361	12	APROBADO	2022-05-10 00:00:00	2022-04-29 00:00:00	\N	361	103	10055
363	14	APROBADO	2022-05-24 00:00:00	2022-05-11 00:00:00	\N	363	121	10070
365	1	APROBADO	2022-05-01 00:00:00	2022-05-01 00:00:00	\N	365	122	10079
369	5	APROBADO	2022-05-29 00:00:00	2022-05-25 00:00:00	\N	369	111	10089
371	7	APROBADO	2022-06-12 00:00:00	2022-06-06 00:00:00	\N	371	107	10051
375	11	APROBADO	2022-07-10 00:00:00	2022-06-30 00:00:00	\N	375	117	10054
377	13	APROBADO	2022-07-24 00:00:00	2022-07-12 00:00:00	\N	377	106	10063
379	3	APROBADO	2022-07-03 00:00:00	2022-07-01 00:00:00	\N	379	124	10097
381	3	APROBADO	2022-07-13 00:00:00	2022-07-11 00:00:00	\N	381	109	10079
383	3	APROBADO	2022-07-23 00:00:00	2022-07-21 00:00:00	\N	383	113	10074
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (dtype, id, activo, apellido, bloqueado, email, nombre, pass, calificacion_global, estado, user_id, f_creacion_usuario) FROM stdin;
Ad	1001	t	apeAd 1001	f	emailAd 1001	nomAd 1001	adPass 1001	1000	\N	\N	2022-05-13 00:00:00
Hu	10073	f	apeHu 10073	f	emailHu 10073	nomHu 10073	huPass 10073	1000	APROBADO	\N	2022-05-13 00:00:00
Ad	1002	t	apeAd 1002	f	emailAd 1002	nomAd 1002	adPass 1002	1000	\N	\N	2022-05-13 00:00:00
Ad	1003	t	apeAd 1003	f	emailAd 1003	nomAd 1003	adPass 1003	1000	\N	\N	2022-05-13 00:00:00
Ad	1004	t	apeAd 1004	f	emailAd 1004	nomAd 1004	adPass 1004	1000	\N	\N	2022-05-13 00:00:00
Ad	1005	f	apeAd 1005	f	emailAd 1005	nomAd 1005	adPass 1005	1000	\N	\N	2022-05-13 00:00:00
Ad	1006	t	apeAd 1006	f	emailAd 1006	nomAd 1006	adPass 1006	1000	\N	\N	2022-05-13 00:00:00
Ad	1007	t	apeAd 1007	t	emailAd 1007	nomAd 1007	adPass 1007	1000	\N	\N	2022-05-13 00:00:00
Ad	1008	t	apeAd 1008	f	emailAd 1008	nomAd 1008	adPass 1008	1000	\N	\N	2022-05-13 00:00:00
Ad	1009	t	apeAd 1009	f	emailAd 1009	nomAd 1009	adPass 1009	1000	\N	\N	2022-05-13 00:00:00
Ad	10010	t	apeAd 10010	f	emailAd 10010	nomAd 10010	adPass 10010	1000	\N	\N	2022-05-13 00:00:00
Ad	10011	t	apeAd 10011	f	emailAd 10011	nomAd 10011	adPass 10011	1000	\N	\N	2022-05-13 00:00:00
Ad	10012	t	apeAd 10012	f	emailAd 10012	nomAd 10012	adPass 10012	1000	\N	\N	2022-05-13 00:00:00
Ad	10013	f	apeAd 10013	f	emailAd 10013	nomAd 10013	adPass 10013	1000	\N	\N	2022-05-13 00:00:00
Ad	10014	t	apeAd 10014	f	emailAd 10014	nomAd 10014	adPass 10014	1000	\N	\N	2022-05-13 00:00:00
Ad	10015	t	apeAd 10015	f	emailAd 10015	nomAd 10015	adPass 10015	1000	\N	\N	2022-05-13 00:00:00
Ad	10016	t	apeAd 10016	f	emailAd 10016	nomAd 10016	adPass 10016	1000	\N	\N	2022-05-13 00:00:00
Ad	10017	t	apeAd 10017	f	emailAd 10017	nomAd 10017	adPass 10017	1000	\N	\N	2022-05-13 00:00:00
Ad	10018	t	apeAd 10018	f	emailAd 10018	nomAd 10018	adPass 10018	1000	\N	\N	2022-05-13 00:00:00
Ad	10019	t	apeAd 10019	f	emailAd 10019	nomAd 10019	adPass 10019	1000	\N	\N	2022-05-13 00:00:00
Ad	10020	t	apeAd 10020	f	emailAd 10020	nomAd 10020	adPass 10020	1000	\N	\N	2022-05-13 00:00:00
An	10021	t	apeAn 10021	f	emailAn 10021	nomAn 10021	anPass 10021	1000	APROBADO	\N	2022-05-13 00:00:00
An	10022	t	apeAn 10022	f	emailAn 10022	nomAn 10022	anPass 10022	1000	APROBADO	\N	2022-05-13 00:00:00
An	10023	f	apeAn 10023	f	emailAn 10023	nomAn 10023	anPass 10023	1000	APROBADO	\N	2022-05-13 00:00:00
An	10024	t	apeAn 10024	f	emailAn 10024	nomAn 10024	anPass 10024	1000	APROBADO	\N	2022-05-13 00:00:00
An	10025	t	apeAn 10025	f	emailAn 10025	nomAn 10025	anPass 10025	1000	APROBADO	\N	2022-05-13 00:00:00
An	10026	t	apeAn 10026	f	emailAn 10026	nomAn 10026	anPass 10026	1000	APROBADO	\N	2022-05-13 00:00:00
An	10027	t	apeAn 10027	f	emailAn 10027	nomAn 10027	anPass 10027	1000	APROBADO	\N	2022-05-13 00:00:00
An	10028	t	apeAn 10028	f	emailAn 10028	nomAn 10028	anPass 10028	1000	APROBADO	\N	2022-05-13 00:00:00
An	10029	t	apeAn 10029	f	emailAn 10029	nomAn 10029	anPass 10029	1000	APROBADO	\N	2022-05-13 00:00:00
An	10030	t	apeAn 10030	f	emailAn 10030	nomAn 10030	anPass 10030	1000	APROBADO	\N	2022-05-13 00:00:00
An	10032	t	apeAn 10032	f	emailAn 10032	nomAn 10032	anPass 10032	1000	APROBADO	\N	2022-05-13 00:00:00
An	10033	f	apeAn 10033	f	emailAn 10033	nomAn 10033	anPass 10033	1000	APROBADO	\N	2022-05-13 00:00:00
An	10034	t	apeAn 10034	f	emailAn 10034	nomAn 10034	anPass 10034	1000	APROBADO	\N	2022-05-13 00:00:00
An	10035	t	apeAn 10035	t	emailAn 10035	nomAn 10035	anPass 10035	1000	APROBADO	\N	2022-05-13 00:00:00
An	10036	t	apeAn 10036	f	emailAn 10036	nomAn 10036	anPass 10036	1000	RECHAZADO	\N	2022-05-13 00:00:00
An	10037	t	apeAn 10037	f	emailAn 10037	nomAn 10037	anPass 10037	1000	APROBADO	\N	2022-05-13 00:00:00
An	10038	t	apeAn 10038	t	emailAn 10038	nomAn 10038	anPass 10038	1000	APROBADO	\N	2022-05-13 00:00:00
An	10039	t	apeAn 10039	f	emailAn 10039	nomAn 10039	anPass 10039	1000	APROBADO	\N	2022-05-13 00:00:00
An	10040	t	apeAn 10040	f	emailAn 10040	nomAn 10040	anPass 10040	1000	PENDIENTE	\N	2022-05-13 00:00:00
An	10041	t	apeAn 10041	f	emailAn 10041	nomAn 10041	anPass 10041	1000	APROBADO	\N	2022-05-13 00:00:00
An	10042	t	apeAn 10042	f	emailAn 10042	nomAn 10042	anPass 10042	1000	APROBADO	\N	2022-05-13 00:00:00
An	10043	f	apeAn 10043	f	emailAn 10043	nomAn 10043	anPass 10043	1000	APROBADO	\N	2022-05-13 00:00:00
An	10044	t	apeAn 10044	f	emailAn 10044	nomAn 10044	anPass 10044	1000	APROBADO	\N	2022-05-13 00:00:00
An	10045	t	apeAn 10045	f	emailAn 10045	nomAn 10045	anPass 10045	1000	APROBADO	\N	2022-05-13 00:00:00
An	10046	t	apeAn 10046	f	emailAn 10046	nomAn 10046	anPass 10046	1000	APROBADO	\N	2022-05-13 00:00:00
An	10047	t	apeAn 10047	f	emailAn 10047	nomAn 10047	anPass 10047	1000	APROBADO	\N	2022-05-13 00:00:00
An	10048	t	apeAn 10048	f	emailAn 10048	nomAn 10048	anPass 10048	1000	APROBADO	\N	2022-05-13 00:00:00
An	10049	t	apeAn 10049	f	emailAn 10049	nomAn 10049	anPass 10049	1000	APROBADO	\N	2022-05-13 00:00:00
An	10050	t	apeAn 10050	f	emailAn 10050	nomAn 10050	anPass 10050	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10051	t	apeHu 10051	f	emailHu 10051	nomHu 10051	huPass 10051	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10052	t	apeHu 10052	f	emailHu 10052	nomHu 10052	huPass 10052	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10053	t	apeHu 10053	f	emailHu 10053	nomHu 10053	huPass 10053	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10054	t	apeHu 10054	f	emailHu 10054	nomHu 10054	huPass 10054	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100140	t	apeHu 100140	f	emailHu 100140	nomHu 100140	huPass 100140	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	1	t	string	f	string	string	string	0	\N	\N	2022-05-13 00:00:00
Hu	10055	t	apeHu 10055	f	emailHu 10055	nomHu 10055	huPass 10055	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10056	t	apeHu 10056	f	emailHu 10056	nomHu 10056	huPass 10056	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10057	t	apeHu 10057	f	emailHu 10057	nomHu 10057	huPass 10057	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10058	t	apeHu 10058	f	emailHu 10058	nomHu 10058	huPass 10058	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10059	t	apeHu 10059	f	emailHu 10059	nomHu 10059	huPass 10059	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10060	t	apeHu 10060	t	emailHu 10060	nomHu 10060	huPass 10060	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10061	t	apeHu 10061	f	emailHu 10061	nomHu 10061	huPass 10061	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10062	t	apeHu 10062	f	emailHu 10062	nomHu 10062	huPass 10062	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10063	t	apeHu 10063	f	emailHu 10063	nomHu 10063	huPass 10063	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10064	t	apeHu 10064	f	emailHu 10064	nomHu 10064	huPass 10064	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10065	t	apeHu 10065	f	emailHu 10065	nomHu 10065	huPass 10065	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10066	t	apeHu 10066	f	emailHu 10066	nomHu 10066	huPass 10066	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10067	f	apeHu 10067	f	emailHu 10067	nomHu 10067	huPass 10067	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10068	t	apeHu 10068	f	emailHu 10068	nomHu 10068	huPass 10068	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10069	t	apeHu 10069	f	emailHu 10069	nomHu 10069	huPass 10069	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10070	t	apeHu 10070	f	emailHu 10070	nomHu 10070	huPass 10070	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10071	t	apeHu 10071	f	emailHu 10071	nomHu 10071	huPass 10071	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10072	t	apeHu 10072	f	emailHu 10072	nomHu 10072	huPass 10072	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10074	t	apeHu 10074	f	emailHu 10074	nomHu 10074	huPass 10074	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10075	t	apeHu 10075	f	emailHu 10075	nomHu 10075	huPass 10075	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10076	t	apeHu 10076	f	emailHu 10076	nomHu 10076	huPass 10076	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10077	t	apeHu 10077	f	emailHu 10077	nomHu 10077	huPass 10077	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10078	t	apeHu 10078	f	emailHu 10078	nomHu 10078	huPass 10078	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10079	t	apeHu 10079	f	emailHu 10079	nomHu 10079	huPass 10079	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10080	t	apeHu 10080	f	emailHu 10080	nomHu 10080	huPass 10080	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10081	t	apeHu 10081	f	emailHu 10081	nomHu 10081	huPass 10081	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10082	t	apeHu 10082	f	emailHu 10082	nomHu 10082	huPass 10082	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10083	t	apeHu 10083	f	emailHu 10083	nomHu 10083	huPass 10083	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10084	t	apeHu 10084	t	emailHu 10084	nomHu 10084	huPass 10084	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10085	t	apeHu 10085	f	emailHu 10085	nomHu 10085	huPass 10085	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10086	t	apeHu 10086	f	emailHu 10086	nomHu 10086	huPass 10086	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10087	t	apeHu 10087	f	emailHu 10087	nomHu 10087	huPass 10087	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10088	t	apeHu 10088	f	emailHu 10088	nomHu 10088	huPass 10088	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10089	t	apeHu 10089	f	emailHu 10089	nomHu 10089	huPass 10089	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10090	t	apeHu 10090	f	emailHu 10090	nomHu 10090	huPass 10090	1000	RECHAZADO	\N	2022-05-13 00:00:00
Hu	10091	t	apeHu 10091	f	emailHu 10091	nomHu 10091	huPass 10091	1000	RECHAZADO	\N	2022-05-13 00:00:00
Hu	10092	f	apeHu 10092	f	emailHu 10092	nomHu 10092	huPass 10092	1000	RECHAZADO	\N	2022-05-13 00:00:00
Hu	10093	t	apeHu 10093	f	emailHu 10093	nomHu 10093	huPass 10093	1000	RECHAZADO	\N	2022-05-13 00:00:00
Hu	10094	t	apeHu 10094	f	emailHu 10094	nomHu 10094	huPass 10094	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10095	t	apeHu 10095	f	emailHu 10095	nomHu 10095	huPass 10095	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10096	t	apeHu 10096	f	emailHu 10096	nomHu 10096	huPass 10096	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10097	t	apeHu 10097	t	emailHu 10097	nomHu 10097	huPass 10097	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10098	t	apeHu 10098	f	emailHu 10098	nomHu 10098	huPass 10098	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	10099	t	apeHu 10099	f	emailHu 10099	nomHu 10099	huPass 10099	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100100	t	apeHu 100100	f	emailHu 100100	nomHu 100100	huPass 100100	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100101	t	apeHu 100101	f	emailHu 100101	nomHu 100101	huPass 100101	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100102	t	apeHu 100102	f	emailHu 100102	nomHu 100102	huPass 100102	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100103	t	apeHu 100103	f	emailHu 100103	nomHu 100103	huPass 100103	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100104	t	apeHu 100104	f	emailHu 100104	nomHu 100104	huPass 100104	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100105	t	apeHu 100105	f	emailHu 100105	nomHu 100105	huPass 100105	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100106	t	apeHu 100106	f	emailHu 100106	nomHu 100106	huPass 100106	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100107	t	apeHu 100107	f	emailHu 100107	nomHu 100107	huPass 100107	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100108	t	apeHu 100108	f	emailHu 100108	nomHu 100108	huPass 100108	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100109	t	apeHu 100109	f	emailHu 100109	nomHu 100109	huPass 100109	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100111	t	apeHu 100111	f	emailHu 100111	nomHu 100111	huPass 100111	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100112	t	apeHu 100112	f	emailHu 100112	nomHu 100112	huPass 100112	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100113	t	apeHu 100113	f	emailHu 100113	nomHu 100113	huPass 100113	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100114	t	apeHu 100114	f	emailHu 100114	nomHu 100114	huPass 100114	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100116	t	apeHu 100116	f	emailHu 100116	nomHu 100116	huPass 100116	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100117	t	apeHu 100117	f	emailHu 100117	nomHu 100117	huPass 100117	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100118	t	apeHu 100118	f	emailHu 100118	nomHu 100118	huPass 100118	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100119	t	apeHu 100119	f	emailHu 100119	nomHu 100119	huPass 100119	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100120	t	apeHu 100120	f	emailHu 100120	nomHu 100120	huPass 100120	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100121	t	apeHu 100121	f	emailHu 100121	nomHu 100121	huPass 100121	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100122	t	apeHu 100122	f	emailHu 100122	nomHu 100122	huPass 100122	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100123	t	apeHu 100123	f	emailHu 100123	nomHu 100123	huPass 100123	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100124	t	apeHu 100124	t	emailHu 100124	nomHu 100124	huPass 100124	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100125	t	apeHu 100125	f	emailHu 100125	nomHu 100125	huPass 100125	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100126	t	apeHu 100126	f	emailHu 100126	nomHu 100126	huPass 100126	1000	PENDIENTE	\N	2022-05-13 00:00:00
Hu	100127	t	apeHu 100127	f	emailHu 100127	nomHu 100127	huPass 100127	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100128	t	apeHu 100128	f	emailHu 100128	nomHu 100128	huPass 100128	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100129	t	apeHu 100129	f	emailHu 100129	nomHu 100129	huPass 100129	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100130	t	apeHu 100130	f	emailHu 100130	nomHu 100130	huPass 100130	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100131	t	apeHu 100131	f	emailHu 100131	nomHu 100131	huPass 100131	1000	PENDIENTE	\N	2022-05-13 00:00:00
Hu	100132	t	apeHu 100132	f	emailHu 100132	nomHu 100132	huPass 100132	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100133	t	apeHu 100133	f	emailHu 100133	nomHu 100133	huPass 100133	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100134	t	apeHu 100134	f	emailHu 100134	nomHu 100134	huPass 100134	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100135	t	apeHu 100135	f	emailHu 100135	nomHu 100135	huPass 100135	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100136	t	apeHu 100136	f	emailHu 100136	nomHu 100136	huPass 100136	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100137	t	apeHu 100137	f	emailHu 100137	nomHu 100137	huPass 100137	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100138	t	apeHu 100138	f	emailHu 100138	nomHu 100138	huPass 100138	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100139	t	apeHu 100139	f	emailHu 100139	nomHu 100139	huPass 100139	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100115	t	apeHu 100115	t	emailHu 100115	nomHu 100115	huPass 100115	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100141	t	apeHu 100141	f	emailHu 100141	nomHu 100141	huPass 100141	1000	PENDIENTE	\N	2022-05-13 00:00:00
Hu	100142	t	apeHu 100142	f	emailHu 100142	nomHu 100142	huPass 100142	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100143	t	apeHu 100143	f	emailHu 100143	nomHu 100143	huPass 100143	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100144	t	apeHu 100144	f	emailHu 100144	nomHu 100144	huPass 100144	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100145	t	apeHu 100145	f	emailHu 100145	nomHu 100145	huPass 100145	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100146	t	apeHu 100146	f	emailHu 100146	nomHu 100146	huPass 100146	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100147	t	apeHu 100147	f	emailHu 100147	nomHu 100147	huPass 100147	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100148	t	apeHu 100148	f	emailHu 100148	nomHu 100148	huPass 100148	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100149	t	apeHu 100149	f	emailHu 100149	nomHu 100149	huPass 100149	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100150	t	apeHu 100150	f	emailHu 100150	nomHu 100150	huPass 100150	1000	APROBADO	\N	2022-05-13 00:00:00
Hu	100110	t	apeHu 100110	f	emailHu 100110	nomHu 100110	huPass 100110	1000	APROBADO	\N	2022-05-13 00:00:00
An	10031	t	apeAn 10031	f	emailAn 10031	nomAn 10031	anPass 10031	1000	RECHAZADO	\N	2022-05-13 00:00:00
Ad	15001	t	Thompson	f	e.thompson@randatmail.com	Eddy	15001	0	\N	\N	2021-10-14 00:00:00
Ad	15002	t	Lloyd	f	m.lloyd@randatmail.com	Melanie	15002	0	\N	\N	2021-02-18 00:00:00
Ad	15003	t	Johnston	f	j.johnston@randatmail.com	Jared	15003	0	\N	\N	2020-09-01 00:00:00
Ad	15004	f	Clark	f	k.clark@randatmail.com	Kimberly	15004	0	\N	\N	2021-06-17 00:00:00
Ad	15005	t	Perkins	f	a.perkins@randatmail.com	Adam	15005	0	\N	\N	2021-12-21 00:00:00
Ad	15006	t	Morrison	f	a.morrison@randatmail.com	Abraham	15006	0	\N	\N	2020-03-15 00:00:00
An	15007	t	Parker	f	m.parker@randatmail.com	Mike	15007	0	APROBADO	\N	2021-07-04 00:00:00
An	15008	t	Stevens	f	m.stevens@randatmail.com	Max	15008	0	RECHAZADO	\N	2020-11-25 00:00:00
An	15009	t	Martin	f	e.martin@randatmail.com	Elise	15009	0	APROBADO	\N	2021-03-24 00:00:00
An	15010	t	Miller	f	d.miller@randatmail.com	Deanna	15010	0	APROBADO	\N	2021-03-07 00:00:00
An	15011	t	Holmes	f	a.holmes@randatmail.com	Ada	15011	0	APROBADO	\N	2020-09-18 00:00:00
An	15012	t	Armstrong	t	c.armstrong@randatmail.com	Charlotte	15012	0	APROBADO	\N	2020-04-18 00:00:00
An	15013	t	Kelly	f	k.kelly@randatmail.com	Kate	15013	0	APROBADO	\N	2021-12-04 00:00:00
An	15014	t	Ferguson	f	a.ferguson@randatmail.com	Aldus	15014	0	APROBADO	\N	2020-05-05 00:00:00
An	15015	f	Allen	f	c.allen@randatmail.com	Cherry	15015	0	APROBADO	\N	2020-06-08 00:00:00
An	15016	t	Evans	f	e.evans@randatmail.com	Edwin	15016	0	APROBADO	\N	2022-02-27 00:00:00
An	15017	t	Moore	f	p.moore@randatmail.com	Penelope	15017	0	APROBADO	\N	2020-06-25 00:00:00
An	15018	t	Douglas	f	a.douglas@randatmail.com	Aiden	15018	0	PENDIENTE	\N	2021-03-24 00:00:00
An	15019	t	Crawford	f	c.crawford@randatmail.com	Chester	15019	0	APROBADO	\N	2020-09-18 00:00:00
An	15020	t	Bailey	f	a.bailey@randatmail.com	Aida	15020	0	APROBADO	\N	2021-08-07 00:00:00
An	15021	t	Warren	f	d.warren@randatmail.com	Dominik	15021	0	RECHAZADO	\N	2020-08-15 00:00:00
An	15022	t	Sullivan	f	t.sullivan@randatmail.com	Tiana	15022	0	APROBADO	\N	2021-01-15 00:00:00
An	15023	t	Parker	f	k.parker@randatmail.com	Kelvin	15023	0	APROBADO	\N	2022-02-27 00:00:00
An	15024	t	Kelly	t	a.kelly@randatmail.com	Alford	15024	0	APROBADO	\N	2021-06-17 00:00:00
An	15025	t	Barnes	f	l.barnes@randatmail.com	Lucia	15025	0	APROBADO	\N	2021-03-07 00:00:00
An	15026	f	Brown	f	j.brown@randatmail.com	Julia	15026	0	APROBADO	\N	2020-05-05 00:00:00
An	15027	t	Barnes	f	v.barnes@randatmail.com	Vivian	15027	0	APROBADO	\N	2021-09-27 00:00:00
An	15028	t	Russell	f	s.russell@randatmail.com	Sienna	15028	0	APROBADO	\N	2020-07-29 00:00:00
An	15029	t	Kelley	f	l.kelley@randatmail.com	Lucas	15029	0	APROBADO	\N	2020-08-15 00:00:00
An	15030	t	Baker	f	j.baker@randatmail.com	Jack	15030	0	PENDIENTE	\N	2022-04-19 00:00:00
An	15031	t	Williams	f	n.williams@randatmail.com	Nicholas	15031	0	APROBADO	\N	2022-06-09 00:00:00
An	15032	t	Anderson	f	d.anderson@randatmail.com	David	15032	0	APROBADO	\N	2020-06-25 00:00:00
An	15033	t	Mitchell	f	b.mitchell@randatmail.com	Belinda	15033	0	APROBADO	\N	2021-10-31 00:00:00
An	15034	t	Miller	f	a.miller@randatmail.com	Alan	15034	0	RECHAZADO	\N	2020-10-22 00:00:00
An	15035	t	Elliott	f	e.elliott@randatmail.com	Ellia	15035	0	APROBADO	\N	2021-04-10 00:00:00
An	15036	t	Evans	t	t.evans@randatmail.com	Tony	15036	0	APROBADO	\N	2021-12-04 00:00:00
An	15037	f	Wilson	f	s.wilson@randatmail.com	Sarah	15037	0	APROBADO	\N	2022-02-10 00:00:00
An	15038	t	Hill	f	m.hill@randatmail.com	Mary	15038	0	APROBADO	\N	2022-01-24 00:00:00
An	15039	t	Murray	f	a.murray@randatmail.com	Abraham	15039	0	APROBADO	\N	2021-09-27 00:00:00
An	15040	t	Wright	f	a.wright@randatmail.com	Alisa	15040	0	APROBADO	\N	2021-05-31 00:00:00
Hu	15041	t	Payne	f	c.payne@randatmail.com	Chelsea	15041	0	APROBADO	\N	2020-05-22 00:00:00
Hu	15042	t	Brown	f	m.brown@randatmail.com	Maria	15042	0	PENDIENTE	\N	2020-10-05 00:00:00
Hu	15043	t	Barrett	f	c.barrett@randatmail.com	Chloe	15043	0	APROBADO	\N	2022-03-16 00:00:00
Hu	15044	t	Owens	f	d.owens@randatmail.com	Dale	15044	0	APROBADO	\N	2021-05-31 00:00:00
Hu	15045	t	Baker	f	v.baker@randatmail.com	Vanessa	15045	0	APROBADO	\N	2020-03-15 00:00:00
Hu	15046	t	Sullivan	f	a.sullivan@randatmail.com	Alen	15046	0	APROBADO	\N	2021-10-14 00:00:00
Hu	15047	t	Adams	f	e.adams@randatmail.com	Emma	15047	0	RECHAZADO	\N	2021-06-17 00:00:00
Hu	15048	f	Craig	t	l.craig@randatmail.com	Lydia	15048	0	APROBADO	\N	2021-05-31 00:00:00
Hu	15049	t	Hill	f	a.hill@randatmail.com	Antony	15049	0	APROBADO	\N	2020-08-15 00:00:00
Hu	15050	t	Parker	f	j.parker@randatmail.com	Jared	15050	0	APROBADO	\N	2020-07-29 00:00:00
Hu	15051	t	Henderson	f	a.henderson@randatmail.com	Amelia	15051	0	APROBADO	\N	2020-05-05 00:00:00
Hu	15052	t	Scott	f	c.scott@randatmail.com	Carlos	15052	0	APROBADO	\N	2022-02-27 00:00:00
Hu	15053	t	Scott	f	h.scott@randatmail.com	Heather	15053	0	APROBADO	\N	2020-12-29 00:00:00
Hu	15054	t	Owens	f	o.owens@randatmail.com	Olivia	15054	0	PENDIENTE	\N	2020-06-08 00:00:00
Hu	15055	t	Brooks	f	a.brooks@randatmail.com	Abigail	15055	0	APROBADO	\N	2022-02-27 00:00:00
Hu	15056	t	Campbell	f	m.campbell@randatmail.com	Michelle	15056	0	APROBADO	\N	2020-12-12 00:00:00
Hu	15057	t	Andrews	f	c.andrews@randatmail.com	Charlie	15057	0	APROBADO	\N	2022-04-19 00:00:00
Hu	15058	t	Howard	f	m.howard@randatmail.com	Marcus	15058	0	APROBADO	\N	2020-08-15 00:00:00
Hu	15059	f	Campbell	f	v.campbell@randatmail.com	Victor	15059	0	APROBADO	\N	2020-10-22 00:00:00
Hu	15060	t	Fowler	t	d.fowler@randatmail.com	Daisy	15060	0	RECHAZADO	\N	2021-02-18 00:00:00
Hu	15061	t	Edwards	f	r.edwards@randatmail.com	Rosie	15061	0	APROBADO	\N	2022-04-19 00:00:00
Hu	15062	t	Fowler	f	j.fowler@randatmail.com	Jacob	15062	0	APROBADO	\N	2020-08-15 00:00:00
Hu	15063	t	Payne	f	f.payne@randatmail.com	Fenton	15063	0	APROBADO	\N	2021-04-10 00:00:00
Hu	15064	t	Spencer	f	j.spencer@randatmail.com	John	15064	0	APROBADO	\N	2021-05-14 00:00:00
Hu	15065	t	Watson	f	e.watson@randatmail.com	Edgar	15065	0	APROBADO	\N	2022-02-10 00:00:00
Hu	15066	t	Baker	f	m.baker@randatmail.com	Melanie	15066	0	PENDIENTE	\N	2021-10-31 00:00:00
Hu	15067	t	Andrews	f	e.andrews@randatmail.com	Ellia	15067	0	APROBADO	\N	2022-03-16 00:00:00
Hu	15068	t	Morgan	f	j.morgan@randatmail.com	Jared	15068	0	APROBADO	\N	2021-08-07 00:00:00
Hu	15069	t	Nelson	f	a.nelson@randatmail.com	Adelaide	15069	0	APROBADO	\N	2021-08-07 00:00:00
Hu	15070	f	Farrell	f	s.farrell@randatmail.com	Sabrina	15070	0	APROBADO	\N	2020-11-25 00:00:00
Hu	15071	t	Williams	f	s.williams@randatmail.com	Sofia	15071	0	APROBADO	\N	2021-02-01 00:00:00
Hu	15072	t	Jones	t	a.jones@randatmail.com	Aston	15072	0	APROBADO	\N	2021-05-14 00:00:00
Hu	15073	t	Wright	f	v.wright@randatmail.com	Victoria	15073	0	RECHAZADO	\N	2020-11-08 00:00:00
Hu	15074	t	Moore	f	j.moore@randatmail.com	Jack	15074	0	APROBADO	\N	2021-04-27 00:00:00
Hu	15075	t	Morgan	f	a.morgan@randatmail.com	Amy	15075	0	APROBADO	\N	2022-06-09 00:00:00
Hu	15076	t	West	f	t.west@randatmail.com	Ted	15076	0	APROBADO	\N	2020-11-08 00:00:00
Hu	15077	t	Stevens	f	e.stevens@randatmail.com	Ellia	15077	0	APROBADO	\N	2020-04-01 00:00:00
Hu	15078	t	Lloyd	f	j.lloyd@randatmail.com	Jessica	15078	0	PENDIENTE	\N	2020-09-18 00:00:00
Hu	15079	t	West	f	l.west@randatmail.com	Lucas	15079	0	APROBADO	\N	2021-09-27 00:00:00
Hu	15080	t	Robinson	f	b.robinson@randatmail.com	Belinda	15080	0	APROBADO	\N	2021-05-14 00:00:00
Hu	15081	f	Harris	f	n.harris@randatmail.com	Naomi	15081	0	APROBADO	\N	2020-07-12 00:00:00
Hu	15082	t	Kelly	f	a.kelly@randatmail.com	Agata	15082	0	APROBADO	\N	2020-03-15 00:00:00
Hu	15083	t	Ellis	f	r.ellis@randatmail.com	Rafael	15083	0	APROBADO	\N	2020-09-18 00:00:00
Hu	15084	t	Moore	t	m.moore@randatmail.com	Melissa	15084	0	APROBADO	\N	2022-06-09 00:00:00
Hu	15085	t	Chapman	f	e.chapman@randatmail.com	Edith	15085	0	APROBADO	\N	2021-06-17 00:00:00
Hu	15086	t	Gray	f	a.gray@randatmail.com	Abraham	15086	0	RECHAZADO	\N	2021-06-17 00:00:00
Hu	15087	t	Stevens	f	v.stevens@randatmail.com	Valeria	15087	0	APROBADO	\N	2021-09-10 00:00:00
Hu	15088	t	Wright	f	v.wright@randatmail.com	Violet	15088	0	APROBADO	\N	2020-11-08 00:00:00
Hu	15089	t	Payne	f	b.payne@randatmail.com	Briony	15089	0	APROBADO	\N	2020-11-25 00:00:00
Hu	15090	t	Baker	f	o.baker@randatmail.com	Oliver	15090	0	PENDIENTE	\N	2020-12-29 00:00:00
Hu	15091	t	Smith	f	l.smith@randatmail.com	Lenny	15091	0	APROBADO	\N	2020-05-22 00:00:00
Hu	15092	f	Craig	f	b.craig@randatmail.com	Brianna	15092	0	APROBADO	\N	2022-02-10 00:00:00
Hu	15093	t	Warren	f	a.warren@randatmail.com	Aston	15093	0	APROBADO	\N	2022-04-19 00:00:00
Hu	15094	t	Wells	f	k.wells@randatmail.com	Kellan	15094	0	APROBADO	\N	2020-07-12 00:00:00
Hu	15095	t	Russell	f	l.russell@randatmail.com	Leonardo	15095	0	APROBADO	\N	2020-07-12 00:00:00
Hu	15096	t	Morgan	t	s.morgan@randatmail.com	Sophia	15096	0	APROBADO	\N	2020-10-05 00:00:00
Hu	15097	t	Montgomery	f	n.montgomery@randatmail.com	Naomi	15097	0	APROBADO	\N	2021-03-24 00:00:00
Hu	15098	t	Martin	f	e.martin@randatmail.com	Emily	15098	0	APROBADO	\N	2020-12-29 00:00:00
Hu	15099	t	Baker	f	a.baker@randatmail.com	Ada	15099	0	RECHAZADO	\N	2021-08-24 00:00:00
Hu	15100	t	Russell	f	m.russell@randatmail.com	Madaline	15100	0	APROBADO	\N	2021-08-24 00:00:00
Hu	15101	t	Cunningham	f	b.cunningham@randatmail.com	Brooke	15101	0	APROBADO	\N	2022-01-07 00:00:00
Hu	15102	t	Morris	f	r.morris@randatmail.com	Rebecca	15102	0	PENDIENTE	\N	2022-01-07 00:00:00
Hu	15103	f	Hamilton	f	a.hamilton@randatmail.com	Arianna	15103	0	APROBADO	\N	2022-05-06 00:00:00
Hu	15104	t	Farrell	f	a.farrell@randatmail.com	Alberta	15104	0	APROBADO	\N	2020-04-01 00:00:00
Hu	15105	t	Thomas	f	p.thomas@randatmail.com	Preston	15105	0	APROBADO	\N	2021-03-24 00:00:00
Hu	15106	t	Barnes	f	c.barnes@randatmail.com	Carlos	15106	0	APROBADO	\N	2020-10-05 00:00:00
Hu	15107	t	Walker	f	d.walker@randatmail.com	Derek	15107	0	APROBADO	\N	2021-10-14 00:00:00
Hu	15108	t	Lloyd	t	c.lloyd@randatmail.com	Carina	15108	0	APROBADO	\N	2021-08-24 00:00:00
Hu	15109	t	Brown	f	t.brown@randatmail.com	Ted	15109	0	APROBADO	\N	2020-12-12 00:00:00
Hu	15110	t	Brooks	f	m.brooks@randatmail.com	Miller	15110	0	APROBADO	\N	2021-02-18 00:00:00
Hu	15111	t	Wilson	f	a.wilson@randatmail.com	Adelaide	15111	0	APROBADO	\N	2022-05-06 00:00:00
Hu	15112	t	Farrell	f	a.farrell@randatmail.com	Ashton	15112	0	RECHAZADO	\N	2020-10-05 00:00:00
Hu	15113	t	Alexander	f	i.alexander@randatmail.com	Isabella	15113	0	APROBADO	\N	2021-06-17 00:00:00
Hu	15114	f	Lloyd	f	m.lloyd@randatmail.com	Max	15114	0	PENDIENTE	\N	2021-09-10 00:00:00
Hu	15115	t	Clark	f	b.clark@randatmail.com	Brad	15115	0	APROBADO	\N	2022-04-02 00:00:00
Hu	15116	t	Phillips	f	v.phillips@randatmail.com	Victoria	15116	0	APROBADO	\N	2021-08-07 00:00:00
Hu	15117	t	Andrews	f	p.andrews@randatmail.com	Paige	15117	0	APROBADO	\N	2021-09-10 00:00:00
Hu	15118	t	Nelson	f	r.nelson@randatmail.com	Reid	15118	0	APROBADO	\N	2020-05-05 00:00:00
Hu	15119	t	Cameron	f	g.cameron@randatmail.com	Gianna	15119	0	APROBADO	\N	2022-02-10 00:00:00
Hu	15120	t	Harris	t	j.harris@randatmail.com	Jack	15120	0	APROBADO	\N	2020-05-05 00:00:00
Hu	15121	t	Mitchell	f	k.mitchell@randatmail.com	Kelvin	15121	0	APROBADO	\N	2021-06-17 00:00:00
Hu	15122	t	Craig	f	m.craig@randatmail.com	Maximilian	15122	0	APROBADO	\N	2020-04-18 00:00:00
Hu	15123	t	Johnson	f	s.johnson@randatmail.com	Sofia	15123	0	APROBADO	\N	2021-05-14 00:00:00
Hu	15124	t	Russell	f	v.russell@randatmail.com	Vivian	15124	0	APROBADO	\N	2021-07-04 00:00:00
Hu	15125	f	Johnson	f	d.johnson@randatmail.com	Dominik	15125	0	RECHAZADO	\N	2021-11-17 00:00:00
Hu	15126	t	Hunt	f	t.hunt@randatmail.com	Tara	15126	0	PENDIENTE	\N	2021-04-27 00:00:00
Hu	15127	t	Ellis	f	e.ellis@randatmail.com	Emily	15127	0	APROBADO	\N	2020-11-08 00:00:00
Hu	15128	t	Riley	f	k.riley@randatmail.com	Kellan	15128	0	APROBADO	\N	2020-05-05 00:00:00
Hu	15129	t	Howard	f	l.howard@randatmail.com	Leonardo	15129	0	APROBADO	\N	2020-12-12 00:00:00
Hu	15130	t	Tucker	f	v.tucker@randatmail.com	Vivian	15130	0	APROBADO	\N	2022-04-02 00:00:00
Hu	15131	t	Jones	f	h.jones@randatmail.com	Henry	15131	0	APROBADO	\N	2020-08-15 00:00:00
Hu	15132	t	Holmes	t	t.holmes@randatmail.com	Ted	15132	0	APROBADO	\N	2020-10-22 00:00:00
Hu	15133	t	Ferguson	f	b.ferguson@randatmail.com	Blake	15133	0	APROBADO	\N	2021-04-27 00:00:00
Hu	15134	t	Barnes	f	t.barnes@randatmail.com	Tiana	15134	0	APROBADO	\N	2020-07-29 00:00:00
Hu	15135	t	Chapman	f	a.chapman@randatmail.com	Abigail	15135	0	APROBADO	\N	2020-09-01 00:00:00
Hu	15136	f	Clark	f	r.clark@randatmail.com	Rebecca	15136	0	APROBADO	\N	2020-12-12 00:00:00
Hu	15137	t	Perry	f	j.perry@randatmail.com	James	15137	0	APROBADO	\N	2021-08-24 00:00:00
Hu	15138	t	Dixon	f	l.dixon@randatmail.com	Lily	15138	0	RECHAZADO	\N	2020-09-18 00:00:00
Hu	15139	t	Richards	f	e.richards@randatmail.com	Elise	15139	0	APROBADO	\N	2020-09-18 00:00:00
Hu	15140	t	Hunt	f	e.hunt@randatmail.com	Ellia	15140	0	APROBADO	\N	2021-09-27 00:00:00
Hu	15141	t	Wilson	f	v.wilson@randatmail.com	Valeria	15141	0	APROBADO	\N	2021-07-04 00:00:00
Hu	15142	t	Harper	f	j.harper@randatmail.com	James	15142	0	APROBADO	\N	2021-06-17 00:00:00
Hu	15143	t	Owens	f	s.owens@randatmail.com	Sophia	15143	0	APROBADO	\N	2020-09-01 00:00:00
Hu	15144	t	Myers	t	b.myers@randatmail.com	Blake	15144	0	APROBADO	\N	2021-01-15 00:00:00
Hu	15145	t	Harper	f	l.harper@randatmail.com	Lucia	15145	0	APROBADO	\N	2020-03-15 00:00:00
Hu	15146	t	Henderson	f	o.henderson@randatmail.com	Olivia	15146	0	APROBADO	\N	2021-08-24 00:00:00
Hu	15147	f	Hamilton	f	f.hamilton@randatmail.com	Frederick	15147	0	APROBADO	\N	2020-06-08 00:00:00
Hu	15148	t	Perry	f	a.perry@randatmail.com	Amelia	15148	0	APROBADO	\N	2022-06-09 00:00:00
Hu	15149	t	Murphy	f	l.murphy@randatmail.com	Lyndon	15149	0	APROBADO	\N	2021-02-01 00:00:00
Hu	15150	t	Foster	f	h.foster@randatmail.com	Henry	15150	0	PENDIENTE	\N	2021-01-15 00:00:00
Hu	15151	t	Mason	f	m.mason@randatmail.com	Marcus	15151	0	RECHAZADO	\N	2021-04-27 00:00:00
Hu	15152	t	Allen	f	j.allen@randatmail.com	Jasmine	15152	0	APROBADO	\N	2020-05-22 00:00:00
Hu	15153	t	Baker	f	a.baker@randatmail.com	Aldus	15153	0	APROBADO	\N	2022-02-27 00:00:00
Hu	15154	t	Adams	f	a.adams@randatmail.com	Arianna	15154	0	APROBADO	\N	2020-09-01 00:00:00
Hu	15155	t	Hill	f	a.hill@randatmail.com	Adelaide	15155	0	APROBADO	\N	2021-03-24 00:00:00
Hu	15156	t	Spencer	t	t.spencer@randatmail.com	Tyler	15156	0	APROBADO	\N	2021-07-04 00:00:00
Hu	15157	t	Perry	f	l.perry@randatmail.com	Lenny	15157	0	APROBADO	\N	2021-01-15 00:00:00
Hu	15158	f	Armstrong	f	c.armstrong@randatmail.com	Chelsea	15158	0	APROBADO	\N	2022-06-09 00:00:00
Hu	15159	t	Hamilton	f	l.hamilton@randatmail.com	Lucas	15159	0	APROBADO	\N	2021-09-27 00:00:00
Hu	15160	t	Foster	f	a.foster@randatmail.com	Alford	15160	0	APROBADO	\N	2022-05-06 00:00:00
Hu	15161	t	Nelson	f	t.nelson@randatmail.com	Tiana	15161	0	APROBADO	\N	2021-10-31 00:00:00
Hu	15162	t	Holmes	f	r.holmes@randatmail.com	Roland	15162	0	PENDIENTE	\N	2022-03-16 00:00:00
Hu	15163	t	Henderson	f	a.henderson@randatmail.com	Arianna	15163	0	APROBADO	\N	2022-03-16 00:00:00
Hu	15164	t	Martin	f	k.martin@randatmail.com	Kelsey	15164	0	RECHAZADO	\N	2020-04-01 00:00:00
Hu	15165	t	Hill	f	t.hill@randatmail.com	Tony	15165	0	APROBADO	\N	2020-10-22 00:00:00
Hu	15166	t	Carter	f	a.carter@randatmail.com	Alexia	15166	0	APROBADO	\N	2022-01-24 00:00:00
Hu	15167	t	Richardson	f	a.richardson@randatmail.com	Agata	15167	0	APROBADO	\N	2021-04-27 00:00:00
Hu	15168	t	Edwards	t	e.edwards@randatmail.com	Emma	15168	0	APROBADO	\N	2022-05-23 00:00:00
Hu	15169	f	Cooper	f	m.cooper@randatmail.com	Melanie	15169	0	APROBADO	\N	2020-10-05 00:00:00
Hu	15170	t	Cooper	f	a.cooper@randatmail.com	Adrianna	15170	0	APROBADO	\N	2022-02-10 00:00:00
Hu	15171	t	Taylor	f	e.taylor@randatmail.com	Edith	15171	0	APROBADO	\N	2021-05-31 00:00:00
Hu	15172	t	Cooper	f	a.cooper@randatmail.com	Alexander	15172	0	APROBADO	\N	2022-04-19 00:00:00
Hu	15173	t	Alexander	f	a.alexander@randatmail.com	Alissa	15173	0	APROBADO	\N	2020-04-18 00:00:00
Hu	15174	t	Ryan	f	a.ryan@randatmail.com	Aston	15174	0	PENDIENTE	\N	2020-04-01 00:00:00
Hu	15175	t	Richardson	f	b.richardson@randatmail.com	Brianna	15175	0	APROBADO	\N	2020-10-05 00:00:00
Hu	15176	t	Murphy	f	a.murphy@randatmail.com	Andrew	15176	0	APROBADO	\N	2020-07-12 00:00:00
Hu	15177	t	Kelly	f	r.kelly@randatmail.com	Rebecca	15177	0	RECHAZADO	\N	2020-04-01 00:00:00
Hu	15178	t	Carter	f	t.carter@randatmail.com	Tara	15178	0	APROBADO	\N	2022-01-07 00:00:00
Hu	15179	t	Craig	f	c.craig@randatmail.com	Chelsea	15179	0	APROBADO	\N	2021-11-17 00:00:00
Hu	15180	f	Warren	t	t.warren@randatmail.com	Ted	15180	0	APROBADO	\N	2021-05-31 00:00:00
Hu	15181	t	Campbell	f	a.campbell@randatmail.com	Andrew	15181	0	APROBADO	\N	2022-02-10 00:00:00
Hu	15182	t	Martin	f	m.martin@randatmail.com	Maya	15182	0	APROBADO	\N	2022-01-07 00:00:00
Hu	15183	t	Thomas	f	v.thomas@randatmail.com	Victor	15183	0	APROBADO	\N	2021-04-27 00:00:00
Hu	15184	t	Higgins	f	t.higgins@randatmail.com	Thomas	15184	0	APROBADO	\N	2020-09-18 00:00:00
Hu	15185	t	Davis	f	a.davis@randatmail.com	Alina	15185	0	APROBADO	\N	2021-07-04 00:00:00
Hu	15186	t	Richardson	f	s.richardson@randatmail.com	Stella	15186	0	PENDIENTE	\N	2022-03-16 00:00:00
Hu	15187	t	Grant	f	j.grant@randatmail.com	Julian	15187	0	APROBADO	\N	2021-03-24 00:00:00
Hu	15188	t	Mason	f	a.mason@randatmail.com	Amanda	15188	0	APROBADO	\N	2020-06-25 00:00:00
Hu	15189	t	Stewart	f	m.stewart@randatmail.com	Melissa	15189	0	APROBADO	\N	2021-07-04 00:00:00
Hu	15190	t	Scott	f	a.scott@randatmail.com	Alexander	15190	0	RECHAZADO	\N	2020-08-15 00:00:00
Hu	15191	f	Smith	f	m.smith@randatmail.com	Miley	15191	0	APROBADO	\N	2021-08-07 00:00:00
Hu	15192	t	Armstrong	t	d.armstrong@randatmail.com	Daryl	15192	0	APROBADO	\N	2020-08-15 00:00:00
Hu	15193	t	Andrews	f	a.andrews@randatmail.com	Andrew	15193	0	APROBADO	\N	2022-04-02 00:00:00
Hu	15194	t	Kelly	f	a.kelly@randatmail.com	Arianna	15194	0	APROBADO	\N	2022-02-10 00:00:00
Hu	15195	t	Kelley	f	c.kelley@randatmail.com	Carlos	15195	0	APROBADO	\N	2021-10-31 00:00:00
Hu	15196	t	Barrett	f	e.barrett@randatmail.com	Edward	15196	0	APROBADO	\N	2022-04-02 00:00:00
Hu	15197	t	Ferguson	f	e.ferguson@randatmail.com	Ellia	15197	0	APROBADO	\N	2020-05-05 00:00:00
Hu	15198	t	Craig	f	m.craig@randatmail.com	Mary	15198	0	PENDIENTE	\N	2020-12-12 00:00:00
Hu	15199	t	Stewart	f	v.stewart@randatmail.com	Vivian	15199	0	APROBADO	\N	2021-12-21 00:00:00
Hu	15200	t	Foster	f	g.foster@randatmail.com	Garry	15200	0	APROBADO	\N	2022-06-09 00:00:00
\.


--
-- Name: alojamientos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alojamientos_id_seq', 197, true);


--
-- Name: calificaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calificaciones_id_seq', 1, true);


--
-- Name: dt_direccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dt_direccion_id_seq', 1, true);


--
-- Name: dt_pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dt_pais_id_seq', 3152, true);


--
-- Name: dt_servicios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dt_servicios_id_seq', 1, false);


--
-- Name: facturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturas_id_seq', 8, true);


--
-- Name: habitaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.habitaciones_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- Name: recuperaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recuperaciones_id_seq', 1, false);


--
-- Name: reservas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservas_id_seq', 1, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, true);


--
-- Name: alojamientos alojamientos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alojamientos
    ADD CONSTRAINT alojamientos_pkey PRIMARY KEY (id);


--
-- Name: calificaciones calificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);


--
-- Name: dt_direccion dt_direccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dt_direccion
    ADD CONSTRAINT dt_direccion_pkey PRIMARY KEY (id);


--
-- Name: dt_pais dt_pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dt_pais
    ADD CONSTRAINT dt_pais_pkey PRIMARY KEY (id);


--
-- Name: dt_servicios dt_servicios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dt_servicios
    ADD CONSTRAINT dt_servicios_pkey PRIMARY KEY (id);


--
-- Name: facturas facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- Name: habitaciones habitaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_pkey PRIMARY KEY (id);


--
-- Name: password_reset_token password_reset_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_token
    ADD CONSTRAINT password_reset_token_pkey PRIMARY KEY (id);


--
-- Name: recuperaciones recuperaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recuperaciones
    ADD CONSTRAINT recuperaciones_pkey PRIMARY KEY (id);


--
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: dt_direccion fk19wm130mnm9eqg2vmxp3x9n5m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dt_direccion
    ADD CONSTRAINT fk19wm130mnm9eqg2vmxp3x9n5m FOREIGN KEY (pais) REFERENCES public.dt_pais(id);


--
-- Name: habitaciones fk3r01d8gor8vve49otwqd5hlix; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT fk3r01d8gor8vve49otwqd5hlix FOREIGN KEY (servicios_id) REFERENCES public.dt_servicios(id);


--
-- Name: usuarios fk7sd0hlifblas68uskxf3ffox7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk7sd0hlifblas68uskxf3ffox7 FOREIGN KEY (user_id) REFERENCES public.recuperaciones(id);


--
-- Name: alojamientos fk8dnsuwlxyr1f54xorojl3c0es; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alojamientos
    ADD CONSTRAINT fk8dnsuwlxyr1f54xorojl3c0es FOREIGN KEY (anfitrion_id) REFERENCES public.usuarios(id);


--
-- Name: reservas fkaufff82mr36lu96eflhv1wws8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT fkaufff82mr36lu96eflhv1wws8 FOREIGN KEY (calificacion_id) REFERENCES public.calificaciones(id);


--
-- Name: habitaciones fkb0ywyg5ou6wl42wbhm2wx1av; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT fkb0ywyg5ou6wl42wbhm2wx1av FOREIGN KEY (alojamiento_id) REFERENCES public.alojamientos(id);


--
-- Name: password_reset_token fkc0h3g4hnddsx4ugpu1vq6umu0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_token
    ADD CONSTRAINT fkc0h3g4hnddsx4ugpu1vq6umu0 FOREIGN KEY (user_id) REFERENCES public.usuarios(id);


--
-- Name: alojamientos fkdfbnht5i649pc5fokrjn1d1ul; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alojamientos
    ADD CONSTRAINT fkdfbnht5i649pc5fokrjn1d1ul FOREIGN KEY (alojamiento_dir) REFERENCES public.dt_direccion(id);


--
-- Name: reservas fkgqrp4r80giaq2op07c9h4iuht; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT fkgqrp4r80giaq2op07c9h4iuht FOREIGN KEY (huesped_id) REFERENCES public.usuarios(id);


--
-- Name: reservas fkj1dyoxal4rnhdcxo4mv6bcivc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT fkj1dyoxal4rnhdcxo4mv6bcivc FOREIGN KEY (habitacion_id) REFERENCES public.habitaciones(id);


--
-- Name: facturas fkks11dlpkrred6an8o8simxxut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT fkks11dlpkrred6an8o8simxxut FOREIGN KEY (reserva_id) REFERENCES public.reservas(id);


--
-- Name: huesped_push_tokens fkmr4u6cwn25gn8um3emcf519lg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.huesped_push_tokens
    ADD CONSTRAINT fkmr4u6cwn25gn8um3emcf519lg FOREIGN KEY (huesped_id) REFERENCES public.usuarios(id);


--
-- PostgreSQL database dump complete
--

