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
SELECT pg_catalog.lo_unlink('59407');
SELECT pg_catalog.lo_unlink('59406');
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

INSERT INTO public.alojamientos VALUES (1, true, 'desc_ 10022_ 1000', 'nombreAloj_ 10022_ 1000', 10022, 1001);
INSERT INTO public.alojamientos VALUES (2, true, 'desc_ 10023_ 1000', 'nombreAloj_ 10023_ 1000', 10023, 1002);
INSERT INTO public.alojamientos VALUES (4, true, 'desc_ 10025_ 1000', 'nombreAloj_ 10025_ 1000', 10025, 1004);
INSERT INTO public.alojamientos VALUES (5, true, 'desc_ 10026_ 1000', 'nombreAloj_ 10026_ 1000', 10026, 1005);
INSERT INTO public.alojamientos VALUES (9, true, 'desc_ 10029_ 1001', 'nombreAloj_ 10029_ 1001', 10029, 1009);
INSERT INTO public.alojamientos VALUES (11, true, 'desc_ 10032_ 1000', 'nombreAloj_ 10032_ 1000', 10032, 10011);
INSERT INTO public.alojamientos VALUES (13, true, 'desc_ 10034_ 1000', 'nombreAloj_ 10034_ 1000', 10034, 10013);
INSERT INTO public.alojamientos VALUES (15, true, 'desc_ 10035_ 1001', 'nombreAloj_ 10035_ 1001', 10035, 10015);
INSERT INTO public.alojamientos VALUES (16, true, 'desc_ 10037_ 1000', 'nombreAloj_ 10037_ 1000', 10037, 10016);
INSERT INTO public.alojamientos VALUES (18, true, 'desc_ 10038_ 1001', 'nombreAloj_ 10038_ 1001', 10038, 10018);
INSERT INTO public.alojamientos VALUES (21, true, 'desc_ 10041_ 1001', 'nombreAloj_ 10041_ 1001', 10041, 10021);
INSERT INTO public.alojamientos VALUES (25, true, 'desc_ 10046_ 1000', 'nombreAloj_ 10046_ 1000', 10046, 10025);
INSERT INTO public.alojamientos VALUES (27, true, 'desc_ 10047_ 1001', 'nombreAloj_ 10047_ 1001', 10047, 10027);
INSERT INTO public.alojamientos VALUES (10, false, 'desc_ 10031_ 1000', 'nombreAloj_ 10031_ 1000', 10031, 10010);
INSERT INTO public.alojamientos VALUES (201, true, 'desc aloj 15014', 'nombre aloj 15014', 15014, 2);
INSERT INTO public.alojamientos VALUES (22, false, 'desc_ 10043_ 1000', 'nombreAloj_ 10043_ 1000', 10043, 10022);
INSERT INTO public.alojamientos VALUES (7, false, 'desc_ 10028_ 1000', 'nombreAloj_ 10028_ 1000', 10028, 1007);
INSERT INTO public.alojamientos VALUES (3, false, 'desc_ 10023_ 1001', 'nombreAloj_ 10023_ 1001', 10028, 1003);
INSERT INTO public.alojamientos VALUES (6, true, 'desc_ 10026_ 1001', 'nombreAloj_ 10026_ 1001', 10028, 1006);
INSERT INTO public.alojamientos VALUES (8, true, 'desc_ 10029_ 1000', 'nombreAloj_ 10029_ 1000', 10028, 1008);
INSERT INTO public.alojamientos VALUES (12, true, 'desc_ 10032_ 1001', 'nombreAloj_ 10032_ 1001', 10028, 10012);
INSERT INTO public.alojamientos VALUES (14, true, 'desc_ 10035_ 1000', 'nombreAloj_ 10035_ 1000', 10028, 10014);
INSERT INTO public.alojamientos VALUES (17, false, 'desc_ 10038_ 1000', 'nombreAloj_ 10038_ 1000', 10028, 10017);
INSERT INTO public.alojamientos VALUES (20, true, 'desc_ 10041_ 1000', 'nombreAloj_ 10041_ 1000', 10028, 10020);
INSERT INTO public.alojamientos VALUES (23, true, 'desc_ 10044_ 1000', 'nombreAloj_ 10044_ 1000', 10028, 10023);
INSERT INTO public.alojamientos VALUES (24, false, 'desc_ 10044_ 1001', 'nombreAloj_ 10044_ 1001', 10028, 10024);
INSERT INTO public.alojamientos VALUES (26, true, 'desc_ 10047_ 1000', 'nombreAloj_ 10047_ 1000', 10028, 10026);
INSERT INTO public.alojamientos VALUES (28, true, 'desc_ 10049_ 1000', 'nombreAloj_ 10049_ 1000', 10028, 10028);
INSERT INTO public.alojamientos VALUES (19, true, 'desc aloji 19', 'nom alji 19', 10028, 10019);
INSERT INTO public.alojamientos VALUES (801, true, 'Este hotel de San Francisco está situado en la plaza Union Square, a 5 minutos a pie de la línea de tranvía Powell Street. Tiene piscina al aire libre y ofrece habitaciones con conexión para MP3.', 'Handlery Union Square Hotel', 15015, 801);
INSERT INTO public.alojamientos VALUES (802, true, 'Este alojamiento está a 1 minuto a pie de la playa. Este establecimiento se encuentra frente a la playa, en el corazón de Fort Myers Beach, y ofrece alojamientos tipo apartamento de 1 dormitorio con zona de cocina. En el resort hay WiFi gratuita y aparcamiento gratuito.', 'The Neptune Resort', 15015, 802);
INSERT INTO public.alojamientos VALUES (803, true, 'Este hotel de suites se encuentra a 3 minutos en coche del Walt Disney World Resort. Ofrece una piscina exterior climatizada y desayuno gratuito. Se ofrece un servicio de traslado a Walt Disney World en un horario programado.', 'Buena Vista Suites Orlando', 15015, 803);
INSERT INTO public.alojamientos VALUES (804, true, 'El Riu Plaza Manhattan Times Square se encuentra en Nueva York, a 300 metros de Times Square, y ofrece registros de entrada y salida exprés, habitaciones para no fumadores, restaurante, WiFi gratuita en todas las instalaciones y bar. Este hotel de 4 estrellas ofrece servicio de conserjería y consigna de equipaje. Además, hay recepción 24 horas, centro de negocios y servicio de organización de excursiones.', 'Riu Plaza Manhattan Times Square', 15015, 804);
INSERT INTO public.alojamientos VALUES (805, true, 'Este hotel está ubicado en Manhattan, junto a la estación Grand Central Terminal, y alberga un sitio para comer y un centro de fitness StayFit (abierto todos los días, las 24 horas). Las habitaciones incluyen TV de pantalla plana y soporte para iPod.', 'Hyatt Grand Central New York', 15015, 805);
INSERT INTO public.alojamientos VALUES (806, true, 'El Au Manoir d''Anniviers está rodeado de montañas y viñedos y se encuentra en la histórica localidad de Vissoie, a 17 km de Sierre. Las habitaciones disponen de conexión Wi-Fi gratuita y balcón con vistas a los Alpes del Valais.', 'Au Manoir d''Anniviers', 15020, 806);
INSERT INTO public.alojamientos VALUES (807, true, 'El Hotel de l''Ours Preles se encuentra en Prêles y ofrece restaurante, bar, salón compartido y jardín. Ofrece habitaciones familiares y terraza. Hay servicio de habitaciones, cajero automático y servicio de organización de excursiones.', 'Hotel de l’Ours Preles', 15020, 807);
INSERT INTO public.alojamientos VALUES (808, true, 'El Hotel Royal Zurich está situado a solo 2 paradas de tranvía y a 5 minutos a pie de la estación principal de trenes de Zúrich y de la zona comercial Bahnhofstrasse, y ofrece aparcamiento en garaje privado por un suplemento y conexión WiFi de alta velocidad gratuita.', 'Royal Hotel Zurich', 15020, 808);
INSERT INTO public.alojamientos VALUES (809, true, 'El Hotel Harder Minerva está situado en el centro de Interlaken, en una calle lateral tranquila y a solo 50 metros de la calle principal. Ofrece habitaciones modernas con aire acondicionado, instalaciones de primera categoría y un apartamento con balcón, chimenea y conexión Wi-Fi gratuita.', 'Hotel Harder Minerva', 15020, 809);
INSERT INTO public.alojamientos VALUES (810, true, 'Este alojamiento está a 11 minutos a pie de la playa. Situado a 100 metros de la estación de tren de Lucerna y a 200 metros del muelle, del famoso Kapellbrücke (Puente de la Capilla) y del lago, el Waldstätterhof Hotel goza de una céntrica ubicación.', 'Waldstätterhof Swiss Quality Hotel', 15020, 810);
INSERT INTO public.alojamientos VALUES (811, true, 'La Bastide Du Bois Breant se encuentra en Maubec y cuenta con restaurante, piscina al aire libre de temporada, bar y salón compartido. El hotel de 3 estrellas cuenta con jardín y habitaciones con aire acondicionado, WiFi gratuita y baño privado. El hotel ofrece aparcamiento privado gratuito y servicio de alquiler de coches.', 'La Bastide Du Bois Breant', 15021, 811);
INSERT INTO public.alojamientos VALUES (812, true, 'El Flat CHamps Élysées está situado en París, a 700 metros del Arco del Triunfo y a 1,6 km del Museo de la Orangerie y de la Torre Eiffel. El establecimiento se encuentra a 2 km del Museo de Orsay y de la ópera Garnier.', 'Flat CHamps Élysées', 15022, 812);
INSERT INTO public.alojamientos VALUES (813, true, 'El Hôtel Axotel Lyon está situado en el barrio de la Presqu’île de Lyon, a 6 minutos a pie de la estación de tren y metro de Perrache. El establecimiento alberga un restaurante tradicional, un jardín y terraza con sombra. Ofrece WiFi gratuita en todas sus instalaciones.', 'Hôtel Axotel Lyon', 15023, 813);
INSERT INTO public.alojamientos VALUES (814, true, 'El Ibis Marseille Centre está situado en el distrito 6 de Marsella y ofrece WiFi gratis y recepción 24 horas. El puerto viejo está a 12 minutos a pie y el estadio Vélodrome, a 3 km.', 'Ibis Marseille Centre', 15024, 814);
INSERT INTO public.alojamientos VALUES (815, true, 'El Pullman Montpellier Centre, situado en el centro histórico de Montpellier, a 500 metros de la Place de la Comédie y al lado del centro comercial Polygone, cuenta con piscina exterior en la azota, abierta todo el año y climatizada de abril a octubre. Tiene WiFi gratuita en todas las zonas. El hotel está a menos de 20 km de las playas de Palavas-les-Flots y La Grande Motte.', 'Pullman Montpellier Centre', 15025, 815);


--
-- Data for Name: calificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.calificaciones VALUES (351, 3, 4, '2022-05-03 00:00:00', 'RESEnA 351');
INSERT INTO public.calificaciones VALUES (365, 5, 5, '2022-05-11 00:00:00', 'RESEÑA 365');
INSERT INTO public.calificaciones VALUES (367, 2, 3, '2022-05-12 00:00:00', 'RESEÑA 367');
INSERT INTO public.calificaciones VALUES (375, 4, 1, '2022-05-16 00:00:00', 'RESEÑA 375');
INSERT INTO public.calificaciones VALUES (381, 3, 1, '2022-05-19 00:00:00', 'RESEÑA 381');
INSERT INTO public.calificaciones VALUES (383, 4, 5, '2022-05-20 00:00:00', 'RESEÑA 383');
INSERT INTO public.calificaciones VALUES (2, 0, 5, '0002-12-31 00:00:00.308 BC', '');
INSERT INTO public.calificaciones VALUES (355, 0, 5, '2022-05-06 00:00:00', 'RESEÑA 355');
INSERT INTO public.calificaciones VALUES (357, 5, 0, '2022-05-07 00:00:00', 'RESEÑA 357');
INSERT INTO public.calificaciones VALUES (361, 5, 0, '2022-05-09 00:00:00', 'RESEÑA 361');
INSERT INTO public.calificaciones VALUES (363, 0, 3, '2022-05-10 00:00:00', 'RESEÑA 363');
INSERT INTO public.calificaciones VALUES (377, 5, 0, '2022-05-17 00:00:00', 'RESEÑA 377');
INSERT INTO public.calificaciones VALUES (373, 4, 0, '2022-05-15 00:00:00', 'RESEÑA 373');
INSERT INTO public.calificaciones VALUES (379, 1, 0, '2022-05-18 00:00:00', 'RESEÑA 379');
INSERT INTO public.calificaciones VALUES (369, 4, 0, '2022-05-13 00:00:00', 'RESEÑA 369');
INSERT INTO public.calificaciones VALUES (353, 0, 2, '2022-05-05 00:00:00', 'RESEÑA 353');
INSERT INTO public.calificaciones VALUES (371, 3, 4, '2022-06-17 00:00:00.22', 'resa ');
INSERT INTO public.calificaciones VALUES (359, 5, 2, '2022-06-18 00:00:00.996', 'aaa');


