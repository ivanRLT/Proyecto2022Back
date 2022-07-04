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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alojamientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alojamientos (
    id integer NOT NULL,
    activo boolean,
    descripcion text,
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
    push_tokens character varying(255) NOT NULL
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
    f_creacion_usuario timestamp without time zone,
    telefono integer
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
-- Name: 59406; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('59406');


ALTER LARGE OBJECT 59406 OWNER TO postgres;

--
-- Name: 59407; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('59407');


ALTER LARGE OBJECT 59407 OWNER TO postgres;

--
-- Data for Name: alojamientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alojamientos (id, activo, descripcion, nombre, anfitrion_id, alojamiento_dir) FROM stdin;
1	t	desc_ 10022_ 1000	nombreAloj_ 10022_ 1000	10022	1001
2	t	desc_ 10023_ 1000	nombreAloj_ 10023_ 1000	10023	1002
4	t	desc_ 10025_ 1000	nombreAloj_ 10025_ 1000	10025	1004
5	t	desc_ 10026_ 1000	nombreAloj_ 10026_ 1000	10026	1005
9	t	desc_ 10029_ 1001	nombreAloj_ 10029_ 1001	10029	1009
11	t	desc_ 10032_ 1000	nombreAloj_ 10032_ 1000	10032	10011
13	t	desc_ 10034_ 1000	nombreAloj_ 10034_ 1000	10034	10013
15	t	desc_ 10035_ 1001	nombreAloj_ 10035_ 1001	10035	10015
16	t	desc_ 10037_ 1000	nombreAloj_ 10037_ 1000	10037	10016
18	t	desc_ 10038_ 1001	nombreAloj_ 10038_ 1001	10038	10018
21	t	desc_ 10041_ 1001	nombreAloj_ 10041_ 1001	10041	10021
25	t	desc_ 10046_ 1000	nombreAloj_ 10046_ 1000	10046	10025
27	t	desc_ 10047_ 1001	nombreAloj_ 10047_ 1001	10047	10027
10	f	desc_ 10031_ 1000	nombreAloj_ 10031_ 1000	10031	10010
201	t	desc aloj 15014	nombre aloj 15014	15014	2
22	f	desc_ 10043_ 1000	nombreAloj_ 10043_ 1000	10043	10022
8	f	desc_ 10029_ 1000	nombreAloj_ 10029_ 1000	10028	1008
7	f	desc_ 10028_ 1000	nombreAloj_ 10028_ 1000	10028	1007
12	f	desc_ 10032_ 1001	nombreAloj_ 10032_ 1001	10028	10012
14	f	desc_ 10035_ 1000	nombreAloj_ 10035_ 1000	10028	10014
20	f	desc_ 10041_ 1000	nombreAloj_ 10041_ 1000	10028	10020
3	f	desc_ 10023_ 1001	nombreAloj_ 10023_ 1001	10028	1003
6	t	desc_ 10026_ 1001	nombreAloj_ 10026_ 1001	10028	1006
17	f	desc_ 10038_ 1000	nombreAloj_ 10038_ 1000	10028	10017
23	t	desc_ 10044_ 1000	nombreAloj_ 10044_ 1000	10028	10023
24	f	desc_ 10044_ 1001	nombreAloj_ 10044_ 1001	10028	10024
26	t	desc_ 10047_ 1000	nombreAloj_ 10047_ 1000	10028	10026
28	t	desc_ 10049_ 1000	nombreAloj_ 10049_ 1000	10028	10028
19	t	desc aloji 19	nom alji 19	10028	10019
801	t	Este hotel de San Francisco está situado en la plaza Union Square, a 5 minutos a pie de la línea de tranvía Powell Street. Tiene piscina al aire libre y ofrece habitaciones con conexión para MP3.	Handlery Union Square Hotel	15015	801
802	t	Este alojamiento está a 1 minuto a pie de la playa. Este establecimiento se encuentra frente a la playa, en el corazón de Fort Myers Beach, y ofrece alojamientos tipo apartamento de 1 dormitorio con zona de cocina. En el resort hay WiFi gratuita y aparcamiento gratuito.	The Neptune Resort	15015	802
803	t	Este hotel de suites se encuentra a 3 minutos en coche del Walt Disney World Resort. Ofrece una piscina exterior climatizada y desayuno gratuito. Se ofrece un servicio de traslado a Walt Disney World en un horario programado.	Buena Vista Suites Orlando	15015	803
804	t	El Riu Plaza Manhattan Times Square se encuentra en Nueva York, a 300 metros de Times Square, y ofrece registros de entrada y salida exprés, habitaciones para no fumadores, restaurante, WiFi gratuita en todas las instalaciones y bar. Este hotel de 4 estrellas ofrece servicio de conserjería y consigna de equipaje. Además, hay recepción 24 horas, centro de negocios y servicio de organización de excursiones.	Riu Plaza Manhattan Times Square	15015	804
805	t	Este hotel está ubicado en Manhattan, junto a la estación Grand Central Terminal, y alberga un sitio para comer y un centro de fitness StayFit (abierto todos los días, las 24 horas). Las habitaciones incluyen TV de pantalla plana y soporte para iPod.	Hyatt Grand Central New York	15015	805
806	t	El Au Manoir d'Anniviers está rodeado de montañas y viñedos y se encuentra en la histórica localidad de Vissoie, a 17 km de Sierre. Las habitaciones disponen de conexión Wi-Fi gratuita y balcón con vistas a los Alpes del Valais.	Au Manoir d'Anniviers	15020	806
807	t	El Hotel de l'Ours Preles se encuentra en Prêles y ofrece restaurante, bar, salón compartido y jardín. Ofrece habitaciones familiares y terraza. Hay servicio de habitaciones, cajero automático y servicio de organización de excursiones.	Hotel de l’Ours Preles	15020	807
808	t	El Hotel Royal Zurich está situado a solo 2 paradas de tranvía y a 5 minutos a pie de la estación principal de trenes de Zúrich y de la zona comercial Bahnhofstrasse, y ofrece aparcamiento en garaje privado por un suplemento y conexión WiFi de alta velocidad gratuita.	Royal Hotel Zurich	15020	808
809	t	El Hotel Harder Minerva está situado en el centro de Interlaken, en una calle lateral tranquila y a solo 50 metros de la calle principal. Ofrece habitaciones modernas con aire acondicionado, instalaciones de primera categoría y un apartamento con balcón, chimenea y conexión Wi-Fi gratuita.	Hotel Harder Minerva	15020	809
810	t	Este alojamiento está a 11 minutos a pie de la playa. Situado a 100 metros de la estación de tren de Lucerna y a 200 metros del muelle, del famoso Kapellbrücke (Puente de la Capilla) y del lago, el Waldstätterhof Hotel goza de una céntrica ubicación.	Waldstätterhof Swiss Quality Hotel	15020	810
811	t	La Bastide Du Bois Breant se encuentra en Maubec y cuenta con restaurante, piscina al aire libre de temporada, bar y salón compartido. El hotel de 3 estrellas cuenta con jardín y habitaciones con aire acondicionado, WiFi gratuita y baño privado. El hotel ofrece aparcamiento privado gratuito y servicio de alquiler de coches.	La Bastide Du Bois Breant	15021	811
812	t	El Flat CHamps Élysées está situado en París, a 700 metros del Arco del Triunfo y a 1,6 km del Museo de la Orangerie y de la Torre Eiffel. El establecimiento se encuentra a 2 km del Museo de Orsay y de la ópera Garnier.	Flat CHamps Élysées	15022	812
813	t	El Hôtel Axotel Lyon está situado en el barrio de la Presqu’île de Lyon, a 6 minutos a pie de la estación de tren y metro de Perrache. El establecimiento alberga un restaurante tradicional, un jardín y terraza con sombra. Ofrece WiFi gratuita en todas sus instalaciones.	Hôtel Axotel Lyon	15023	813
814	t	El Ibis Marseille Centre está situado en el distrito 6 de Marsella y ofrece WiFi gratis y recepción 24 horas. El puerto viejo está a 12 minutos a pie y el estadio Vélodrome, a 3 km.	Ibis Marseille Centre	15024	814
815	t	El Pullman Montpellier Centre, situado en el centro histórico de Montpellier, a 500 metros de la Place de la Comédie y al lado del centro comercial Polygone, cuenta con piscina exterior en la azota, abierta todo el año y climatizada de abril a octubre. Tiene WiFi gratuita en todas las zonas. El hotel está a menos de 20 km de las playas de Palavas-les-Flots y La Grande Motte.	Pullman Montpellier Centre	15025	815
\.


--
-- Data for Name: calificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calificaciones (id, calificacion_anfitrion, calificacion_huesped, fecha_resena, resena) FROM stdin;
351	3	4	2022-05-03 00:00:00	RESEnA 351
365	5	5	2022-05-11 00:00:00	RESEÑA 365
367	2	3	2022-05-12 00:00:00	RESEÑA 367
375	4	1	2022-05-16 00:00:00	RESEÑA 375
381	3	1	2022-05-19 00:00:00	RESEÑA 381
383	4	5	2022-05-20 00:00:00	RESEÑA 383
2	0	5	0002-12-31 00:00:00.308 BC	
355	0	5	2022-05-06 00:00:00	RESEÑA 355
357	5	0	2022-05-07 00:00:00	RESEÑA 357
361	5	0	2022-05-09 00:00:00	RESEÑA 361
363	0	3	2022-05-10 00:00:00	RESEÑA 363
377	5	0	2022-05-17 00:00:00	RESEÑA 377
373	4	0	2022-05-15 00:00:00	RESEÑA 373
379	1	0	2022-05-18 00:00:00	RESEÑA 379
369	4	0	2022-05-13 00:00:00	RESEÑA 369
353	0	2	2022-05-05 00:00:00	RESEÑA 353
371	3	4	2022-06-17 00:00:00.22	resa 
359	5	2	2022-06-18 00:00:00.996	aaa
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
10012	calle_dir$	ciudad 1000	 1001	2
10013	calle_dir$	ciudad 1001	 1001	1
10014	calle_dir$	ciudad 1002	 1001	1
10015	calle_dir$	ciudad 1000	 1001	1
10016	calle_dir$	ciudad 1001	 1001	1
10017	calle_dir$	ciudad 1002	 1001	3
10018	calle_dir$	ciudad 1000	 1001	1
10020	calle_dir$	ciudad 1002	 1001	1
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
10019	calle aloj 19	ciaaaudad loj	125534	1
2	calle 15014	citutut	1234 15014	8
10021	calle_dir$	ciudad 1000	 1001	3
10011	calle_dir$	ciudad 1002	 1001	3
801	 Geary Street	San Francisco	351	58
802	Estero Boulevard	Miami	2310	58
803	World Center Drive, Lago Buena Vista	Orlando	2310	58
804	West 47th Street	New York	145	58
805	East 42nd Street	New York	109	58
806	Route de Sierre 20	Berna	3961	176
807	6 La Chaîne, 2515 Prêles	Interlaken	215	176
808	Leonhardstrasse 6, 1.	Zurich	143	176
809	Harderstr. 15, 3800	Interlaken	1400	176
810	Zentralstrasse 4	Lucerna	6003	176
811	501 chemin du puits du grandaou	Niza	84660	66
812	78 Avenue des Champs-Élysées, Campos Elíseos	Paris	75008	66
813	12 rue Marc Antoine Petit	Lyon	69002	66
814	13 Rue Lafon, Castellane et Préfecture	Marsella	13006	66
815	1, rue des Pertuisanes	Montpellier	34000	66
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
1	t	t	t	t	t	t
2	t	t	t	t	t	t
3	t	t	t	t	t	t
901	f	t	t	f	t	t
902	t	t	f	f	f	t
903	f	t	f	f	t	t
904	t	f	f	t	t	f
905	t	f	t	f	t	t
906	f	t	t	t	f	f
907	t	t	t	f	f	t
908	f	f	f	f	f	f
909	t	f	f	f	t	t
910	t	t	t	t	t	f
911	t	f	f	f	t	f
912	t	t	f	t	f	t
913	t	f	t	t	t	f
914	f	t	t	f	t	f
915	f	f	f	f	t	t
916	t	f	t	f	t	f
917	t	f	t	t	t	f
918	f	t	f	f	t	f
919	f	f	f	t	t	t
920	f	f	t	t	t	t
921	t	f	t	t	t	f
922	f	t	t	t	f	t
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
9	t	PENDIENTE	0022-12-13 00:00:00.04	sss  tring	4150	50	2
10	t	PENDIENTE	0022-12-13 00:00:00.485	sdd asd ppal tring	5740	10	3
11	t	PENDIENTE	0022-12-13 00:00:00.387	sdd asd ppal tring	5740	10	4
17	f	PENDIENTE	2022-06-22 00:00:00.059	6BX62214246359808	0	0	10
13	t	PENDIENTE	2022-06-17 00:00:00.185	sdd asd ppal tring	5490	10	6
18	f	PENDIENTE	2022-06-22 00:00:00.103	5UK37213DL1173429	0	0	11
19	f	PENDIENTE	2022-06-22 00:00:00.987	5XD02769W06097509	1500	0	12
20	f	PENDIENTE	2022-06-22 00:00:00.241	4BU71164BT341122B	1150	0	13
12	t	REALIZADO	0022-12-13 00:00:00.416	straaaaaaasdfing	5490	10	5
27	f	PENDIENTE	2022-06-24 00:00:00.981	64M9548338950244S	0	0	20
28	f	PENDIENTE	2022-06-24 00:00:00.845	8DK68489YN6027710	0	0	21
29	f	PENDIENTE	2022-06-24 00:00:00.622	61J18735N39248831	0	0	22
30	f	PENDIENTE	2022-06-24 00:00:00.077	7R645330AA4223136	0	0	23
31	f	PENDIENTE	2022-06-24 00:00:00.421	7D5278193X7220455	0	0	24
32	f	PENDIENTE	2022-06-24 00:00:00.047	59B2023552322314J	0	0	25
33	f	PENDIENTE	2022-06-24 00:00:00.877	41169351JL926505P	0	0	26
34	f	PENDIENTE	2022-06-24 00:00:00.983	61B02224KD5567831	0	0	27
35	f	PENDIENTE	2022-06-24 00:00:00.192	3L285317KK459003E	0	0	28
36	f	PENDIENTE	2022-06-24 00:00:00.981	41F09623LX736830U	0	0	29
37	f	PENDIENTE	2022-06-24 00:00:00.501	9AF28026GF003924B	0	0	30
38	f	PENDIENTE	2022-06-24 00:00:00.461	91U64631G7379232S	0	0	31
39	f	PENDIENTE	2022-06-24 00:00:00.326	65V37249LA5790509	0	0	32
40	f	PENDIENTE	2022-06-26 00:00:00.657	95927103D2794951A	0	0	33
41	f	PENDIENTE	2022-06-26 00:00:00.327	72H694755U747604G	0	0	34
42	f	PENDIENTE	2022-06-26 00:00:00.355	3TP48146U2509801D	1500	0	35
14	f	PENDIENTE	2022-06-22 00:00:00.814	6VW82844UT2218401	0	0	7
15	f	PENDIENTE	2022-06-22 00:00:00.463	0WX57557D62537329	0	0	8
16	f	PENDIENTE	2022-06-22 00:00:00.797	3GP62371A81858011	0	0	9
21	f	PENDIENTE	2022-06-22 00:00:00.846	60434087LV036723K	0	0	14
22	f	PENDIENTE	2022-06-22 00:00:00.509	1Y4634160P4953447	0	0	15
23	f	PENDIENTE	2022-06-22 00:00:00.475	2F3293950K384534G	0	0	16
24	f	PENDIENTE	2022-06-22 00:00:00.389	6DK84758YR329941D	0	0	17
25	f	PENDIENTE	2022-06-22 00:00:00.693	846718198X928630L	0	0	18
26	f	PENDIENTE	2022-06-22 00:00:00.052	1JB68049TV944862U	0	0	19
\.


--
-- Data for Name: habitaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habitaciones (id, camas, descripcion, precio_noche, alojamiento_id, servicios_id) FROM stdin;
101	2	Desc hab 101	500	1	101
102	4	Desc hab 102	1400	2	102
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
4	1	desc hab 15014	330	201	3
103	1	Desc hab 103	1200	4	103
901	2	Doble Petite	340	802	901
902	4	Doble 	190	804	902
903	3	Estudio	140	803	903
904	1	Suite	100	801	904
905	3	Suite Doble Deluxe	470	803	905
906	1	Suite Junior	40	801	906
907	4	Doble 	410	804	907
908	3	Suite	450	803	908
909	3	Single	40	803	909
910	2	Doble	170	802	910
911	3	Suite Junior	460	803	911
912	4	Doble	380	804	912
913	1	Triple Clásica	440	801	913
914	1	Single	370	801	914
915	1	Doble	180	801	915
916	4	Triple	390	804	916
917	1	Doble	20	801	917
918	2	Apartamento 	220	802	918
919	4	Doble	40	804	919
920	1	Suite	80	801	920
921	3	Apartamento 	470	803	921
922	1	Loft	350	801	922
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
1	2022-06-15 20:00:43.998	20daa031-8317-480a-816f-97ec302e35eb	10015
2	2022-06-15 20:13:56.624	b9bcd684-d0dd-4da5-ae57-6ee8fe21883f	10015
3	2022-06-15 20:16:40.47	4e061f75-86d9-4003-a1ee-e3273e83817e	10015
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
382	3	PENDIENTE	2022-07-18 00:00:00	2022-07-16 00:00:00	\N	351	114	10080
384	3	PENDIENTE	2022-07-28 00:00:00	2022-07-26 00:00:00	\N	351	109	10076
374	10	RECHAZADO	2022-07-03 00:00:00	2022-06-24 00:00:00	\N	351	125	10085
368	4	EJECUTADA	2022-05-22 00:00:00	2022-05-19 00:00:00	\N	351	119	10067
354	5	EJECUTADA	2022-03-22 00:00:00	2022-03-18 00:00:00	\N	351	122	10053
376	12	EJECUTADA	2022-07-17 00:00:00	2022-07-06 00:00:00	\N	351	125	10094
362	13	EJECUTADA	2022-05-17 00:00:00	2022-05-05 00:00:00	\N	351	128	10051
367	3	EJECUTADA	2022-05-15 00:00:00	2022-05-13 00:00:00	\N	367	120	10095
351	2	APROBADO	2022-03-01 00:00:00	2022-02-28 00:00:00	\N	351	128	10072
357	8	APROBADO	2022-04-12 00:00:00	2022-04-05 00:00:00	\N	357	104	10064
359	10	APROBADO	2022-04-26 00:00:00	2022-04-17 00:00:00	\N	359	126	10088
361	12	APROBADO	2022-05-10 00:00:00	2022-04-29 00:00:00	\N	361	103	10055
363	14	APROBADO	2022-05-24 00:00:00	2022-05-11 00:00:00	\N	363	121	10070
365	1	APROBADO	2022-05-01 00:00:00	2022-05-01 00:00:00	\N	365	122	10079
381	3	APROBADO	2022-07-13 00:00:00	2022-07-11 00:00:00	\N	381	109	10079
383	3	APROBADO	2022-07-23 00:00:00	2022-07-21 00:00:00	\N	383	113	10074
31	0	PENDIENTE	2022-06-28 00:00:00	2022-06-26 00:00:00	\N	\N	101	10083
360	11	EJECUTADA	2022-05-03 00:00:00	2022-04-23 00:00:00	\N	351	108	10053
32	0	PENDIENTE	2022-06-30 00:00:00	2022-06-26 00:00:00	\N	\N	101	10083
373	9	EJECUTADA	2022-06-26 00:00:00	2022-06-18 00:00:00	\N	2	124	10091
33	0	PENDIENTE	2022-06-30 00:00:00	2022-06-28 00:00:00	\N	\N	102	10083
34	0	PENDIENTE	2022-06-29 00:00:00	2022-06-27 00:00:00	\N	\N	113	10083
35	1	PENDIENTE	2022-06-29 00:00:00	2022-06-28 00:00:00	\N	\N	116	10083
356	7	EJECUTADA	2022-04-05 00:00:00	2022-03-30 00:00:00	\N	351	108	10053
369	5	EJECUTADA	2022-05-29 00:00:00	2022-05-25 00:00:00	\N	369	111	10053
379	3	EJECUTADA	2022-07-03 00:00:00	2022-07-01 00:00:00	\N	379	124	10053
377	13	EJECUTADA	2022-07-24 00:00:00	2022-07-12 00:00:00	\N	377	106	10053
371	7	EJECUTADA	2022-06-12 00:00:00	2022-06-06 00:00:00	\N	371	107	10053
353	4	EJECUTADA	2022-03-15 00:00:00	2022-03-12 00:00:00	\N	353	126	10053
355	6	EJECUTADA	2022-03-29 00:00:00	2022-03-24 00:00:00	\N	355	103	10053
375	11	EJECUTADA	2022-07-10 00:00:00	2022-06-30 00:00:00	\N	375	117	10053
380	3	APROBADO	2022-07-08 00:00:00	2022-07-06 00:00:00	\N	351	121	10053
2	3	PENDIENTE	0010-09-12 00:00:00	0008-09-11 00:00:00	\N	\N	102	10053
3	5	PENDIENTE	0011-04-14 00:00:00	0007-04-14 00:00:00	\N	\N	110	10053
4	5	PENDIENTE	2022-10-05 00:00:00	2022-10-01 00:00:00	\N	\N	110	10053
5	5	PENDIENTE	2022-10-05 00:00:00	2022-10-01 00:00:00	\N	\N	111	10053
6	5	PENDIENTE	2022-10-05 00:00:00	2022-10-01 00:00:00	\N	\N	111	10053
7	0	PENDIENTE	2022-06-21 00:00:00	2022-06-20 00:00:00	\N	\N	113	10083
8	0	PENDIENTE	2022-06-24 00:00:00	2022-06-19 00:00:00	\N	\N	101	10083
9	0	PENDIENTE	2022-06-23 00:00:00	2022-06-20 00:00:00	\N	\N	101	10083
10	0	PENDIENTE	2022-06-23 00:00:00	2022-06-20 00:00:00	\N	\N	104	10083
11	0	PENDIENTE	2022-06-23 00:00:00	2022-06-20 00:00:00	\N	\N	101	10083
12	3	PENDIENTE	2022-06-23 00:00:00	2022-06-20 00:00:00	\N	\N	101	10083
13	1	PENDIENTE	2022-06-24 00:00:00	2022-06-23 00:00:00	\N	\N	118	10083
14	0	PENDIENTE	2022-06-23 00:00:00	2022-06-13 00:00:00	\N	\N	101	10083
15	0	PENDIENTE	2022-06-25 00:00:00	2022-06-23 00:00:00	\N	\N	101	10083
16	0	PENDIENTE	2022-06-25 00:00:00	2022-06-23 00:00:00	\N	\N	113	10083
17	0	PENDIENTE	2022-06-28 00:00:00	2022-06-23 00:00:00	\N	\N	113	10083
18	0	PENDIENTE	2022-06-29 00:00:00	2022-06-23 00:00:00	\N	\N	113	10083
19	0	PENDIENTE	2022-06-27 00:00:00	2022-06-24 00:00:00	\N	\N	104	10083
20	0	PENDIENTE	2022-06-30 00:00:00	2022-06-28 00:00:00	\N	\N	101	10083
21	0	PENDIENTE	2022-06-29 00:00:00	2022-06-27 00:00:00	\N	\N	101	10083
22	0	PENDIENTE	2022-06-28 00:00:00	2022-06-26 00:00:00	\N	\N	101	10083
23	0	PENDIENTE	2022-06-30 00:00:00	2022-06-27 00:00:00	\N	\N	101	10083
24	0	PENDIENTE	2022-07-07 00:00:00	2022-06-30 00:00:00	\N	\N	101	10083
25	0	PENDIENTE	2022-06-29 00:00:00	2022-06-27 00:00:00	\N	\N	101	10083
26	0	PENDIENTE	2022-06-29 00:00:00	2022-06-27 00:00:00	\N	\N	101	10083
27	0	PENDIENTE	2022-06-30 00:00:00	2022-06-26 00:00:00	\N	\N	101	10083
28	0	PENDIENTE	2022-06-30 00:00:00	2022-06-27 00:00:00	\N	\N	101	10083
29	0	PENDIENTE	2022-06-28 00:00:00	2022-06-26 00:00:00	\N	\N	101	10083
30	0	PENDIENTE	2022-06-29 00:00:00	2022-06-27 00:00:00	\N	\N	101	10083
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (dtype, id, activo, apellido, bloqueado, email, nombre, pass, calificacion_global, estado, user_id, f_creacion_usuario, telefono) FROM stdin;
Hu	10097	t	apeHu 10097	t	emailHu 10097	nomHu 10097	huPass 10097	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10072	t	apeHu 10072	f	emailHu 10072	nomHu 10072	huPass 10072	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10074	t	apeHu 10074	f	emailHu 10074	nomHu 10074	huPass 10074	3	APROBADO	\N	2022-05-13 00:00:00	\N
An	10022	t	apeAn 10022	f	emailAn 10022	nomAn 10022	anPass 10022	2	APROBADO	\N	2022-05-13 00:00:00	\N
An	10038	t	apeAn 10038	t	emailAn 10038	nomAn 10038	anPass 10038	2	APROBADO	\N	2022-05-13 00:00:00	\N
An	10032	t	apeAn 10032	f	emailAn 10032	nomAn 10032	anPass 10032	2	APROBADO	\N	2022-05-13 00:00:00	\N
An	10041	t	apeAn 10041	f	emailAn 10041	nomAn 10041	anPass 10041	2	APROBADO	\N	2022-05-13 00:00:00	\N
An	10035	t	apeAn 10035	t	emailAn 10035	nomAn 10035	anPass 10035	2	APROBADO	\N	2022-05-13 00:00:00	\N
An	10029	t	apeAn 10029	f	emailAn 10029	nomAn 10029	anPass 10029	2	APROBADO	\N	2022-05-13 00:00:00	\N
An	10046	t	apeAn 10046	f	emailAn 10046	nomAn 10046	anPass 10046	2	APROBADO	\N	2022-05-13 00:00:00	\N
An	10040	t	apeAn 10040	f	emailAn 10040	nomAn 10040	anPass 10040	2	PENDIENTE	\N	2022-05-13 00:00:00	\N
An	10043	f	apeAn 10043	f	emailAn 10043	nomAn 10043	anPass 10043	2	APROBADO	\N	2022-05-13 00:00:00	\N
An	10049	t	apeAn 10049	f	emailAn 10049	nomAn 10049	anPass 10049	2	APROBADO	\N	2022-05-13 00:00:00	\N
An	10044	t	apeAn 10044	f	emailAn 10044	nomAn 10044	anPass 10044	2	APROBADO	\N	2022-05-13 00:00:00	\N
An	10047	t	apeAn 10047	f	emailAn 10047	nomAn 10047	anPass 10047	2	APROBADO	\N	2022-05-13 00:00:00	\N
An	10025	t	apeAn 10025	f	emailAn 10025	nomAn 10025	anPass 10025	2	APROBADO	\N	2022-05-13 00:00:00	\N
An	10034	t	apeAn 10034	f	emailAn 10034	nomAn 10034	anPass 10034	2	APROBADO	\N	2022-05-13 00:00:00	\N
Ad	1001	t	apeAd 1001	f	emailAd 1001	nomAd 1001	adPass 1001	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	1002	t	apeAd 1002	f	emailAd 1002	nomAd 1002	adPass 1002	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	1003	t	apeAd 1003	f	emailAd 1003	nomAd 1003	adPass 1003	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	1004	t	apeAd 1004	f	emailAd 1004	nomAd 1004	adPass 1004	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	1005	f	apeAd 1005	f	emailAd 1005	nomAd 1005	adPass 1005	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	1006	t	apeAd 1006	f	emailAd 1006	nomAd 1006	adPass 1006	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	1007	t	apeAd 1007	t	emailAd 1007	nomAd 1007	adPass 1007	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	1008	t	apeAd 1008	f	emailAd 1008	nomAd 1008	adPass 1008	\N	\N	\N	2022-05-13 00:00:00	\N
Hu	2	f	a	f	a	a	a	0	\N	\N	2022-06-26 17:40:15.518403	\N
Hu	5	f	asdf	f	asdfasdf	asdf	YXNkZg==\n	0	\N	\N	2022-06-28 23:09:12.715401	\N
Hu	10054	t	apeHu 10054	f	emailHu 10054	nomHu 10054	huPass 10054	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10055	t	apeHu 10055	f	emailHu 10055	nomHu 10055	huPass 10055	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10057	t	apeHu 10057	f	emailHu 10057	nomHu 10057	huPass 10057	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10060	t	apeHu 10060	t	emailHu 10060	nomHu 10060	huPass 10060	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10061	t	apeHu 10061	f	emailHu 10061	nomHu 10061	huPass 10061	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10063	t	apeHu 10063	f	emailHu 10063	nomHu 10063	huPass 10063	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10064	t	apeHu 10064	f	emailHu 10064	nomHu 10064	huPass 10064	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10067	f	apeHu 10067	f	emailHu 10067	nomHu 10067	huPass 10067	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10070	t	apeHu 10070	f	emailHu 10070	nomHu 10070	huPass 10070	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10071	t	apeHu 10071	f	emailHu 10071	nomHu 10071	huPass 10071	3	APROBADO	\N	2022-05-13 00:00:00	\N
An	10026	t	apeAn 10026	f	emailAn 10026	nomAn 10026	anPass 10026	0	APROBADO	\N	2022-05-13 00:00:00	\N
An	10028	t	apeAn 10028	f	emailAn 10028	nomAn 10028	anPass 10028	5	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10073	f	apeHu 10073	f	emailHu 10073	nomHu 10073	huPass 10073	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	3	f	apellido	f	mail	Nombre	123	0	\N	\N	2022-06-26 18:21:27.62422	\N
Hu	4	f	ja	f	ma	js	ja	0	\N	\N	2022-06-26 18:27:13.013321	\N
Ad	10015	t	apeAd 10015	f	freddyamr@gmail.com	nomAd 10015	1234567aa	\N	\N	\N	2022-05-13 00:00:00	\N
Hu	10051	t	apeHu 10051	f	emailHu 10051	nomHu 10051	huPass 10051	3	APROBADO	\N	2022-05-13 00:00:00	\N
Ad	1009	t	apeAd 1009	f	emailAd 1009	nomAd 1009	adPass 1009	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	10010	t	apeAd 10010	f	emailAd 10010	nomAd 10010	adPass 10010	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	10011	t	apeAd 10011	f	emailAd 10011	nomAd 10011	adPass 10011	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	10012	t	apeAd 10012	f	emailAd 10012	nomAd 10012	adPass 10012	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	10013	f	apeAd 10013	f	emailAd 10013	nomAd 10013	adPass 10013	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	10014	t	apeAd 10014	f	emailAd 10014	nomAd 10014	adPass 10014	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	10016	t	apeAd 10016	f	emailAd 10016	nomAd 10016	adPass 10016	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	10017	t	apeAd 10017	f	emailAd 10017	nomAd 10017	adPass 10017	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	10018	t	apeAd 10018	f	emailAd 10018	nomAd 10018	adPass 10018	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	10019	t	apeAd 10019	f	emailAd 10019	nomAd 10019	adPass 10019	\N	\N	\N	2022-05-13 00:00:00	\N
Ad	10020	t	apeAd 10020	f	emailAd 10020	nomAd 10020	adPass 10020	\N	\N	\N	2022-05-13 00:00:00	\N
An	10037	t	apeAn 10037	f	emailAn 10037	nomAn 10037	anPass 10037	2	APROBADO	\N	2022-05-13 00:00:00	\N
An	10023	f	apeAn 10023	f	emailAn 10023	nomAn 10023	anPass 10023	2	APROBADO	\N	2022-05-13 00:00:00	\N
Ad	15001	t	Thompson	f	e.thompson@randatmail.com	Eddy	15001	\N	\N	\N	2021-10-14 00:00:00	\N
Ad	15002	t	Lloyd	f	m.lloyd@randatmail.com	Melanie	15002	\N	\N	\N	2021-02-18 00:00:00	\N
Ad	15003	t	Johnston	f	j.johnston@randatmail.com	Jared	15003	\N	\N	\N	2020-09-01 00:00:00	\N
Ad	15004	f	Clark	f	k.clark@randatmail.com	Kimberly	15004	\N	\N	\N	2021-06-17 00:00:00	\N
Ad	15005	t	Perkins	f	a.perkins@randatmail.com	Adam	15005	\N	\N	\N	2021-12-21 00:00:00	\N
Ad	15006	t	Morrison	f	a.morrison@randatmail.com	Abraham	15006	\N	\N	\N	2020-03-15 00:00:00	\N
Hu	10076	t	apeHu 10076	f	emailHu 10076	nomHu 10076	huPass 10076	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10078	t	apeHu 10078	f	emailHu 10078	nomHu 10078	huPass 10078	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10079	t	apeHu 10079	f	emailHu 10079	nomHu 10079	huPass 10079	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10080	t	apeHu 10080	f	emailHu 10080	nomHu 10080	huPass 10080	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10085	t	apeHu 10085	f	emailHu 10085	nomHu 10085	huPass 10085	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10088	t	apeHu 10088	f	emailHu 10088	nomHu 10088	huPass 10088	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10089	t	apeHu 10089	f	emailHu 10089	nomHu 10089	huPass 10089	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10094	t	apeHu 10094	f	emailHu 10094	nomHu 10094	huPass 10094	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10095	t	apeHu 10095	f	emailHu 10095	nomHu 10095	huPass 10095	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10099	t	apeHu 10099	f	emailHu 10099	nomHu 10099	huPass 10099	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10091	t	apeHu 10091	f	emailHu 10091	nomHu 10091	huPass 10091	5	RECHAZADO	\N	2022-05-13 00:00:00	\N
Hu	10066	t	apeHu 10066	f	emailHu 10066	nomHu 10066	huPass 10066	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10053	t	apeHu 10053	f	emailHu 10053	nomHu 10053	huPass 10053	3	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10068	t	apeHu 10068	f	emailHu 10068	nomHu 10068	huPass 10068	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10069	t	apeHu 10069	f	emailHu 10069	nomHu 10069	huPass 10069	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10075	t	apeHu 10075	f	emailHu 10075	nomHu 10075	huPass 10075	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10077	t	apeHu 10077	f	emailHu 10077	nomHu 10077	huPass 10077	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10081	t	apeHu 10081	f	emailHu 10081	nomHu 10081	huPass 10081	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10082	t	apeHu 10082	f	emailHu 10082	nomHu 10082	huPass 10082	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10084	t	apeHu 10084	t	emailHu 10084	nomHu 10084	huPass 10084	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10086	t	apeHu 10086	f	emailHu 10086	nomHu 10086	huPass 10086	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10087	t	apeHu 10087	f	emailHu 10087	nomHu 10087	huPass 10087	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10090	t	apeHu 10090	f	emailHu 10090	nomHu 10090	huPass 10090	0	RECHAZADO	\N	2022-05-13 00:00:00	\N
Hu	10092	f	apeHu 10092	f	emailHu 10092	nomHu 10092	huPass 10092	0	RECHAZADO	\N	2022-05-13 00:00:00	\N
Hu	10093	t	apeHu 10093	f	emailHu 10093	nomHu 10093	huPass 10093	0	RECHAZADO	\N	2022-05-13 00:00:00	\N
Hu	10096	t	apeHu 10096	f	emailHu 10096	nomHu 10096	huPass 10096	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10098	t	apeHu 10098	f	emailHu 10098	nomHu 10098	huPass 10098	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100100	t	apeHu 100100	f	emailHu 100100	nomHu 100100	huPass 100100	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100101	t	apeHu 100101	f	emailHu 100101	nomHu 100101	huPass 100101	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	15185	t	Davis	f	a.davis@randatmail.com	Alina	15185	0	APROBADO	\N	2021-07-04 00:00:00	\N
Hu	15186	t	Richardson	f	s.richardson@randatmail.com	Stella	15186	0	PENDIENTE	\N	2022-03-16 00:00:00	\N
Hu	15187	t	Grant	f	j.grant@randatmail.com	Julian	15187	0	APROBADO	\N	2021-03-24 00:00:00	\N
Hu	15188	t	Mason	f	a.mason@randatmail.com	Amanda	15188	0	APROBADO	\N	2020-06-25 00:00:00	\N
Hu	15189	t	Stewart	f	m.stewart@randatmail.com	Melissa	15189	0	APROBADO	\N	2021-07-04 00:00:00	\N
Hu	15190	t	Scott	f	a.scott@randatmail.com	Alexander	15190	0	RECHAZADO	\N	2020-08-15 00:00:00	\N
Hu	15191	f	Smith	f	m.smith@randatmail.com	Miley	15191	0	APROBADO	\N	2021-08-07 00:00:00	\N
Hu	15192	t	Armstrong	t	d.armstrong@randatmail.com	Daryl	15192	0	APROBADO	\N	2020-08-15 00:00:00	\N
Hu	15193	t	Andrews	f	a.andrews@randatmail.com	Andrew	15193	0	APROBADO	\N	2022-04-02 00:00:00	\N
Hu	15194	t	Kelly	f	a.kelly@randatmail.com	Arianna	15194	0	APROBADO	\N	2022-02-10 00:00:00	\N
Hu	15195	t	Kelley	f	c.kelley@randatmail.com	Carlos	15195	0	APROBADO	\N	2021-10-31 00:00:00	\N
Hu	15196	t	Barrett	f	e.barrett@randatmail.com	Edward	15196	0	APROBADO	\N	2022-04-02 00:00:00	\N
Hu	10083	t	apeHu 10083	f	asdf	nomHu 10083	YXNkZg==\n	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	15197	t	Ferguson	f	e.ferguson@randatmail.com	Ellia	15197	0	APROBADO	\N	2020-05-05 00:00:00	\N
Hu	15198	t	Craig	f	m.craig@randatmail.com	Mary	15198	0	PENDIENTE	\N	2020-12-12 00:00:00	\N
Hu	15199	t	Stewart	f	v.stewart@randatmail.com	Vivian	15199	0	APROBADO	\N	2021-12-21 00:00:00	\N
Hu	15200	t	Foster	f	g.foster@randatmail.com	Garry	15200	0	APROBADO	\N	2022-06-09 00:00:00	\N
An	10021	t	apeAn 10021	f	emailAn 10021	nomAn 10021	anPass 10021	0	APROBADO	\N	2022-05-13 00:00:00	\N
An	10024	t	apeAn 10024	f	emailAn 10024	nomAn 10024	anPass 10024	0	APROBADO	\N	2022-05-13 00:00:00	\N
An	10027	t	apeAn 10027	f	emailAn 10027	nomAn 10027	anPass 10027	0	APROBADO	\N	2022-05-13 00:00:00	\N
An	10030	t	apeAn 10030	f	emailAn 10030	nomAn 10030	anPass 10030	0	APROBADO	\N	2022-05-13 00:00:00	\N
An	10033	f	apeAn 10033	f	emailAn 10033	nomAn 10033	anPass 10033	0	APROBADO	\N	2022-05-13 00:00:00	\N
An	10036	t	apeAn 10036	f	emailAn 10036	nomAn 10036	anPass 10036	0	RECHAZADO	\N	2022-05-13 00:00:00	\N
An	10039	t	apeAn 10039	f	emailAn 10039	nomAn 10039	anPass 10039	0	APROBADO	\N	2022-05-13 00:00:00	\N
An	10042	t	apeAn 10042	f	emailAn 10042	nomAn 10042	anPass 10042	0	APROBADO	\N	2022-05-13 00:00:00	\N
An	10045	t	apeAn 10045	f	emailAn 10045	nomAn 10045	anPass 10045	0	APROBADO	\N	2022-05-13 00:00:00	\N
An	10048	t	apeAn 10048	f	emailAn 10048	nomAn 10048	anPass 10048	0	APROBADO	\N	2022-05-13 00:00:00	\N
An	10050	t	apeAn 10050	f	emailAn 10050	nomAn 10050	anPass 10050	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10052	t	apeHu 10052	f	emailHu 10052	nomHu 10052	huPass 10052	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100140	t	apeHu 100140	f	emailHu 100140	nomHu 100140	huPass 100140	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	1	t	string	f	string	string	string	0	\N	\N	2022-05-13 00:00:00	\N
Hu	10056	t	apeHu 10056	f	emailHu 10056	nomHu 10056	huPass 10056	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10058	t	apeHu 10058	f	emailHu 10058	nomHu 10058	huPass 10058	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10059	t	apeHu 10059	f	emailHu 10059	nomHu 10059	huPass 10059	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10062	t	apeHu 10062	f	emailHu 10062	nomHu 10062	huPass 10062	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	10065	t	apeHu 10065	f	emailHu 10065	nomHu 10065	huPass 10065	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100102	t	apeHu 100102	f	emailHu 100102	nomHu 100102	huPass 100102	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100103	t	apeHu 100103	f	emailHu 100103	nomHu 100103	huPass 100103	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100104	t	apeHu 100104	f	emailHu 100104	nomHu 100104	huPass 100104	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100105	t	apeHu 100105	f	emailHu 100105	nomHu 100105	huPass 100105	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100106	t	apeHu 100106	f	emailHu 100106	nomHu 100106	huPass 100106	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100107	t	apeHu 100107	f	emailHu 100107	nomHu 100107	huPass 100107	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100108	t	apeHu 100108	f	emailHu 100108	nomHu 100108	huPass 100108	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100109	t	apeHu 100109	f	emailHu 100109	nomHu 100109	huPass 100109	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100111	t	apeHu 100111	f	emailHu 100111	nomHu 100111	huPass 100111	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100112	t	apeHu 100112	f	emailHu 100112	nomHu 100112	huPass 100112	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100113	t	apeHu 100113	f	emailHu 100113	nomHu 100113	huPass 100113	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100114	t	apeHu 100114	f	emailHu 100114	nomHu 100114	huPass 100114	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100116	t	apeHu 100116	f	emailHu 100116	nomHu 100116	huPass 100116	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100117	t	apeHu 100117	f	emailHu 100117	nomHu 100117	huPass 100117	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100118	t	apeHu 100118	f	emailHu 100118	nomHu 100118	huPass 100118	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100119	t	apeHu 100119	f	emailHu 100119	nomHu 100119	huPass 100119	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100120	t	apeHu 100120	f	emailHu 100120	nomHu 100120	huPass 100120	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100121	t	apeHu 100121	f	emailHu 100121	nomHu 100121	huPass 100121	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100122	t	apeHu 100122	f	emailHu 100122	nomHu 100122	huPass 100122	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100123	t	apeHu 100123	f	emailHu 100123	nomHu 100123	huPass 100123	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100124	t	apeHu 100124	t	emailHu 100124	nomHu 100124	huPass 100124	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100125	t	apeHu 100125	f	emailHu 100125	nomHu 100125	huPass 100125	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100126	t	apeHu 100126	f	emailHu 100126	nomHu 100126	huPass 100126	0	PENDIENTE	\N	2022-05-13 00:00:00	\N
Hu	100127	t	apeHu 100127	f	emailHu 100127	nomHu 100127	huPass 100127	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100128	t	apeHu 100128	f	emailHu 100128	nomHu 100128	huPass 100128	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100129	t	apeHu 100129	f	emailHu 100129	nomHu 100129	huPass 100129	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100130	t	apeHu 100130	f	emailHu 100130	nomHu 100130	huPass 100130	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100131	t	apeHu 100131	f	emailHu 100131	nomHu 100131	huPass 100131	0	PENDIENTE	\N	2022-05-13 00:00:00	\N
Hu	100132	t	apeHu 100132	f	emailHu 100132	nomHu 100132	huPass 100132	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100133	t	apeHu 100133	f	emailHu 100133	nomHu 100133	huPass 100133	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100134	t	apeHu 100134	f	emailHu 100134	nomHu 100134	huPass 100134	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100135	t	apeHu 100135	f	emailHu 100135	nomHu 100135	huPass 100135	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100136	t	apeHu 100136	f	emailHu 100136	nomHu 100136	huPass 100136	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100137	t	apeHu 100137	f	emailHu 100137	nomHu 100137	huPass 100137	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100138	t	apeHu 100138	f	emailHu 100138	nomHu 100138	huPass 100138	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100139	t	apeHu 100139	f	emailHu 100139	nomHu 100139	huPass 100139	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100115	t	apeHu 100115	t	emailHu 100115	nomHu 100115	huPass 100115	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100141	t	apeHu 100141	f	emailHu 100141	nomHu 100141	huPass 100141	0	PENDIENTE	\N	2022-05-13 00:00:00	\N
Hu	100142	t	apeHu 100142	f	emailHu 100142	nomHu 100142	huPass 100142	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100143	t	apeHu 100143	f	emailHu 100143	nomHu 100143	huPass 100143	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100144	t	apeHu 100144	f	emailHu 100144	nomHu 100144	huPass 100144	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100145	t	apeHu 100145	f	emailHu 100145	nomHu 100145	huPass 100145	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100146	t	apeHu 100146	f	emailHu 100146	nomHu 100146	huPass 100146	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100147	t	apeHu 100147	f	emailHu 100147	nomHu 100147	huPass 100147	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100148	t	apeHu 100148	f	emailHu 100148	nomHu 100148	huPass 100148	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100149	t	apeHu 100149	f	emailHu 100149	nomHu 100149	huPass 100149	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100150	t	apeHu 100150	f	emailHu 100150	nomHu 100150	huPass 100150	0	APROBADO	\N	2022-05-13 00:00:00	\N
Hu	100110	t	apeHu 100110	f	emailHu 100110	nomHu 100110	huPass 100110	0	APROBADO	\N	2022-05-13 00:00:00	\N
An	10031	t	apeAn 10031	f	emailAn 10031	nomAn 10031	anPass 10031	0	RECHAZADO	\N	2022-05-13 00:00:00	\N
An	15007	t	Parker	f	m.parker@randatmail.com	Mike	15007	0	APROBADO	\N	2021-07-04 00:00:00	\N
An	15008	t	Stevens	f	m.stevens@randatmail.com	Max	15008	0	RECHAZADO	\N	2020-11-25 00:00:00	\N
An	15009	t	Martin	f	e.martin@randatmail.com	Elise	15009	0	APROBADO	\N	2021-03-24 00:00:00	\N
An	15010	t	Miller	f	d.miller@randatmail.com	Deanna	15010	0	APROBADO	\N	2021-03-07 00:00:00	\N
An	15011	t	Holmes	f	a.holmes@randatmail.com	Ada	15011	0	APROBADO	\N	2020-09-18 00:00:00	\N
An	15012	t	Armstrong	t	c.armstrong@randatmail.com	Charlotte	15012	0	APROBADO	\N	2020-04-18 00:00:00	\N
An	15013	t	Kelly	f	k.kelly@randatmail.com	Kate	15013	0	APROBADO	\N	2021-12-04 00:00:00	\N
An	15014	t	Ferguson	f	a.ferguson@randatmail.com	Aldus	15014	0	APROBADO	\N	2020-05-05 00:00:00	\N
An	15015	f	Allen	f	c.allen@randatmail.com	Cherry	15015	0	APROBADO	\N	2020-06-08 00:00:00	\N
An	15016	t	Evans	f	e.evans@randatmail.com	Edwin	15016	0	APROBADO	\N	2022-02-27 00:00:00	\N
An	15017	t	Moore	f	p.moore@randatmail.com	Penelope	15017	0	APROBADO	\N	2020-06-25 00:00:00	\N
An	15018	t	Douglas	f	a.douglas@randatmail.com	Aiden	15018	0	PENDIENTE	\N	2021-03-24 00:00:00	\N
An	15019	t	Crawford	f	c.crawford@randatmail.com	Chester	15019	0	APROBADO	\N	2020-09-18 00:00:00	\N
An	15020	t	Bailey	f	a.bailey@randatmail.com	Aida	15020	0	APROBADO	\N	2021-08-07 00:00:00	\N
An	15021	t	Warren	f	d.warren@randatmail.com	Dominik	15021	0	RECHAZADO	\N	2020-08-15 00:00:00	\N
An	15022	t	Sullivan	f	t.sullivan@randatmail.com	Tiana	15022	0	APROBADO	\N	2021-01-15 00:00:00	\N
An	15023	t	Parker	f	k.parker@randatmail.com	Kelvin	15023	0	APROBADO	\N	2022-02-27 00:00:00	\N
An	15024	t	Kelly	t	a.kelly@randatmail.com	Alford	15024	0	APROBADO	\N	2021-06-17 00:00:00	\N
An	15025	t	Barnes	f	l.barnes@randatmail.com	Lucia	15025	0	APROBADO	\N	2021-03-07 00:00:00	\N
An	15026	f	Brown	f	j.brown@randatmail.com	Julia	15026	0	APROBADO	\N	2020-05-05 00:00:00	\N
An	15027	t	Barnes	f	v.barnes@randatmail.com	Vivian	15027	0	APROBADO	\N	2021-09-27 00:00:00	\N
An	15028	t	Russell	f	s.russell@randatmail.com	Sienna	15028	0	APROBADO	\N	2020-07-29 00:00:00	\N
An	15029	t	Kelley	f	l.kelley@randatmail.com	Lucas	15029	0	APROBADO	\N	2020-08-15 00:00:00	\N
An	15030	t	Baker	f	j.baker@randatmail.com	Jack	15030	0	PENDIENTE	\N	2022-04-19 00:00:00	\N
An	15031	t	Williams	f	n.williams@randatmail.com	Nicholas	15031	0	APROBADO	\N	2022-06-09 00:00:00	\N
An	15032	t	Anderson	f	d.anderson@randatmail.com	David	15032	0	APROBADO	\N	2020-06-25 00:00:00	\N
An	15033	t	Mitchell	f	b.mitchell@randatmail.com	Belinda	15033	0	APROBADO	\N	2021-10-31 00:00:00	\N
An	15034	t	Miller	f	a.miller@randatmail.com	Alan	15034	0	RECHAZADO	\N	2020-10-22 00:00:00	\N
An	15035	t	Elliott	f	e.elliott@randatmail.com	Ellia	15035	0	APROBADO	\N	2021-04-10 00:00:00	\N
An	15036	t	Evans	t	t.evans@randatmail.com	Tony	15036	0	APROBADO	\N	2021-12-04 00:00:00	\N
An	15037	f	Wilson	f	s.wilson@randatmail.com	Sarah	15037	0	APROBADO	\N	2022-02-10 00:00:00	\N
An	15038	t	Hill	f	m.hill@randatmail.com	Mary	15038	0	APROBADO	\N	2022-01-24 00:00:00	\N
An	15039	t	Murray	f	a.murray@randatmail.com	Abraham	15039	0	APROBADO	\N	2021-09-27 00:00:00	\N
An	15040	t	Wright	f	a.wright@randatmail.com	Alisa	15040	0	APROBADO	\N	2021-05-31 00:00:00	\N
Hu	15041	t	Payne	f	c.payne@randatmail.com	Chelsea	15041	0	APROBADO	\N	2020-05-22 00:00:00	\N
Hu	15042	t	Brown	f	m.brown@randatmail.com	Maria	15042	0	PENDIENTE	\N	2020-10-05 00:00:00	\N
Hu	15043	t	Barrett	f	c.barrett@randatmail.com	Chloe	15043	0	APROBADO	\N	2022-03-16 00:00:00	\N
Hu	15044	t	Owens	f	d.owens@randatmail.com	Dale	15044	0	APROBADO	\N	2021-05-31 00:00:00	\N
Hu	15045	t	Baker	f	v.baker@randatmail.com	Vanessa	15045	0	APROBADO	\N	2020-03-15 00:00:00	\N
Hu	15046	t	Sullivan	f	a.sullivan@randatmail.com	Alen	15046	0	APROBADO	\N	2021-10-14 00:00:00	\N
Hu	15047	t	Adams	f	e.adams@randatmail.com	Emma	15047	0	RECHAZADO	\N	2021-06-17 00:00:00	\N
Hu	15048	f	Craig	t	l.craig@randatmail.com	Lydia	15048	0	APROBADO	\N	2021-05-31 00:00:00	\N
Hu	15049	t	Hill	f	a.hill@randatmail.com	Antony	15049	0	APROBADO	\N	2020-08-15 00:00:00	\N
Hu	15050	t	Parker	f	j.parker@randatmail.com	Jared	15050	0	APROBADO	\N	2020-07-29 00:00:00	\N
Hu	15051	t	Henderson	f	a.henderson@randatmail.com	Amelia	15051	0	APROBADO	\N	2020-05-05 00:00:00	\N
Hu	15052	t	Scott	f	c.scott@randatmail.com	Carlos	15052	0	APROBADO	\N	2022-02-27 00:00:00	\N
Hu	15053	t	Scott	f	h.scott@randatmail.com	Heather	15053	0	APROBADO	\N	2020-12-29 00:00:00	\N
Hu	15054	t	Owens	f	o.owens@randatmail.com	Olivia	15054	0	PENDIENTE	\N	2020-06-08 00:00:00	\N
Hu	15055	t	Brooks	f	a.brooks@randatmail.com	Abigail	15055	0	APROBADO	\N	2022-02-27 00:00:00	\N
Hu	15056	t	Campbell	f	m.campbell@randatmail.com	Michelle	15056	0	APROBADO	\N	2020-12-12 00:00:00	\N
Hu	15057	t	Andrews	f	c.andrews@randatmail.com	Charlie	15057	0	APROBADO	\N	2022-04-19 00:00:00	\N
Hu	15058	t	Howard	f	m.howard@randatmail.com	Marcus	15058	0	APROBADO	\N	2020-08-15 00:00:00	\N
Hu	15059	f	Campbell	f	v.campbell@randatmail.com	Victor	15059	0	APROBADO	\N	2020-10-22 00:00:00	\N
Hu	15060	t	Fowler	t	d.fowler@randatmail.com	Daisy	15060	0	RECHAZADO	\N	2021-02-18 00:00:00	\N
Hu	15061	t	Edwards	f	r.edwards@randatmail.com	Rosie	15061	0	APROBADO	\N	2022-04-19 00:00:00	\N
Hu	15062	t	Fowler	f	j.fowler@randatmail.com	Jacob	15062	0	APROBADO	\N	2020-08-15 00:00:00	\N
Hu	15063	t	Payne	f	f.payne@randatmail.com	Fenton	15063	0	APROBADO	\N	2021-04-10 00:00:00	\N
Hu	15064	t	Spencer	f	j.spencer@randatmail.com	John	15064	0	APROBADO	\N	2021-05-14 00:00:00	\N
Hu	15065	t	Watson	f	e.watson@randatmail.com	Edgar	15065	0	APROBADO	\N	2022-02-10 00:00:00	\N
Hu	15066	t	Baker	f	m.baker@randatmail.com	Melanie	15066	0	PENDIENTE	\N	2021-10-31 00:00:00	\N
Hu	15067	t	Andrews	f	e.andrews@randatmail.com	Ellia	15067	0	APROBADO	\N	2022-03-16 00:00:00	\N
Hu	15068	t	Morgan	f	j.morgan@randatmail.com	Jared	15068	0	APROBADO	\N	2021-08-07 00:00:00	\N
Hu	15069	t	Nelson	f	a.nelson@randatmail.com	Adelaide	15069	0	APROBADO	\N	2021-08-07 00:00:00	\N
Hu	15070	f	Farrell	f	s.farrell@randatmail.com	Sabrina	15070	0	APROBADO	\N	2020-11-25 00:00:00	\N
Hu	15071	t	Williams	f	s.williams@randatmail.com	Sofia	15071	0	APROBADO	\N	2021-02-01 00:00:00	\N
Hu	15072	t	Jones	t	a.jones@randatmail.com	Aston	15072	0	APROBADO	\N	2021-05-14 00:00:00	\N
Hu	15073	t	Wright	f	v.wright@randatmail.com	Victoria	15073	0	RECHAZADO	\N	2020-11-08 00:00:00	\N
Hu	15074	t	Moore	f	j.moore@randatmail.com	Jack	15074	0	APROBADO	\N	2021-04-27 00:00:00	\N
Hu	15075	t	Morgan	f	a.morgan@randatmail.com	Amy	15075	0	APROBADO	\N	2022-06-09 00:00:00	\N
Hu	15076	t	West	f	t.west@randatmail.com	Ted	15076	0	APROBADO	\N	2020-11-08 00:00:00	\N
Hu	15077	t	Stevens	f	e.stevens@randatmail.com	Ellia	15077	0	APROBADO	\N	2020-04-01 00:00:00	\N
Hu	15078	t	Lloyd	f	j.lloyd@randatmail.com	Jessica	15078	0	PENDIENTE	\N	2020-09-18 00:00:00	\N
Hu	15079	t	West	f	l.west@randatmail.com	Lucas	15079	0	APROBADO	\N	2021-09-27 00:00:00	\N
Hu	15080	t	Robinson	f	b.robinson@randatmail.com	Belinda	15080	0	APROBADO	\N	2021-05-14 00:00:00	\N
Hu	15081	f	Harris	f	n.harris@randatmail.com	Naomi	15081	0	APROBADO	\N	2020-07-12 00:00:00	\N
Hu	15082	t	Kelly	f	a.kelly@randatmail.com	Agata	15082	0	APROBADO	\N	2020-03-15 00:00:00	\N
Hu	15083	t	Ellis	f	r.ellis@randatmail.com	Rafael	15083	0	APROBADO	\N	2020-09-18 00:00:00	\N
Hu	15084	t	Moore	t	m.moore@randatmail.com	Melissa	15084	0	APROBADO	\N	2022-06-09 00:00:00	\N
Hu	15085	t	Chapman	f	e.chapman@randatmail.com	Edith	15085	0	APROBADO	\N	2021-06-17 00:00:00	\N
Hu	15086	t	Gray	f	a.gray@randatmail.com	Abraham	15086	0	RECHAZADO	\N	2021-06-17 00:00:00	\N
Hu	15087	t	Stevens	f	v.stevens@randatmail.com	Valeria	15087	0	APROBADO	\N	2021-09-10 00:00:00	\N
Hu	15088	t	Wright	f	v.wright@randatmail.com	Violet	15088	0	APROBADO	\N	2020-11-08 00:00:00	\N
Hu	15089	t	Payne	f	b.payne@randatmail.com	Briony	15089	0	APROBADO	\N	2020-11-25 00:00:00	\N
Hu	15090	t	Baker	f	o.baker@randatmail.com	Oliver	15090	0	PENDIENTE	\N	2020-12-29 00:00:00	\N
Hu	15091	t	Smith	f	l.smith@randatmail.com	Lenny	15091	0	APROBADO	\N	2020-05-22 00:00:00	\N
Hu	15092	f	Craig	f	b.craig@randatmail.com	Brianna	15092	0	APROBADO	\N	2022-02-10 00:00:00	\N
Hu	15093	t	Warren	f	a.warren@randatmail.com	Aston	15093	0	APROBADO	\N	2022-04-19 00:00:00	\N
Hu	15094	t	Wells	f	k.wells@randatmail.com	Kellan	15094	0	APROBADO	\N	2020-07-12 00:00:00	\N
Hu	15095	t	Russell	f	l.russell@randatmail.com	Leonardo	15095	0	APROBADO	\N	2020-07-12 00:00:00	\N
Hu	15096	t	Morgan	t	s.morgan@randatmail.com	Sophia	15096	0	APROBADO	\N	2020-10-05 00:00:00	\N
Hu	15097	t	Montgomery	f	n.montgomery@randatmail.com	Naomi	15097	0	APROBADO	\N	2021-03-24 00:00:00	\N
Hu	15098	t	Martin	f	e.martin@randatmail.com	Emily	15098	0	APROBADO	\N	2020-12-29 00:00:00	\N
Hu	15099	t	Baker	f	a.baker@randatmail.com	Ada	15099	0	RECHAZADO	\N	2021-08-24 00:00:00	\N
Hu	15100	t	Russell	f	m.russell@randatmail.com	Madaline	15100	0	APROBADO	\N	2021-08-24 00:00:00	\N
Hu	15101	t	Cunningham	f	b.cunningham@randatmail.com	Brooke	15101	0	APROBADO	\N	2022-01-07 00:00:00	\N
Hu	15102	t	Morris	f	r.morris@randatmail.com	Rebecca	15102	0	PENDIENTE	\N	2022-01-07 00:00:00	\N
Hu	15103	f	Hamilton	f	a.hamilton@randatmail.com	Arianna	15103	0	APROBADO	\N	2022-05-06 00:00:00	\N
Hu	15104	t	Farrell	f	a.farrell@randatmail.com	Alberta	15104	0	APROBADO	\N	2020-04-01 00:00:00	\N
Hu	15105	t	Thomas	f	p.thomas@randatmail.com	Preston	15105	0	APROBADO	\N	2021-03-24 00:00:00	\N
Hu	15106	t	Barnes	f	c.barnes@randatmail.com	Carlos	15106	0	APROBADO	\N	2020-10-05 00:00:00	\N
Hu	15107	t	Walker	f	d.walker@randatmail.com	Derek	15107	0	APROBADO	\N	2021-10-14 00:00:00	\N
Hu	15108	t	Lloyd	t	c.lloyd@randatmail.com	Carina	15108	0	APROBADO	\N	2021-08-24 00:00:00	\N
Hu	15109	t	Brown	f	t.brown@randatmail.com	Ted	15109	0	APROBADO	\N	2020-12-12 00:00:00	\N
Hu	15110	t	Brooks	f	m.brooks@randatmail.com	Miller	15110	0	APROBADO	\N	2021-02-18 00:00:00	\N
Hu	15111	t	Wilson	f	a.wilson@randatmail.com	Adelaide	15111	0	APROBADO	\N	2022-05-06 00:00:00	\N
Hu	15112	t	Farrell	f	a.farrell@randatmail.com	Ashton	15112	0	RECHAZADO	\N	2020-10-05 00:00:00	\N
Hu	15113	t	Alexander	f	i.alexander@randatmail.com	Isabella	15113	0	APROBADO	\N	2021-06-17 00:00:00	\N
Hu	15114	f	Lloyd	f	m.lloyd@randatmail.com	Max	15114	0	PENDIENTE	\N	2021-09-10 00:00:00	\N
Hu	15115	t	Clark	f	b.clark@randatmail.com	Brad	15115	0	APROBADO	\N	2022-04-02 00:00:00	\N
Hu	15116	t	Phillips	f	v.phillips@randatmail.com	Victoria	15116	0	APROBADO	\N	2021-08-07 00:00:00	\N
Hu	15117	t	Andrews	f	p.andrews@randatmail.com	Paige	15117	0	APROBADO	\N	2021-09-10 00:00:00	\N
Hu	15118	t	Nelson	f	r.nelson@randatmail.com	Reid	15118	0	APROBADO	\N	2020-05-05 00:00:00	\N
Hu	15119	t	Cameron	f	g.cameron@randatmail.com	Gianna	15119	0	APROBADO	\N	2022-02-10 00:00:00	\N
Hu	15120	t	Harris	t	j.harris@randatmail.com	Jack	15120	0	APROBADO	\N	2020-05-05 00:00:00	\N
Hu	15121	t	Mitchell	f	k.mitchell@randatmail.com	Kelvin	15121	0	APROBADO	\N	2021-06-17 00:00:00	\N
Hu	15122	t	Craig	f	m.craig@randatmail.com	Maximilian	15122	0	APROBADO	\N	2020-04-18 00:00:00	\N
Hu	15123	t	Johnson	f	s.johnson@randatmail.com	Sofia	15123	0	APROBADO	\N	2021-05-14 00:00:00	\N
Hu	15124	t	Russell	f	v.russell@randatmail.com	Vivian	15124	0	APROBADO	\N	2021-07-04 00:00:00	\N
Hu	15125	f	Johnson	f	d.johnson@randatmail.com	Dominik	15125	0	RECHAZADO	\N	2021-11-17 00:00:00	\N
Hu	15126	t	Hunt	f	t.hunt@randatmail.com	Tara	15126	0	PENDIENTE	\N	2021-04-27 00:00:00	\N
Hu	15127	t	Ellis	f	e.ellis@randatmail.com	Emily	15127	0	APROBADO	\N	2020-11-08 00:00:00	\N
Hu	15128	t	Riley	f	k.riley@randatmail.com	Kellan	15128	0	APROBADO	\N	2020-05-05 00:00:00	\N
Hu	15129	t	Howard	f	l.howard@randatmail.com	Leonardo	15129	0	APROBADO	\N	2020-12-12 00:00:00	\N
Hu	15130	t	Tucker	f	v.tucker@randatmail.com	Vivian	15130	0	APROBADO	\N	2022-04-02 00:00:00	\N
Hu	15131	t	Jones	f	h.jones@randatmail.com	Henry	15131	0	APROBADO	\N	2020-08-15 00:00:00	\N
Hu	15132	t	Holmes	t	t.holmes@randatmail.com	Ted	15132	0	APROBADO	\N	2020-10-22 00:00:00	\N
Hu	15133	t	Ferguson	f	b.ferguson@randatmail.com	Blake	15133	0	APROBADO	\N	2021-04-27 00:00:00	\N
Hu	15134	t	Barnes	f	t.barnes@randatmail.com	Tiana	15134	0	APROBADO	\N	2020-07-29 00:00:00	\N
Hu	15135	t	Chapman	f	a.chapman@randatmail.com	Abigail	15135	0	APROBADO	\N	2020-09-01 00:00:00	\N
Hu	15136	f	Clark	f	r.clark@randatmail.com	Rebecca	15136	0	APROBADO	\N	2020-12-12 00:00:00	\N
Hu	15137	t	Perry	f	j.perry@randatmail.com	James	15137	0	APROBADO	\N	2021-08-24 00:00:00	\N
Hu	15138	t	Dixon	f	l.dixon@randatmail.com	Lily	15138	0	RECHAZADO	\N	2020-09-18 00:00:00	\N
Hu	15139	t	Richards	f	e.richards@randatmail.com	Elise	15139	0	APROBADO	\N	2020-09-18 00:00:00	\N
Hu	15140	t	Hunt	f	e.hunt@randatmail.com	Ellia	15140	0	APROBADO	\N	2021-09-27 00:00:00	\N
Hu	15141	t	Wilson	f	v.wilson@randatmail.com	Valeria	15141	0	APROBADO	\N	2021-07-04 00:00:00	\N
Hu	15142	t	Harper	f	j.harper@randatmail.com	James	15142	0	APROBADO	\N	2021-06-17 00:00:00	\N
Hu	15143	t	Owens	f	s.owens@randatmail.com	Sophia	15143	0	APROBADO	\N	2020-09-01 00:00:00	\N
Hu	15144	t	Myers	t	b.myers@randatmail.com	Blake	15144	0	APROBADO	\N	2021-01-15 00:00:00	\N
Hu	15145	t	Harper	f	l.harper@randatmail.com	Lucia	15145	0	APROBADO	\N	2020-03-15 00:00:00	\N
Hu	15146	t	Henderson	f	o.henderson@randatmail.com	Olivia	15146	0	APROBADO	\N	2021-08-24 00:00:00	\N
Hu	15147	f	Hamilton	f	f.hamilton@randatmail.com	Frederick	15147	0	APROBADO	\N	2020-06-08 00:00:00	\N
Hu	15148	t	Perry	f	a.perry@randatmail.com	Amelia	15148	0	APROBADO	\N	2022-06-09 00:00:00	\N
Hu	15149	t	Murphy	f	l.murphy@randatmail.com	Lyndon	15149	0	APROBADO	\N	2021-02-01 00:00:00	\N
Hu	15150	t	Foster	f	h.foster@randatmail.com	Henry	15150	0	PENDIENTE	\N	2021-01-15 00:00:00	\N
Hu	15151	t	Mason	f	m.mason@randatmail.com	Marcus	15151	0	RECHAZADO	\N	2021-04-27 00:00:00	\N
Hu	15152	t	Allen	f	j.allen@randatmail.com	Jasmine	15152	0	APROBADO	\N	2020-05-22 00:00:00	\N
Hu	15153	t	Baker	f	a.baker@randatmail.com	Aldus	15153	0	APROBADO	\N	2022-02-27 00:00:00	\N
Hu	15154	t	Adams	f	a.adams@randatmail.com	Arianna	15154	0	APROBADO	\N	2020-09-01 00:00:00	\N
Hu	15155	t	Hill	f	a.hill@randatmail.com	Adelaide	15155	0	APROBADO	\N	2021-03-24 00:00:00	\N
Hu	15156	t	Spencer	t	t.spencer@randatmail.com	Tyler	15156	0	APROBADO	\N	2021-07-04 00:00:00	\N
Hu	15157	t	Perry	f	l.perry@randatmail.com	Lenny	15157	0	APROBADO	\N	2021-01-15 00:00:00	\N
Hu	15158	f	Armstrong	f	c.armstrong@randatmail.com	Chelsea	15158	0	APROBADO	\N	2022-06-09 00:00:00	\N
Hu	15159	t	Hamilton	f	l.hamilton@randatmail.com	Lucas	15159	0	APROBADO	\N	2021-09-27 00:00:00	\N
Hu	15160	t	Foster	f	a.foster@randatmail.com	Alford	15160	0	APROBADO	\N	2022-05-06 00:00:00	\N
Hu	15161	t	Nelson	f	t.nelson@randatmail.com	Tiana	15161	0	APROBADO	\N	2021-10-31 00:00:00	\N
Hu	15162	t	Holmes	f	r.holmes@randatmail.com	Roland	15162	0	PENDIENTE	\N	2022-03-16 00:00:00	\N
Hu	15163	t	Henderson	f	a.henderson@randatmail.com	Arianna	15163	0	APROBADO	\N	2022-03-16 00:00:00	\N
Hu	15164	t	Martin	f	k.martin@randatmail.com	Kelsey	15164	0	RECHAZADO	\N	2020-04-01 00:00:00	\N
Hu	15165	t	Hill	f	t.hill@randatmail.com	Tony	15165	0	APROBADO	\N	2020-10-22 00:00:00	\N
Hu	15166	t	Carter	f	a.carter@randatmail.com	Alexia	15166	0	APROBADO	\N	2022-01-24 00:00:00	\N
Hu	15167	t	Richardson	f	a.richardson@randatmail.com	Agata	15167	0	APROBADO	\N	2021-04-27 00:00:00	\N
Hu	15168	t	Edwards	t	e.edwards@randatmail.com	Emma	15168	0	APROBADO	\N	2022-05-23 00:00:00	\N
Hu	15169	f	Cooper	f	m.cooper@randatmail.com	Melanie	15169	0	APROBADO	\N	2020-10-05 00:00:00	\N
Hu	15170	t	Cooper	f	a.cooper@randatmail.com	Adrianna	15170	0	APROBADO	\N	2022-02-10 00:00:00	\N
Hu	15171	t	Taylor	f	e.taylor@randatmail.com	Edith	15171	0	APROBADO	\N	2021-05-31 00:00:00	\N
Hu	15172	t	Cooper	f	a.cooper@randatmail.com	Alexander	15172	0	APROBADO	\N	2022-04-19 00:00:00	\N
Hu	15173	t	Alexander	f	a.alexander@randatmail.com	Alissa	15173	0	APROBADO	\N	2020-04-18 00:00:00	\N
Hu	15174	t	Ryan	f	a.ryan@randatmail.com	Aston	15174	0	PENDIENTE	\N	2020-04-01 00:00:00	\N
Hu	15175	t	Richardson	f	b.richardson@randatmail.com	Brianna	15175	0	APROBADO	\N	2020-10-05 00:00:00	\N
Hu	15176	t	Murphy	f	a.murphy@randatmail.com	Andrew	15176	0	APROBADO	\N	2020-07-12 00:00:00	\N
Hu	15177	t	Kelly	f	r.kelly@randatmail.com	Rebecca	15177	0	RECHAZADO	\N	2020-04-01 00:00:00	\N
Hu	15178	t	Carter	f	t.carter@randatmail.com	Tara	15178	0	APROBADO	\N	2022-01-07 00:00:00	\N
Hu	15179	t	Craig	f	c.craig@randatmail.com	Chelsea	15179	0	APROBADO	\N	2021-11-17 00:00:00	\N
Hu	15180	f	Warren	t	t.warren@randatmail.com	Ted	15180	0	APROBADO	\N	2021-05-31 00:00:00	\N
Hu	15181	t	Campbell	f	a.campbell@randatmail.com	Andrew	15181	0	APROBADO	\N	2022-02-10 00:00:00	\N
Hu	15182	t	Martin	f	m.martin@randatmail.com	Maya	15182	0	APROBADO	\N	2022-01-07 00:00:00	\N
Hu	15183	t	Thomas	f	v.thomas@randatmail.com	Victor	15183	0	APROBADO	\N	2021-04-27 00:00:00	\N
Hu	15184	t	Higgins	f	t.higgins@randatmail.com	Thomas	15184	0	APROBADO	\N	2020-09-18 00:00:00	\N
\.


--
-- Name: alojamientos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alojamientos_id_seq', 201, true);


--
-- Name: calificaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calificaciones_id_seq', 2, true);


--
-- Name: dt_direccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dt_direccion_id_seq', 2, true);


--
-- Name: dt_pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dt_pais_id_seq', 3152, true);


--
-- Name: dt_servicios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dt_servicios_id_seq', 3, true);


--
-- Name: facturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturas_id_seq', 42, true);


--
-- Name: habitaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.habitaciones_id_seq', 4, true);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 3, true);


--
-- Name: recuperaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recuperaciones_id_seq', 1, false);


--
-- Name: reservas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservas_id_seq', 35, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 5, true);


--
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

BEGIN;

SELECT pg_catalog.lo_open('59406', 131072);
SELECT pg_catalog.lowrite(0, '\x656165557253464c5373574c776244554d714b57784d3a41504139316247694238427a6b4b334d656e50685f4c6b524a48746d7241427146576352684b675f2d4159696f413236426e386c6737654a706e314c674c73644a3574396871565178707a63554868655734784b61354b6f74684844514c47474e3542787671666b71593346453054722d4d417a6370374264396b397373504f5348646a346e786e36416f6d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('59407', 131072);
SELECT pg_catalog.lowrite(0, '\x656165557253464c5373574c776244554d714b57784d3a41504139316247694238427a6b4b334d656e50685f4c6b524a48746d7241427146576352684b675f2d4159696f413236426e386c6737654a706e314c674c73644a3574396871565178707a63554868655734784b61354b6f74684844514c47474e3542787671666b71593346453054722d4d417a6370374264396b397373504f5348646a346e786e36416f6d');
SELECT pg_catalog.lo_close(0);

COMMIT;

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
-- Name: huesped_push_tokens huesped_push_tokens_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.huesped_push_tokens
    ADD CONSTRAINT huesped_push_tokens_pk PRIMARY KEY (huesped_id, push_tokens);


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