--
-- Data for Name: dt_direccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dt_direccion VALUES (1001, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (1002, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (1003, 'calle_dir$', 'ciudad 1000', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (1004, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (1005, 'calle_dir$', 'ciudad 1002', ' 1001', 2);
INSERT INTO public.dt_direccion VALUES (1006, 'calle_dir$', 'ciudad 1000', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (1007, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (1008, 'calle_dir$', 'ciudad 1002', ' 1001', 3);
INSERT INTO public.dt_direccion VALUES (1009, 'calle_dir$', 'ciudad 1000', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10010, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10012, 'calle_dir$', 'ciudad 1000', ' 1001', 2);
INSERT INTO public.dt_direccion VALUES (10013, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10014, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10015, 'calle_dir$', 'ciudad 1000', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10016, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10017, 'calle_dir$', 'ciudad 1002', ' 1001', 3);
INSERT INTO public.dt_direccion VALUES (10018, 'calle_dir$', 'ciudad 1000', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10020, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10022, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10023, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10024, 'calle_dir$', 'ciudad 1000', ' 1001', 4);
INSERT INTO public.dt_direccion VALUES (10025, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10026, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10027, 'calle_dir$', 'ciudad 1000', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10028, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10029, 'calle_dir$', 'ciudad 1002', ' 1001', 2);
INSERT INTO public.dt_direccion VALUES (10030, 'calle_dir$', 'ciudad 1000', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10031, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10032, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10033, 'calle_dir$', 'ciudad 1000', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10034, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10035, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10036, 'calle_dir$', 'ciudad 1000', ' 1001', 8);
INSERT INTO public.dt_direccion VALUES (10037, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10038, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10039, 'calle_dir$', 'ciudad 1000', ' 1001', 15);
INSERT INTO public.dt_direccion VALUES (10040, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10041, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10042, 'calle_dir$', 'ciudad 1000', ' 1001', 8);
INSERT INTO public.dt_direccion VALUES (10043, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10044, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10045, 'calle_dir$', 'ciudad 1000', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10046, 'calle_dir$', 'ciudad 1001', ' 1001', 15);
INSERT INTO public.dt_direccion VALUES (10047, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10048, 'calle_dir$', 'ciudad 1000', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10049, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10019, 'calle aloj 19', 'ciaaaudad loj', '125534', 1);
INSERT INTO public.dt_direccion VALUES (2, 'calle 15014', 'citutut', '1234 15014', 8);
INSERT INTO public.dt_direccion VALUES (10021, 'calle_dir$', 'ciudad 1000', ' 1001', 3);
INSERT INTO public.dt_direccion VALUES (10011, 'calle_dir$', 'ciudad 1002', ' 1001', 3);
INSERT INTO public.dt_direccion VALUES (801, ' Geary Street', 'San Francisco', '351', 58);
INSERT INTO public.dt_direccion VALUES (802, 'Estero Boulevard', 'Miami', '2310', 58);
INSERT INTO public.dt_direccion VALUES (803, 'World Center Drive, Lago Buena Vista', 'Orlando', '2310', 58);
INSERT INTO public.dt_direccion VALUES (804, 'West 47th Street', 'New York', '145', 58);
INSERT INTO public.dt_direccion VALUES (805, 'East 42nd Street', 'New York', '109', 58);
INSERT INTO public.dt_direccion VALUES (806, 'Route de Sierre 20', 'Berna', '3961', 176);
INSERT INTO public.dt_direccion VALUES (807, '6 La Chaîne, 2515 Prêles', 'Interlaken', '215', 176);
INSERT INTO public.dt_direccion VALUES (808, 'Leonhardstrasse 6, 1.', 'Zurich', '143', 176);
INSERT INTO public.dt_direccion VALUES (809, 'Harderstr. 15, 3800', 'Interlaken', '1400', 176);
INSERT INTO public.dt_direccion VALUES (810, 'Zentralstrasse 4', 'Lucerna', '6003', 176);
INSERT INTO public.dt_direccion VALUES (811, '501 chemin du puits du grandaou', 'Niza', '84660', 66);
INSERT INTO public.dt_direccion VALUES (812, '78 Avenue des Champs-Élysées, Campos Elíseos', 'Paris', '75008', 66);
INSERT INTO public.dt_direccion VALUES (813, '12 rue Marc Antoine Petit', 'Lyon', '69002', 66);
INSERT INTO public.dt_direccion VALUES (814, '13 Rue Lafon, Castellane et Préfecture', 'Marsella', '13006', 66);
INSERT INTO public.dt_direccion VALUES (815, '1, rue des Pertuisanes', 'Montpellier', '34000', 66);


--
-- Data for Name: dt_pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dt_pais VALUES (1, 'Afganistán');
INSERT INTO public.dt_pais VALUES (2, 'Albania');
INSERT INTO public.dt_pais VALUES (3, 'Alemania');
INSERT INTO public.dt_pais VALUES (4, 'Andorra');
INSERT INTO public.dt_pais VALUES (5, 'Ango');
INSERT INTO public.dt_pais VALUES (6, 'Antigua y Barbuda');
INSERT INTO public.dt_pais VALUES (7, 'Arabia Saudita');
INSERT INTO public.dt_pais VALUES (8, 'Argia');
INSERT INTO public.dt_pais VALUES (9, 'Argentina');
INSERT INTO public.dt_pais VALUES (10, 'Armenia');
INSERT INTO public.dt_pais VALUES (11, 'Australia');
INSERT INTO public.dt_pais VALUES (12, 'Austria');
INSERT INTO public.dt_pais VALUES (13, 'Azerbaiyán');
INSERT INTO public.dt_pais VALUES (14, 'Bahamas s');
INSERT INTO public.dt_pais VALUES (15, 'Bahrein');
INSERT INTO public.dt_pais VALUES (16, 'Bangdesh');
INSERT INTO public.dt_pais VALUES (17, 'Barbados');
INSERT INTO public.dt_pais VALUES (18, 'Barús');
INSERT INTO public.dt_pais VALUES (19, 'Bélgica');
INSERT INTO public.dt_pais VALUES (20, 'Bice');
INSERT INTO public.dt_pais VALUES (21, 'Benin');
INSERT INTO public.dt_pais VALUES (22, 'Bhután');
INSERT INTO public.dt_pais VALUES (23, 'Bolivia Estado Plurinacional de');
INSERT INTO public.dt_pais VALUES (24, 'Bosnia y Herzegovina');
INSERT INTO public.dt_pais VALUES (25, 'Botswana');
INSERT INTO public.dt_pais VALUES (26, 'Brasil');
INSERT INTO public.dt_pais VALUES (27, 'Brunei Darussam');
INSERT INTO public.dt_pais VALUES (28, 'Bulgaria');
INSERT INTO public.dt_pais VALUES (29, 'Burkina Faso');
INSERT INTO public.dt_pais VALUES (30, 'Burundi');
INSERT INTO public.dt_pais VALUES (31, 'Cabo Verde');
INSERT INTO public.dt_pais VALUES (32, 'Camboya');
INSERT INTO public.dt_pais VALUES (33, 'Camerún');
INSERT INTO public.dt_pais VALUES (34, 'Canadá');
INSERT INTO public.dt_pais VALUES (35, 'Chad');
INSERT INTO public.dt_pais VALUES (36, 'Chequia');
INSERT INTO public.dt_pais VALUES (37, 'Chile');
INSERT INTO public.dt_pais VALUES (38, 'China');
INSERT INTO public.dt_pais VALUES (39, 'Chipre');
INSERT INTO public.dt_pais VALUES (40, 'Colombia');
INSERT INTO public.dt_pais VALUES (41, 'Comoras s');
INSERT INTO public.dt_pais VALUES (42, 'Congo');
INSERT INTO public.dt_pais VALUES (43, 'Costa Rica');
INSERT INTO public.dt_pais VALUES (44, 'Côte d’Ivoire');
INSERT INTO public.dt_pais VALUES (45, 'Croacia');
INSERT INTO public.dt_pais VALUES (46, 'Cuba');
INSERT INTO public.dt_pais VALUES (47, 'Dinamarca');
INSERT INTO public.dt_pais VALUES (48, 'Djibouti');
INSERT INTO public.dt_pais VALUES (49, 'Dominica');
INSERT INTO public.dt_pais VALUES (50, 'Ecuador');
INSERT INTO public.dt_pais VALUES (51, 'Egipto');
INSERT INTO public.dt_pais VALUES (52, ' Salvador');
INSERT INTO public.dt_pais VALUES (53, 'Emiratos Árabes Unidos');
INSERT INTO public.dt_pais VALUES (54, 'Eritrea');
INSERT INTO public.dt_pais VALUES (55, 'Eslovaquia');
INSERT INTO public.dt_pais VALUES (56, 'Eslovenia');
INSERT INTO public.dt_pais VALUES (57, 'España');
INSERT INTO public.dt_pais VALUES (58, 'Estados Unidos de América');
INSERT INTO public.dt_pais VALUES (59, 'Estonia');
INSERT INTO public.dt_pais VALUES (60, 'Eswatini');
INSERT INTO public.dt_pais VALUES (61, 'Etiopía');
INSERT INTO public.dt_pais VALUES (62, 'Federación de Rusia');
INSERT INTO public.dt_pais VALUES (63, 'Fiji');
INSERT INTO public.dt_pais VALUES (64, 'Filipinas');
INSERT INTO public.dt_pais VALUES (65, 'Finndia');
INSERT INTO public.dt_pais VALUES (66, 'Francia');
INSERT INTO public.dt_pais VALUES (67, 'Gabón');
INSERT INTO public.dt_pais VALUES (68, 'Gambia');
INSERT INTO public.dt_pais VALUES (69, 'Georgia');
INSERT INTO public.dt_pais VALUES (70, 'Ghana');
INSERT INTO public.dt_pais VALUES (71, 'Granada');
INSERT INTO public.dt_pais VALUES (72, 'Grecia');
INSERT INTO public.dt_pais VALUES (73, 'Guatema');
INSERT INTO public.dt_pais VALUES (74, 'Guinea');
INSERT INTO public.dt_pais VALUES (75, 'Guinea Ecuatorial');
INSERT INTO public.dt_pais VALUES (76, 'Guinea-Bissau');
INSERT INTO public.dt_pais VALUES (77, 'Guyana');
INSERT INTO public.dt_pais VALUES (78, 'Haití');
INSERT INTO public.dt_pais VALUES (79, 'Honduras');
INSERT INTO public.dt_pais VALUES (80, 'Hungría');
INSERT INTO public.dt_pais VALUES (81, 'India');
INSERT INTO public.dt_pais VALUES (82, 'Indonesia');
INSERT INTO public.dt_pais VALUES (83, 'Irán República Islámica d');
INSERT INTO public.dt_pais VALUES (84, 'Iraq');
INSERT INTO public.dt_pais VALUES (85, 'Irnda');
INSERT INTO public.dt_pais VALUES (86, 'Isndia');
INSERT INTO public.dt_pais VALUES (87, 'Iss Cook s');
INSERT INTO public.dt_pais VALUES (88, 'Iss Marshall s');
INSERT INTO public.dt_pais VALUES (89, 'Iss Salomón s');
INSERT INTO public.dt_pais VALUES (90, 'Isra');
INSERT INTO public.dt_pais VALUES (91, 'Italia');
INSERT INTO public.dt_pais VALUES (92, 'Jamaica');
INSERT INTO public.dt_pais VALUES (93, 'Japón');
INSERT INTO public.dt_pais VALUES (94, 'Jordania');
INSERT INTO public.dt_pais VALUES (95, 'Kazajstán');
INSERT INTO public.dt_pais VALUES (96, 'Kenya');
INSERT INTO public.dt_pais VALUES (97, 'Kirguistán');
INSERT INTO public.dt_pais VALUES (98, 'Kiribati');
INSERT INTO public.dt_pais VALUES (99, 'Kuwait');
INSERT INTO public.dt_pais VALUES (100, 'Lesotho');
INSERT INTO public.dt_pais VALUES (101, 'Letonia');
INSERT INTO public.dt_pais VALUES (102, 'Líbano');
INSERT INTO public.dt_pais VALUES (103, 'Liberia');
INSERT INTO public.dt_pais VALUES (104, 'Libia');
INSERT INTO public.dt_pais VALUES (105, 'Liechtenstein');
INSERT INTO public.dt_pais VALUES (106, 'Lituania');
INSERT INTO public.dt_pais VALUES (107, 'Luxemburgo');
INSERT INTO public.dt_pais VALUES (108, 'Madagascar');
INSERT INTO public.dt_pais VALUES (109, 'Masia');
INSERT INTO public.dt_pais VALUES (110, 'Mawi');
INSERT INTO public.dt_pais VALUES (111, 'Maldivas');
INSERT INTO public.dt_pais VALUES (112, 'Malí');
INSERT INTO public.dt_pais VALUES (113, 'Malta');
INSERT INTO public.dt_pais VALUES (114, 'Marruecos');
INSERT INTO public.dt_pais VALUES (115, 'Mauricio');
INSERT INTO public.dt_pais VALUES (116, 'Mauritania');
INSERT INTO public.dt_pais VALUES (117, 'México');
INSERT INTO public.dt_pais VALUES (118, 'Micronesia Estados Federados de');
INSERT INTO public.dt_pais VALUES (119, 'Mónaco');
INSERT INTO public.dt_pais VALUES (120, 'Mongolia');
INSERT INTO public.dt_pais VALUES (121, 'Montenegro');
INSERT INTO public.dt_pais VALUES (122, 'Mozambique');
INSERT INTO public.dt_pais VALUES (123, 'Myanmar');
INSERT INTO public.dt_pais VALUES (124, 'Namibia');
INSERT INTO public.dt_pais VALUES (125, 'Nauru');
INSERT INTO public.dt_pais VALUES (126, 'Nepal');
INSERT INTO public.dt_pais VALUES (127, 'Nicaragua');
INSERT INTO public.dt_pais VALUES (128, 'Níger');
INSERT INTO public.dt_pais VALUES (129, 'Nigeria');
INSERT INTO public.dt_pais VALUES (130, 'Niue');
INSERT INTO public.dt_pais VALUES (131, 'Noruega');
INSERT INTO public.dt_pais VALUES (132, 'Nueva Zandia');
INSERT INTO public.dt_pais VALUES (133, 'Omán');
INSERT INTO public.dt_pais VALUES (134, 'Países Bajos');
INSERT INTO public.dt_pais VALUES (135, 'Pakistán');
INSERT INTO public.dt_pais VALUES (136, 'Pau');
INSERT INTO public.dt_pais VALUES (137, 'Panamá');
INSERT INTO public.dt_pais VALUES (138, 'Papua Nueva Guinea');
INSERT INTO public.dt_pais VALUES (139, 'Paraguay');
INSERT INTO public.dt_pais VALUES (140, 'Perú');
INSERT INTO public.dt_pais VALUES (141, 'Polonia');
INSERT INTO public.dt_pais VALUES (142, 'Portugal');
INSERT INTO public.dt_pais VALUES (143, 'Qatar');
INSERT INTO public.dt_pais VALUES (144, 'Reino Unido de Gran Bretaña e Irnda d Norte');
INSERT INTO public.dt_pais VALUES (145, 'República Árabe Siria');
INSERT INTO public.dt_pais VALUES (146, 'República Centroafricana');
INSERT INTO public.dt_pais VALUES (147, 'República de Corea');
INSERT INTO public.dt_pais VALUES (148, 'República de Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (149, 'Nombre corto: Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (150, 'República de Moldova');
INSERT INTO public.dt_pais VALUES (151, 'República Democrática d Congo');
INSERT INTO public.dt_pais VALUES (152, 'República Democrática Popur o');
INSERT INTO public.dt_pais VALUES (153, 'República Dominicana');
INSERT INTO public.dt_pais VALUES (154, 'República Popur Democrática de Corea');
INSERT INTO public.dt_pais VALUES (155, 'República Unida de Tanzanía');
INSERT INTO public.dt_pais VALUES (156, 'Rumania');
INSERT INTO public.dt_pais VALUES (157, 'Rwanda');
INSERT INTO public.dt_pais VALUES (158, 'Saint Kitts y Nevis');
INSERT INTO public.dt_pais VALUES (159, 'Samoa');
INSERT INTO public.dt_pais VALUES (160, 'San Marino');
INSERT INTO public.dt_pais VALUES (161, 'San Vicente y s Granadinas');
INSERT INTO public.dt_pais VALUES (162, 'Santa Lucía');
INSERT INTO public.dt_pais VALUES (163, 'Santa Sede');
INSERT INTO public.dt_pais VALUES (164, 'Santo Tomé y Príncipe');
INSERT INTO public.dt_pais VALUES (165, 'Senegal');
INSERT INTO public.dt_pais VALUES (166, 'Serbia');
INSERT INTO public.dt_pais VALUES (167, 'Seychles');
INSERT INTO public.dt_pais VALUES (168, 'Sierra Leona');
INSERT INTO public.dt_pais VALUES (169, 'Singapur');
INSERT INTO public.dt_pais VALUES (170, 'Somalia');
INSERT INTO public.dt_pais VALUES (171, 'Sri nka');
INSERT INTO public.dt_pais VALUES (172, 'Sudáfrica');
INSERT INTO public.dt_pais VALUES (173, 'Sudán');
INSERT INTO public.dt_pais VALUES (174, 'Sudán d Sur');
INSERT INTO public.dt_pais VALUES (175, 'Suecia');
INSERT INTO public.dt_pais VALUES (176, 'Suiza');
INSERT INTO public.dt_pais VALUES (177, 'Suriname');
INSERT INTO public.dt_pais VALUES (178, 'Taindia');
INSERT INTO public.dt_pais VALUES (179, 'Tayikistán');
INSERT INTO public.dt_pais VALUES (180, 'Timor-Leste');
INSERT INTO public.dt_pais VALUES (181, 'Togo');
INSERT INTO public.dt_pais VALUES (182, 'Tonga');
INSERT INTO public.dt_pais VALUES (183, 'Trinidad y Tabago');
INSERT INTO public.dt_pais VALUES (184, 'Túnez');
INSERT INTO public.dt_pais VALUES (185, 'Turkmenistán');
INSERT INTO public.dt_pais VALUES (186, 'Turquía');
INSERT INTO public.dt_pais VALUES (187, 'Tuvalu');
INSERT INTO public.dt_pais VALUES (188, 'Ucrania');
INSERT INTO public.dt_pais VALUES (189, 'Uganda');
INSERT INTO public.dt_pais VALUES (190, 'Uruguay');
INSERT INTO public.dt_pais VALUES (191, 'Uzbekistán');
INSERT INTO public.dt_pais VALUES (192, 'Vanuatu');
INSERT INTO public.dt_pais VALUES (193, 'Venezua República Bolivariana de');
INSERT INTO public.dt_pais VALUES (194, 'Viet Nam');
INSERT INTO public.dt_pais VALUES (195, 'Yemen');
INSERT INTO public.dt_pais VALUES (196, 'Zambia');
INSERT INTO public.dt_pais VALUES (197, 'Zimbabwe');


--
-- Data for Name: dt_servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dt_servicios VALUES (101, true, true, true, true, true, true);
INSERT INTO public.dt_servicios VALUES (102, true, true, true, false, false, true);
INSERT INTO public.dt_servicios VALUES (103, true, false, false, false, true, true);
INSERT INTO public.dt_servicios VALUES (104, true, true, true, false, true, true);
INSERT INTO public.dt_servicios VALUES (105, true, false, true, false, false, true);
INSERT INTO public.dt_servicios VALUES (106, false, false, false, true, false, true);
INSERT INTO public.dt_servicios VALUES (107, true, true, false, false, false, true);
INSERT INTO public.dt_servicios VALUES (108, true, true, false, false, false, true);
INSERT INTO public.dt_servicios VALUES (109, true, false, false, true, true, true);
INSERT INTO public.dt_servicios VALUES (110, true, false, true, true, false, true);
INSERT INTO public.dt_servicios VALUES (111, false, false, false, true, false, false);
INSERT INTO public.dt_servicios VALUES (112, false, false, false, true, true, false);
INSERT INTO public.dt_servicios VALUES (113, false, true, false, true, false, false);
INSERT INTO public.dt_servicios VALUES (114, true, true, false, true, false, true);
INSERT INTO public.dt_servicios VALUES (115, false, false, true, false, false, true);
INSERT INTO public.dt_servicios VALUES (116, true, true, false, true, true, false);
INSERT INTO public.dt_servicios VALUES (117, false, false, false, true, true, false);
INSERT INTO public.dt_servicios VALUES (118, true, true, true, true, true, true);
INSERT INTO public.dt_servicios VALUES (119, false, true, true, false, true, false);
INSERT INTO public.dt_servicios VALUES (120, false, true, true, false, true, true);
INSERT INTO public.dt_servicios VALUES (121, true, true, false, true, false, false);
INSERT INTO public.dt_servicios VALUES (122, true, false, false, true, true, false);
INSERT INTO public.dt_servicios VALUES (123, false, false, false, true, true, false);
INSERT INTO public.dt_servicios VALUES (124, true, true, false, false, false, false);
INSERT INTO public.dt_servicios VALUES (125, false, false, false, true, false, false);
INSERT INTO public.dt_servicios VALUES (126, true, false, false, true, false, true);
INSERT INTO public.dt_servicios VALUES (127, true, true, false, true, false, false);
INSERT INTO public.dt_servicios VALUES (128, false, true, false, false, true, false);
INSERT INTO public.dt_servicios VALUES (1, true, true, true, true, true, true);
INSERT INTO public.dt_servicios VALUES (2, true, true, true, true, true, true);
INSERT INTO public.dt_servicios VALUES (3, true, true, true, true, true, true);
INSERT INTO public.dt_servicios VALUES (901, false, true, true, false, true, true);
INSERT INTO public.dt_servicios VALUES (902, true, true, false, false, false, true);
INSERT INTO public.dt_servicios VALUES (903, false, true, false, false, true, true);
INSERT INTO public.dt_servicios VALUES (904, true, false, false, true, true, false);
INSERT INTO public.dt_servicios VALUES (905, true, false, true, false, true, true);
INSERT INTO public.dt_servicios VALUES (906, false, true, true, true, false, false);
INSERT INTO public.dt_servicios VALUES (907, true, true, true, false, false, true);
INSERT INTO public.dt_servicios VALUES (908, false, false, false, false, false, false);
INSERT INTO public.dt_servicios VALUES (909, true, false, false, false, true, true);
INSERT INTO public.dt_servicios VALUES (910, true, true, true, true, true, false);
INSERT INTO public.dt_servicios VALUES (911, true, false, false, false, true, false);
INSERT INTO public.dt_servicios VALUES (912, true, true, false, true, false, true);
INSERT INTO public.dt_servicios VALUES (913, true, false, true, true, true, false);
INSERT INTO public.dt_servicios VALUES (914, false, true, true, false, true, false);
INSERT INTO public.dt_servicios VALUES (915, false, false, false, false, true, true);
INSERT INTO public.dt_servicios VALUES (916, true, false, true, false, true, false);
INSERT INTO public.dt_servicios VALUES (917, true, false, true, true, true, false);
INSERT INTO public.dt_servicios VALUES (918, false, true, false, false, true, false);
INSERT INTO public.dt_servicios VALUES (919, false, false, false, true, true, true);
INSERT INTO public.dt_servicios VALUES (920, false, false, true, true, true, true);
INSERT INTO public.dt_servicios VALUES (921, true, false, true, true, true, false);
INSERT INTO public.dt_servicios VALUES (922, false, true, true, true, false, true);


--
-- Data for Name: facturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.facturas VALUES (2, true, 'REALIZADO', '2022-02-12 00:00:00.546', NULL, 1312, 100, 368);
INSERT INTO public.facturas VALUES (3, true, 'REALIZADO', '2022-02-12 00:00:00.619', NULL, 1312, 100, 373);
INSERT INTO public.facturas VALUES (4, true, 'REALIZADO', '2022-01-12 00:00:00.941', NULL, 1312, 100, 354);
INSERT INTO public.facturas VALUES (5, true, 'REALIZADO', '2022-01-12 00:00:00.158', NULL, 1312, 100, 376);
INSERT INTO public.facturas VALUES (6, true, 'REALIZADO', '2021-10-31 00:00:00.544', NULL, 1200, 100, 360);
INSERT INTO public.facturas VALUES (7, true, 'REALIZADO', '2021-10-31 00:00:00.099', NULL, 1210, 100, 356);
INSERT INTO public.facturas VALUES (8, true, 'REALIZADO', '2021-10-31 00:00:00.742', NULL, 1210, 100, 362);
INSERT INTO public.facturas VALUES (9, true, 'PENDIENTE', '0022-12-13 00:00:00.04', 'sss  tring', 4150, 50, 2);
INSERT INTO public.facturas VALUES (10, true, 'PENDIENTE', '0022-12-13 00:00:00.485', 'sdd asd ppal tring', 5740, 10, 3);
INSERT INTO public.facturas VALUES (11, true, 'PENDIENTE', '0022-12-13 00:00:00.387', 'sdd asd ppal tring', 5740, 10, 4);
INSERT INTO public.facturas VALUES (17, false, 'PENDIENTE', '2022-06-22 00:00:00.059', '6BX62214246359808', 0, 0, 10);
INSERT INTO public.facturas VALUES (13, true, 'PENDIENTE', '2022-06-17 00:00:00.185', 'sdd asd ppal tring', 5490, 10, 6);
INSERT INTO public.facturas VALUES (18, false, 'PENDIENTE', '2022-06-22 00:00:00.103', '5UK37213DL1173429', 0, 0, 11);
INSERT INTO public.facturas VALUES (19, false, 'PENDIENTE', '2022-06-22 00:00:00.987', '5XD02769W06097509', 1500, 0, 12);
INSERT INTO public.facturas VALUES (20, false, 'PENDIENTE', '2022-06-22 00:00:00.241', '4BU71164BT341122B', 1150, 0, 13);
INSERT INTO public.facturas VALUES (12, true, 'REALIZADO', '0022-12-13 00:00:00.416', 'straaaaaaasdfing', 5490, 10, 5);
INSERT INTO public.facturas VALUES (27, false, 'PENDIENTE', '2022-06-24 00:00:00.981', '64M9548338950244S', 0, 0, 20);
INSERT INTO public.facturas VALUES (28, false, 'PENDIENTE', '2022-06-24 00:00:00.845', '8DK68489YN6027710', 0, 0, 21);
INSERT INTO public.facturas VALUES (29, false, 'PENDIENTE', '2022-06-24 00:00:00.622', '61J18735N39248831', 0, 0, 22);
INSERT INTO public.facturas VALUES (30, false, 'PENDIENTE', '2022-06-24 00:00:00.077', '7R645330AA4223136', 0, 0, 23);
INSERT INTO public.facturas VALUES (31, false, 'PENDIENTE', '2022-06-24 00:00:00.421', '7D5278193X7220455', 0, 0, 24);
INSERT INTO public.facturas VALUES (32, false, 'PENDIENTE', '2022-06-24 00:00:00.047', '59B2023552322314J', 0, 0, 25);
INSERT INTO public.facturas VALUES (33, false, 'PENDIENTE', '2022-06-24 00:00:00.877', '41169351JL926505P', 0, 0, 26);
INSERT INTO public.facturas VALUES (34, false, 'PENDIENTE', '2022-06-24 00:00:00.983', '61B02224KD5567831', 0, 0, 27);
INSERT INTO public.facturas VALUES (35, false, 'PENDIENTE', '2022-06-24 00:00:00.192', '3L285317KK459003E', 0, 0, 28);
INSERT INTO public.facturas VALUES (36, false, 'PENDIENTE', '2022-06-24 00:00:00.981', '41F09623LX736830U', 0, 0, 29);
INSERT INTO public.facturas VALUES (37, false, 'PENDIENTE', '2022-06-24 00:00:00.501', '9AF28026GF003924B', 0, 0, 30);
INSERT INTO public.facturas VALUES (38, false, 'PENDIENTE', '2022-06-24 00:00:00.461', '91U64631G7379232S', 0, 0, 31);
INSERT INTO public.facturas VALUES (39, false, 'PENDIENTE', '2022-06-24 00:00:00.326', '65V37249LA5790509', 0, 0, 32);
INSERT INTO public.facturas VALUES (40, false, 'PENDIENTE', '2022-06-26 00:00:00.657', '95927103D2794951A', 0, 0, 33);
INSERT INTO public.facturas VALUES (41, false, 'PENDIENTE', '2022-06-26 00:00:00.327', '72H694755U747604G', 0, 0, 34);
INSERT INTO public.facturas VALUES (42, false, 'PENDIENTE', '2022-06-26 00:00:00.355', '3TP48146U2509801D', 1500, 0, 35);
INSERT INTO public.facturas VALUES (14, false, 'PENDIENTE', '2022-06-22 00:00:00.814', '6VW82844UT2218401', 0, 0, 7);
INSERT INTO public.facturas VALUES (15, false, 'PENDIENTE', '2022-06-22 00:00:00.463', '0WX57557D62537329', 0, 0, 8);
INSERT INTO public.facturas VALUES (16, false, 'PENDIENTE', '2022-06-22 00:00:00.797', '3GP62371A81858011', 0, 0, 9);
INSERT INTO public.facturas VALUES (21, false, 'PENDIENTE', '2022-06-22 00:00:00.846', '60434087LV036723K', 0, 0, 14);
INSERT INTO public.facturas VALUES (22, false, 'PENDIENTE', '2022-06-22 00:00:00.509', '1Y4634160P4953447', 0, 0, 15);
INSERT INTO public.facturas VALUES (23, false, 'PENDIENTE', '2022-06-22 00:00:00.475', '2F3293950K384534G', 0, 0, 16);
INSERT INTO public.facturas VALUES (24, false, 'PENDIENTE', '2022-06-22 00:00:00.389', '6DK84758YR329941D', 0, 0, 17);
INSERT INTO public.facturas VALUES (25, false, 'PENDIENTE', '2022-06-22 00:00:00.693', '846718198X928630L', 0, 0, 18);
INSERT INTO public.facturas VALUES (26, false, 'PENDIENTE', '2022-06-22 00:00:00.052', '1JB68049TV944862U', 0, 0, 19);


--
-- Data for Name: habitaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.habitaciones VALUES (101, 2, 'Desc hab 101', 500, 1, 101);
INSERT INTO public.habitaciones VALUES (102, 4, 'Desc hab 102', 1400, 2, 102);
INSERT INTO public.habitaciones VALUES (104, 1, 'Desc hab 104', 1500, 4, 104);
INSERT INTO public.habitaciones VALUES (105, 1, 'Desc hab 105', 500, 5, 105);
INSERT INTO public.habitaciones VALUES (106, 2, 'Desc hab 106', 1250, 6, 106);
INSERT INTO public.habitaciones VALUES (107, 2, 'Desc hab 107', 1350, 7, 107);
INSERT INTO public.habitaciones VALUES (108, 3, 'Desc hab 108', 1450, 8, 108);
INSERT INTO public.habitaciones VALUES (109, 2, 'Desc hab 109', 1200, 9, 109);
INSERT INTO public.habitaciones VALUES (110, 1, 'Desc hab 110', 1150, 10, 110);
INSERT INTO public.habitaciones VALUES (111, 3, 'Desc hab 111', 1100, 11, 111);
INSERT INTO public.habitaciones VALUES (112, 2, 'Desc hab 112', 1050, 12, 112);
INSERT INTO public.habitaciones VALUES (113, 3, 'Desc hab 113', 750, 13, 113);
INSERT INTO public.habitaciones VALUES (114, 1, 'Desc hab 114', 1050, 14, 114);
INSERT INTO public.habitaciones VALUES (115, 2, 'Desc hab 115', 750, 15, 115);
INSERT INTO public.habitaciones VALUES (116, 2, 'Desc hab 116', 1500, 16, 116);
INSERT INTO public.habitaciones VALUES (117, 4, 'Desc hab 117', 750, 17, 117);
INSERT INTO public.habitaciones VALUES (118, 3, 'Desc hab 118', 1150, 18, 118);
INSERT INTO public.habitaciones VALUES (119, 4, 'Desc hab 119', 800, 19, 119);
INSERT INTO public.habitaciones VALUES (120, 3, 'Desc hab 120', 1100, 20, 120);
INSERT INTO public.habitaciones VALUES (121, 2, 'Desc hab 121', 1200, 21, 121);
INSERT INTO public.habitaciones VALUES (122, 1, 'Desc hab 122', 900, 22, 122);
INSERT INTO public.habitaciones VALUES (123, 1, 'Desc hab 123', 550, 23, 123);
INSERT INTO public.habitaciones VALUES (124, 4, 'Desc hab 124', 500, 24, 124);
INSERT INTO public.habitaciones VALUES (125, 1, 'Desc hab 125', 1000, 25, 125);
INSERT INTO public.habitaciones VALUES (126, 1, 'Desc hab 126', 850, 26, 126);
INSERT INTO public.habitaciones VALUES (127, 2, 'Desc hab 127', 1150, 27, 127);
INSERT INTO public.habitaciones VALUES (128, 3, 'Desc hab 128', 1150, 28, 128);
INSERT INTO public.habitaciones VALUES (4, 1, 'desc hab 15014', 330, 201, 3);
INSERT INTO public.habitaciones VALUES (103, 1, 'Desc hab 103', 1200, 4, 103);
INSERT INTO public.habitaciones VALUES (901, 2, 'Doble Petite', 340, 802, 901);
INSERT INTO public.habitaciones VALUES (902, 4, 'Doble ', 190, 804, 902);
INSERT INTO public.habitaciones VALUES (903, 3, 'Estudio', 140, 803, 903);
INSERT INTO public.habitaciones VALUES (904, 1, 'Suite', 100, 801, 904);
INSERT INTO public.habitaciones VALUES (905, 3, 'Suite Doble Deluxe', 470, 803, 905);
INSERT INTO public.habitaciones VALUES (906, 1, 'Suite Junior', 40, 801, 906);
INSERT INTO public.habitaciones VALUES (907, 4, 'Doble ', 410, 804, 907);
INSERT INTO public.habitaciones VALUES (908, 3, 'Suite', 450, 803, 908);
INSERT INTO public.habitaciones VALUES (909, 3, 'Single', 40, 803, 909);
INSERT INTO public.habitaciones VALUES (910, 2, 'Doble', 170, 802, 910);
INSERT INTO public.habitaciones VALUES (911, 3, 'Suite Junior', 460, 803, 911);
INSERT INTO public.habitaciones VALUES (912, 4, 'Doble', 380, 804, 912);
INSERT INTO public.habitaciones VALUES (913, 1, 'Triple Clásica', 440, 801, 913);
INSERT INTO public.habitaciones VALUES (914, 1, 'Single', 370, 801, 914);
INSERT INTO public.habitaciones VALUES (915, 1, 'Doble', 180, 801, 915);
INSERT INTO public.habitaciones VALUES (916, 4, 'Triple', 390, 804, 916);
INSERT INTO public.habitaciones VALUES (917, 1, 'Doble', 20, 801, 917);
INSERT INTO public.habitaciones VALUES (918, 2, 'Apartamento ', 220, 802, 918);
INSERT INTO public.habitaciones VALUES (919, 4, 'Doble', 40, 804, 919);
INSERT INTO public.habitaciones VALUES (920, 1, 'Suite', 80, 801, 920);
INSERT INTO public.habitaciones VALUES (921, 3, 'Apartamento ', 470, 803, 921);
INSERT INTO public.habitaciones VALUES (922, 1, 'Loft', 350, 801, 922);


--
-- Data for Name: huesped_push_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.huesped_push_tokens VALUES (10083, '59406');
INSERT INTO public.huesped_push_tokens VALUES (10083, '59407');
INSERT INTO public.huesped_push_tokens VALUES (10083, 'eaeUrSFLSsWLwbDUMqKWxM:APA91bGiB8BzkK3MenPh_LkRJHtmrABqFWcRhKg_-AYioA26Bn8lg7eJpn1LgLsdJ5t9hqVQxpzcUHheW4xKa5KothHDQLGGN5BxvqfkqY3FE0Tr-MAzcp7Bd9k9ssPOSHdj4nxn6Aom');
INSERT INTO public.huesped_push_tokens VALUES (10083, 'fXi1ntRRSauurOShbFSWT5:APA91bFibXySwlsBNRmrQKl60VQChNpnaJPah67D4k-_EDvX5zjCUTK_9-5dr2QR6Bgj0gwDDrxxdlH8n2XEe8GOV_C4c_BgykSW2CFWRIdvVCKxnMNeHyhBmp8bDgaXiM_-8eCEm6WF');
INSERT INTO public.huesped_push_tokens VALUES (5, 'eaeUrSFLSsWLwbDUMqKWxM:APA91bGiB8BzkK3MenPh_LkRJHtmrABqFWcRhKg_-AYioA26Bn8lg7eJpn1LgLsdJ5t9hqVQxpzcUHheW4xKa5KothHDQLGGN5BxvqfkqY3FE0Tr-MAzcp7Bd9k9ssPOSHdj4nxn6Aom');


--
-- Data for Name: password_reset_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.password_reset_token VALUES (1, '2022-06-15 20:00:43.998', '20daa031-8317-480a-816f-97ec302e35eb', 10015);
INSERT INTO public.password_reset_token VALUES (2, '2022-06-15 20:13:56.624', 'b9bcd684-d0dd-4da5-ae57-6ee8fe21883f', 10015);
INSERT INTO public.password_reset_token VALUES (3, '2022-06-15 20:16:40.47', '4e061f75-86d9-4003-a1ee-e3273e83817e', 10015);


--
-- Data for Name: recuperaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reservas VALUES (352, 3, 'PENDIENTE', '2022-03-08 00:00:00', '2022-03-06 00:00:00', NULL, 351, 116, 10057);
INSERT INTO public.reservas VALUES (358, 9, 'PENDIENTE', '2022-04-19 00:00:00', '2022-04-11 00:00:00', NULL, 351, 102, 10071);
INSERT INTO public.reservas VALUES (364, 15, 'PENDIENTE', '2022-05-31 00:00:00', '2022-05-17 00:00:00', NULL, 351, 101, 10051);
INSERT INTO public.reservas VALUES (366, 2, 'PENDIENTE', '2022-05-08 00:00:00', '2022-05-07 00:00:00', NULL, 351, 117, 10072);
INSERT INTO public.reservas VALUES (370, 6, 'PENDIENTE', '2022-06-05 00:00:00', '2022-05-31 00:00:00', NULL, 351, 118, 10078);
INSERT INTO public.reservas VALUES (372, 8, 'PENDIENTE', '2022-06-19 00:00:00', '2022-06-12 00:00:00', NULL, 351, 111, 10099);
INSERT INTO public.reservas VALUES (378, 14, 'PENDIENTE', '2022-07-31 00:00:00', '2022-07-18 00:00:00', NULL, 351, 120, 10061);
INSERT INTO public.reservas VALUES (382, 3, 'PENDIENTE', '2022-07-18 00:00:00', '2022-07-16 00:00:00', NULL, 351, 114, 10080);
INSERT INTO public.reservas VALUES (384, 3, 'PENDIENTE', '2022-07-28 00:00:00', '2022-07-26 00:00:00', NULL, 351, 109, 10076);
INSERT INTO public.reservas VALUES (374, 10, 'RECHAZADO', '2022-07-03 00:00:00', '2022-06-24 00:00:00', NULL, 351, 125, 10085);
INSERT INTO public.reservas VALUES (368, 4, 'EJECUTADA', '2022-05-22 00:00:00', '2022-05-19 00:00:00', NULL, 351, 119, 10067);
INSERT INTO public.reservas VALUES (354, 5, 'EJECUTADA', '2022-03-22 00:00:00', '2022-03-18 00:00:00', NULL, 351, 122, 10053);
INSERT INTO public.reservas VALUES (376, 12, 'EJECUTADA', '2022-07-17 00:00:00', '2022-07-06 00:00:00', NULL, 351, 125, 10094);
INSERT INTO public.reservas VALUES (362, 13, 'EJECUTADA', '2022-05-17 00:00:00', '2022-05-05 00:00:00', NULL, 351, 128, 10051);
INSERT INTO public.reservas VALUES (367, 3, 'EJECUTADA', '2022-05-15 00:00:00', '2022-05-13 00:00:00', NULL, 367, 120, 10095);
INSERT INTO public.reservas VALUES (351, 2, 'APROBADO', '2022-03-01 00:00:00', '2022-02-28 00:00:00', NULL, 351, 128, 10072);
INSERT INTO public.reservas VALUES (357, 8, 'APROBADO', '2022-04-12 00:00:00', '2022-04-05 00:00:00', NULL, 357, 104, 10064);
INSERT INTO public.reservas VALUES (359, 10, 'APROBADO', '2022-04-26 00:00:00', '2022-04-17 00:00:00', NULL, 359, 126, 10088);
INSERT INTO public.reservas VALUES (361, 12, 'APROBADO', '2022-05-10 00:00:00', '2022-04-29 00:00:00', NULL, 361, 103, 10055);
INSERT INTO public.reservas VALUES (363, 14, 'APROBADO', '2022-05-24 00:00:00', '2022-05-11 00:00:00', NULL, 363, 121, 10070);
INSERT INTO public.reservas VALUES (365, 1, 'APROBADO', '2022-05-01 00:00:00', '2022-05-01 00:00:00', NULL, 365, 122, 10079);
INSERT INTO public.reservas VALUES (381, 3, 'APROBADO', '2022-07-13 00:00:00', '2022-07-11 00:00:00', NULL, 381, 109, 10079);
INSERT INTO public.reservas VALUES (383, 3, 'APROBADO', '2022-07-23 00:00:00', '2022-07-21 00:00:00', NULL, 383, 113, 10074);
INSERT INTO public.reservas VALUES (31, 0, 'PENDIENTE', '2022-06-28 00:00:00', '2022-06-26 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (360, 11, 'EJECUTADA', '2022-05-03 00:00:00', '2022-04-23 00:00:00', NULL, 351, 108, 10053);
INSERT INTO public.reservas VALUES (32, 0, 'PENDIENTE', '2022-06-30 00:00:00', '2022-06-26 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (373, 9, 'EJECUTADA', '2022-06-26 00:00:00', '2022-06-18 00:00:00', NULL, 2, 124, 10091);
INSERT INTO public.reservas VALUES (33, 0, 'PENDIENTE', '2022-06-30 00:00:00', '2022-06-28 00:00:00', NULL, NULL, 102, 10083);
INSERT INTO public.reservas VALUES (34, 0, 'PENDIENTE', '2022-06-29 00:00:00', '2022-06-27 00:00:00', NULL, NULL, 113, 10083);
INSERT INTO public.reservas VALUES (35, 1, 'PENDIENTE', '2022-06-29 00:00:00', '2022-06-28 00:00:00', NULL, NULL, 116, 10083);
INSERT INTO public.reservas VALUES (356, 7, 'EJECUTADA', '2022-04-05 00:00:00', '2022-03-30 00:00:00', NULL, 351, 108, 10053);
INSERT INTO public.reservas VALUES (369, 5, 'EJECUTADA', '2022-05-29 00:00:00', '2022-05-25 00:00:00', NULL, 369, 111, 10053);
INSERT INTO public.reservas VALUES (379, 3, 'EJECUTADA', '2022-07-03 00:00:00', '2022-07-01 00:00:00', NULL, 379, 124, 10053);
INSERT INTO public.reservas VALUES (377, 13, 'EJECUTADA', '2022-07-24 00:00:00', '2022-07-12 00:00:00', NULL, 377, 106, 10053);
INSERT INTO public.reservas VALUES (371, 7, 'EJECUTADA', '2022-06-12 00:00:00', '2022-06-06 00:00:00', NULL, 371, 107, 10053);
INSERT INTO public.reservas VALUES (353, 4, 'EJECUTADA', '2022-03-15 00:00:00', '2022-03-12 00:00:00', NULL, 353, 126, 10053);
INSERT INTO public.reservas VALUES (355, 6, 'EJECUTADA', '2022-03-29 00:00:00', '2022-03-24 00:00:00', NULL, 355, 103, 10053);
INSERT INTO public.reservas VALUES (375, 11, 'EJECUTADA', '2022-07-10 00:00:00', '2022-06-30 00:00:00', NULL, 375, 117, 10053);
INSERT INTO public.reservas VALUES (380, 3, 'APROBADO', '2022-07-08 00:00:00', '2022-07-06 00:00:00', NULL, 351, 121, 10053);
INSERT INTO public.reservas VALUES (2, 3, 'PENDIENTE', '0010-09-12 00:00:00', '0008-09-11 00:00:00', NULL, NULL, 102, 10053);
INSERT INTO public.reservas VALUES (3, 5, 'PENDIENTE', '0011-04-14 00:00:00', '0007-04-14 00:00:00', NULL, NULL, 110, 10053);
INSERT INTO public.reservas VALUES (4, 5, 'PENDIENTE', '2022-10-05 00:00:00', '2022-10-01 00:00:00', NULL, NULL, 110, 10053);
INSERT INTO public.reservas VALUES (5, 5, 'PENDIENTE', '2022-10-05 00:00:00', '2022-10-01 00:00:00', NULL, NULL, 111, 10053);
INSERT INTO public.reservas VALUES (6, 5, 'PENDIENTE', '2022-10-05 00:00:00', '2022-10-01 00:00:00', NULL, NULL, 111, 10053);
INSERT INTO public.reservas VALUES (7, 0, 'PENDIENTE', '2022-06-21 00:00:00', '2022-06-20 00:00:00', NULL, NULL, 113, 10083);
INSERT INTO public.reservas VALUES (8, 0, 'PENDIENTE', '2022-06-24 00:00:00', '2022-06-19 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (9, 0, 'PENDIENTE', '2022-06-23 00:00:00', '2022-06-20 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (10, 0, 'PENDIENTE', '2022-06-23 00:00:00', '2022-06-20 00:00:00', NULL, NULL, 104, 10083);
INSERT INTO public.reservas VALUES (11, 0, 'PENDIENTE', '2022-06-23 00:00:00', '2022-06-20 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (12, 3, 'PENDIENTE', '2022-06-23 00:00:00', '2022-06-20 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (13, 1, 'PENDIENTE', '2022-06-24 00:00:00', '2022-06-23 00:00:00', NULL, NULL, 118, 10083);
INSERT INTO public.reservas VALUES (14, 0, 'PENDIENTE', '2022-06-23 00:00:00', '2022-06-13 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (15, 0, 'PENDIENTE', '2022-06-25 00:00:00', '2022-06-23 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (16, 0, 'PENDIENTE', '2022-06-25 00:00:00', '2022-06-23 00:00:00', NULL, NULL, 113, 10083);
INSERT INTO public.reservas VALUES (17, 0, 'PENDIENTE', '2022-06-28 00:00:00', '2022-06-23 00:00:00', NULL, NULL, 113, 10083);
INSERT INTO public.reservas VALUES (18, 0, 'PENDIENTE', '2022-06-29 00:00:00', '2022-06-23 00:00:00', NULL, NULL, 113, 10083);
INSERT INTO public.reservas VALUES (19, 0, 'PENDIENTE', '2022-06-27 00:00:00', '2022-06-24 00:00:00', NULL, NULL, 104, 10083);
INSERT INTO public.reservas VALUES (20, 0, 'PENDIENTE', '2022-06-30 00:00:00', '2022-06-28 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (21, 0, 'PENDIENTE', '2022-06-29 00:00:00', '2022-06-27 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (22, 0, 'PENDIENTE', '2022-06-28 00:00:00', '2022-06-26 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (23, 0, 'PENDIENTE', '2022-06-30 00:00:00', '2022-06-27 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (24, 0, 'PENDIENTE', '2022-07-07 00:00:00', '2022-06-30 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (25, 0, 'PENDIENTE', '2022-06-29 00:00:00', '2022-06-27 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (26, 0, 'PENDIENTE', '2022-06-29 00:00:00', '2022-06-27 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (27, 0, 'PENDIENTE', '2022-06-30 00:00:00', '2022-06-26 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (28, 0, 'PENDIENTE', '2022-06-30 00:00:00', '2022-06-27 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (29, 0, 'PENDIENTE', '2022-06-28 00:00:00', '2022-06-26 00:00:00', NULL, NULL, 101, 10083);
INSERT INTO public.reservas VALUES (30, 0, 'PENDIENTE', '2022-06-29 00:00:00', '2022-06-27 00:00:00', NULL, NULL, 101, 10083);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios VALUES ('Hu', 10097, true, 'apeHu 10097', true, 'emailHu 10097', 'nomHu 10097', 'huPass 10097', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10072, true, 'apeHu 10072', false, 'emailHu 10072', 'nomHu 10072', 'huPass 10072', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10074, true, 'apeHu 10074', false, 'emailHu 10074', 'nomHu 10074', 'huPass 10074', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10022, true, 'apeAn 10022', false, 'emailAn 10022', 'nomAn 10022', 'anPass 10022', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10038, true, 'apeAn 10038', true, 'emailAn 10038', 'nomAn 10038', 'anPass 10038', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10032, true, 'apeAn 10032', false, 'emailAn 10032', 'nomAn 10032', 'anPass 10032', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10041, true, 'apeAn 10041', false, 'emailAn 10041', 'nomAn 10041', 'anPass 10041', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10035, true, 'apeAn 10035', true, 'emailAn 10035', 'nomAn 10035', 'anPass 10035', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10029, true, 'apeAn 10029', false, 'emailAn 10029', 'nomAn 10029', 'anPass 10029', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10046, true, 'apeAn 10046', false, 'emailAn 10046', 'nomAn 10046', 'anPass 10046', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10040, true, 'apeAn 10040', false, 'emailAn 10040', 'nomAn 10040', 'anPass 10040', 2, 'PENDIENTE', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10043, false, 'apeAn 10043', false, 'emailAn 10043', 'nomAn 10043', 'anPass 10043', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10049, true, 'apeAn 10049', false, 'emailAn 10049', 'nomAn 10049', 'anPass 10049', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10044, true, 'apeAn 10044', false, 'emailAn 10044', 'nomAn 10044', 'anPass 10044', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10047, true, 'apeAn 10047', false, 'emailAn 10047', 'nomAn 10047', 'anPass 10047', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10025, true, 'apeAn 10025', false, 'emailAn 10025', 'nomAn 10025', 'anPass 10025', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10034, true, 'apeAn 10034', false, 'emailAn 10034', 'nomAn 10034', 'anPass 10034', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1001, true, 'apeAd 1001', false, 'emailAd 1001', 'nomAd 1001', 'adPass 1001', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1002, true, 'apeAd 1002', false, 'emailAd 1002', 'nomAd 1002', 'adPass 1002', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1003, true, 'apeAd 1003', false, 'emailAd 1003', 'nomAd 1003', 'adPass 1003', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1004, true, 'apeAd 1004', false, 'emailAd 1004', 'nomAd 1004', 'adPass 1004', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1005, false, 'apeAd 1005', false, 'emailAd 1005', 'nomAd 1005', 'adPass 1005', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1006, true, 'apeAd 1006', false, 'emailAd 1006', 'nomAd 1006', 'adPass 1006', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1007, true, 'apeAd 1007', true, 'emailAd 1007', 'nomAd 1007', 'adPass 1007', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1008, true, 'apeAd 1008', false, 'emailAd 1008', 'nomAd 1008', 'adPass 1008', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 2, false, 'a', false, 'a', 'a', 'a', 0, NULL, NULL, '2022-06-26 17:40:15.518403');
INSERT INTO public.usuarios VALUES ('Hu', 5, false, 'asdf', false, 'asdfasdf', 'asdf', 'YXNkZg==
', 0, NULL, NULL, '2022-06-28 23:09:12.715401');
INSERT INTO public.usuarios VALUES ('Hu', 10054, true, 'apeHu 10054', false, 'emailHu 10054', 'nomHu 10054', 'huPass 10054', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10055, true, 'apeHu 10055', false, 'emailHu 10055', 'nomHu 10055', 'huPass 10055', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10057, true, 'apeHu 10057', false, 'emailHu 10057', 'nomHu 10057', 'huPass 10057', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10060, true, 'apeHu 10060', true, 'emailHu 10060', 'nomHu 10060', 'huPass 10060', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10061, true, 'apeHu 10061', false, 'emailHu 10061', 'nomHu 10061', 'huPass 10061', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10063, true, 'apeHu 10063', false, 'emailHu 10063', 'nomHu 10063', 'huPass 10063', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10064, true, 'apeHu 10064', false, 'emailHu 10064', 'nomHu 10064', 'huPass 10064', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10067, false, 'apeHu 10067', false, 'emailHu 10067', 'nomHu 10067', 'huPass 10067', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10070, true, 'apeHu 10070', false, 'emailHu 10070', 'nomHu 10070', 'huPass 10070', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10071, true, 'apeHu 10071', false, 'emailHu 10071', 'nomHu 10071', 'huPass 10071', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10026, true, 'apeAn 10026', false, 'emailAn 10026', 'nomAn 10026', 'anPass 10026', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10028, true, 'apeAn 10028', false, 'emailAn 10028', 'nomAn 10028', 'anPass 10028', 5, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10073, false, 'apeHu 10073', false, 'emailHu 10073', 'nomHu 10073', 'huPass 10073', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 3, false, 'apellido', false, 'mail', 'Nombre', '123', 0, NULL, NULL, '2022-06-26 18:21:27.62422');
INSERT INTO public.usuarios VALUES ('Hu', 4, false, 'ja', false, 'ma', 'js', 'ja', 0, NULL, NULL, '2022-06-26 18:27:13.013321');
INSERT INTO public.usuarios VALUES ('Ad', 10015, true, 'apeAd 10015', false, 'freddyamr@gmail.com', 'nomAd 10015', '1234567aa', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10051, true, 'apeHu 10051', false, 'emailHu 10051', 'nomHu 10051', 'huPass 10051', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1009, true, 'apeAd 1009', false, 'emailAd 1009', 'nomAd 1009', 'adPass 1009', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10010, true, 'apeAd 10010', false, 'emailAd 10010', 'nomAd 10010', 'adPass 10010', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10011, true, 'apeAd 10011', false, 'emailAd 10011', 'nomAd 10011', 'adPass 10011', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10012, true, 'apeAd 10012', false, 'emailAd 10012', 'nomAd 10012', 'adPass 10012', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10013, false, 'apeAd 10013', false, 'emailAd 10013', 'nomAd 10013', 'adPass 10013', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10014, true, 'apeAd 10014', false, 'emailAd 10014', 'nomAd 10014', 'adPass 10014', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10016, true, 'apeAd 10016', false, 'emailAd 10016', 'nomAd 10016', 'adPass 10016', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10017, true, 'apeAd 10017', false, 'emailAd 10017', 'nomAd 10017', 'adPass 10017', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10018, true, 'apeAd 10018', false, 'emailAd 10018', 'nomAd 10018', 'adPass 10018', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10019, true, 'apeAd 10019', false, 'emailAd 10019', 'nomAd 10019', 'adPass 10019', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10020, true, 'apeAd 10020', false, 'emailAd 10020', 'nomAd 10020', 'adPass 10020', NULL, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10037, true, 'apeAn 10037', false, 'emailAn 10037', 'nomAn 10037', 'anPass 10037', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10023, false, 'apeAn 10023', false, 'emailAn 10023', 'nomAn 10023', 'anPass 10023', 2, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 15001, true, 'Thompson', false, 'e.thompson@randatmail.com', 'Eddy', '15001', NULL, NULL, NULL, '2021-10-14 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 15002, true, 'Lloyd', false, 'm.lloyd@randatmail.com', 'Melanie', '15002', NULL, NULL, NULL, '2021-02-18 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 15003, true, 'Johnston', false, 'j.johnston@randatmail.com', 'Jared', '15003', NULL, NULL, NULL, '2020-09-01 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 15004, false, 'Clark', false, 'k.clark@randatmail.com', 'Kimberly', '15004', NULL, NULL, NULL, '2021-06-17 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 15005, true, 'Perkins', false, 'a.perkins@randatmail.com', 'Adam', '15005', NULL, NULL, NULL, '2021-12-21 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 15006, true, 'Morrison', false, 'a.morrison@randatmail.com', 'Abraham', '15006', NULL, NULL, NULL, '2020-03-15 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10076, true, 'apeHu 10076', false, 'emailHu 10076', 'nomHu 10076', 'huPass 10076', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10078, true, 'apeHu 10078', false, 'emailHu 10078', 'nomHu 10078', 'huPass 10078', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10079, true, 'apeHu 10079', false, 'emailHu 10079', 'nomHu 10079', 'huPass 10079', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10080, true, 'apeHu 10080', false, 'emailHu 10080', 'nomHu 10080', 'huPass 10080', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10085, true, 'apeHu 10085', false, 'emailHu 10085', 'nomHu 10085', 'huPass 10085', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10088, true, 'apeHu 10088', false, 'emailHu 10088', 'nomHu 10088', 'huPass 10088', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10089, true, 'apeHu 10089', false, 'emailHu 10089', 'nomHu 10089', 'huPass 10089', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10094, true, 'apeHu 10094', false, 'emailHu 10094', 'nomHu 10094', 'huPass 10094', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10095, true, 'apeHu 10095', false, 'emailHu 10095', 'nomHu 10095', 'huPass 10095', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10099, true, 'apeHu 10099', false, 'emailHu 10099', 'nomHu 10099', 'huPass 10099', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10091, true, 'apeHu 10091', false, 'emailHu 10091', 'nomHu 10091', 'huPass 10091', 5, 'RECHAZADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10066, true, 'apeHu 10066', false, 'emailHu 10066', 'nomHu 10066', 'huPass 10066', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10053, true, 'apeHu 10053', false, 'emailHu 10053', 'nomHu 10053', 'huPass 10053', 3, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10068, true, 'apeHu 10068', false, 'emailHu 10068', 'nomHu 10068', 'huPass 10068', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10069, true, 'apeHu 10069', false, 'emailHu 10069', 'nomHu 10069', 'huPass 10069', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10075, true, 'apeHu 10075', false, 'emailHu 10075', 'nomHu 10075', 'huPass 10075', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10077, true, 'apeHu 10077', false, 'emailHu 10077', 'nomHu 10077', 'huPass 10077', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10081, true, 'apeHu 10081', false, 'emailHu 10081', 'nomHu 10081', 'huPass 10081', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10082, true, 'apeHu 10082', false, 'emailHu 10082', 'nomHu 10082', 'huPass 10082', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10084, true, 'apeHu 10084', true, 'emailHu 10084', 'nomHu 10084', 'huPass 10084', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10086, true, 'apeHu 10086', false, 'emailHu 10086', 'nomHu 10086', 'huPass 10086', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10087, true, 'apeHu 10087', false, 'emailHu 10087', 'nomHu 10087', 'huPass 10087', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10090, true, 'apeHu 10090', false, 'emailHu 10090', 'nomHu 10090', 'huPass 10090', 0, 'RECHAZADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10092, false, 'apeHu 10092', false, 'emailHu 10092', 'nomHu 10092', 'huPass 10092', 0, 'RECHAZADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10093, true, 'apeHu 10093', false, 'emailHu 10093', 'nomHu 10093', 'huPass 10093', 0, 'RECHAZADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10096, true, 'apeHu 10096', false, 'emailHu 10096', 'nomHu 10096', 'huPass 10096', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10098, true, 'apeHu 10098', false, 'emailHu 10098', 'nomHu 10098', 'huPass 10098', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100100, true, 'apeHu 100100', false, 'emailHu 100100', 'nomHu 100100', 'huPass 100100', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100101, true, 'apeHu 100101', false, 'emailHu 100101', 'nomHu 100101', 'huPass 100101', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15185, true, 'Davis', false, 'a.davis@randatmail.com', 'Alina', '15185', 0, 'APROBADO', NULL, '2021-07-04 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15186, true, 'Richardson', false, 's.richardson@randatmail.com', 'Stella', '15186', 0, 'PENDIENTE', NULL, '2022-03-16 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15187, true, 'Grant', false, 'j.grant@randatmail.com', 'Julian', '15187', 0, 'APROBADO', NULL, '2021-03-24 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15188, true, 'Mason', false, 'a.mason@randatmail.com', 'Amanda', '15188', 0, 'APROBADO', NULL, '2020-06-25 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15189, true, 'Stewart', false, 'm.stewart@randatmail.com', 'Melissa', '15189', 0, 'APROBADO', NULL, '2021-07-04 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15190, true, 'Scott', false, 'a.scott@randatmail.com', 'Alexander', '15190', 0, 'RECHAZADO', NULL, '2020-08-15 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15191, false, 'Smith', false, 'm.smith@randatmail.com', 'Miley', '15191', 0, 'APROBADO', NULL, '2021-08-07 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15192, true, 'Armstrong', true, 'd.armstrong@randatmail.com', 'Daryl', '15192', 0, 'APROBADO', NULL, '2020-08-15 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15193, true, 'Andrews', false, 'a.andrews@randatmail.com', 'Andrew', '15193', 0, 'APROBADO', NULL, '2022-04-02 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15194, true, 'Kelly', false, 'a.kelly@randatmail.com', 'Arianna', '15194', 0, 'APROBADO', NULL, '2022-02-10 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15195, true, 'Kelley', false, 'c.kelley@randatmail.com', 'Carlos', '15195', 0, 'APROBADO', NULL, '2021-10-31 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15196, true, 'Barrett', false, 'e.barrett@randatmail.com', 'Edward', '15196', 0, 'APROBADO', NULL, '2022-04-02 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10083, true, 'apeHu 10083', false, 'asdf', 'nomHu 10083', 'YXNkZg==
', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15197, true, 'Ferguson', false, 'e.ferguson@randatmail.com', 'Ellia', '15197', 0, 'APROBADO', NULL, '2020-05-05 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15198, true, 'Craig', false, 'm.craig@randatmail.com', 'Mary', '15198', 0, 'PENDIENTE', NULL, '2020-12-12 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15199, true, 'Stewart', false, 'v.stewart@randatmail.com', 'Vivian', '15199', 0, 'APROBADO', NULL, '2021-12-21 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15200, true, 'Foster', false, 'g.foster@randatmail.com', 'Garry', '15200', 0, 'APROBADO', NULL, '2022-06-09 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10021, true, 'apeAn 10021', false, 'emailAn 10021', 'nomAn 10021', 'anPass 10021', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10024, true, 'apeAn 10024', false, 'emailAn 10024', 'nomAn 10024', 'anPass 10024', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10027, true, 'apeAn 10027', false, 'emailAn 10027', 'nomAn 10027', 'anPass 10027', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10030, true, 'apeAn 10030', false, 'emailAn 10030', 'nomAn 10030', 'anPass 10030', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10033, false, 'apeAn 10033', false, 'emailAn 10033', 'nomAn 10033', 'anPass 10033', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10036, true, 'apeAn 10036', false, 'emailAn 10036', 'nomAn 10036', 'anPass 10036', 0, 'RECHAZADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10039, true, 'apeAn 10039', false, 'emailAn 10039', 'nomAn 10039', 'anPass 10039', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10042, true, 'apeAn 10042', false, 'emailAn 10042', 'nomAn 10042', 'anPass 10042', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10045, true, 'apeAn 10045', false, 'emailAn 10045', 'nomAn 10045', 'anPass 10045', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10048, true, 'apeAn 10048', false, 'emailAn 10048', 'nomAn 10048', 'anPass 10048', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10050, true, 'apeAn 10050', false, 'emailAn 10050', 'nomAn 10050', 'anPass 10050', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10052, true, 'apeHu 10052', false, 'emailHu 10052', 'nomHu 10052', 'huPass 10052', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100140, true, 'apeHu 100140', false, 'emailHu 100140', 'nomHu 100140', 'huPass 100140', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 1, true, 'string', false, 'string', 'string', 'string', 0, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10056, true, 'apeHu 10056', false, 'emailHu 10056', 'nomHu 10056', 'huPass 10056', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10058, true, 'apeHu 10058', false, 'emailHu 10058', 'nomHu 10058', 'huPass 10058', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10059, true, 'apeHu 10059', false, 'emailHu 10059', 'nomHu 10059', 'huPass 10059', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10062, true, 'apeHu 10062', false, 'emailHu 10062', 'nomHu 10062', 'huPass 10062', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10065, true, 'apeHu 10065', false, 'emailHu 10065', 'nomHu 10065', 'huPass 10065', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100102, true, 'apeHu 100102', false, 'emailHu 100102', 'nomHu 100102', 'huPass 100102', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100103, true, 'apeHu 100103', false, 'emailHu 100103', 'nomHu 100103', 'huPass 100103', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100104, true, 'apeHu 100104', false, 'emailHu 100104', 'nomHu 100104', 'huPass 100104', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100105, true, 'apeHu 100105', false, 'emailHu 100105', 'nomHu 100105', 'huPass 100105', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100106, true, 'apeHu 100106', false, 'emailHu 100106', 'nomHu 100106', 'huPass 100106', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100107, true, 'apeHu 100107', false, 'emailHu 100107', 'nomHu 100107', 'huPass 100107', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100108, true, 'apeHu 100108', false, 'emailHu 100108', 'nomHu 100108', 'huPass 100108', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100109, true, 'apeHu 100109', false, 'emailHu 100109', 'nomHu 100109', 'huPass 100109', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100111, true, 'apeHu 100111', false, 'emailHu 100111', 'nomHu 100111', 'huPass 100111', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100112, true, 'apeHu 100112', false, 'emailHu 100112', 'nomHu 100112', 'huPass 100112', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100113, true, 'apeHu 100113', false, 'emailHu 100113', 'nomHu 100113', 'huPass 100113', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100114, true, 'apeHu 100114', false, 'emailHu 100114', 'nomHu 100114', 'huPass 100114', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100116, true, 'apeHu 100116', false, 'emailHu 100116', 'nomHu 100116', 'huPass 100116', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100117, true, 'apeHu 100117', false, 'emailHu 100117', 'nomHu 100117', 'huPass 100117', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100118, true, 'apeHu 100118', false, 'emailHu 100118', 'nomHu 100118', 'huPass 100118', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100119, true, 'apeHu 100119', false, 'emailHu 100119', 'nomHu 100119', 'huPass 100119', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100120, true, 'apeHu 100120', false, 'emailHu 100120', 'nomHu 100120', 'huPass 100120', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100121, true, 'apeHu 100121', false, 'emailHu 100121', 'nomHu 100121', 'huPass 100121', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100122, true, 'apeHu 100122', false, 'emailHu 100122', 'nomHu 100122', 'huPass 100122', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100123, true, 'apeHu 100123', false, 'emailHu 100123', 'nomHu 100123', 'huPass 100123', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100124, true, 'apeHu 100124', true, 'emailHu 100124', 'nomHu 100124', 'huPass 100124', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100125, true, 'apeHu 100125', false, 'emailHu 100125', 'nomHu 100125', 'huPass 100125', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100126, true, 'apeHu 100126', false, 'emailHu 100126', 'nomHu 100126', 'huPass 100126', 0, 'PENDIENTE', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100127, true, 'apeHu 100127', false, 'emailHu 100127', 'nomHu 100127', 'huPass 100127', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100128, true, 'apeHu 100128', false, 'emailHu 100128', 'nomHu 100128', 'huPass 100128', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100129, true, 'apeHu 100129', false, 'emailHu 100129', 'nomHu 100129', 'huPass 100129', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100130, true, 'apeHu 100130', false, 'emailHu 100130', 'nomHu 100130', 'huPass 100130', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100131, true, 'apeHu 100131', false, 'emailHu 100131', 'nomHu 100131', 'huPass 100131', 0, 'PENDIENTE', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100132, true, 'apeHu 100132', false, 'emailHu 100132', 'nomHu 100132', 'huPass 100132', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100133, true, 'apeHu 100133', false, 'emailHu 100133', 'nomHu 100133', 'huPass 100133', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100134, true, 'apeHu 100134', false, 'emailHu 100134', 'nomHu 100134', 'huPass 100134', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100135, true, 'apeHu 100135', false, 'emailHu 100135', 'nomHu 100135', 'huPass 100135', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100136, true, 'apeHu 100136', false, 'emailHu 100136', 'nomHu 100136', 'huPass 100136', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100137, true, 'apeHu 100137', false, 'emailHu 100137', 'nomHu 100137', 'huPass 100137', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100138, true, 'apeHu 100138', false, 'emailHu 100138', 'nomHu 100138', 'huPass 100138', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100139, true, 'apeHu 100139', false, 'emailHu 100139', 'nomHu 100139', 'huPass 100139', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100115, true, 'apeHu 100115', true, 'emailHu 100115', 'nomHu 100115', 'huPass 100115', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100141, true, 'apeHu 100141', false, 'emailHu 100141', 'nomHu 100141', 'huPass 100141', 0, 'PENDIENTE', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100142, true, 'apeHu 100142', false, 'emailHu 100142', 'nomHu 100142', 'huPass 100142', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100143, true, 'apeHu 100143', false, 'emailHu 100143', 'nomHu 100143', 'huPass 100143', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100144, true, 'apeHu 100144', false, 'emailHu 100144', 'nomHu 100144', 'huPass 100144', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100145, true, 'apeHu 100145', false, 'emailHu 100145', 'nomHu 100145', 'huPass 100145', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100146, true, 'apeHu 100146', false, 'emailHu 100146', 'nomHu 100146', 'huPass 100146', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100147, true, 'apeHu 100147', false, 'emailHu 100147', 'nomHu 100147', 'huPass 100147', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100148, true, 'apeHu 100148', false, 'emailHu 100148', 'nomHu 100148', 'huPass 100148', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100149, true, 'apeHu 100149', false, 'emailHu 100149', 'nomHu 100149', 'huPass 100149', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100150, true, 'apeHu 100150', false, 'emailHu 100150', 'nomHu 100150', 'huPass 100150', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100110, true, 'apeHu 100110', false, 'emailHu 100110', 'nomHu 100110', 'huPass 100110', 0, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10031, true, 'apeAn 10031', false, 'emailAn 10031', 'nomAn 10031', 'anPass 10031', 0, 'RECHAZADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15007, true, 'Parker', false, 'm.parker@randatmail.com', 'Mike', '15007', 0, 'APROBADO', NULL, '2021-07-04 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15008, true, 'Stevens', false, 'm.stevens@randatmail.com', 'Max', '15008', 0, 'RECHAZADO', NULL, '2020-11-25 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15009, true, 'Martin', false, 'e.martin@randatmail.com', 'Elise', '15009', 0, 'APROBADO', NULL, '2021-03-24 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15010, true, 'Miller', false, 'd.miller@randatmail.com', 'Deanna', '15010', 0, 'APROBADO', NULL, '2021-03-07 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15011, true, 'Holmes', false, 'a.holmes@randatmail.com', 'Ada', '15011', 0, 'APROBADO', NULL, '2020-09-18 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15012, true, 'Armstrong', true, 'c.armstrong@randatmail.com', 'Charlotte', '15012', 0, 'APROBADO', NULL, '2020-04-18 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15013, true, 'Kelly', false, 'k.kelly@randatmail.com', 'Kate', '15013', 0, 'APROBADO', NULL, '2021-12-04 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15014, true, 'Ferguson', false, 'a.ferguson@randatmail.com', 'Aldus', '15014', 0, 'APROBADO', NULL, '2020-05-05 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15015, false, 'Allen', false, 'c.allen@randatmail.com', 'Cherry', '15015', 0, 'APROBADO', NULL, '2020-06-08 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15016, true, 'Evans', false, 'e.evans@randatmail.com', 'Edwin', '15016', 0, 'APROBADO', NULL, '2022-02-27 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15017, true, 'Moore', false, 'p.moore@randatmail.com', 'Penelope', '15017', 0, 'APROBADO', NULL, '2020-06-25 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15018, true, 'Douglas', false, 'a.douglas@randatmail.com', 'Aiden', '15018', 0, 'PENDIENTE', NULL, '2021-03-24 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15019, true, 'Crawford', false, 'c.crawford@randatmail.com', 'Chester', '15019', 0, 'APROBADO', NULL, '2020-09-18 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15020, true, 'Bailey', false, 'a.bailey@randatmail.com', 'Aida', '15020', 0, 'APROBADO', NULL, '2021-08-07 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15021, true, 'Warren', false, 'd.warren@randatmail.com', 'Dominik', '15021', 0, 'RECHAZADO', NULL, '2020-08-15 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15022, true, 'Sullivan', false, 't.sullivan@randatmail.com', 'Tiana', '15022', 0, 'APROBADO', NULL, '2021-01-15 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15023, true, 'Parker', false, 'k.parker@randatmail.com', 'Kelvin', '15023', 0, 'APROBADO', NULL, '2022-02-27 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15024, true, 'Kelly', true, 'a.kelly@randatmail.com', 'Alford', '15024', 0, 'APROBADO', NULL, '2021-06-17 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15025, true, 'Barnes', false, 'l.barnes@randatmail.com', 'Lucia', '15025', 0, 'APROBADO', NULL, '2021-03-07 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15026, false, 'Brown', false, 'j.brown@randatmail.com', 'Julia', '15026', 0, 'APROBADO', NULL, '2020-05-05 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15027, true, 'Barnes', false, 'v.barnes@randatmail.com', 'Vivian', '15027', 0, 'APROBADO', NULL, '2021-09-27 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15028, true, 'Russell', false, 's.russell@randatmail.com', 'Sienna', '15028', 0, 'APROBADO', NULL, '2020-07-29 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15029, true, 'Kelley', false, 'l.kelley@randatmail.com', 'Lucas', '15029', 0, 'APROBADO', NULL, '2020-08-15 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15030, true, 'Baker', false, 'j.baker@randatmail.com', 'Jack', '15030', 0, 'PENDIENTE', NULL, '2022-04-19 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15031, true, 'Williams', false, 'n.williams@randatmail.com', 'Nicholas', '15031', 0, 'APROBADO', NULL, '2022-06-09 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15032, true, 'Anderson', false, 'd.anderson@randatmail.com', 'David', '15032', 0, 'APROBADO', NULL, '2020-06-25 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15033, true, 'Mitchell', false, 'b.mitchell@randatmail.com', 'Belinda', '15033', 0, 'APROBADO', NULL, '2021-10-31 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15034, true, 'Miller', false, 'a.miller@randatmail.com', 'Alan', '15034', 0, 'RECHAZADO', NULL, '2020-10-22 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15035, true, 'Elliott', false, 'e.elliott@randatmail.com', 'Ellia', '15035', 0, 'APROBADO', NULL, '2021-04-10 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15036, true, 'Evans', true, 't.evans@randatmail.com', 'Tony', '15036', 0, 'APROBADO', NULL, '2021-12-04 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15037, false, 'Wilson', false, 's.wilson@randatmail.com', 'Sarah', '15037', 0, 'APROBADO', NULL, '2022-02-10 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15038, true, 'Hill', false, 'm.hill@randatmail.com', 'Mary', '15038', 0, 'APROBADO', NULL, '2022-01-24 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15039, true, 'Murray', false, 'a.murray@randatmail.com', 'Abraham', '15039', 0, 'APROBADO', NULL, '2021-09-27 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 15040, true, 'Wright', false, 'a.wright@randatmail.com', 'Alisa', '15040', 0, 'APROBADO', NULL, '2021-05-31 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15041, true, 'Payne', false, 'c.payne@randatmail.com', 'Chelsea', '15041', 0, 'APROBADO', NULL, '2020-05-22 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15042, true, 'Brown', false, 'm.brown@randatmail.com', 'Maria', '15042', 0, 'PENDIENTE', NULL, '2020-10-05 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15043, true, 'Barrett', false, 'c.barrett@randatmail.com', 'Chloe', '15043', 0, 'APROBADO', NULL, '2022-03-16 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15044, true, 'Owens', false, 'd.owens@randatmail.com', 'Dale', '15044', 0, 'APROBADO', NULL, '2021-05-31 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15045, true, 'Baker', false, 'v.baker@randatmail.com', 'Vanessa', '15045', 0, 'APROBADO', NULL, '2020-03-15 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15046, true, 'Sullivan', false, 'a.sullivan@randatmail.com', 'Alen', '15046', 0, 'APROBADO', NULL, '2021-10-14 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15047, true, 'Adams', false, 'e.adams@randatmail.com', 'Emma', '15047', 0, 'RECHAZADO', NULL, '2021-06-17 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15048, false, 'Craig', true, 'l.craig@randatmail.com', 'Lydia', '15048', 0, 'APROBADO', NULL, '2021-05-31 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15049, true, 'Hill', false, 'a.hill@randatmail.com', 'Antony', '15049', 0, 'APROBADO', NULL, '2020-08-15 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15050, true, 'Parker', false, 'j.parker@randatmail.com', 'Jared', '15050', 0, 'APROBADO', NULL, '2020-07-29 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15051, true, 'Henderson', false, 'a.henderson@randatmail.com', 'Amelia', '15051', 0, 'APROBADO', NULL, '2020-05-05 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15052, true, 'Scott', false, 'c.scott@randatmail.com', 'Carlos', '15052', 0, 'APROBADO', NULL, '2022-02-27 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15053, true, 'Scott', false, 'h.scott@randatmail.com', 'Heather', '15053', 0, 'APROBADO', NULL, '2020-12-29 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15054, true, 'Owens', false, 'o.owens@randatmail.com', 'Olivia', '15054', 0, 'PENDIENTE', NULL, '2020-06-08 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15055, true, 'Brooks', false, 'a.brooks@randatmail.com', 'Abigail', '15055', 0, 'APROBADO', NULL, '2022-02-27 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15056, true, 'Campbell', false, 'm.campbell@randatmail.com', 'Michelle', '15056', 0, 'APROBADO', NULL, '2020-12-12 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15057, true, 'Andrews', false, 'c.andrews@randatmail.com', 'Charlie', '15057', 0, 'APROBADO', NULL, '2022-04-19 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15058, true, 'Howard', false, 'm.howard@randatmail.com', 'Marcus', '15058', 0, 'APROBADO', NULL, '2020-08-15 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15059, false, 'Campbell', false, 'v.campbell@randatmail.com', 'Victor', '15059', 0, 'APROBADO', NULL, '2020-10-22 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15060, true, 'Fowler', true, 'd.fowler@randatmail.com', 'Daisy', '15060', 0, 'RECHAZADO', NULL, '2021-02-18 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15061, true, 'Edwards', false, 'r.edwards@randatmail.com', 'Rosie', '15061', 0, 'APROBADO', NULL, '2022-04-19 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15062, true, 'Fowler', false, 'j.fowler@randatmail.com', 'Jacob', '15062', 0, 'APROBADO', NULL, '2020-08-15 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15063, true, 'Payne', false, 'f.payne@randatmail.com', 'Fenton', '15063', 0, 'APROBADO', NULL, '2021-04-10 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15064, true, 'Spencer', false, 'j.spencer@randatmail.com', 'John', '15064', 0, 'APROBADO', NULL, '2021-05-14 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15065, true, 'Watson', false, 'e.watson@randatmail.com', 'Edgar', '15065', 0, 'APROBADO', NULL, '2022-02-10 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15066, true, 'Baker', false, 'm.baker@randatmail.com', 'Melanie', '15066', 0, 'PENDIENTE', NULL, '2021-10-31 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15067, true, 'Andrews', false, 'e.andrews@randatmail.com', 'Ellia', '15067', 0, 'APROBADO', NULL, '2022-03-16 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15068, true, 'Morgan', false, 'j.morgan@randatmail.com', 'Jared', '15068', 0, 'APROBADO', NULL, '2021-08-07 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15069, true, 'Nelson', false, 'a.nelson@randatmail.com', 'Adelaide', '15069', 0, 'APROBADO', NULL, '2021-08-07 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15070, false, 'Farrell', false, 's.farrell@randatmail.com', 'Sabrina', '15070', 0, 'APROBADO', NULL, '2020-11-25 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15071, true, 'Williams', false, 's.williams@randatmail.com', 'Sofia', '15071', 0, 'APROBADO', NULL, '2021-02-01 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15072, true, 'Jones', true, 'a.jones@randatmail.com', 'Aston', '15072', 0, 'APROBADO', NULL, '2021-05-14 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15073, true, 'Wright', false, 'v.wright@randatmail.com', 'Victoria', '15073', 0, 'RECHAZADO', NULL, '2020-11-08 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15074, true, 'Moore', false, 'j.moore@randatmail.com', 'Jack', '15074', 0, 'APROBADO', NULL, '2021-04-27 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15075, true, 'Morgan', false, 'a.morgan@randatmail.com', 'Amy', '15075', 0, 'APROBADO', NULL, '2022-06-09 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15076, true, 'West', false, 't.west@randatmail.com', 'Ted', '15076', 0, 'APROBADO', NULL, '2020-11-08 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15077, true, 'Stevens', false, 'e.stevens@randatmail.com', 'Ellia', '15077', 0, 'APROBADO', NULL, '2020-04-01 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15078, true, 'Lloyd', false, 'j.lloyd@randatmail.com', 'Jessica', '15078', 0, 'PENDIENTE', NULL, '2020-09-18 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15079, true, 'West', false, 'l.west@randatmail.com', 'Lucas', '15079', 0, 'APROBADO', NULL, '2021-09-27 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15080, true, 'Robinson', false, 'b.robinson@randatmail.com', 'Belinda', '15080', 0, 'APROBADO', NULL, '2021-05-14 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15081, false, 'Harris', false, 'n.harris@randatmail.com', 'Naomi', '15081', 0, 'APROBADO', NULL, '2020-07-12 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15082, true, 'Kelly', false, 'a.kelly@randatmail.com', 'Agata', '15082', 0, 'APROBADO', NULL, '2020-03-15 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15083, true, 'Ellis', false, 'r.ellis@randatmail.com', 'Rafael', '15083', 0, 'APROBADO', NULL, '2020-09-18 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15084, true, 'Moore', true, 'm.moore@randatmail.com', 'Melissa', '15084', 0, 'APROBADO', NULL, '2022-06-09 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15085, true, 'Chapman', false, 'e.chapman@randatmail.com', 'Edith', '15085', 0, 'APROBADO', NULL, '2021-06-17 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15086, true, 'Gray', false, 'a.gray@randatmail.com', 'Abraham', '15086', 0, 'RECHAZADO', NULL, '2021-06-17 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15087, true, 'Stevens', false, 'v.stevens@randatmail.com', 'Valeria', '15087', 0, 'APROBADO', NULL, '2021-09-10 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15088, true, 'Wright', false, 'v.wright@randatmail.com', 'Violet', '15088', 0, 'APROBADO', NULL, '2020-11-08 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15089, true, 'Payne', false, 'b.payne@randatmail.com', 'Briony', '15089', 0, 'APROBADO', NULL, '2020-11-25 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15090, true, 'Baker', false, 'o.baker@randatmail.com', 'Oliver', '15090', 0, 'PENDIENTE', NULL, '2020-12-29 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15091, true, 'Smith', false, 'l.smith@randatmail.com', 'Lenny', '15091', 0, 'APROBADO', NULL, '2020-05-22 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15092, false, 'Craig', false, 'b.craig@randatmail.com', 'Brianna', '15092', 0, 'APROBADO', NULL, '2022-02-10 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15093, true, 'Warren', false, 'a.warren@randatmail.com', 'Aston', '15093', 0, 'APROBADO', NULL, '2022-04-19 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15094, true, 'Wells', false, 'k.wells@randatmail.com', 'Kellan', '15094', 0, 'APROBADO', NULL, '2020-07-12 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15095, true, 'Russell', false, 'l.russell@randatmail.com', 'Leonardo', '15095', 0, 'APROBADO', NULL, '2020-07-12 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15096, true, 'Morgan', true, 's.morgan@randatmail.com', 'Sophia', '15096', 0, 'APROBADO', NULL, '2020-10-05 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15097, true, 'Montgomery', false, 'n.montgomery@randatmail.com', 'Naomi', '15097', 0, 'APROBADO', NULL, '2021-03-24 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15098, true, 'Martin', false, 'e.martin@randatmail.com', 'Emily', '15098', 0, 'APROBADO', NULL, '2020-12-29 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15099, true, 'Baker', false, 'a.baker@randatmail.com', 'Ada', '15099', 0, 'RECHAZADO', NULL, '2021-08-24 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15100, true, 'Russell', false, 'm.russell@randatmail.com', 'Madaline', '15100', 0, 'APROBADO', NULL, '2021-08-24 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15101, true, 'Cunningham', false, 'b.cunningham@randatmail.com', 'Brooke', '15101', 0, 'APROBADO', NULL, '2022-01-07 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15102, true, 'Morris', false, 'r.morris@randatmail.com', 'Rebecca', '15102', 0, 'PENDIENTE', NULL, '2022-01-07 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15103, false, 'Hamilton', false, 'a.hamilton@randatmail.com', 'Arianna', '15103', 0, 'APROBADO', NULL, '2022-05-06 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15104, true, 'Farrell', false, 'a.farrell@randatmail.com', 'Alberta', '15104', 0, 'APROBADO', NULL, '2020-04-01 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15105, true, 'Thomas', false, 'p.thomas@randatmail.com', 'Preston', '15105', 0, 'APROBADO', NULL, '2021-03-24 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15106, true, 'Barnes', false, 'c.barnes@randatmail.com', 'Carlos', '15106', 0, 'APROBADO', NULL, '2020-10-05 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15107, true, 'Walker', false, 'd.walker@randatmail.com', 'Derek', '15107', 0, 'APROBADO', NULL, '2021-10-14 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15108, true, 'Lloyd', true, 'c.lloyd@randatmail.com', 'Carina', '15108', 0, 'APROBADO', NULL, '2021-08-24 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15109, true, 'Brown', false, 't.brown@randatmail.com', 'Ted', '15109', 0, 'APROBADO', NULL, '2020-12-12 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15110, true, 'Brooks', false, 'm.brooks@randatmail.com', 'Miller', '15110', 0, 'APROBADO', NULL, '2021-02-18 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15111, true, 'Wilson', false, 'a.wilson@randatmail.com', 'Adelaide', '15111', 0, 'APROBADO', NULL, '2022-05-06 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15112, true, 'Farrell', false, 'a.farrell@randatmail.com', 'Ashton', '15112', 0, 'RECHAZADO', NULL, '2020-10-05 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15113, true, 'Alexander', false, 'i.alexander@randatmail.com', 'Isabella', '15113', 0, 'APROBADO', NULL, '2021-06-17 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15114, false, 'Lloyd', false, 'm.lloyd@randatmail.com', 'Max', '15114', 0, 'PENDIENTE', NULL, '2021-09-10 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15115, true, 'Clark', false, 'b.clark@randatmail.com', 'Brad', '15115', 0, 'APROBADO', NULL, '2022-04-02 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15116, true, 'Phillips', false, 'v.phillips@randatmail.com', 'Victoria', '15116', 0, 'APROBADO', NULL, '2021-08-07 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15117, true, 'Andrews', false, 'p.andrews@randatmail.com', 'Paige', '15117', 0, 'APROBADO', NULL, '2021-09-10 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15118, true, 'Nelson', false, 'r.nelson@randatmail.com', 'Reid', '15118', 0, 'APROBADO', NULL, '2020-05-05 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15119, true, 'Cameron', false, 'g.cameron@randatmail.com', 'Gianna', '15119', 0, 'APROBADO', NULL, '2022-02-10 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15120, true, 'Harris', true, 'j.harris@randatmail.com', 'Jack', '15120', 0, 'APROBADO', NULL, '2020-05-05 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15121, true, 'Mitchell', false, 'k.mitchell@randatmail.com', 'Kelvin', '15121', 0, 'APROBADO', NULL, '2021-06-17 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15122, true, 'Craig', false, 'm.craig@randatmail.com', 'Maximilian', '15122', 0, 'APROBADO', NULL, '2020-04-18 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15123, true, 'Johnson', false, 's.johnson@randatmail.com', 'Sofia', '15123', 0, 'APROBADO', NULL, '2021-05-14 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15124, true, 'Russell', false, 'v.russell@randatmail.com', 'Vivian', '15124', 0, 'APROBADO', NULL, '2021-07-04 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15125, false, 'Johnson', false, 'd.johnson@randatmail.com', 'Dominik', '15125', 0, 'RECHAZADO', NULL, '2021-11-17 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15126, true, 'Hunt', false, 't.hunt@randatmail.com', 'Tara', '15126', 0, 'PENDIENTE', NULL, '2021-04-27 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15127, true, 'Ellis', false, 'e.ellis@randatmail.com', 'Emily', '15127', 0, 'APROBADO', NULL, '2020-11-08 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15128, true, 'Riley', false, 'k.riley@randatmail.com', 'Kellan', '15128', 0, 'APROBADO', NULL, '2020-05-05 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15129, true, 'Howard', false, 'l.howard@randatmail.com', 'Leonardo', '15129', 0, 'APROBADO', NULL, '2020-12-12 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15130, true, 'Tucker', false, 'v.tucker@randatmail.com', 'Vivian', '15130', 0, 'APROBADO', NULL, '2022-04-02 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15131, true, 'Jones', false, 'h.jones@randatmail.com', 'Henry', '15131', 0, 'APROBADO', NULL, '2020-08-15 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15132, true, 'Holmes', true, 't.holmes@randatmail.com', 'Ted', '15132', 0, 'APROBADO', NULL, '2020-10-22 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15133, true, 'Ferguson', false, 'b.ferguson@randatmail.com', 'Blake', '15133', 0, 'APROBADO', NULL, '2021-04-27 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15134, true, 'Barnes', false, 't.barnes@randatmail.com', 'Tiana', '15134', 0, 'APROBADO', NULL, '2020-07-29 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15135, true, 'Chapman', false, 'a.chapman@randatmail.com', 'Abigail', '15135', 0, 'APROBADO', NULL, '2020-09-01 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15136, false, 'Clark', false, 'r.clark@randatmail.com', 'Rebecca', '15136', 0, 'APROBADO', NULL, '2020-12-12 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15137, true, 'Perry', false, 'j.perry@randatmail.com', 'James', '15137', 0, 'APROBADO', NULL, '2021-08-24 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15138, true, 'Dixon', false, 'l.dixon@randatmail.com', 'Lily', '15138', 0, 'RECHAZADO', NULL, '2020-09-18 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15139, true, 'Richards', false, 'e.richards@randatmail.com', 'Elise', '15139', 0, 'APROBADO', NULL, '2020-09-18 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15140, true, 'Hunt', false, 'e.hunt@randatmail.com', 'Ellia', '15140', 0, 'APROBADO', NULL, '2021-09-27 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15141, true, 'Wilson', false, 'v.wilson@randatmail.com', 'Valeria', '15141', 0, 'APROBADO', NULL, '2021-07-04 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15142, true, 'Harper', false, 'j.harper@randatmail.com', 'James', '15142', 0, 'APROBADO', NULL, '2021-06-17 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15143, true, 'Owens', false, 's.owens@randatmail.com', 'Sophia', '15143', 0, 'APROBADO', NULL, '2020-09-01 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15144, true, 'Myers', true, 'b.myers@randatmail.com', 'Blake', '15144', 0, 'APROBADO', NULL, '2021-01-15 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15145, true, 'Harper', false, 'l.harper@randatmail.com', 'Lucia', '15145', 0, 'APROBADO', NULL, '2020-03-15 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15146, true, 'Henderson', false, 'o.henderson@randatmail.com', 'Olivia', '15146', 0, 'APROBADO', NULL, '2021-08-24 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15147, false, 'Hamilton', false, 'f.hamilton@randatmail.com', 'Frederick', '15147', 0, 'APROBADO', NULL, '2020-06-08 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15148, true, 'Perry', false, 'a.perry@randatmail.com', 'Amelia', '15148', 0, 'APROBADO', NULL, '2022-06-09 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15149, true, 'Murphy', false, 'l.murphy@randatmail.com', 'Lyndon', '15149', 0, 'APROBADO', NULL, '2021-02-01 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15150, true, 'Foster', false, 'h.foster@randatmail.com', 'Henry', '15150', 0, 'PENDIENTE', NULL, '2021-01-15 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15151, true, 'Mason', false, 'm.mason@randatmail.com', 'Marcus', '15151', 0, 'RECHAZADO', NULL, '2021-04-27 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15152, true, 'Allen', false, 'j.allen@randatmail.com', 'Jasmine', '15152', 0, 'APROBADO', NULL, '2020-05-22 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15153, true, 'Baker', false, 'a.baker@randatmail.com', 'Aldus', '15153', 0, 'APROBADO', NULL, '2022-02-27 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15154, true, 'Adams', false, 'a.adams@randatmail.com', 'Arianna', '15154', 0, 'APROBADO', NULL, '2020-09-01 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15155, true, 'Hill', false, 'a.hill@randatmail.com', 'Adelaide', '15155', 0, 'APROBADO', NULL, '2021-03-24 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15156, true, 'Spencer', true, 't.spencer@randatmail.com', 'Tyler', '15156', 0, 'APROBADO', NULL, '2021-07-04 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15157, true, 'Perry', false, 'l.perry@randatmail.com', 'Lenny', '15157', 0, 'APROBADO', NULL, '2021-01-15 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15158, false, 'Armstrong', false, 'c.armstrong@randatmail.com', 'Chelsea', '15158', 0, 'APROBADO', NULL, '2022-06-09 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15159, true, 'Hamilton', false, 'l.hamilton@randatmail.com', 'Lucas', '15159', 0, 'APROBADO', NULL, '2021-09-27 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15160, true, 'Foster', false, 'a.foster@randatmail.com', 'Alford', '15160', 0, 'APROBADO', NULL, '2022-05-06 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15161, true, 'Nelson', false, 't.nelson@randatmail.com', 'Tiana', '15161', 0, 'APROBADO', NULL, '2021-10-31 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15162, true, 'Holmes', false, 'r.holmes@randatmail.com', 'Roland', '15162', 0, 'PENDIENTE', NULL, '2022-03-16 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15163, true, 'Henderson', false, 'a.henderson@randatmail.com', 'Arianna', '15163', 0, 'APROBADO', NULL, '2022-03-16 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15164, true, 'Martin', false, 'k.martin@randatmail.com', 'Kelsey', '15164', 0, 'RECHAZADO', NULL, '2020-04-01 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15165, true, 'Hill', false, 't.hill@randatmail.com', 'Tony', '15165', 0, 'APROBADO', NULL, '2020-10-22 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15166, true, 'Carter', false, 'a.carter@randatmail.com', 'Alexia', '15166', 0, 'APROBADO', NULL, '2022-01-24 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15167, true, 'Richardson', false, 'a.richardson@randatmail.com', 'Agata', '15167', 0, 'APROBADO', NULL, '2021-04-27 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15168, true, 'Edwards', true, 'e.edwards@randatmail.com', 'Emma', '15168', 0, 'APROBADO', NULL, '2022-05-23 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15169, false, 'Cooper', false, 'm.cooper@randatmail.com', 'Melanie', '15169', 0, 'APROBADO', NULL, '2020-10-05 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15170, true, 'Cooper', false, 'a.cooper@randatmail.com', 'Adrianna', '15170', 0, 'APROBADO', NULL, '2022-02-10 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15171, true, 'Taylor', false, 'e.taylor@randatmail.com', 'Edith', '15171', 0, 'APROBADO', NULL, '2021-05-31 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15172, true, 'Cooper', false, 'a.cooper@randatmail.com', 'Alexander', '15172', 0, 'APROBADO', NULL, '2022-04-19 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15173, true, 'Alexander', false, 'a.alexander@randatmail.com', 'Alissa', '15173', 0, 'APROBADO', NULL, '2020-04-18 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15174, true, 'Ryan', false, 'a.ryan@randatmail.com', 'Aston', '15174', 0, 'PENDIENTE', NULL, '2020-04-01 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15175, true, 'Richardson', false, 'b.richardson@randatmail.com', 'Brianna', '15175', 0, 'APROBADO', NULL, '2020-10-05 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15176, true, 'Murphy', false, 'a.murphy@randatmail.com', 'Andrew', '15176', 0, 'APROBADO', NULL, '2020-07-12 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15177, true, 'Kelly', false, 'r.kelly@randatmail.com', 'Rebecca', '15177', 0, 'RECHAZADO', NULL, '2020-04-01 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15178, true, 'Carter', false, 't.carter@randatmail.com', 'Tara', '15178', 0, 'APROBADO', NULL, '2022-01-07 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15179, true, 'Craig', false, 'c.craig@randatmail.com', 'Chelsea', '15179', 0, 'APROBADO', NULL, '2021-11-17 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15180, false, 'Warren', true, 't.warren@randatmail.com', 'Ted', '15180', 0, 'APROBADO', NULL, '2021-05-31 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15181, true, 'Campbell', false, 'a.campbell@randatmail.com', 'Andrew', '15181', 0, 'APROBADO', NULL, '2022-02-10 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15182, true, 'Martin', false, 'm.martin@randatmail.com', 'Maya', '15182', 0, 'APROBADO', NULL, '2022-01-07 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15183, true, 'Thomas', false, 'v.thomas@randatmail.com', 'Victor', '15183', 0, 'APROBADO', NULL, '2021-04-27 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15184, true, 'Higgins', false, 't.higgins@randatmail.com', 'Thomas', '15184', 0, 'APROBADO', NULL, '2020-09-18 00:00:00');


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

