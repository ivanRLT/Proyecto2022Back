
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

ALTER TABLE IF EXISTS ONLY public.huesped_push_tokens DROP CONSTRAINT fkmr4u6cwn25gn8um3emcf519lg;
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

INSERT INTO public.alojamientos VALUES (1, true, 'desc_ 10022_ 1000', 'nombreAloj_ 10022_ 1000', 10022, 1001);
INSERT INTO public.alojamientos VALUES (2, true, 'desc_ 10023_ 1000', 'nombreAloj_ 10023_ 1000', 10023, 1002);
INSERT INTO public.alojamientos VALUES (3, true, 'desc_ 10023_ 1001', 'nombreAloj_ 10023_ 1001', 10023, 1003);
INSERT INTO public.alojamientos VALUES (4, true, 'desc_ 10025_ 1000', 'nombreAloj_ 10025_ 1000', 10025, 1004);
INSERT INTO public.alojamientos VALUES (5, true, 'desc_ 10026_ 1000', 'nombreAloj_ 10026_ 1000', 10026, 1005);
INSERT INTO public.alojamientos VALUES (6, true, 'desc_ 10026_ 1001', 'nombreAloj_ 10026_ 1001', 10026, 1006);
INSERT INTO public.alojamientos VALUES (7, true, 'desc_ 10028_ 1000', 'nombreAloj_ 10028_ 1000', 10028, 1007);
INSERT INTO public.alojamientos VALUES (8, true, 'desc_ 10029_ 1000', 'nombreAloj_ 10029_ 1000', 10029, 1008);
INSERT INTO public.alojamientos VALUES (9, true, 'desc_ 10029_ 1001', 'nombreAloj_ 10029_ 1001', 10029, 1009);
INSERT INTO public.alojamientos VALUES (11, true, 'desc_ 10032_ 1000', 'nombreAloj_ 10032_ 1000', 10032, 10011);
INSERT INTO public.alojamientos VALUES (12, true, 'desc_ 10032_ 1001', 'nombreAloj_ 10032_ 1001', 10032, 10012);
INSERT INTO public.alojamientos VALUES (13, true, 'desc_ 10034_ 1000', 'nombreAloj_ 10034_ 1000', 10034, 10013);
INSERT INTO public.alojamientos VALUES (14, true, 'desc_ 10035_ 1000', 'nombreAloj_ 10035_ 1000', 10035, 10014);
INSERT INTO public.alojamientos VALUES (15, true, 'desc_ 10035_ 1001', 'nombreAloj_ 10035_ 1001', 10035, 10015);
INSERT INTO public.alojamientos VALUES (16, true, 'desc_ 10037_ 1000', 'nombreAloj_ 10037_ 1000', 10037, 10016);
INSERT INTO public.alojamientos VALUES (17, true, 'desc_ 10038_ 1000', 'nombreAloj_ 10038_ 1000', 10038, 10017);
INSERT INTO public.alojamientos VALUES (18, true, 'desc_ 10038_ 1001', 'nombreAloj_ 10038_ 1001', 10038, 10018);
INSERT INTO public.alojamientos VALUES (19, true, 'desc_ 10040_ 1000', 'nombreAloj_ 10040_ 1000', 10040, 10019);
INSERT INTO public.alojamientos VALUES (20, true, 'desc_ 10041_ 1000', 'nombreAloj_ 10041_ 1000', 10041, 10020);
INSERT INTO public.alojamientos VALUES (21, true, 'desc_ 10041_ 1001', 'nombreAloj_ 10041_ 1001', 10041, 10021);
INSERT INTO public.alojamientos VALUES (22, true, 'desc_ 10043_ 1000', 'nombreAloj_ 10043_ 1000', 10043, 10022);
INSERT INTO public.alojamientos VALUES (23, true, 'desc_ 10044_ 1000', 'nombreAloj_ 10044_ 1000', 10044, 10023);
INSERT INTO public.alojamientos VALUES (24, true, 'desc_ 10044_ 1001', 'nombreAloj_ 10044_ 1001', 10044, 10024);
INSERT INTO public.alojamientos VALUES (25, true, 'desc_ 10046_ 1000', 'nombreAloj_ 10046_ 1000', 10046, 10025);
INSERT INTO public.alojamientos VALUES (26, true, 'desc_ 10047_ 1000', 'nombreAloj_ 10047_ 1000', 10047, 10026);
INSERT INTO public.alojamientos VALUES (27, true, 'desc_ 10047_ 1001', 'nombreAloj_ 10047_ 1001', 10047, 10027);
INSERT INTO public.alojamientos VALUES (28, true, 'desc_ 10049_ 1000', 'nombreAloj_ 10049_ 1000', 10049, 10028);
INSERT INTO public.alojamientos VALUES (10, false, 'desc_ 10031_ 1000', 'nombreAloj_ 10031_ 1000', 10031, 10010);


--
-- Data for Name: calificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.calificaciones VALUES (351, 3, 4, '2022-05-03 00:00:00', 'RESEnA 351');
INSERT INTO public.calificaciones VALUES (353, 4, 2, '2022-05-05 00:00:00', 'RESEÑA 353');
INSERT INTO public.calificaciones VALUES (355, 2, 5, '2022-05-06 00:00:00', 'RESEÑA 355');
INSERT INTO public.calificaciones VALUES (357, 5, 4, '2022-05-07 00:00:00', 'RESEÑA 357');
INSERT INTO public.calificaciones VALUES (359, 4, 2, '2022-05-08 00:00:00', 'RESEÑA 359');
INSERT INTO public.calificaciones VALUES (361, 5, 4, '2022-05-09 00:00:00', 'RESEÑA 361');
INSERT INTO public.calificaciones VALUES (363, 2, 3, '2022-05-10 00:00:00', 'RESEÑA 363');
INSERT INTO public.calificaciones VALUES (365, 5, 5, '2022-05-11 00:00:00', 'RESEÑA 365');
INSERT INTO public.calificaciones VALUES (367, 2, 3, '2022-05-12 00:00:00', 'RESEÑA 367');
INSERT INTO public.calificaciones VALUES (369, 4, 4, '2022-05-13 00:00:00', 'RESEÑA 369');
INSERT INTO public.calificaciones VALUES (371, 1, 5, '2022-05-14 00:00:00', 'RESEÑA 371');
INSERT INTO public.calificaciones VALUES (373, 4, 3, '2022-05-15 00:00:00', 'RESEÑA 373');
INSERT INTO public.calificaciones VALUES (375, 4, 1, '2022-05-16 00:00:00', 'RESEÑA 375');
INSERT INTO public.calificaciones VALUES (377, 5, 1, '2022-05-17 00:00:00', 'RESEÑA 377');
INSERT INTO public.calificaciones VALUES (379, 1, 1, '2022-05-18 00:00:00', 'RESEÑA 379');
INSERT INTO public.calificaciones VALUES (381, 3, 1, '2022-05-19 00:00:00', 'RESEÑA 381');
INSERT INTO public.calificaciones VALUES (383, 4, 5, '2022-05-20 00:00:00', 'RESEÑA 383');


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
INSERT INTO public.dt_direccion VALUES (10011, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10012, 'calle_dir$', 'ciudad 1000', ' 1001', 2);
INSERT INTO public.dt_direccion VALUES (10013, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10014, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10015, 'calle_dir$', 'ciudad 1000', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10016, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10017, 'calle_dir$', 'ciudad 1002', ' 1001', 3);
INSERT INTO public.dt_direccion VALUES (10018, 'calle_dir$', 'ciudad 1000', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10019, 'calle_dir$', 'ciudad 1001', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10020, 'calle_dir$', 'ciudad 1002', ' 1001', 1);
INSERT INTO public.dt_direccion VALUES (10021, 'calle_dir$', 'ciudad 1000', ' 1001', 1);
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
INSERT INTO public.dt_pais VALUES (1183, 'Afganistán');
INSERT INTO public.dt_pais VALUES (1184, 'Albania');
INSERT INTO public.dt_pais VALUES (1185, 'Alemania');
INSERT INTO public.dt_pais VALUES (1186, 'Andorra');
INSERT INTO public.dt_pais VALUES (1187, 'Ango');
INSERT INTO public.dt_pais VALUES (1188, 'Antigua y Barbuda');
INSERT INTO public.dt_pais VALUES (1189, 'Arabia Saudita');
INSERT INTO public.dt_pais VALUES (1190, 'Argia');
INSERT INTO public.dt_pais VALUES (1191, 'Argentina');
INSERT INTO public.dt_pais VALUES (1192, 'Armenia');
INSERT INTO public.dt_pais VALUES (1193, 'Australia');
INSERT INTO public.dt_pais VALUES (1194, 'Austria');
INSERT INTO public.dt_pais VALUES (1195, 'Azerbaiyán');
INSERT INTO public.dt_pais VALUES (1196, 'Bahamas s');
INSERT INTO public.dt_pais VALUES (1197, 'Bahrein');
INSERT INTO public.dt_pais VALUES (1198, 'Bangdesh');
INSERT INTO public.dt_pais VALUES (1199, 'Barbados');
INSERT INTO public.dt_pais VALUES (1200, 'Barús');
INSERT INTO public.dt_pais VALUES (1201, 'Bélgica');
INSERT INTO public.dt_pais VALUES (1202, 'Bice');
INSERT INTO public.dt_pais VALUES (1203, 'Benin');
INSERT INTO public.dt_pais VALUES (1204, 'Bhután');
INSERT INTO public.dt_pais VALUES (1205, 'Bolivia Estado Plurinacional de');
INSERT INTO public.dt_pais VALUES (1206, 'Bosnia y Herzegovina');
INSERT INTO public.dt_pais VALUES (1207, 'Botswana');
INSERT INTO public.dt_pais VALUES (1208, 'Brasil');
INSERT INTO public.dt_pais VALUES (1209, 'Brunei Darussam');
INSERT INTO public.dt_pais VALUES (1210, 'Bulgaria');
INSERT INTO public.dt_pais VALUES (1211, 'Burkina Faso');
INSERT INTO public.dt_pais VALUES (1212, 'Burundi');
INSERT INTO public.dt_pais VALUES (1213, 'Cabo Verde');
INSERT INTO public.dt_pais VALUES (1214, 'Camboya');
INSERT INTO public.dt_pais VALUES (1215, 'Camerún');
INSERT INTO public.dt_pais VALUES (1216, 'Canadá');
INSERT INTO public.dt_pais VALUES (1217, 'Chad');
INSERT INTO public.dt_pais VALUES (1218, 'Chequia');
INSERT INTO public.dt_pais VALUES (1219, 'Chile');
INSERT INTO public.dt_pais VALUES (1220, 'China');
INSERT INTO public.dt_pais VALUES (1221, 'Chipre');
INSERT INTO public.dt_pais VALUES (1222, 'Colombia');
INSERT INTO public.dt_pais VALUES (1223, 'Comoras s');
INSERT INTO public.dt_pais VALUES (1224, 'Congo');
INSERT INTO public.dt_pais VALUES (1225, 'Costa Rica');
INSERT INTO public.dt_pais VALUES (1226, 'Côte d’Ivoire');
INSERT INTO public.dt_pais VALUES (1227, 'Croacia');
INSERT INTO public.dt_pais VALUES (1228, 'Cuba');
INSERT INTO public.dt_pais VALUES (1229, 'Dinamarca');
INSERT INTO public.dt_pais VALUES (1230, 'Djibouti');
INSERT INTO public.dt_pais VALUES (1231, 'Dominica');
INSERT INTO public.dt_pais VALUES (1232, 'Ecuador');
INSERT INTO public.dt_pais VALUES (1233, 'Egipto');
INSERT INTO public.dt_pais VALUES (1234, ' Salvador');
INSERT INTO public.dt_pais VALUES (1235, 'Emiratos Árabes Unidos');
INSERT INTO public.dt_pais VALUES (1236, 'Eritrea');
INSERT INTO public.dt_pais VALUES (1237, 'Eslovaquia');
INSERT INTO public.dt_pais VALUES (1238, 'Eslovenia');
INSERT INTO public.dt_pais VALUES (1239, 'España');
INSERT INTO public.dt_pais VALUES (1240, 'Estados Unidos de América');
INSERT INTO public.dt_pais VALUES (1241, 'Estonia');
INSERT INTO public.dt_pais VALUES (1242, 'Eswatini');
INSERT INTO public.dt_pais VALUES (1243, 'Etiopía');
INSERT INTO public.dt_pais VALUES (1244, 'Federación de Rusia');
INSERT INTO public.dt_pais VALUES (1245, 'Fiji');
INSERT INTO public.dt_pais VALUES (1246, 'Filipinas');
INSERT INTO public.dt_pais VALUES (1247, 'Finndia');
INSERT INTO public.dt_pais VALUES (1248, 'Francia');
INSERT INTO public.dt_pais VALUES (1249, 'Gabón');
INSERT INTO public.dt_pais VALUES (1250, 'Gambia');
INSERT INTO public.dt_pais VALUES (1251, 'Georgia');
INSERT INTO public.dt_pais VALUES (1252, 'Ghana');
INSERT INTO public.dt_pais VALUES (1253, 'Granada');
INSERT INTO public.dt_pais VALUES (1254, 'Grecia');
INSERT INTO public.dt_pais VALUES (1255, 'Guatema');
INSERT INTO public.dt_pais VALUES (1256, 'Guinea');
INSERT INTO public.dt_pais VALUES (1257, 'Guinea Ecuatorial');
INSERT INTO public.dt_pais VALUES (1258, 'Guinea-Bissau');
INSERT INTO public.dt_pais VALUES (1259, 'Guyana');
INSERT INTO public.dt_pais VALUES (1260, 'Haití');
INSERT INTO public.dt_pais VALUES (1261, 'Honduras');
INSERT INTO public.dt_pais VALUES (1262, 'Hungría');
INSERT INTO public.dt_pais VALUES (1263, 'India');
INSERT INTO public.dt_pais VALUES (1264, 'Indonesia');
INSERT INTO public.dt_pais VALUES (1265, 'Irán República Islámica d');
INSERT INTO public.dt_pais VALUES (1266, 'Iraq');
INSERT INTO public.dt_pais VALUES (1267, 'Irnda');
INSERT INTO public.dt_pais VALUES (1268, 'Isndia');
INSERT INTO public.dt_pais VALUES (1269, 'Iss Cook s');
INSERT INTO public.dt_pais VALUES (1270, 'Iss Marshall s');
INSERT INTO public.dt_pais VALUES (1271, 'Iss Salomón s');
INSERT INTO public.dt_pais VALUES (1272, 'Isra');
INSERT INTO public.dt_pais VALUES (1273, 'Italia');
INSERT INTO public.dt_pais VALUES (1274, 'Jamaica');
INSERT INTO public.dt_pais VALUES (1275, 'Japón');
INSERT INTO public.dt_pais VALUES (1276, 'Jordania');
INSERT INTO public.dt_pais VALUES (1277, 'Kazajstán');
INSERT INTO public.dt_pais VALUES (1278, 'Kenya');
INSERT INTO public.dt_pais VALUES (1279, 'Kirguistán');
INSERT INTO public.dt_pais VALUES (1280, 'Kiribati');
INSERT INTO public.dt_pais VALUES (1281, 'Kuwait');
INSERT INTO public.dt_pais VALUES (1282, 'Lesotho');
INSERT INTO public.dt_pais VALUES (1283, 'Letonia');
INSERT INTO public.dt_pais VALUES (1284, 'Líbano');
INSERT INTO public.dt_pais VALUES (1285, 'Liberia');
INSERT INTO public.dt_pais VALUES (1286, 'Libia');
INSERT INTO public.dt_pais VALUES (1287, 'Liechtenstein');
INSERT INTO public.dt_pais VALUES (1288, 'Lituania');
INSERT INTO public.dt_pais VALUES (1289, 'Luxemburgo');
INSERT INTO public.dt_pais VALUES (1290, 'Madagascar');
INSERT INTO public.dt_pais VALUES (1291, 'Masia');
INSERT INTO public.dt_pais VALUES (1292, 'Mawi');
INSERT INTO public.dt_pais VALUES (1293, 'Maldivas');
INSERT INTO public.dt_pais VALUES (1294, 'Malí');
INSERT INTO public.dt_pais VALUES (1295, 'Malta');
INSERT INTO public.dt_pais VALUES (1296, 'Marruecos');
INSERT INTO public.dt_pais VALUES (1297, 'Mauricio');
INSERT INTO public.dt_pais VALUES (1298, 'Mauritania');
INSERT INTO public.dt_pais VALUES (1299, 'México');
INSERT INTO public.dt_pais VALUES (1300, 'Micronesia Estados Federados de');
INSERT INTO public.dt_pais VALUES (1301, 'Mónaco');
INSERT INTO public.dt_pais VALUES (1302, 'Mongolia');
INSERT INTO public.dt_pais VALUES (1303, 'Montenegro');
INSERT INTO public.dt_pais VALUES (1304, 'Mozambique');
INSERT INTO public.dt_pais VALUES (1305, 'Myanmar');
INSERT INTO public.dt_pais VALUES (1306, 'Namibia');
INSERT INTO public.dt_pais VALUES (1307, 'Nauru');
INSERT INTO public.dt_pais VALUES (1308, 'Nepal');
INSERT INTO public.dt_pais VALUES (1309, 'Nicaragua');
INSERT INTO public.dt_pais VALUES (1310, 'Níger');
INSERT INTO public.dt_pais VALUES (1311, 'Nigeria');
INSERT INTO public.dt_pais VALUES (1312, 'Niue');
INSERT INTO public.dt_pais VALUES (1313, 'Noruega');
INSERT INTO public.dt_pais VALUES (1314, 'Nueva Zandia');
INSERT INTO public.dt_pais VALUES (1315, 'Omán');
INSERT INTO public.dt_pais VALUES (1316, 'Países Bajos');
INSERT INTO public.dt_pais VALUES (1317, 'Pakistán');
INSERT INTO public.dt_pais VALUES (1318, 'Pau');
INSERT INTO public.dt_pais VALUES (1319, 'Panamá');
INSERT INTO public.dt_pais VALUES (1320, 'Papua Nueva Guinea');
INSERT INTO public.dt_pais VALUES (1321, 'Paraguay');
INSERT INTO public.dt_pais VALUES (1322, 'Perú');
INSERT INTO public.dt_pais VALUES (1323, 'Polonia');
INSERT INTO public.dt_pais VALUES (1324, 'Portugal');
INSERT INTO public.dt_pais VALUES (1325, 'Qatar');
INSERT INTO public.dt_pais VALUES (1326, 'Reino Unido de Gran Bretaña e Irnda d Norte');
INSERT INTO public.dt_pais VALUES (1327, 'República Árabe Siria');
INSERT INTO public.dt_pais VALUES (1328, 'República Centroafricana');
INSERT INTO public.dt_pais VALUES (1329, 'República de Corea');
INSERT INTO public.dt_pais VALUES (1330, 'República de Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (1331, 'Nombre corto: Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (1332, 'República de Moldova');
INSERT INTO public.dt_pais VALUES (1333, 'República Democrática d Congo');
INSERT INTO public.dt_pais VALUES (1334, 'República Democrática Popur o');
INSERT INTO public.dt_pais VALUES (1335, 'República Dominicana');
INSERT INTO public.dt_pais VALUES (1336, 'República Popur Democrática de Corea');
INSERT INTO public.dt_pais VALUES (1337, 'República Unida de Tanzanía');
INSERT INTO public.dt_pais VALUES (1338, 'Rumania');
INSERT INTO public.dt_pais VALUES (1339, 'Rwanda');
INSERT INTO public.dt_pais VALUES (1340, 'Saint Kitts y Nevis');
INSERT INTO public.dt_pais VALUES (1341, 'Samoa');
INSERT INTO public.dt_pais VALUES (1342, 'San Marino');
INSERT INTO public.dt_pais VALUES (1343, 'San Vicente y s Granadinas');
INSERT INTO public.dt_pais VALUES (1344, 'Santa Lucía');
INSERT INTO public.dt_pais VALUES (1345, 'Santa Sede');
INSERT INTO public.dt_pais VALUES (1346, 'Santo Tomé y Príncipe');
INSERT INTO public.dt_pais VALUES (1347, 'Senegal');
INSERT INTO public.dt_pais VALUES (1348, 'Serbia');
INSERT INTO public.dt_pais VALUES (1349, 'Seychles');
INSERT INTO public.dt_pais VALUES (1350, 'Sierra Leona');
INSERT INTO public.dt_pais VALUES (1351, 'Singapur');
INSERT INTO public.dt_pais VALUES (1352, 'Somalia');
INSERT INTO public.dt_pais VALUES (1353, 'Sri nka');
INSERT INTO public.dt_pais VALUES (1354, 'Sudáfrica');
INSERT INTO public.dt_pais VALUES (1355, 'Sudán');
INSERT INTO public.dt_pais VALUES (1356, 'Sudán d Sur');
INSERT INTO public.dt_pais VALUES (1357, 'Suecia');
INSERT INTO public.dt_pais VALUES (1358, 'Suiza');
INSERT INTO public.dt_pais VALUES (1359, 'Suriname');
INSERT INTO public.dt_pais VALUES (1360, 'Taindia');
INSERT INTO public.dt_pais VALUES (1361, 'Tayikistán');
INSERT INTO public.dt_pais VALUES (1362, 'Timor-Leste');
INSERT INTO public.dt_pais VALUES (1363, 'Togo');
INSERT INTO public.dt_pais VALUES (1364, 'Tonga');
INSERT INTO public.dt_pais VALUES (1365, 'Trinidad y Tabago');
INSERT INTO public.dt_pais VALUES (1366, 'Túnez');
INSERT INTO public.dt_pais VALUES (1367, 'Turkmenistán');
INSERT INTO public.dt_pais VALUES (1368, 'Turquía');
INSERT INTO public.dt_pais VALUES (1369, 'Tuvalu');
INSERT INTO public.dt_pais VALUES (1370, 'Ucrania');
INSERT INTO public.dt_pais VALUES (1371, 'Uganda');
INSERT INTO public.dt_pais VALUES (1372, 'Uruguay');
INSERT INTO public.dt_pais VALUES (1373, 'Uzbekistán');
INSERT INTO public.dt_pais VALUES (1374, 'Vanuatu');
INSERT INTO public.dt_pais VALUES (1375, 'Venezua República Bolivariana de');
INSERT INTO public.dt_pais VALUES (1376, 'Viet Nam');
INSERT INTO public.dt_pais VALUES (1377, 'Yemen');
INSERT INTO public.dt_pais VALUES (1378, 'Zambia');
INSERT INTO public.dt_pais VALUES (1379, 'Zimbabwe');
INSERT INTO public.dt_pais VALUES (1380, 'Afganistán');
INSERT INTO public.dt_pais VALUES (1381, 'Albania');
INSERT INTO public.dt_pais VALUES (1382, 'Alemania');
INSERT INTO public.dt_pais VALUES (1383, 'Andorra');
INSERT INTO public.dt_pais VALUES (1384, 'Ango');
INSERT INTO public.dt_pais VALUES (1385, 'Antigua y Barbuda');
INSERT INTO public.dt_pais VALUES (1386, 'Arabia Saudita');
INSERT INTO public.dt_pais VALUES (1387, 'Argia');
INSERT INTO public.dt_pais VALUES (1388, 'Argentina');
INSERT INTO public.dt_pais VALUES (1389, 'Armenia');
INSERT INTO public.dt_pais VALUES (1390, 'Australia');
INSERT INTO public.dt_pais VALUES (1391, 'Austria');
INSERT INTO public.dt_pais VALUES (1392, 'Azerbaiyán');
INSERT INTO public.dt_pais VALUES (1393, 'Bahamas s');
INSERT INTO public.dt_pais VALUES (1394, 'Bahrein');
INSERT INTO public.dt_pais VALUES (1395, 'Bangdesh');
INSERT INTO public.dt_pais VALUES (1396, 'Barbados');
INSERT INTO public.dt_pais VALUES (1397, 'Barús');
INSERT INTO public.dt_pais VALUES (1398, 'Bélgica');
INSERT INTO public.dt_pais VALUES (1399, 'Bice');
INSERT INTO public.dt_pais VALUES (1400, 'Benin');
INSERT INTO public.dt_pais VALUES (1401, 'Bhután');
INSERT INTO public.dt_pais VALUES (1402, 'Bolivia Estado Plurinacional de');
INSERT INTO public.dt_pais VALUES (1403, 'Bosnia y Herzegovina');
INSERT INTO public.dt_pais VALUES (1404, 'Botswana');
INSERT INTO public.dt_pais VALUES (1405, 'Brasil');
INSERT INTO public.dt_pais VALUES (1406, 'Brunei Darussam');
INSERT INTO public.dt_pais VALUES (1407, 'Bulgaria');
INSERT INTO public.dt_pais VALUES (1408, 'Burkina Faso');
INSERT INTO public.dt_pais VALUES (1409, 'Burundi');
INSERT INTO public.dt_pais VALUES (1410, 'Cabo Verde');
INSERT INTO public.dt_pais VALUES (1411, 'Camboya');
INSERT INTO public.dt_pais VALUES (1412, 'Camerún');
INSERT INTO public.dt_pais VALUES (1413, 'Canadá');
INSERT INTO public.dt_pais VALUES (1414, 'Chad');
INSERT INTO public.dt_pais VALUES (1415, 'Chequia');
INSERT INTO public.dt_pais VALUES (1416, 'Chile');
INSERT INTO public.dt_pais VALUES (1417, 'China');
INSERT INTO public.dt_pais VALUES (1418, 'Chipre');
INSERT INTO public.dt_pais VALUES (1419, 'Colombia');
INSERT INTO public.dt_pais VALUES (1420, 'Comoras s');
INSERT INTO public.dt_pais VALUES (1421, 'Congo');
INSERT INTO public.dt_pais VALUES (1422, 'Costa Rica');
INSERT INTO public.dt_pais VALUES (1423, 'Côte d’Ivoire');
INSERT INTO public.dt_pais VALUES (1424, 'Croacia');
INSERT INTO public.dt_pais VALUES (1425, 'Cuba');
INSERT INTO public.dt_pais VALUES (1426, 'Dinamarca');
INSERT INTO public.dt_pais VALUES (1427, 'Djibouti');
INSERT INTO public.dt_pais VALUES (1428, 'Dominica');
INSERT INTO public.dt_pais VALUES (1429, 'Ecuador');
INSERT INTO public.dt_pais VALUES (1430, 'Egipto');
INSERT INTO public.dt_pais VALUES (1431, ' Salvador');
INSERT INTO public.dt_pais VALUES (1432, 'Emiratos Árabes Unidos');
INSERT INTO public.dt_pais VALUES (1433, 'Eritrea');
INSERT INTO public.dt_pais VALUES (1434, 'Eslovaquia');
INSERT INTO public.dt_pais VALUES (1435, 'Eslovenia');
INSERT INTO public.dt_pais VALUES (1436, 'España');
INSERT INTO public.dt_pais VALUES (1437, 'Estados Unidos de América');
INSERT INTO public.dt_pais VALUES (1438, 'Estonia');
INSERT INTO public.dt_pais VALUES (1439, 'Eswatini');
INSERT INTO public.dt_pais VALUES (1440, 'Etiopía');
INSERT INTO public.dt_pais VALUES (1441, 'Federación de Rusia');
INSERT INTO public.dt_pais VALUES (1442, 'Fiji');
INSERT INTO public.dt_pais VALUES (1443, 'Filipinas');
INSERT INTO public.dt_pais VALUES (1444, 'Finndia');
INSERT INTO public.dt_pais VALUES (1445, 'Francia');
INSERT INTO public.dt_pais VALUES (1446, 'Gabón');
INSERT INTO public.dt_pais VALUES (1447, 'Gambia');
INSERT INTO public.dt_pais VALUES (1448, 'Georgia');
INSERT INTO public.dt_pais VALUES (1449, 'Ghana');
INSERT INTO public.dt_pais VALUES (1450, 'Granada');
INSERT INTO public.dt_pais VALUES (1451, 'Grecia');
INSERT INTO public.dt_pais VALUES (1452, 'Guatema');
INSERT INTO public.dt_pais VALUES (1453, 'Guinea');
INSERT INTO public.dt_pais VALUES (1454, 'Guinea Ecuatorial');
INSERT INTO public.dt_pais VALUES (1455, 'Guinea-Bissau');
INSERT INTO public.dt_pais VALUES (1456, 'Guyana');
INSERT INTO public.dt_pais VALUES (1457, 'Haití');
INSERT INTO public.dt_pais VALUES (1458, 'Honduras');
INSERT INTO public.dt_pais VALUES (1459, 'Hungría');
INSERT INTO public.dt_pais VALUES (1460, 'India');
INSERT INTO public.dt_pais VALUES (1461, 'Indonesia');
INSERT INTO public.dt_pais VALUES (1462, 'Irán República Islámica d');
INSERT INTO public.dt_pais VALUES (1463, 'Iraq');
INSERT INTO public.dt_pais VALUES (1464, 'Irnda');
INSERT INTO public.dt_pais VALUES (1465, 'Isndia');
INSERT INTO public.dt_pais VALUES (1466, 'Iss Cook s');
INSERT INTO public.dt_pais VALUES (1467, 'Iss Marshall s');
INSERT INTO public.dt_pais VALUES (1468, 'Iss Salomón s');
INSERT INTO public.dt_pais VALUES (1469, 'Isra');
INSERT INTO public.dt_pais VALUES (1470, 'Italia');
INSERT INTO public.dt_pais VALUES (1471, 'Jamaica');
INSERT INTO public.dt_pais VALUES (1472, 'Japón');
INSERT INTO public.dt_pais VALUES (1473, 'Jordania');
INSERT INTO public.dt_pais VALUES (1474, 'Kazajstán');
INSERT INTO public.dt_pais VALUES (1475, 'Kenya');
INSERT INTO public.dt_pais VALUES (1476, 'Kirguistán');
INSERT INTO public.dt_pais VALUES (1477, 'Kiribati');
INSERT INTO public.dt_pais VALUES (1478, 'Kuwait');
INSERT INTO public.dt_pais VALUES (1479, 'Lesotho');
INSERT INTO public.dt_pais VALUES (1480, 'Letonia');
INSERT INTO public.dt_pais VALUES (1481, 'Líbano');
INSERT INTO public.dt_pais VALUES (1482, 'Liberia');
INSERT INTO public.dt_pais VALUES (1483, 'Libia');
INSERT INTO public.dt_pais VALUES (1484, 'Liechtenstein');
INSERT INTO public.dt_pais VALUES (1485, 'Lituania');
INSERT INTO public.dt_pais VALUES (1486, 'Luxemburgo');
INSERT INTO public.dt_pais VALUES (1487, 'Madagascar');
INSERT INTO public.dt_pais VALUES (1488, 'Masia');
INSERT INTO public.dt_pais VALUES (1489, 'Mawi');
INSERT INTO public.dt_pais VALUES (1490, 'Maldivas');
INSERT INTO public.dt_pais VALUES (1491, 'Malí');
INSERT INTO public.dt_pais VALUES (1492, 'Malta');
INSERT INTO public.dt_pais VALUES (1493, 'Marruecos');
INSERT INTO public.dt_pais VALUES (1494, 'Mauricio');
INSERT INTO public.dt_pais VALUES (1495, 'Mauritania');
INSERT INTO public.dt_pais VALUES (1496, 'México');
INSERT INTO public.dt_pais VALUES (1497, 'Micronesia Estados Federados de');
INSERT INTO public.dt_pais VALUES (1498, 'Mónaco');
INSERT INTO public.dt_pais VALUES (1499, 'Mongolia');
INSERT INTO public.dt_pais VALUES (1500, 'Montenegro');
INSERT INTO public.dt_pais VALUES (1501, 'Mozambique');
INSERT INTO public.dt_pais VALUES (1502, 'Myanmar');
INSERT INTO public.dt_pais VALUES (1503, 'Namibia');
INSERT INTO public.dt_pais VALUES (1504, 'Nauru');
INSERT INTO public.dt_pais VALUES (1505, 'Nepal');
INSERT INTO public.dt_pais VALUES (1506, 'Nicaragua');
INSERT INTO public.dt_pais VALUES (1507, 'Níger');
INSERT INTO public.dt_pais VALUES (1508, 'Nigeria');
INSERT INTO public.dt_pais VALUES (1509, 'Niue');
INSERT INTO public.dt_pais VALUES (1510, 'Noruega');
INSERT INTO public.dt_pais VALUES (1511, 'Nueva Zandia');
INSERT INTO public.dt_pais VALUES (1512, 'Omán');
INSERT INTO public.dt_pais VALUES (1513, 'Países Bajos');
INSERT INTO public.dt_pais VALUES (1514, 'Pakistán');
INSERT INTO public.dt_pais VALUES (1515, 'Pau');
INSERT INTO public.dt_pais VALUES (1516, 'Panamá');
INSERT INTO public.dt_pais VALUES (1517, 'Papua Nueva Guinea');
INSERT INTO public.dt_pais VALUES (1518, 'Paraguay');
INSERT INTO public.dt_pais VALUES (1519, 'Perú');
INSERT INTO public.dt_pais VALUES (1520, 'Polonia');
INSERT INTO public.dt_pais VALUES (1521, 'Portugal');
INSERT INTO public.dt_pais VALUES (1522, 'Qatar');
INSERT INTO public.dt_pais VALUES (1523, 'Reino Unido de Gran Bretaña e Irnda d Norte');
INSERT INTO public.dt_pais VALUES (1524, 'República Árabe Siria');
INSERT INTO public.dt_pais VALUES (1525, 'República Centroafricana');
INSERT INTO public.dt_pais VALUES (1526, 'República de Corea');
INSERT INTO public.dt_pais VALUES (1527, 'República de Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (1528, 'Nombre corto: Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (1529, 'República de Moldova');
INSERT INTO public.dt_pais VALUES (1530, 'República Democrática d Congo');
INSERT INTO public.dt_pais VALUES (1531, 'República Democrática Popur o');
INSERT INTO public.dt_pais VALUES (1532, 'República Dominicana');
INSERT INTO public.dt_pais VALUES (1533, 'República Popur Democrática de Corea');
INSERT INTO public.dt_pais VALUES (1534, 'República Unida de Tanzanía');
INSERT INTO public.dt_pais VALUES (1535, 'Rumania');
INSERT INTO public.dt_pais VALUES (1536, 'Rwanda');
INSERT INTO public.dt_pais VALUES (1537, 'Saint Kitts y Nevis');
INSERT INTO public.dt_pais VALUES (1538, 'Samoa');
INSERT INTO public.dt_pais VALUES (1539, 'San Marino');
INSERT INTO public.dt_pais VALUES (1540, 'San Vicente y s Granadinas');
INSERT INTO public.dt_pais VALUES (1541, 'Santa Lucía');
INSERT INTO public.dt_pais VALUES (1542, 'Santa Sede');
INSERT INTO public.dt_pais VALUES (1543, 'Santo Tomé y Príncipe');
INSERT INTO public.dt_pais VALUES (1544, 'Senegal');
INSERT INTO public.dt_pais VALUES (1545, 'Serbia');
INSERT INTO public.dt_pais VALUES (1546, 'Seychles');
INSERT INTO public.dt_pais VALUES (1547, 'Sierra Leona');
INSERT INTO public.dt_pais VALUES (1548, 'Singapur');
INSERT INTO public.dt_pais VALUES (1549, 'Somalia');
INSERT INTO public.dt_pais VALUES (1550, 'Sri nka');
INSERT INTO public.dt_pais VALUES (1551, 'Sudáfrica');
INSERT INTO public.dt_pais VALUES (1552, 'Sudán');
INSERT INTO public.dt_pais VALUES (1553, 'Sudán d Sur');
INSERT INTO public.dt_pais VALUES (1554, 'Suecia');
INSERT INTO public.dt_pais VALUES (1555, 'Suiza');
INSERT INTO public.dt_pais VALUES (1556, 'Suriname');
INSERT INTO public.dt_pais VALUES (1557, 'Taindia');
INSERT INTO public.dt_pais VALUES (1558, 'Tayikistán');
INSERT INTO public.dt_pais VALUES (1559, 'Timor-Leste');
INSERT INTO public.dt_pais VALUES (1560, 'Togo');
INSERT INTO public.dt_pais VALUES (1561, 'Tonga');
INSERT INTO public.dt_pais VALUES (1562, 'Trinidad y Tabago');
INSERT INTO public.dt_pais VALUES (1563, 'Túnez');
INSERT INTO public.dt_pais VALUES (1564, 'Turkmenistán');
INSERT INTO public.dt_pais VALUES (1565, 'Turquía');
INSERT INTO public.dt_pais VALUES (1566, 'Tuvalu');
INSERT INTO public.dt_pais VALUES (1567, 'Ucrania');
INSERT INTO public.dt_pais VALUES (1568, 'Uganda');
INSERT INTO public.dt_pais VALUES (1569, 'Uruguay');
INSERT INTO public.dt_pais VALUES (1570, 'Uzbekistán');
INSERT INTO public.dt_pais VALUES (1571, 'Vanuatu');
INSERT INTO public.dt_pais VALUES (1572, 'Venezua República Bolivariana de');
INSERT INTO public.dt_pais VALUES (1573, 'Viet Nam');
INSERT INTO public.dt_pais VALUES (1574, 'Yemen');
INSERT INTO public.dt_pais VALUES (1575, 'Zambia');
INSERT INTO public.dt_pais VALUES (1576, 'Zimbabwe');
INSERT INTO public.dt_pais VALUES (1577, 'Afganistán');
INSERT INTO public.dt_pais VALUES (1578, 'Albania');
INSERT INTO public.dt_pais VALUES (1579, 'Alemania');
INSERT INTO public.dt_pais VALUES (1580, 'Andorra');
INSERT INTO public.dt_pais VALUES (1581, 'Ango');
INSERT INTO public.dt_pais VALUES (1582, 'Antigua y Barbuda');
INSERT INTO public.dt_pais VALUES (1583, 'Arabia Saudita');
INSERT INTO public.dt_pais VALUES (1584, 'Argia');
INSERT INTO public.dt_pais VALUES (1585, 'Argentina');
INSERT INTO public.dt_pais VALUES (1586, 'Armenia');
INSERT INTO public.dt_pais VALUES (1587, 'Australia');
INSERT INTO public.dt_pais VALUES (1588, 'Austria');
INSERT INTO public.dt_pais VALUES (1589, 'Azerbaiyán');
INSERT INTO public.dt_pais VALUES (1590, 'Bahamas s');
INSERT INTO public.dt_pais VALUES (1591, 'Bahrein');
INSERT INTO public.dt_pais VALUES (1592, 'Bangdesh');
INSERT INTO public.dt_pais VALUES (1593, 'Barbados');
INSERT INTO public.dt_pais VALUES (1594, 'Barús');
INSERT INTO public.dt_pais VALUES (1595, 'Bélgica');
INSERT INTO public.dt_pais VALUES (1596, 'Bice');
INSERT INTO public.dt_pais VALUES (1597, 'Benin');
INSERT INTO public.dt_pais VALUES (1598, 'Bhután');
INSERT INTO public.dt_pais VALUES (1599, 'Bolivia Estado Plurinacional de');
INSERT INTO public.dt_pais VALUES (1600, 'Bosnia y Herzegovina');
INSERT INTO public.dt_pais VALUES (1601, 'Botswana');
INSERT INTO public.dt_pais VALUES (1602, 'Brasil');
INSERT INTO public.dt_pais VALUES (1603, 'Brunei Darussam');
INSERT INTO public.dt_pais VALUES (1604, 'Bulgaria');
INSERT INTO public.dt_pais VALUES (1605, 'Burkina Faso');
INSERT INTO public.dt_pais VALUES (1606, 'Burundi');
INSERT INTO public.dt_pais VALUES (1607, 'Cabo Verde');
INSERT INTO public.dt_pais VALUES (1608, 'Camboya');
INSERT INTO public.dt_pais VALUES (1609, 'Camerún');
INSERT INTO public.dt_pais VALUES (1610, 'Canadá');
INSERT INTO public.dt_pais VALUES (1611, 'Chad');
INSERT INTO public.dt_pais VALUES (1612, 'Chequia');
INSERT INTO public.dt_pais VALUES (1613, 'Chile');
INSERT INTO public.dt_pais VALUES (1614, 'China');
INSERT INTO public.dt_pais VALUES (1615, 'Chipre');
INSERT INTO public.dt_pais VALUES (1616, 'Colombia');
INSERT INTO public.dt_pais VALUES (1617, 'Comoras s');
INSERT INTO public.dt_pais VALUES (1618, 'Congo');
INSERT INTO public.dt_pais VALUES (1619, 'Costa Rica');
INSERT INTO public.dt_pais VALUES (1620, 'Côte d’Ivoire');
INSERT INTO public.dt_pais VALUES (1621, 'Croacia');
INSERT INTO public.dt_pais VALUES (1622, 'Cuba');
INSERT INTO public.dt_pais VALUES (1623, 'Dinamarca');
INSERT INTO public.dt_pais VALUES (1624, 'Djibouti');
INSERT INTO public.dt_pais VALUES (1625, 'Dominica');
INSERT INTO public.dt_pais VALUES (1626, 'Ecuador');
INSERT INTO public.dt_pais VALUES (1627, 'Egipto');
INSERT INTO public.dt_pais VALUES (1628, ' Salvador');
INSERT INTO public.dt_pais VALUES (1629, 'Emiratos Árabes Unidos');
INSERT INTO public.dt_pais VALUES (1630, 'Eritrea');
INSERT INTO public.dt_pais VALUES (1631, 'Eslovaquia');
INSERT INTO public.dt_pais VALUES (1632, 'Eslovenia');
INSERT INTO public.dt_pais VALUES (1633, 'España');
INSERT INTO public.dt_pais VALUES (1634, 'Estados Unidos de América');
INSERT INTO public.dt_pais VALUES (1635, 'Estonia');
INSERT INTO public.dt_pais VALUES (1636, 'Eswatini');
INSERT INTO public.dt_pais VALUES (1637, 'Etiopía');
INSERT INTO public.dt_pais VALUES (1638, 'Federación de Rusia');
INSERT INTO public.dt_pais VALUES (1639, 'Fiji');
INSERT INTO public.dt_pais VALUES (1640, 'Filipinas');
INSERT INTO public.dt_pais VALUES (1641, 'Finndia');
INSERT INTO public.dt_pais VALUES (1642, 'Francia');
INSERT INTO public.dt_pais VALUES (1643, 'Gabón');
INSERT INTO public.dt_pais VALUES (1644, 'Gambia');
INSERT INTO public.dt_pais VALUES (1645, 'Georgia');
INSERT INTO public.dt_pais VALUES (1646, 'Ghana');
INSERT INTO public.dt_pais VALUES (1647, 'Granada');
INSERT INTO public.dt_pais VALUES (1648, 'Grecia');
INSERT INTO public.dt_pais VALUES (1649, 'Guatema');
INSERT INTO public.dt_pais VALUES (1650, 'Guinea');
INSERT INTO public.dt_pais VALUES (1651, 'Guinea Ecuatorial');
INSERT INTO public.dt_pais VALUES (1652, 'Guinea-Bissau');
INSERT INTO public.dt_pais VALUES (1653, 'Guyana');
INSERT INTO public.dt_pais VALUES (1654, 'Haití');
INSERT INTO public.dt_pais VALUES (1655, 'Honduras');
INSERT INTO public.dt_pais VALUES (1656, 'Hungría');
INSERT INTO public.dt_pais VALUES (1657, 'India');
INSERT INTO public.dt_pais VALUES (1658, 'Indonesia');
INSERT INTO public.dt_pais VALUES (1659, 'Irán República Islámica d');
INSERT INTO public.dt_pais VALUES (1660, 'Iraq');
INSERT INTO public.dt_pais VALUES (1661, 'Irnda');
INSERT INTO public.dt_pais VALUES (1662, 'Isndia');
INSERT INTO public.dt_pais VALUES (1663, 'Iss Cook s');
INSERT INTO public.dt_pais VALUES (1664, 'Iss Marshall s');
INSERT INTO public.dt_pais VALUES (1665, 'Iss Salomón s');
INSERT INTO public.dt_pais VALUES (1666, 'Isra');
INSERT INTO public.dt_pais VALUES (1667, 'Italia');
INSERT INTO public.dt_pais VALUES (1668, 'Jamaica');
INSERT INTO public.dt_pais VALUES (1669, 'Japón');
INSERT INTO public.dt_pais VALUES (1670, 'Jordania');
INSERT INTO public.dt_pais VALUES (1671, 'Kazajstán');
INSERT INTO public.dt_pais VALUES (1672, 'Kenya');
INSERT INTO public.dt_pais VALUES (1673, 'Kirguistán');
INSERT INTO public.dt_pais VALUES (1674, 'Kiribati');
INSERT INTO public.dt_pais VALUES (1675, 'Kuwait');
INSERT INTO public.dt_pais VALUES (1676, 'Lesotho');
INSERT INTO public.dt_pais VALUES (1677, 'Letonia');
INSERT INTO public.dt_pais VALUES (1678, 'Líbano');
INSERT INTO public.dt_pais VALUES (1679, 'Liberia');
INSERT INTO public.dt_pais VALUES (1680, 'Libia');
INSERT INTO public.dt_pais VALUES (1681, 'Liechtenstein');
INSERT INTO public.dt_pais VALUES (1682, 'Lituania');
INSERT INTO public.dt_pais VALUES (1683, 'Luxemburgo');
INSERT INTO public.dt_pais VALUES (1684, 'Madagascar');
INSERT INTO public.dt_pais VALUES (1685, 'Masia');
INSERT INTO public.dt_pais VALUES (1686, 'Mawi');
INSERT INTO public.dt_pais VALUES (1687, 'Maldivas');
INSERT INTO public.dt_pais VALUES (1688, 'Malí');
INSERT INTO public.dt_pais VALUES (1689, 'Malta');
INSERT INTO public.dt_pais VALUES (1690, 'Marruecos');
INSERT INTO public.dt_pais VALUES (1691, 'Mauricio');
INSERT INTO public.dt_pais VALUES (1692, 'Mauritania');
INSERT INTO public.dt_pais VALUES (1693, 'México');
INSERT INTO public.dt_pais VALUES (1694, 'Micronesia Estados Federados de');
INSERT INTO public.dt_pais VALUES (1695, 'Mónaco');
INSERT INTO public.dt_pais VALUES (1696, 'Mongolia');
INSERT INTO public.dt_pais VALUES (1697, 'Montenegro');
INSERT INTO public.dt_pais VALUES (1698, 'Mozambique');
INSERT INTO public.dt_pais VALUES (1699, 'Myanmar');
INSERT INTO public.dt_pais VALUES (1700, 'Namibia');
INSERT INTO public.dt_pais VALUES (1701, 'Nauru');
INSERT INTO public.dt_pais VALUES (1702, 'Nepal');
INSERT INTO public.dt_pais VALUES (1703, 'Nicaragua');
INSERT INTO public.dt_pais VALUES (1704, 'Níger');
INSERT INTO public.dt_pais VALUES (1705, 'Nigeria');
INSERT INTO public.dt_pais VALUES (1706, 'Niue');
INSERT INTO public.dt_pais VALUES (1707, 'Noruega');
INSERT INTO public.dt_pais VALUES (1708, 'Nueva Zandia');
INSERT INTO public.dt_pais VALUES (1709, 'Omán');
INSERT INTO public.dt_pais VALUES (1710, 'Países Bajos');
INSERT INTO public.dt_pais VALUES (1711, 'Pakistán');
INSERT INTO public.dt_pais VALUES (1712, 'Pau');
INSERT INTO public.dt_pais VALUES (1713, 'Panamá');
INSERT INTO public.dt_pais VALUES (1714, 'Papua Nueva Guinea');
INSERT INTO public.dt_pais VALUES (1715, 'Paraguay');
INSERT INTO public.dt_pais VALUES (1716, 'Perú');
INSERT INTO public.dt_pais VALUES (1717, 'Polonia');
INSERT INTO public.dt_pais VALUES (1718, 'Portugal');
INSERT INTO public.dt_pais VALUES (1719, 'Qatar');
INSERT INTO public.dt_pais VALUES (1720, 'Reino Unido de Gran Bretaña e Irnda d Norte');
INSERT INTO public.dt_pais VALUES (1721, 'República Árabe Siria');
INSERT INTO public.dt_pais VALUES (1722, 'República Centroafricana');
INSERT INTO public.dt_pais VALUES (1723, 'República de Corea');
INSERT INTO public.dt_pais VALUES (1724, 'República de Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (1725, 'Nombre corto: Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (1726, 'República de Moldova');
INSERT INTO public.dt_pais VALUES (1727, 'República Democrática d Congo');
INSERT INTO public.dt_pais VALUES (1728, 'República Democrática Popur o');
INSERT INTO public.dt_pais VALUES (1729, 'República Dominicana');
INSERT INTO public.dt_pais VALUES (1730, 'República Popur Democrática de Corea');
INSERT INTO public.dt_pais VALUES (1731, 'República Unida de Tanzanía');
INSERT INTO public.dt_pais VALUES (1732, 'Rumania');
INSERT INTO public.dt_pais VALUES (1733, 'Rwanda');
INSERT INTO public.dt_pais VALUES (1734, 'Saint Kitts y Nevis');
INSERT INTO public.dt_pais VALUES (1735, 'Samoa');
INSERT INTO public.dt_pais VALUES (1736, 'San Marino');
INSERT INTO public.dt_pais VALUES (1737, 'San Vicente y s Granadinas');
INSERT INTO public.dt_pais VALUES (1738, 'Santa Lucía');
INSERT INTO public.dt_pais VALUES (1739, 'Santa Sede');
INSERT INTO public.dt_pais VALUES (1740, 'Santo Tomé y Príncipe');
INSERT INTO public.dt_pais VALUES (1741, 'Senegal');
INSERT INTO public.dt_pais VALUES (1742, 'Serbia');
INSERT INTO public.dt_pais VALUES (1743, 'Seychles');
INSERT INTO public.dt_pais VALUES (1744, 'Sierra Leona');
INSERT INTO public.dt_pais VALUES (1745, 'Singapur');
INSERT INTO public.dt_pais VALUES (1746, 'Somalia');
INSERT INTO public.dt_pais VALUES (1747, 'Sri nka');
INSERT INTO public.dt_pais VALUES (1748, 'Sudáfrica');
INSERT INTO public.dt_pais VALUES (1749, 'Sudán');
INSERT INTO public.dt_pais VALUES (1750, 'Sudán d Sur');
INSERT INTO public.dt_pais VALUES (1751, 'Suecia');
INSERT INTO public.dt_pais VALUES (1752, 'Suiza');
INSERT INTO public.dt_pais VALUES (1753, 'Suriname');
INSERT INTO public.dt_pais VALUES (1754, 'Taindia');
INSERT INTO public.dt_pais VALUES (1755, 'Tayikistán');
INSERT INTO public.dt_pais VALUES (1756, 'Timor-Leste');
INSERT INTO public.dt_pais VALUES (1757, 'Togo');
INSERT INTO public.dt_pais VALUES (1758, 'Tonga');
INSERT INTO public.dt_pais VALUES (1759, 'Trinidad y Tabago');
INSERT INTO public.dt_pais VALUES (1760, 'Túnez');
INSERT INTO public.dt_pais VALUES (1761, 'Turkmenistán');
INSERT INTO public.dt_pais VALUES (1762, 'Turquía');
INSERT INTO public.dt_pais VALUES (1763, 'Tuvalu');
INSERT INTO public.dt_pais VALUES (1764, 'Ucrania');
INSERT INTO public.dt_pais VALUES (1765, 'Uganda');
INSERT INTO public.dt_pais VALUES (1766, 'Uruguay');
INSERT INTO public.dt_pais VALUES (1767, 'Uzbekistán');
INSERT INTO public.dt_pais VALUES (1768, 'Vanuatu');
INSERT INTO public.dt_pais VALUES (1769, 'Venezua República Bolivariana de');
INSERT INTO public.dt_pais VALUES (1770, 'Viet Nam');
INSERT INTO public.dt_pais VALUES (1771, 'Yemen');
INSERT INTO public.dt_pais VALUES (1772, 'Zambia');
INSERT INTO public.dt_pais VALUES (1773, 'Zimbabwe');
INSERT INTO public.dt_pais VALUES (1774, 'Afganistán');
INSERT INTO public.dt_pais VALUES (1775, 'Albania');
INSERT INTO public.dt_pais VALUES (1776, 'Alemania');
INSERT INTO public.dt_pais VALUES (1777, 'Andorra');
INSERT INTO public.dt_pais VALUES (1778, 'Ango');
INSERT INTO public.dt_pais VALUES (1779, 'Antigua y Barbuda');
INSERT INTO public.dt_pais VALUES (1780, 'Arabia Saudita');
INSERT INTO public.dt_pais VALUES (1781, 'Argia');
INSERT INTO public.dt_pais VALUES (1782, 'Argentina');
INSERT INTO public.dt_pais VALUES (1783, 'Armenia');
INSERT INTO public.dt_pais VALUES (1784, 'Australia');
INSERT INTO public.dt_pais VALUES (1785, 'Austria');
INSERT INTO public.dt_pais VALUES (1786, 'Azerbaiyán');
INSERT INTO public.dt_pais VALUES (1787, 'Bahamas s');
INSERT INTO public.dt_pais VALUES (1788, 'Bahrein');
INSERT INTO public.dt_pais VALUES (1789, 'Bangdesh');
INSERT INTO public.dt_pais VALUES (1790, 'Barbados');
INSERT INTO public.dt_pais VALUES (1791, 'Barús');
INSERT INTO public.dt_pais VALUES (1792, 'Bélgica');
INSERT INTO public.dt_pais VALUES (1793, 'Bice');
INSERT INTO public.dt_pais VALUES (1794, 'Benin');
INSERT INTO public.dt_pais VALUES (1795, 'Bhután');
INSERT INTO public.dt_pais VALUES (1796, 'Bolivia Estado Plurinacional de');
INSERT INTO public.dt_pais VALUES (1797, 'Bosnia y Herzegovina');
INSERT INTO public.dt_pais VALUES (1798, 'Botswana');
INSERT INTO public.dt_pais VALUES (1799, 'Brasil');
INSERT INTO public.dt_pais VALUES (1800, 'Brunei Darussam');
INSERT INTO public.dt_pais VALUES (1801, 'Bulgaria');
INSERT INTO public.dt_pais VALUES (1802, 'Burkina Faso');
INSERT INTO public.dt_pais VALUES (1803, 'Burundi');
INSERT INTO public.dt_pais VALUES (1804, 'Cabo Verde');
INSERT INTO public.dt_pais VALUES (1805, 'Camboya');
INSERT INTO public.dt_pais VALUES (1806, 'Camerún');
INSERT INTO public.dt_pais VALUES (1807, 'Canadá');
INSERT INTO public.dt_pais VALUES (1808, 'Chad');
INSERT INTO public.dt_pais VALUES (1809, 'Chequia');
INSERT INTO public.dt_pais VALUES (1810, 'Chile');
INSERT INTO public.dt_pais VALUES (1811, 'China');
INSERT INTO public.dt_pais VALUES (1812, 'Chipre');
INSERT INTO public.dt_pais VALUES (1813, 'Colombia');
INSERT INTO public.dt_pais VALUES (1814, 'Comoras s');
INSERT INTO public.dt_pais VALUES (1815, 'Congo');
INSERT INTO public.dt_pais VALUES (1816, 'Costa Rica');
INSERT INTO public.dt_pais VALUES (1817, 'Côte d’Ivoire');
INSERT INTO public.dt_pais VALUES (1818, 'Croacia');
INSERT INTO public.dt_pais VALUES (1819, 'Cuba');
INSERT INTO public.dt_pais VALUES (1820, 'Dinamarca');
INSERT INTO public.dt_pais VALUES (1821, 'Djibouti');
INSERT INTO public.dt_pais VALUES (1822, 'Dominica');
INSERT INTO public.dt_pais VALUES (1823, 'Ecuador');
INSERT INTO public.dt_pais VALUES (1824, 'Egipto');
INSERT INTO public.dt_pais VALUES (1825, ' Salvador');
INSERT INTO public.dt_pais VALUES (1826, 'Emiratos Árabes Unidos');
INSERT INTO public.dt_pais VALUES (1827, 'Eritrea');
INSERT INTO public.dt_pais VALUES (1828, 'Eslovaquia');
INSERT INTO public.dt_pais VALUES (1829, 'Eslovenia');
INSERT INTO public.dt_pais VALUES (1830, 'España');
INSERT INTO public.dt_pais VALUES (1831, 'Estados Unidos de América');
INSERT INTO public.dt_pais VALUES (1832, 'Estonia');
INSERT INTO public.dt_pais VALUES (1833, 'Eswatini');
INSERT INTO public.dt_pais VALUES (1834, 'Etiopía');
INSERT INTO public.dt_pais VALUES (1835, 'Federación de Rusia');
INSERT INTO public.dt_pais VALUES (1836, 'Fiji');
INSERT INTO public.dt_pais VALUES (1837, 'Filipinas');
INSERT INTO public.dt_pais VALUES (1838, 'Finndia');
INSERT INTO public.dt_pais VALUES (1839, 'Francia');
INSERT INTO public.dt_pais VALUES (1840, 'Gabón');
INSERT INTO public.dt_pais VALUES (1841, 'Gambia');
INSERT INTO public.dt_pais VALUES (1842, 'Georgia');
INSERT INTO public.dt_pais VALUES (1843, 'Ghana');
INSERT INTO public.dt_pais VALUES (1844, 'Granada');
INSERT INTO public.dt_pais VALUES (1845, 'Grecia');
INSERT INTO public.dt_pais VALUES (1846, 'Guatema');
INSERT INTO public.dt_pais VALUES (1847, 'Guinea');
INSERT INTO public.dt_pais VALUES (1848, 'Guinea Ecuatorial');
INSERT INTO public.dt_pais VALUES (1849, 'Guinea-Bissau');
INSERT INTO public.dt_pais VALUES (1850, 'Guyana');
INSERT INTO public.dt_pais VALUES (1851, 'Haití');
INSERT INTO public.dt_pais VALUES (1852, 'Honduras');
INSERT INTO public.dt_pais VALUES (1853, 'Hungría');
INSERT INTO public.dt_pais VALUES (1854, 'India');
INSERT INTO public.dt_pais VALUES (1855, 'Indonesia');
INSERT INTO public.dt_pais VALUES (1856, 'Irán República Islámica d');
INSERT INTO public.dt_pais VALUES (1857, 'Iraq');
INSERT INTO public.dt_pais VALUES (1858, 'Irnda');
INSERT INTO public.dt_pais VALUES (1859, 'Isndia');
INSERT INTO public.dt_pais VALUES (1860, 'Iss Cook s');
INSERT INTO public.dt_pais VALUES (1861, 'Iss Marshall s');
INSERT INTO public.dt_pais VALUES (1862, 'Iss Salomón s');
INSERT INTO public.dt_pais VALUES (1863, 'Isra');
INSERT INTO public.dt_pais VALUES (1864, 'Italia');
INSERT INTO public.dt_pais VALUES (1865, 'Jamaica');
INSERT INTO public.dt_pais VALUES (1866, 'Japón');
INSERT INTO public.dt_pais VALUES (1867, 'Jordania');
INSERT INTO public.dt_pais VALUES (1868, 'Kazajstán');
INSERT INTO public.dt_pais VALUES (1869, 'Kenya');
INSERT INTO public.dt_pais VALUES (1870, 'Kirguistán');
INSERT INTO public.dt_pais VALUES (1871, 'Kiribati');
INSERT INTO public.dt_pais VALUES (1872, 'Kuwait');
INSERT INTO public.dt_pais VALUES (1873, 'Lesotho');
INSERT INTO public.dt_pais VALUES (1874, 'Letonia');
INSERT INTO public.dt_pais VALUES (1875, 'Líbano');
INSERT INTO public.dt_pais VALUES (1876, 'Liberia');
INSERT INTO public.dt_pais VALUES (1877, 'Libia');
INSERT INTO public.dt_pais VALUES (1878, 'Liechtenstein');
INSERT INTO public.dt_pais VALUES (1879, 'Lituania');
INSERT INTO public.dt_pais VALUES (1880, 'Luxemburgo');
INSERT INTO public.dt_pais VALUES (1881, 'Madagascar');
INSERT INTO public.dt_pais VALUES (1882, 'Masia');
INSERT INTO public.dt_pais VALUES (1883, 'Mawi');
INSERT INTO public.dt_pais VALUES (1884, 'Maldivas');
INSERT INTO public.dt_pais VALUES (1885, 'Malí');
INSERT INTO public.dt_pais VALUES (1886, 'Malta');
INSERT INTO public.dt_pais VALUES (1887, 'Marruecos');
INSERT INTO public.dt_pais VALUES (1888, 'Mauricio');
INSERT INTO public.dt_pais VALUES (1889, 'Mauritania');
INSERT INTO public.dt_pais VALUES (1890, 'México');
INSERT INTO public.dt_pais VALUES (1891, 'Micronesia Estados Federados de');
INSERT INTO public.dt_pais VALUES (1892, 'Mónaco');
INSERT INTO public.dt_pais VALUES (1893, 'Mongolia');
INSERT INTO public.dt_pais VALUES (1894, 'Montenegro');
INSERT INTO public.dt_pais VALUES (1895, 'Mozambique');
INSERT INTO public.dt_pais VALUES (1896, 'Myanmar');
INSERT INTO public.dt_pais VALUES (1897, 'Namibia');
INSERT INTO public.dt_pais VALUES (1898, 'Nauru');
INSERT INTO public.dt_pais VALUES (1899, 'Nepal');
INSERT INTO public.dt_pais VALUES (1900, 'Nicaragua');
INSERT INTO public.dt_pais VALUES (1901, 'Níger');
INSERT INTO public.dt_pais VALUES (1902, 'Nigeria');
INSERT INTO public.dt_pais VALUES (1903, 'Niue');
INSERT INTO public.dt_pais VALUES (1904, 'Noruega');
INSERT INTO public.dt_pais VALUES (1905, 'Nueva Zandia');
INSERT INTO public.dt_pais VALUES (1906, 'Omán');
INSERT INTO public.dt_pais VALUES (1907, 'Países Bajos');
INSERT INTO public.dt_pais VALUES (1908, 'Pakistán');
INSERT INTO public.dt_pais VALUES (1909, 'Pau');
INSERT INTO public.dt_pais VALUES (1910, 'Panamá');
INSERT INTO public.dt_pais VALUES (1911, 'Papua Nueva Guinea');
INSERT INTO public.dt_pais VALUES (1912, 'Paraguay');
INSERT INTO public.dt_pais VALUES (1913, 'Perú');
INSERT INTO public.dt_pais VALUES (1914, 'Polonia');
INSERT INTO public.dt_pais VALUES (1915, 'Portugal');
INSERT INTO public.dt_pais VALUES (1916, 'Qatar');
INSERT INTO public.dt_pais VALUES (1917, 'Reino Unido de Gran Bretaña e Irnda d Norte');
INSERT INTO public.dt_pais VALUES (1918, 'República Árabe Siria');
INSERT INTO public.dt_pais VALUES (1919, 'República Centroafricana');
INSERT INTO public.dt_pais VALUES (1920, 'República de Corea');
INSERT INTO public.dt_pais VALUES (1921, 'República de Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (1922, 'Nombre corto: Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (1923, 'República de Moldova');
INSERT INTO public.dt_pais VALUES (1924, 'República Democrática d Congo');
INSERT INTO public.dt_pais VALUES (1925, 'República Democrática Popur o');
INSERT INTO public.dt_pais VALUES (1926, 'República Dominicana');
INSERT INTO public.dt_pais VALUES (1927, 'República Popur Democrática de Corea');
INSERT INTO public.dt_pais VALUES (1928, 'República Unida de Tanzanía');
INSERT INTO public.dt_pais VALUES (1929, 'Rumania');
INSERT INTO public.dt_pais VALUES (1930, 'Rwanda');
INSERT INTO public.dt_pais VALUES (1931, 'Saint Kitts y Nevis');
INSERT INTO public.dt_pais VALUES (1932, 'Samoa');
INSERT INTO public.dt_pais VALUES (1933, 'San Marino');
INSERT INTO public.dt_pais VALUES (1934, 'San Vicente y s Granadinas');
INSERT INTO public.dt_pais VALUES (1935, 'Santa Lucía');
INSERT INTO public.dt_pais VALUES (1936, 'Santa Sede');
INSERT INTO public.dt_pais VALUES (1937, 'Santo Tomé y Príncipe');
INSERT INTO public.dt_pais VALUES (1938, 'Senegal');
INSERT INTO public.dt_pais VALUES (1939, 'Serbia');
INSERT INTO public.dt_pais VALUES (1940, 'Seychles');
INSERT INTO public.dt_pais VALUES (1941, 'Sierra Leona');
INSERT INTO public.dt_pais VALUES (1942, 'Singapur');
INSERT INTO public.dt_pais VALUES (1943, 'Somalia');
INSERT INTO public.dt_pais VALUES (1944, 'Sri nka');
INSERT INTO public.dt_pais VALUES (1945, 'Sudáfrica');
INSERT INTO public.dt_pais VALUES (1946, 'Sudán');
INSERT INTO public.dt_pais VALUES (1947, 'Sudán d Sur');
INSERT INTO public.dt_pais VALUES (1948, 'Suecia');
INSERT INTO public.dt_pais VALUES (1949, 'Suiza');
INSERT INTO public.dt_pais VALUES (1950, 'Suriname');
INSERT INTO public.dt_pais VALUES (1951, 'Taindia');
INSERT INTO public.dt_pais VALUES (1952, 'Tayikistán');
INSERT INTO public.dt_pais VALUES (1953, 'Timor-Leste');
INSERT INTO public.dt_pais VALUES (1954, 'Togo');
INSERT INTO public.dt_pais VALUES (1955, 'Tonga');
INSERT INTO public.dt_pais VALUES (1956, 'Trinidad y Tabago');
INSERT INTO public.dt_pais VALUES (1957, 'Túnez');
INSERT INTO public.dt_pais VALUES (1958, 'Turkmenistán');
INSERT INTO public.dt_pais VALUES (1959, 'Turquía');
INSERT INTO public.dt_pais VALUES (1960, 'Tuvalu');
INSERT INTO public.dt_pais VALUES (1961, 'Ucrania');
INSERT INTO public.dt_pais VALUES (1962, 'Uganda');
INSERT INTO public.dt_pais VALUES (1963, 'Uruguay');
INSERT INTO public.dt_pais VALUES (1964, 'Uzbekistán');
INSERT INTO public.dt_pais VALUES (1965, 'Vanuatu');
INSERT INTO public.dt_pais VALUES (1966, 'Venezua República Bolivariana de');
INSERT INTO public.dt_pais VALUES (1967, 'Viet Nam');
INSERT INTO public.dt_pais VALUES (1968, 'Yemen');
INSERT INTO public.dt_pais VALUES (1969, 'Zambia');
INSERT INTO public.dt_pais VALUES (1970, 'Zimbabwe');
INSERT INTO public.dt_pais VALUES (1971, 'Afganistán');
INSERT INTO public.dt_pais VALUES (1972, 'Albania');
INSERT INTO public.dt_pais VALUES (1973, 'Alemania');
INSERT INTO public.dt_pais VALUES (1974, 'Andorra');
INSERT INTO public.dt_pais VALUES (1975, 'Ango');
INSERT INTO public.dt_pais VALUES (1976, 'Antigua y Barbuda');
INSERT INTO public.dt_pais VALUES (1977, 'Arabia Saudita');
INSERT INTO public.dt_pais VALUES (1978, 'Argia');
INSERT INTO public.dt_pais VALUES (1979, 'Argentina');
INSERT INTO public.dt_pais VALUES (1980, 'Armenia');
INSERT INTO public.dt_pais VALUES (1981, 'Australia');
INSERT INTO public.dt_pais VALUES (1982, 'Austria');
INSERT INTO public.dt_pais VALUES (1983, 'Azerbaiyán');
INSERT INTO public.dt_pais VALUES (1984, 'Bahamas s');
INSERT INTO public.dt_pais VALUES (1985, 'Bahrein');
INSERT INTO public.dt_pais VALUES (1986, 'Bangdesh');
INSERT INTO public.dt_pais VALUES (1987, 'Barbados');
INSERT INTO public.dt_pais VALUES (1988, 'Barús');
INSERT INTO public.dt_pais VALUES (1989, 'Bélgica');
INSERT INTO public.dt_pais VALUES (1990, 'Bice');
INSERT INTO public.dt_pais VALUES (1991, 'Benin');
INSERT INTO public.dt_pais VALUES (1992, 'Bhután');
INSERT INTO public.dt_pais VALUES (1993, 'Bolivia Estado Plurinacional de');
INSERT INTO public.dt_pais VALUES (1994, 'Bosnia y Herzegovina');
INSERT INTO public.dt_pais VALUES (1995, 'Botswana');
INSERT INTO public.dt_pais VALUES (1996, 'Brasil');
INSERT INTO public.dt_pais VALUES (1997, 'Brunei Darussam');
INSERT INTO public.dt_pais VALUES (1998, 'Bulgaria');
INSERT INTO public.dt_pais VALUES (1999, 'Burkina Faso');
INSERT INTO public.dt_pais VALUES (2000, 'Burundi');
INSERT INTO public.dt_pais VALUES (2001, 'Cabo Verde');
INSERT INTO public.dt_pais VALUES (2002, 'Camboya');
INSERT INTO public.dt_pais VALUES (2003, 'Camerún');
INSERT INTO public.dt_pais VALUES (2004, 'Canadá');
INSERT INTO public.dt_pais VALUES (2005, 'Chad');
INSERT INTO public.dt_pais VALUES (2006, 'Chequia');
INSERT INTO public.dt_pais VALUES (2007, 'Chile');
INSERT INTO public.dt_pais VALUES (2008, 'China');
INSERT INTO public.dt_pais VALUES (2009, 'Chipre');
INSERT INTO public.dt_pais VALUES (2010, 'Colombia');
INSERT INTO public.dt_pais VALUES (2011, 'Comoras s');
INSERT INTO public.dt_pais VALUES (2012, 'Congo');
INSERT INTO public.dt_pais VALUES (2013, 'Costa Rica');
INSERT INTO public.dt_pais VALUES (2014, 'Côte d’Ivoire');
INSERT INTO public.dt_pais VALUES (2015, 'Croacia');
INSERT INTO public.dt_pais VALUES (2016, 'Cuba');
INSERT INTO public.dt_pais VALUES (2017, 'Dinamarca');
INSERT INTO public.dt_pais VALUES (2018, 'Djibouti');
INSERT INTO public.dt_pais VALUES (2019, 'Dominica');
INSERT INTO public.dt_pais VALUES (2020, 'Ecuador');
INSERT INTO public.dt_pais VALUES (2021, 'Egipto');
INSERT INTO public.dt_pais VALUES (2022, ' Salvador');
INSERT INTO public.dt_pais VALUES (2023, 'Emiratos Árabes Unidos');
INSERT INTO public.dt_pais VALUES (2024, 'Eritrea');
INSERT INTO public.dt_pais VALUES (2025, 'Eslovaquia');
INSERT INTO public.dt_pais VALUES (2026, 'Eslovenia');
INSERT INTO public.dt_pais VALUES (2027, 'España');
INSERT INTO public.dt_pais VALUES (2028, 'Estados Unidos de América');
INSERT INTO public.dt_pais VALUES (2029, 'Estonia');
INSERT INTO public.dt_pais VALUES (2030, 'Eswatini');
INSERT INTO public.dt_pais VALUES (2031, 'Etiopía');
INSERT INTO public.dt_pais VALUES (2032, 'Federación de Rusia');
INSERT INTO public.dt_pais VALUES (2033, 'Fiji');
INSERT INTO public.dt_pais VALUES (2034, 'Filipinas');
INSERT INTO public.dt_pais VALUES (2035, 'Finndia');
INSERT INTO public.dt_pais VALUES (2036, 'Francia');
INSERT INTO public.dt_pais VALUES (2037, 'Gabón');
INSERT INTO public.dt_pais VALUES (2038, 'Gambia');
INSERT INTO public.dt_pais VALUES (2039, 'Georgia');
INSERT INTO public.dt_pais VALUES (2040, 'Ghana');
INSERT INTO public.dt_pais VALUES (2041, 'Granada');
INSERT INTO public.dt_pais VALUES (2042, 'Grecia');
INSERT INTO public.dt_pais VALUES (2043, 'Guatema');
INSERT INTO public.dt_pais VALUES (2044, 'Guinea');
INSERT INTO public.dt_pais VALUES (2045, 'Guinea Ecuatorial');
INSERT INTO public.dt_pais VALUES (2046, 'Guinea-Bissau');
INSERT INTO public.dt_pais VALUES (2047, 'Guyana');
INSERT INTO public.dt_pais VALUES (2048, 'Haití');
INSERT INTO public.dt_pais VALUES (2049, 'Honduras');
INSERT INTO public.dt_pais VALUES (2050, 'Hungría');
INSERT INTO public.dt_pais VALUES (2051, 'India');
INSERT INTO public.dt_pais VALUES (2052, 'Indonesia');
INSERT INTO public.dt_pais VALUES (2053, 'Irán República Islámica d');
INSERT INTO public.dt_pais VALUES (2054, 'Iraq');
INSERT INTO public.dt_pais VALUES (2055, 'Irnda');
INSERT INTO public.dt_pais VALUES (2056, 'Isndia');
INSERT INTO public.dt_pais VALUES (2057, 'Iss Cook s');
INSERT INTO public.dt_pais VALUES (2058, 'Iss Marshall s');
INSERT INTO public.dt_pais VALUES (2059, 'Iss Salomón s');
INSERT INTO public.dt_pais VALUES (2060, 'Isra');
INSERT INTO public.dt_pais VALUES (2061, 'Italia');
INSERT INTO public.dt_pais VALUES (2062, 'Jamaica');
INSERT INTO public.dt_pais VALUES (2063, 'Japón');
INSERT INTO public.dt_pais VALUES (2064, 'Jordania');
INSERT INTO public.dt_pais VALUES (2065, 'Kazajstán');
INSERT INTO public.dt_pais VALUES (2066, 'Kenya');
INSERT INTO public.dt_pais VALUES (2067, 'Kirguistán');
INSERT INTO public.dt_pais VALUES (2068, 'Kiribati');
INSERT INTO public.dt_pais VALUES (2069, 'Kuwait');
INSERT INTO public.dt_pais VALUES (2070, 'Lesotho');
INSERT INTO public.dt_pais VALUES (2071, 'Letonia');
INSERT INTO public.dt_pais VALUES (2072, 'Líbano');
INSERT INTO public.dt_pais VALUES (2073, 'Liberia');
INSERT INTO public.dt_pais VALUES (2074, 'Libia');
INSERT INTO public.dt_pais VALUES (2075, 'Liechtenstein');
INSERT INTO public.dt_pais VALUES (2076, 'Lituania');
INSERT INTO public.dt_pais VALUES (2077, 'Luxemburgo');
INSERT INTO public.dt_pais VALUES (2078, 'Madagascar');
INSERT INTO public.dt_pais VALUES (2079, 'Masia');
INSERT INTO public.dt_pais VALUES (2080, 'Mawi');
INSERT INTO public.dt_pais VALUES (2081, 'Maldivas');
INSERT INTO public.dt_pais VALUES (2082, 'Malí');
INSERT INTO public.dt_pais VALUES (2083, 'Malta');
INSERT INTO public.dt_pais VALUES (2084, 'Marruecos');
INSERT INTO public.dt_pais VALUES (2085, 'Mauricio');
INSERT INTO public.dt_pais VALUES (2086, 'Mauritania');
INSERT INTO public.dt_pais VALUES (2087, 'México');
INSERT INTO public.dt_pais VALUES (2088, 'Micronesia Estados Federados de');
INSERT INTO public.dt_pais VALUES (2089, 'Mónaco');
INSERT INTO public.dt_pais VALUES (2090, 'Mongolia');
INSERT INTO public.dt_pais VALUES (2091, 'Montenegro');
INSERT INTO public.dt_pais VALUES (2092, 'Mozambique');
INSERT INTO public.dt_pais VALUES (2093, 'Myanmar');
INSERT INTO public.dt_pais VALUES (2094, 'Namibia');
INSERT INTO public.dt_pais VALUES (2095, 'Nauru');
INSERT INTO public.dt_pais VALUES (2096, 'Nepal');
INSERT INTO public.dt_pais VALUES (2097, 'Nicaragua');
INSERT INTO public.dt_pais VALUES (2098, 'Níger');
INSERT INTO public.dt_pais VALUES (2099, 'Nigeria');
INSERT INTO public.dt_pais VALUES (2100, 'Niue');
INSERT INTO public.dt_pais VALUES (2101, 'Noruega');
INSERT INTO public.dt_pais VALUES (2102, 'Nueva Zandia');
INSERT INTO public.dt_pais VALUES (2103, 'Omán');
INSERT INTO public.dt_pais VALUES (2104, 'Países Bajos');
INSERT INTO public.dt_pais VALUES (2105, 'Pakistán');
INSERT INTO public.dt_pais VALUES (2106, 'Pau');
INSERT INTO public.dt_pais VALUES (2107, 'Panamá');
INSERT INTO public.dt_pais VALUES (2108, 'Papua Nueva Guinea');
INSERT INTO public.dt_pais VALUES (2109, 'Paraguay');
INSERT INTO public.dt_pais VALUES (2110, 'Perú');
INSERT INTO public.dt_pais VALUES (2111, 'Polonia');
INSERT INTO public.dt_pais VALUES (2112, 'Portugal');
INSERT INTO public.dt_pais VALUES (2113, 'Qatar');
INSERT INTO public.dt_pais VALUES (2114, 'Reino Unido de Gran Bretaña e Irnda d Norte');
INSERT INTO public.dt_pais VALUES (2115, 'República Árabe Siria');
INSERT INTO public.dt_pais VALUES (2116, 'República Centroafricana');
INSERT INTO public.dt_pais VALUES (2117, 'República de Corea');
INSERT INTO public.dt_pais VALUES (2118, 'República de Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (2119, 'Nombre corto: Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (2120, 'República de Moldova');
INSERT INTO public.dt_pais VALUES (2121, 'República Democrática d Congo');
INSERT INTO public.dt_pais VALUES (2122, 'República Democrática Popur o');
INSERT INTO public.dt_pais VALUES (2123, 'República Dominicana');
INSERT INTO public.dt_pais VALUES (2124, 'República Popur Democrática de Corea');
INSERT INTO public.dt_pais VALUES (2125, 'República Unida de Tanzanía');
INSERT INTO public.dt_pais VALUES (2126, 'Rumania');
INSERT INTO public.dt_pais VALUES (2127, 'Rwanda');
INSERT INTO public.dt_pais VALUES (2128, 'Saint Kitts y Nevis');
INSERT INTO public.dt_pais VALUES (2129, 'Samoa');
INSERT INTO public.dt_pais VALUES (2130, 'San Marino');
INSERT INTO public.dt_pais VALUES (2131, 'San Vicente y s Granadinas');
INSERT INTO public.dt_pais VALUES (2132, 'Santa Lucía');
INSERT INTO public.dt_pais VALUES (2133, 'Santa Sede');
INSERT INTO public.dt_pais VALUES (2134, 'Santo Tomé y Príncipe');
INSERT INTO public.dt_pais VALUES (2135, 'Senegal');
INSERT INTO public.dt_pais VALUES (2136, 'Serbia');
INSERT INTO public.dt_pais VALUES (2137, 'Seychles');
INSERT INTO public.dt_pais VALUES (2138, 'Sierra Leona');
INSERT INTO public.dt_pais VALUES (2139, 'Singapur');
INSERT INTO public.dt_pais VALUES (2140, 'Somalia');
INSERT INTO public.dt_pais VALUES (2141, 'Sri nka');
INSERT INTO public.dt_pais VALUES (2142, 'Sudáfrica');
INSERT INTO public.dt_pais VALUES (2143, 'Sudán');
INSERT INTO public.dt_pais VALUES (2144, 'Sudán d Sur');
INSERT INTO public.dt_pais VALUES (2145, 'Suecia');
INSERT INTO public.dt_pais VALUES (2146, 'Suiza');
INSERT INTO public.dt_pais VALUES (2147, 'Suriname');
INSERT INTO public.dt_pais VALUES (2148, 'Taindia');
INSERT INTO public.dt_pais VALUES (2149, 'Tayikistán');
INSERT INTO public.dt_pais VALUES (2150, 'Timor-Leste');
INSERT INTO public.dt_pais VALUES (2151, 'Togo');
INSERT INTO public.dt_pais VALUES (2152, 'Tonga');
INSERT INTO public.dt_pais VALUES (2153, 'Trinidad y Tabago');
INSERT INTO public.dt_pais VALUES (2154, 'Túnez');
INSERT INTO public.dt_pais VALUES (2155, 'Turkmenistán');
INSERT INTO public.dt_pais VALUES (2156, 'Turquía');
INSERT INTO public.dt_pais VALUES (2157, 'Tuvalu');
INSERT INTO public.dt_pais VALUES (2158, 'Ucrania');
INSERT INTO public.dt_pais VALUES (2159, 'Uganda');
INSERT INTO public.dt_pais VALUES (2160, 'Uruguay');
INSERT INTO public.dt_pais VALUES (2161, 'Uzbekistán');
INSERT INTO public.dt_pais VALUES (2162, 'Vanuatu');
INSERT INTO public.dt_pais VALUES (2163, 'Venezua República Bolivariana de');
INSERT INTO public.dt_pais VALUES (2164, 'Viet Nam');
INSERT INTO public.dt_pais VALUES (2165, 'Yemen');
INSERT INTO public.dt_pais VALUES (2166, 'Zambia');
INSERT INTO public.dt_pais VALUES (2167, 'Zimbabwe');
INSERT INTO public.dt_pais VALUES (2168, 'Afganistán');
INSERT INTO public.dt_pais VALUES (2169, 'Albania');
INSERT INTO public.dt_pais VALUES (2170, 'Alemania');
INSERT INTO public.dt_pais VALUES (2171, 'Andorra');
INSERT INTO public.dt_pais VALUES (2172, 'Ango');
INSERT INTO public.dt_pais VALUES (2173, 'Antigua y Barbuda');
INSERT INTO public.dt_pais VALUES (2174, 'Arabia Saudita');
INSERT INTO public.dt_pais VALUES (2175, 'Argia');
INSERT INTO public.dt_pais VALUES (2176, 'Argentina');
INSERT INTO public.dt_pais VALUES (2177, 'Armenia');
INSERT INTO public.dt_pais VALUES (2178, 'Australia');
INSERT INTO public.dt_pais VALUES (2179, 'Austria');
INSERT INTO public.dt_pais VALUES (2180, 'Azerbaiyán');
INSERT INTO public.dt_pais VALUES (2181, 'Bahamas s');
INSERT INTO public.dt_pais VALUES (2182, 'Bahrein');
INSERT INTO public.dt_pais VALUES (2183, 'Bangdesh');
INSERT INTO public.dt_pais VALUES (2184, 'Barbados');
INSERT INTO public.dt_pais VALUES (2185, 'Barús');
INSERT INTO public.dt_pais VALUES (2186, 'Bélgica');
INSERT INTO public.dt_pais VALUES (2187, 'Bice');
INSERT INTO public.dt_pais VALUES (2188, 'Benin');
INSERT INTO public.dt_pais VALUES (2189, 'Bhután');
INSERT INTO public.dt_pais VALUES (2190, 'Bolivia Estado Plurinacional de');
INSERT INTO public.dt_pais VALUES (2191, 'Bosnia y Herzegovina');
INSERT INTO public.dt_pais VALUES (2192, 'Botswana');
INSERT INTO public.dt_pais VALUES (2193, 'Brasil');
INSERT INTO public.dt_pais VALUES (2194, 'Brunei Darussam');
INSERT INTO public.dt_pais VALUES (2195, 'Bulgaria');
INSERT INTO public.dt_pais VALUES (2196, 'Burkina Faso');
INSERT INTO public.dt_pais VALUES (2197, 'Burundi');
INSERT INTO public.dt_pais VALUES (2198, 'Cabo Verde');
INSERT INTO public.dt_pais VALUES (2199, 'Camboya');
INSERT INTO public.dt_pais VALUES (2200, 'Camerún');
INSERT INTO public.dt_pais VALUES (2201, 'Canadá');
INSERT INTO public.dt_pais VALUES (2202, 'Chad');
INSERT INTO public.dt_pais VALUES (2203, 'Chequia');
INSERT INTO public.dt_pais VALUES (2204, 'Chile');
INSERT INTO public.dt_pais VALUES (2205, 'China');
INSERT INTO public.dt_pais VALUES (2206, 'Chipre');
INSERT INTO public.dt_pais VALUES (2207, 'Colombia');
INSERT INTO public.dt_pais VALUES (2208, 'Comoras s');
INSERT INTO public.dt_pais VALUES (2209, 'Congo');
INSERT INTO public.dt_pais VALUES (2210, 'Costa Rica');
INSERT INTO public.dt_pais VALUES (2211, 'Côte d’Ivoire');
INSERT INTO public.dt_pais VALUES (2212, 'Croacia');
INSERT INTO public.dt_pais VALUES (2213, 'Cuba');
INSERT INTO public.dt_pais VALUES (2214, 'Dinamarca');
INSERT INTO public.dt_pais VALUES (2215, 'Djibouti');
INSERT INTO public.dt_pais VALUES (2216, 'Dominica');
INSERT INTO public.dt_pais VALUES (2217, 'Ecuador');
INSERT INTO public.dt_pais VALUES (2218, 'Egipto');
INSERT INTO public.dt_pais VALUES (2219, ' Salvador');
INSERT INTO public.dt_pais VALUES (2220, 'Emiratos Árabes Unidos');
INSERT INTO public.dt_pais VALUES (2221, 'Eritrea');
INSERT INTO public.dt_pais VALUES (2222, 'Eslovaquia');
INSERT INTO public.dt_pais VALUES (2223, 'Eslovenia');
INSERT INTO public.dt_pais VALUES (2224, 'España');
INSERT INTO public.dt_pais VALUES (2225, 'Estados Unidos de América');
INSERT INTO public.dt_pais VALUES (2226, 'Estonia');
INSERT INTO public.dt_pais VALUES (2227, 'Eswatini');
INSERT INTO public.dt_pais VALUES (2228, 'Etiopía');
INSERT INTO public.dt_pais VALUES (2229, 'Federación de Rusia');
INSERT INTO public.dt_pais VALUES (2230, 'Fiji');
INSERT INTO public.dt_pais VALUES (2231, 'Filipinas');
INSERT INTO public.dt_pais VALUES (2232, 'Finndia');
INSERT INTO public.dt_pais VALUES (2233, 'Francia');
INSERT INTO public.dt_pais VALUES (2234, 'Gabón');
INSERT INTO public.dt_pais VALUES (2235, 'Gambia');
INSERT INTO public.dt_pais VALUES (2236, 'Georgia');
INSERT INTO public.dt_pais VALUES (2237, 'Ghana');
INSERT INTO public.dt_pais VALUES (2238, 'Granada');
INSERT INTO public.dt_pais VALUES (2239, 'Grecia');
INSERT INTO public.dt_pais VALUES (2240, 'Guatema');
INSERT INTO public.dt_pais VALUES (2241, 'Guinea');
INSERT INTO public.dt_pais VALUES (2242, 'Guinea Ecuatorial');
INSERT INTO public.dt_pais VALUES (2243, 'Guinea-Bissau');
INSERT INTO public.dt_pais VALUES (2244, 'Guyana');
INSERT INTO public.dt_pais VALUES (2245, 'Haití');
INSERT INTO public.dt_pais VALUES (2246, 'Honduras');
INSERT INTO public.dt_pais VALUES (2247, 'Hungría');
INSERT INTO public.dt_pais VALUES (2248, 'India');
INSERT INTO public.dt_pais VALUES (2249, 'Indonesia');
INSERT INTO public.dt_pais VALUES (2250, 'Irán República Islámica d');
INSERT INTO public.dt_pais VALUES (2251, 'Iraq');
INSERT INTO public.dt_pais VALUES (2252, 'Irnda');
INSERT INTO public.dt_pais VALUES (2253, 'Isndia');
INSERT INTO public.dt_pais VALUES (2254, 'Iss Cook s');
INSERT INTO public.dt_pais VALUES (2255, 'Iss Marshall s');
INSERT INTO public.dt_pais VALUES (2256, 'Iss Salomón s');
INSERT INTO public.dt_pais VALUES (2257, 'Isra');
INSERT INTO public.dt_pais VALUES (2258, 'Italia');
INSERT INTO public.dt_pais VALUES (2259, 'Jamaica');
INSERT INTO public.dt_pais VALUES (2260, 'Japón');
INSERT INTO public.dt_pais VALUES (2261, 'Jordania');
INSERT INTO public.dt_pais VALUES (2262, 'Kazajstán');
INSERT INTO public.dt_pais VALUES (2263, 'Kenya');
INSERT INTO public.dt_pais VALUES (2264, 'Kirguistán');
INSERT INTO public.dt_pais VALUES (2265, 'Kiribati');
INSERT INTO public.dt_pais VALUES (2266, 'Kuwait');
INSERT INTO public.dt_pais VALUES (2267, 'Lesotho');
INSERT INTO public.dt_pais VALUES (2268, 'Letonia');
INSERT INTO public.dt_pais VALUES (2269, 'Líbano');
INSERT INTO public.dt_pais VALUES (2270, 'Liberia');
INSERT INTO public.dt_pais VALUES (2271, 'Libia');
INSERT INTO public.dt_pais VALUES (2272, 'Liechtenstein');
INSERT INTO public.dt_pais VALUES (2273, 'Lituania');
INSERT INTO public.dt_pais VALUES (2274, 'Luxemburgo');
INSERT INTO public.dt_pais VALUES (2275, 'Madagascar');
INSERT INTO public.dt_pais VALUES (2276, 'Masia');
INSERT INTO public.dt_pais VALUES (2277, 'Mawi');
INSERT INTO public.dt_pais VALUES (2278, 'Maldivas');
INSERT INTO public.dt_pais VALUES (2279, 'Malí');
INSERT INTO public.dt_pais VALUES (2280, 'Malta');
INSERT INTO public.dt_pais VALUES (2281, 'Marruecos');
INSERT INTO public.dt_pais VALUES (2282, 'Mauricio');
INSERT INTO public.dt_pais VALUES (2283, 'Mauritania');
INSERT INTO public.dt_pais VALUES (2284, 'México');
INSERT INTO public.dt_pais VALUES (2285, 'Micronesia Estados Federados de');
INSERT INTO public.dt_pais VALUES (2286, 'Mónaco');
INSERT INTO public.dt_pais VALUES (2287, 'Mongolia');
INSERT INTO public.dt_pais VALUES (2288, 'Montenegro');
INSERT INTO public.dt_pais VALUES (2289, 'Mozambique');
INSERT INTO public.dt_pais VALUES (2290, 'Myanmar');
INSERT INTO public.dt_pais VALUES (2291, 'Namibia');
INSERT INTO public.dt_pais VALUES (2292, 'Nauru');
INSERT INTO public.dt_pais VALUES (2293, 'Nepal');
INSERT INTO public.dt_pais VALUES (2294, 'Nicaragua');
INSERT INTO public.dt_pais VALUES (2295, 'Níger');
INSERT INTO public.dt_pais VALUES (2296, 'Nigeria');
INSERT INTO public.dt_pais VALUES (2297, 'Niue');
INSERT INTO public.dt_pais VALUES (2298, 'Noruega');
INSERT INTO public.dt_pais VALUES (2299, 'Nueva Zandia');
INSERT INTO public.dt_pais VALUES (2300, 'Omán');
INSERT INTO public.dt_pais VALUES (2301, 'Países Bajos');
INSERT INTO public.dt_pais VALUES (2302, 'Pakistán');
INSERT INTO public.dt_pais VALUES (2303, 'Pau');
INSERT INTO public.dt_pais VALUES (2304, 'Panamá');
INSERT INTO public.dt_pais VALUES (2305, 'Papua Nueva Guinea');
INSERT INTO public.dt_pais VALUES (2306, 'Paraguay');
INSERT INTO public.dt_pais VALUES (2307, 'Perú');
INSERT INTO public.dt_pais VALUES (2308, 'Polonia');
INSERT INTO public.dt_pais VALUES (2309, 'Portugal');
INSERT INTO public.dt_pais VALUES (2310, 'Qatar');
INSERT INTO public.dt_pais VALUES (2311, 'Reino Unido de Gran Bretaña e Irnda d Norte');
INSERT INTO public.dt_pais VALUES (2312, 'República Árabe Siria');
INSERT INTO public.dt_pais VALUES (2313, 'República Centroafricana');
INSERT INTO public.dt_pais VALUES (2314, 'República de Corea');
INSERT INTO public.dt_pais VALUES (2315, 'República de Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (2316, 'Nombre corto: Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (2317, 'República de Moldova');
INSERT INTO public.dt_pais VALUES (2318, 'República Democrática d Congo');
INSERT INTO public.dt_pais VALUES (2319, 'República Democrática Popur o');
INSERT INTO public.dt_pais VALUES (2320, 'República Dominicana');
INSERT INTO public.dt_pais VALUES (2321, 'República Popur Democrática de Corea');
INSERT INTO public.dt_pais VALUES (2322, 'República Unida de Tanzanía');
INSERT INTO public.dt_pais VALUES (2323, 'Rumania');
INSERT INTO public.dt_pais VALUES (2324, 'Rwanda');
INSERT INTO public.dt_pais VALUES (2325, 'Saint Kitts y Nevis');
INSERT INTO public.dt_pais VALUES (2326, 'Samoa');
INSERT INTO public.dt_pais VALUES (2327, 'San Marino');
INSERT INTO public.dt_pais VALUES (2328, 'San Vicente y s Granadinas');
INSERT INTO public.dt_pais VALUES (2329, 'Santa Lucía');
INSERT INTO public.dt_pais VALUES (2330, 'Santa Sede');
INSERT INTO public.dt_pais VALUES (2331, 'Santo Tomé y Príncipe');
INSERT INTO public.dt_pais VALUES (2332, 'Senegal');
INSERT INTO public.dt_pais VALUES (2333, 'Serbia');
INSERT INTO public.dt_pais VALUES (2334, 'Seychles');
INSERT INTO public.dt_pais VALUES (2335, 'Sierra Leona');
INSERT INTO public.dt_pais VALUES (2336, 'Singapur');
INSERT INTO public.dt_pais VALUES (2337, 'Somalia');
INSERT INTO public.dt_pais VALUES (2338, 'Sri nka');
INSERT INTO public.dt_pais VALUES (2339, 'Sudáfrica');
INSERT INTO public.dt_pais VALUES (2340, 'Sudán');
INSERT INTO public.dt_pais VALUES (2341, 'Sudán d Sur');
INSERT INTO public.dt_pais VALUES (2342, 'Suecia');
INSERT INTO public.dt_pais VALUES (2343, 'Suiza');
INSERT INTO public.dt_pais VALUES (2344, 'Suriname');
INSERT INTO public.dt_pais VALUES (2345, 'Taindia');
INSERT INTO public.dt_pais VALUES (2346, 'Tayikistán');
INSERT INTO public.dt_pais VALUES (2347, 'Timor-Leste');
INSERT INTO public.dt_pais VALUES (2348, 'Togo');
INSERT INTO public.dt_pais VALUES (2349, 'Tonga');
INSERT INTO public.dt_pais VALUES (2350, 'Trinidad y Tabago');
INSERT INTO public.dt_pais VALUES (2351, 'Túnez');
INSERT INTO public.dt_pais VALUES (2352, 'Turkmenistán');
INSERT INTO public.dt_pais VALUES (2353, 'Turquía');
INSERT INTO public.dt_pais VALUES (2354, 'Tuvalu');
INSERT INTO public.dt_pais VALUES (2355, 'Ucrania');
INSERT INTO public.dt_pais VALUES (2356, 'Uganda');
INSERT INTO public.dt_pais VALUES (2357, 'Uruguay');
INSERT INTO public.dt_pais VALUES (2358, 'Uzbekistán');
INSERT INTO public.dt_pais VALUES (2359, 'Vanuatu');
INSERT INTO public.dt_pais VALUES (2360, 'Venezua República Bolivariana de');
INSERT INTO public.dt_pais VALUES (2361, 'Viet Nam');
INSERT INTO public.dt_pais VALUES (2362, 'Yemen');
INSERT INTO public.dt_pais VALUES (2363, 'Zambia');
INSERT INTO public.dt_pais VALUES (2364, 'Zimbabwe');
INSERT INTO public.dt_pais VALUES (2365, 'Afganistán');
INSERT INTO public.dt_pais VALUES (2366, 'Albania');
INSERT INTO public.dt_pais VALUES (2367, 'Alemania');
INSERT INTO public.dt_pais VALUES (2368, 'Andorra');
INSERT INTO public.dt_pais VALUES (2369, 'Ango');
INSERT INTO public.dt_pais VALUES (2370, 'Antigua y Barbuda');
INSERT INTO public.dt_pais VALUES (2371, 'Arabia Saudita');
INSERT INTO public.dt_pais VALUES (2372, 'Argia');
INSERT INTO public.dt_pais VALUES (2373, 'Argentina');
INSERT INTO public.dt_pais VALUES (2374, 'Armenia');
INSERT INTO public.dt_pais VALUES (2375, 'Australia');
INSERT INTO public.dt_pais VALUES (2376, 'Austria');
INSERT INTO public.dt_pais VALUES (2377, 'Azerbaiyán');
INSERT INTO public.dt_pais VALUES (2378, 'Bahamas s');
INSERT INTO public.dt_pais VALUES (2379, 'Bahrein');
INSERT INTO public.dt_pais VALUES (2380, 'Bangdesh');
INSERT INTO public.dt_pais VALUES (2381, 'Barbados');
INSERT INTO public.dt_pais VALUES (2382, 'Barús');
INSERT INTO public.dt_pais VALUES (2383, 'Bélgica');
INSERT INTO public.dt_pais VALUES (2384, 'Bice');
INSERT INTO public.dt_pais VALUES (2385, 'Benin');
INSERT INTO public.dt_pais VALUES (2386, 'Bhután');
INSERT INTO public.dt_pais VALUES (2387, 'Bolivia Estado Plurinacional de');
INSERT INTO public.dt_pais VALUES (2388, 'Bosnia y Herzegovina');
INSERT INTO public.dt_pais VALUES (2389, 'Botswana');
INSERT INTO public.dt_pais VALUES (2390, 'Brasil');
INSERT INTO public.dt_pais VALUES (2391, 'Brunei Darussam');
INSERT INTO public.dt_pais VALUES (2392, 'Bulgaria');
INSERT INTO public.dt_pais VALUES (2393, 'Burkina Faso');
INSERT INTO public.dt_pais VALUES (2394, 'Burundi');
INSERT INTO public.dt_pais VALUES (2395, 'Cabo Verde');
INSERT INTO public.dt_pais VALUES (2396, 'Camboya');
INSERT INTO public.dt_pais VALUES (2397, 'Camerún');
INSERT INTO public.dt_pais VALUES (2398, 'Canadá');
INSERT INTO public.dt_pais VALUES (2399, 'Chad');
INSERT INTO public.dt_pais VALUES (2400, 'Chequia');
INSERT INTO public.dt_pais VALUES (2401, 'Chile');
INSERT INTO public.dt_pais VALUES (2402, 'China');
INSERT INTO public.dt_pais VALUES (2403, 'Chipre');
INSERT INTO public.dt_pais VALUES (2404, 'Colombia');
INSERT INTO public.dt_pais VALUES (2405, 'Comoras s');
INSERT INTO public.dt_pais VALUES (2406, 'Congo');
INSERT INTO public.dt_pais VALUES (2407, 'Costa Rica');
INSERT INTO public.dt_pais VALUES (2408, 'Côte d’Ivoire');
INSERT INTO public.dt_pais VALUES (2409, 'Croacia');
INSERT INTO public.dt_pais VALUES (2410, 'Cuba');
INSERT INTO public.dt_pais VALUES (2411, 'Dinamarca');
INSERT INTO public.dt_pais VALUES (2412, 'Djibouti');
INSERT INTO public.dt_pais VALUES (2413, 'Dominica');
INSERT INTO public.dt_pais VALUES (2414, 'Ecuador');
INSERT INTO public.dt_pais VALUES (2415, 'Egipto');
INSERT INTO public.dt_pais VALUES (2416, ' Salvador');
INSERT INTO public.dt_pais VALUES (2417, 'Emiratos Árabes Unidos');
INSERT INTO public.dt_pais VALUES (2418, 'Eritrea');
INSERT INTO public.dt_pais VALUES (2419, 'Eslovaquia');
INSERT INTO public.dt_pais VALUES (2420, 'Eslovenia');
INSERT INTO public.dt_pais VALUES (2421, 'España');
INSERT INTO public.dt_pais VALUES (2422, 'Estados Unidos de América');
INSERT INTO public.dt_pais VALUES (2423, 'Estonia');
INSERT INTO public.dt_pais VALUES (2424, 'Eswatini');
INSERT INTO public.dt_pais VALUES (2425, 'Etiopía');
INSERT INTO public.dt_pais VALUES (2426, 'Federación de Rusia');
INSERT INTO public.dt_pais VALUES (2427, 'Fiji');
INSERT INTO public.dt_pais VALUES (2428, 'Filipinas');
INSERT INTO public.dt_pais VALUES (2429, 'Finndia');
INSERT INTO public.dt_pais VALUES (2430, 'Francia');
INSERT INTO public.dt_pais VALUES (2431, 'Gabón');
INSERT INTO public.dt_pais VALUES (2432, 'Gambia');
INSERT INTO public.dt_pais VALUES (2433, 'Georgia');
INSERT INTO public.dt_pais VALUES (2434, 'Ghana');
INSERT INTO public.dt_pais VALUES (2435, 'Granada');
INSERT INTO public.dt_pais VALUES (2436, 'Grecia');
INSERT INTO public.dt_pais VALUES (2437, 'Guatema');
INSERT INTO public.dt_pais VALUES (2438, 'Guinea');
INSERT INTO public.dt_pais VALUES (2439, 'Guinea Ecuatorial');
INSERT INTO public.dt_pais VALUES (2440, 'Guinea-Bissau');
INSERT INTO public.dt_pais VALUES (2441, 'Guyana');
INSERT INTO public.dt_pais VALUES (2442, 'Haití');
INSERT INTO public.dt_pais VALUES (2443, 'Honduras');
INSERT INTO public.dt_pais VALUES (2444, 'Hungría');
INSERT INTO public.dt_pais VALUES (2445, 'India');
INSERT INTO public.dt_pais VALUES (2446, 'Indonesia');
INSERT INTO public.dt_pais VALUES (2447, 'Irán República Islámica d');
INSERT INTO public.dt_pais VALUES (2448, 'Iraq');
INSERT INTO public.dt_pais VALUES (2449, 'Irnda');
INSERT INTO public.dt_pais VALUES (2450, 'Isndia');
INSERT INTO public.dt_pais VALUES (2451, 'Iss Cook s');
INSERT INTO public.dt_pais VALUES (2452, 'Iss Marshall s');
INSERT INTO public.dt_pais VALUES (2453, 'Iss Salomón s');
INSERT INTO public.dt_pais VALUES (2454, 'Isra');
INSERT INTO public.dt_pais VALUES (2455, 'Italia');
INSERT INTO public.dt_pais VALUES (2456, 'Jamaica');
INSERT INTO public.dt_pais VALUES (2457, 'Japón');
INSERT INTO public.dt_pais VALUES (2458, 'Jordania');
INSERT INTO public.dt_pais VALUES (2459, 'Kazajstán');
INSERT INTO public.dt_pais VALUES (2460, 'Kenya');
INSERT INTO public.dt_pais VALUES (2461, 'Kirguistán');
INSERT INTO public.dt_pais VALUES (2462, 'Kiribati');
INSERT INTO public.dt_pais VALUES (2463, 'Kuwait');
INSERT INTO public.dt_pais VALUES (2464, 'Lesotho');
INSERT INTO public.dt_pais VALUES (2465, 'Letonia');
INSERT INTO public.dt_pais VALUES (2466, 'Líbano');
INSERT INTO public.dt_pais VALUES (2467, 'Liberia');
INSERT INTO public.dt_pais VALUES (2468, 'Libia');
INSERT INTO public.dt_pais VALUES (2469, 'Liechtenstein');
INSERT INTO public.dt_pais VALUES (2470, 'Lituania');
INSERT INTO public.dt_pais VALUES (2471, 'Luxemburgo');
INSERT INTO public.dt_pais VALUES (2472, 'Madagascar');
INSERT INTO public.dt_pais VALUES (2473, 'Masia');
INSERT INTO public.dt_pais VALUES (2474, 'Mawi');
INSERT INTO public.dt_pais VALUES (2475, 'Maldivas');
INSERT INTO public.dt_pais VALUES (2476, 'Malí');
INSERT INTO public.dt_pais VALUES (2477, 'Malta');
INSERT INTO public.dt_pais VALUES (2478, 'Marruecos');
INSERT INTO public.dt_pais VALUES (2479, 'Mauricio');
INSERT INTO public.dt_pais VALUES (2480, 'Mauritania');
INSERT INTO public.dt_pais VALUES (2481, 'México');
INSERT INTO public.dt_pais VALUES (2482, 'Micronesia Estados Federados de');
INSERT INTO public.dt_pais VALUES (2483, 'Mónaco');
INSERT INTO public.dt_pais VALUES (2484, 'Mongolia');
INSERT INTO public.dt_pais VALUES (2485, 'Montenegro');
INSERT INTO public.dt_pais VALUES (2486, 'Mozambique');
INSERT INTO public.dt_pais VALUES (2487, 'Myanmar');
INSERT INTO public.dt_pais VALUES (2488, 'Namibia');
INSERT INTO public.dt_pais VALUES (2489, 'Nauru');
INSERT INTO public.dt_pais VALUES (2490, 'Nepal');
INSERT INTO public.dt_pais VALUES (2491, 'Nicaragua');
INSERT INTO public.dt_pais VALUES (2492, 'Níger');
INSERT INTO public.dt_pais VALUES (2493, 'Nigeria');
INSERT INTO public.dt_pais VALUES (2494, 'Niue');
INSERT INTO public.dt_pais VALUES (2495, 'Noruega');
INSERT INTO public.dt_pais VALUES (2496, 'Nueva Zandia');
INSERT INTO public.dt_pais VALUES (2497, 'Omán');
INSERT INTO public.dt_pais VALUES (2498, 'Países Bajos');
INSERT INTO public.dt_pais VALUES (2499, 'Pakistán');
INSERT INTO public.dt_pais VALUES (2500, 'Pau');
INSERT INTO public.dt_pais VALUES (2501, 'Panamá');
INSERT INTO public.dt_pais VALUES (2502, 'Papua Nueva Guinea');
INSERT INTO public.dt_pais VALUES (2503, 'Paraguay');
INSERT INTO public.dt_pais VALUES (2504, 'Perú');
INSERT INTO public.dt_pais VALUES (2505, 'Polonia');
INSERT INTO public.dt_pais VALUES (2506, 'Portugal');
INSERT INTO public.dt_pais VALUES (2507, 'Qatar');
INSERT INTO public.dt_pais VALUES (2508, 'Reino Unido de Gran Bretaña e Irnda d Norte');
INSERT INTO public.dt_pais VALUES (2509, 'República Árabe Siria');
INSERT INTO public.dt_pais VALUES (2510, 'República Centroafricana');
INSERT INTO public.dt_pais VALUES (2511, 'República de Corea');
INSERT INTO public.dt_pais VALUES (2512, 'República de Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (2513, 'Nombre corto: Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (2514, 'República de Moldova');
INSERT INTO public.dt_pais VALUES (2515, 'República Democrática d Congo');
INSERT INTO public.dt_pais VALUES (2516, 'República Democrática Popur o');
INSERT INTO public.dt_pais VALUES (2517, 'República Dominicana');
INSERT INTO public.dt_pais VALUES (2518, 'República Popur Democrática de Corea');
INSERT INTO public.dt_pais VALUES (2519, 'República Unida de Tanzanía');
INSERT INTO public.dt_pais VALUES (2520, 'Rumania');
INSERT INTO public.dt_pais VALUES (2521, 'Rwanda');
INSERT INTO public.dt_pais VALUES (2522, 'Saint Kitts y Nevis');
INSERT INTO public.dt_pais VALUES (2523, 'Samoa');
INSERT INTO public.dt_pais VALUES (2524, 'San Marino');
INSERT INTO public.dt_pais VALUES (2525, 'San Vicente y s Granadinas');
INSERT INTO public.dt_pais VALUES (2526, 'Santa Lucía');
INSERT INTO public.dt_pais VALUES (2527, 'Santa Sede');
INSERT INTO public.dt_pais VALUES (2528, 'Santo Tomé y Príncipe');
INSERT INTO public.dt_pais VALUES (2529, 'Senegal');
INSERT INTO public.dt_pais VALUES (2530, 'Serbia');
INSERT INTO public.dt_pais VALUES (2531, 'Seychles');
INSERT INTO public.dt_pais VALUES (2532, 'Sierra Leona');
INSERT INTO public.dt_pais VALUES (2533, 'Singapur');
INSERT INTO public.dt_pais VALUES (2534, 'Somalia');
INSERT INTO public.dt_pais VALUES (2535, 'Sri nka');
INSERT INTO public.dt_pais VALUES (2536, 'Sudáfrica');
INSERT INTO public.dt_pais VALUES (2537, 'Sudán');
INSERT INTO public.dt_pais VALUES (2538, 'Sudán d Sur');
INSERT INTO public.dt_pais VALUES (2539, 'Suecia');
INSERT INTO public.dt_pais VALUES (2540, 'Suiza');
INSERT INTO public.dt_pais VALUES (2541, 'Suriname');
INSERT INTO public.dt_pais VALUES (2542, 'Taindia');
INSERT INTO public.dt_pais VALUES (2543, 'Tayikistán');
INSERT INTO public.dt_pais VALUES (2544, 'Timor-Leste');
INSERT INTO public.dt_pais VALUES (2545, 'Togo');
INSERT INTO public.dt_pais VALUES (2546, 'Tonga');
INSERT INTO public.dt_pais VALUES (2547, 'Trinidad y Tabago');
INSERT INTO public.dt_pais VALUES (2548, 'Túnez');
INSERT INTO public.dt_pais VALUES (2549, 'Turkmenistán');
INSERT INTO public.dt_pais VALUES (2550, 'Turquía');
INSERT INTO public.dt_pais VALUES (2551, 'Tuvalu');
INSERT INTO public.dt_pais VALUES (2552, 'Ucrania');
INSERT INTO public.dt_pais VALUES (2553, 'Uganda');
INSERT INTO public.dt_pais VALUES (2554, 'Uruguay');
INSERT INTO public.dt_pais VALUES (2555, 'Uzbekistán');
INSERT INTO public.dt_pais VALUES (2556, 'Vanuatu');
INSERT INTO public.dt_pais VALUES (2557, 'Venezua República Bolivariana de');
INSERT INTO public.dt_pais VALUES (2558, 'Viet Nam');
INSERT INTO public.dt_pais VALUES (2559, 'Yemen');
INSERT INTO public.dt_pais VALUES (2560, 'Zambia');
INSERT INTO public.dt_pais VALUES (2561, 'Zimbabwe');
INSERT INTO public.dt_pais VALUES (2562, 'Afganistán');
INSERT INTO public.dt_pais VALUES (2563, 'Albania');
INSERT INTO public.dt_pais VALUES (2564, 'Alemania');
INSERT INTO public.dt_pais VALUES (2565, 'Andorra');
INSERT INTO public.dt_pais VALUES (2566, 'Ango');
INSERT INTO public.dt_pais VALUES (2567, 'Antigua y Barbuda');
INSERT INTO public.dt_pais VALUES (2568, 'Arabia Saudita');
INSERT INTO public.dt_pais VALUES (2569, 'Argia');
INSERT INTO public.dt_pais VALUES (2570, 'Argentina');
INSERT INTO public.dt_pais VALUES (2571, 'Armenia');
INSERT INTO public.dt_pais VALUES (2572, 'Australia');
INSERT INTO public.dt_pais VALUES (2573, 'Austria');
INSERT INTO public.dt_pais VALUES (2574, 'Azerbaiyán');
INSERT INTO public.dt_pais VALUES (2575, 'Bahamas s');
INSERT INTO public.dt_pais VALUES (2576, 'Bahrein');
INSERT INTO public.dt_pais VALUES (2577, 'Bangdesh');
INSERT INTO public.dt_pais VALUES (2578, 'Barbados');
INSERT INTO public.dt_pais VALUES (2579, 'Barús');
INSERT INTO public.dt_pais VALUES (2580, 'Bélgica');
INSERT INTO public.dt_pais VALUES (2581, 'Bice');
INSERT INTO public.dt_pais VALUES (2582, 'Benin');
INSERT INTO public.dt_pais VALUES (2583, 'Bhután');
INSERT INTO public.dt_pais VALUES (2584, 'Bolivia Estado Plurinacional de');
INSERT INTO public.dt_pais VALUES (2585, 'Bosnia y Herzegovina');
INSERT INTO public.dt_pais VALUES (2586, 'Botswana');
INSERT INTO public.dt_pais VALUES (2587, 'Brasil');
INSERT INTO public.dt_pais VALUES (2588, 'Brunei Darussam');
INSERT INTO public.dt_pais VALUES (2589, 'Bulgaria');
INSERT INTO public.dt_pais VALUES (2590, 'Burkina Faso');
INSERT INTO public.dt_pais VALUES (2591, 'Burundi');
INSERT INTO public.dt_pais VALUES (2592, 'Cabo Verde');
INSERT INTO public.dt_pais VALUES (2593, 'Camboya');
INSERT INTO public.dt_pais VALUES (2594, 'Camerún');
INSERT INTO public.dt_pais VALUES (2595, 'Canadá');
INSERT INTO public.dt_pais VALUES (2596, 'Chad');
INSERT INTO public.dt_pais VALUES (2597, 'Chequia');
INSERT INTO public.dt_pais VALUES (2598, 'Chile');
INSERT INTO public.dt_pais VALUES (2599, 'China');
INSERT INTO public.dt_pais VALUES (2600, 'Chipre');
INSERT INTO public.dt_pais VALUES (2601, 'Colombia');
INSERT INTO public.dt_pais VALUES (2602, 'Comoras s');
INSERT INTO public.dt_pais VALUES (2603, 'Congo');
INSERT INTO public.dt_pais VALUES (2604, 'Costa Rica');
INSERT INTO public.dt_pais VALUES (2605, 'Côte d’Ivoire');
INSERT INTO public.dt_pais VALUES (2606, 'Croacia');
INSERT INTO public.dt_pais VALUES (2607, 'Cuba');
INSERT INTO public.dt_pais VALUES (2608, 'Dinamarca');
INSERT INTO public.dt_pais VALUES (2609, 'Djibouti');
INSERT INTO public.dt_pais VALUES (2610, 'Dominica');
INSERT INTO public.dt_pais VALUES (2611, 'Ecuador');
INSERT INTO public.dt_pais VALUES (2612, 'Egipto');
INSERT INTO public.dt_pais VALUES (2613, ' Salvador');
INSERT INTO public.dt_pais VALUES (2614, 'Emiratos Árabes Unidos');
INSERT INTO public.dt_pais VALUES (2615, 'Eritrea');
INSERT INTO public.dt_pais VALUES (2616, 'Eslovaquia');
INSERT INTO public.dt_pais VALUES (2617, 'Eslovenia');
INSERT INTO public.dt_pais VALUES (2618, 'España');
INSERT INTO public.dt_pais VALUES (2619, 'Estados Unidos de América');
INSERT INTO public.dt_pais VALUES (2620, 'Estonia');
INSERT INTO public.dt_pais VALUES (2621, 'Eswatini');
INSERT INTO public.dt_pais VALUES (2622, 'Etiopía');
INSERT INTO public.dt_pais VALUES (2623, 'Federación de Rusia');
INSERT INTO public.dt_pais VALUES (2624, 'Fiji');
INSERT INTO public.dt_pais VALUES (2625, 'Filipinas');
INSERT INTO public.dt_pais VALUES (2626, 'Finndia');
INSERT INTO public.dt_pais VALUES (2627, 'Francia');
INSERT INTO public.dt_pais VALUES (2628, 'Gabón');
INSERT INTO public.dt_pais VALUES (2629, 'Gambia');
INSERT INTO public.dt_pais VALUES (2630, 'Georgia');
INSERT INTO public.dt_pais VALUES (2631, 'Ghana');
INSERT INTO public.dt_pais VALUES (2632, 'Granada');
INSERT INTO public.dt_pais VALUES (2633, 'Grecia');
INSERT INTO public.dt_pais VALUES (2634, 'Guatema');
INSERT INTO public.dt_pais VALUES (2635, 'Guinea');
INSERT INTO public.dt_pais VALUES (2636, 'Guinea Ecuatorial');
INSERT INTO public.dt_pais VALUES (2637, 'Guinea-Bissau');
INSERT INTO public.dt_pais VALUES (2638, 'Guyana');
INSERT INTO public.dt_pais VALUES (2639, 'Haití');
INSERT INTO public.dt_pais VALUES (2640, 'Honduras');
INSERT INTO public.dt_pais VALUES (2641, 'Hungría');
INSERT INTO public.dt_pais VALUES (2642, 'India');
INSERT INTO public.dt_pais VALUES (2643, 'Indonesia');
INSERT INTO public.dt_pais VALUES (2644, 'Irán República Islámica d');
INSERT INTO public.dt_pais VALUES (2645, 'Iraq');
INSERT INTO public.dt_pais VALUES (2646, 'Irnda');
INSERT INTO public.dt_pais VALUES (2647, 'Isndia');
INSERT INTO public.dt_pais VALUES (2648, 'Iss Cook s');
INSERT INTO public.dt_pais VALUES (2649, 'Iss Marshall s');
INSERT INTO public.dt_pais VALUES (2650, 'Iss Salomón s');
INSERT INTO public.dt_pais VALUES (2651, 'Isra');
INSERT INTO public.dt_pais VALUES (2652, 'Italia');
INSERT INTO public.dt_pais VALUES (2653, 'Jamaica');
INSERT INTO public.dt_pais VALUES (2654, 'Japón');
INSERT INTO public.dt_pais VALUES (2655, 'Jordania');
INSERT INTO public.dt_pais VALUES (2656, 'Kazajstán');
INSERT INTO public.dt_pais VALUES (2657, 'Kenya');
INSERT INTO public.dt_pais VALUES (2658, 'Kirguistán');
INSERT INTO public.dt_pais VALUES (2659, 'Kiribati');
INSERT INTO public.dt_pais VALUES (2660, 'Kuwait');
INSERT INTO public.dt_pais VALUES (2661, 'Lesotho');
INSERT INTO public.dt_pais VALUES (2662, 'Letonia');
INSERT INTO public.dt_pais VALUES (2663, 'Líbano');
INSERT INTO public.dt_pais VALUES (2664, 'Liberia');
INSERT INTO public.dt_pais VALUES (2665, 'Libia');
INSERT INTO public.dt_pais VALUES (2666, 'Liechtenstein');
INSERT INTO public.dt_pais VALUES (2667, 'Lituania');
INSERT INTO public.dt_pais VALUES (2668, 'Luxemburgo');
INSERT INTO public.dt_pais VALUES (2669, 'Madagascar');
INSERT INTO public.dt_pais VALUES (2670, 'Masia');
INSERT INTO public.dt_pais VALUES (2671, 'Mawi');
INSERT INTO public.dt_pais VALUES (2672, 'Maldivas');
INSERT INTO public.dt_pais VALUES (2673, 'Malí');
INSERT INTO public.dt_pais VALUES (2674, 'Malta');
INSERT INTO public.dt_pais VALUES (2675, 'Marruecos');
INSERT INTO public.dt_pais VALUES (2676, 'Mauricio');
INSERT INTO public.dt_pais VALUES (2677, 'Mauritania');
INSERT INTO public.dt_pais VALUES (2678, 'México');
INSERT INTO public.dt_pais VALUES (2679, 'Micronesia Estados Federados de');
INSERT INTO public.dt_pais VALUES (2680, 'Mónaco');
INSERT INTO public.dt_pais VALUES (2681, 'Mongolia');
INSERT INTO public.dt_pais VALUES (2682, 'Montenegro');
INSERT INTO public.dt_pais VALUES (2683, 'Mozambique');
INSERT INTO public.dt_pais VALUES (2684, 'Myanmar');
INSERT INTO public.dt_pais VALUES (2685, 'Namibia');
INSERT INTO public.dt_pais VALUES (2686, 'Nauru');
INSERT INTO public.dt_pais VALUES (2687, 'Nepal');
INSERT INTO public.dt_pais VALUES (2688, 'Nicaragua');
INSERT INTO public.dt_pais VALUES (2689, 'Níger');
INSERT INTO public.dt_pais VALUES (2690, 'Nigeria');
INSERT INTO public.dt_pais VALUES (2691, 'Niue');
INSERT INTO public.dt_pais VALUES (2692, 'Noruega');
INSERT INTO public.dt_pais VALUES (2693, 'Nueva Zandia');
INSERT INTO public.dt_pais VALUES (2694, 'Omán');
INSERT INTO public.dt_pais VALUES (2695, 'Países Bajos');
INSERT INTO public.dt_pais VALUES (2696, 'Pakistán');
INSERT INTO public.dt_pais VALUES (2697, 'Pau');
INSERT INTO public.dt_pais VALUES (2698, 'Panamá');
INSERT INTO public.dt_pais VALUES (2699, 'Papua Nueva Guinea');
INSERT INTO public.dt_pais VALUES (2700, 'Paraguay');
INSERT INTO public.dt_pais VALUES (2701, 'Perú');
INSERT INTO public.dt_pais VALUES (2702, 'Polonia');
INSERT INTO public.dt_pais VALUES (2703, 'Portugal');
INSERT INTO public.dt_pais VALUES (2704, 'Qatar');
INSERT INTO public.dt_pais VALUES (2705, 'Reino Unido de Gran Bretaña e Irnda d Norte');
INSERT INTO public.dt_pais VALUES (2706, 'República Árabe Siria');
INSERT INTO public.dt_pais VALUES (2707, 'República Centroafricana');
INSERT INTO public.dt_pais VALUES (2708, 'República de Corea');
INSERT INTO public.dt_pais VALUES (2709, 'República de Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (2710, 'Nombre corto: Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (2711, 'República de Moldova');
INSERT INTO public.dt_pais VALUES (2712, 'República Democrática d Congo');
INSERT INTO public.dt_pais VALUES (2713, 'República Democrática Popur o');
INSERT INTO public.dt_pais VALUES (2714, 'República Dominicana');
INSERT INTO public.dt_pais VALUES (2715, 'República Popur Democrática de Corea');
INSERT INTO public.dt_pais VALUES (2716, 'República Unida de Tanzanía');
INSERT INTO public.dt_pais VALUES (2717, 'Rumania');
INSERT INTO public.dt_pais VALUES (2718, 'Rwanda');
INSERT INTO public.dt_pais VALUES (2719, 'Saint Kitts y Nevis');
INSERT INTO public.dt_pais VALUES (2720, 'Samoa');
INSERT INTO public.dt_pais VALUES (2721, 'San Marino');
INSERT INTO public.dt_pais VALUES (2722, 'San Vicente y s Granadinas');
INSERT INTO public.dt_pais VALUES (2723, 'Santa Lucía');
INSERT INTO public.dt_pais VALUES (2724, 'Santa Sede');
INSERT INTO public.dt_pais VALUES (2725, 'Santo Tomé y Príncipe');
INSERT INTO public.dt_pais VALUES (2726, 'Senegal');
INSERT INTO public.dt_pais VALUES (2727, 'Serbia');
INSERT INTO public.dt_pais VALUES (2728, 'Seychles');
INSERT INTO public.dt_pais VALUES (2729, 'Sierra Leona');
INSERT INTO public.dt_pais VALUES (2730, 'Singapur');
INSERT INTO public.dt_pais VALUES (2731, 'Somalia');
INSERT INTO public.dt_pais VALUES (2732, 'Sri nka');
INSERT INTO public.dt_pais VALUES (2733, 'Sudáfrica');
INSERT INTO public.dt_pais VALUES (2734, 'Sudán');
INSERT INTO public.dt_pais VALUES (2735, 'Sudán d Sur');
INSERT INTO public.dt_pais VALUES (2736, 'Suecia');
INSERT INTO public.dt_pais VALUES (2737, 'Suiza');
INSERT INTO public.dt_pais VALUES (2738, 'Suriname');
INSERT INTO public.dt_pais VALUES (2739, 'Taindia');
INSERT INTO public.dt_pais VALUES (2740, 'Tayikistán');
INSERT INTO public.dt_pais VALUES (2741, 'Timor-Leste');
INSERT INTO public.dt_pais VALUES (2742, 'Togo');
INSERT INTO public.dt_pais VALUES (2743, 'Tonga');
INSERT INTO public.dt_pais VALUES (2744, 'Trinidad y Tabago');
INSERT INTO public.dt_pais VALUES (2745, 'Túnez');
INSERT INTO public.dt_pais VALUES (2746, 'Turkmenistán');
INSERT INTO public.dt_pais VALUES (2747, 'Turquía');
INSERT INTO public.dt_pais VALUES (2748, 'Tuvalu');
INSERT INTO public.dt_pais VALUES (2749, 'Ucrania');
INSERT INTO public.dt_pais VALUES (2750, 'Uganda');
INSERT INTO public.dt_pais VALUES (2751, 'Uruguay');
INSERT INTO public.dt_pais VALUES (2752, 'Uzbekistán');
INSERT INTO public.dt_pais VALUES (2753, 'Vanuatu');
INSERT INTO public.dt_pais VALUES (2754, 'Venezua República Bolivariana de');
INSERT INTO public.dt_pais VALUES (2755, 'Viet Nam');
INSERT INTO public.dt_pais VALUES (2756, 'Yemen');
INSERT INTO public.dt_pais VALUES (2757, 'Zambia');
INSERT INTO public.dt_pais VALUES (2758, 'Zimbabwe');
INSERT INTO public.dt_pais VALUES (2759, 'Afganistán');
INSERT INTO public.dt_pais VALUES (2760, 'Albania');
INSERT INTO public.dt_pais VALUES (2761, 'Alemania');
INSERT INTO public.dt_pais VALUES (2762, 'Andorra');
INSERT INTO public.dt_pais VALUES (2763, 'Ango');
INSERT INTO public.dt_pais VALUES (2764, 'Antigua y Barbuda');
INSERT INTO public.dt_pais VALUES (2765, 'Arabia Saudita');
INSERT INTO public.dt_pais VALUES (2766, 'Argia');
INSERT INTO public.dt_pais VALUES (2767, 'Argentina');
INSERT INTO public.dt_pais VALUES (2768, 'Armenia');
INSERT INTO public.dt_pais VALUES (2769, 'Australia');
INSERT INTO public.dt_pais VALUES (2770, 'Austria');
INSERT INTO public.dt_pais VALUES (2771, 'Azerbaiyán');
INSERT INTO public.dt_pais VALUES (2772, 'Bahamas s');
INSERT INTO public.dt_pais VALUES (2773, 'Bahrein');
INSERT INTO public.dt_pais VALUES (2774, 'Bangdesh');
INSERT INTO public.dt_pais VALUES (2775, 'Barbados');
INSERT INTO public.dt_pais VALUES (2776, 'Barús');
INSERT INTO public.dt_pais VALUES (2777, 'Bélgica');
INSERT INTO public.dt_pais VALUES (2778, 'Bice');
INSERT INTO public.dt_pais VALUES (2779, 'Benin');
INSERT INTO public.dt_pais VALUES (2780, 'Bhután');
INSERT INTO public.dt_pais VALUES (2781, 'Bolivia Estado Plurinacional de');
INSERT INTO public.dt_pais VALUES (2782, 'Bosnia y Herzegovina');
INSERT INTO public.dt_pais VALUES (2783, 'Botswana');
INSERT INTO public.dt_pais VALUES (2784, 'Brasil');
INSERT INTO public.dt_pais VALUES (2785, 'Brunei Darussam');
INSERT INTO public.dt_pais VALUES (2786, 'Bulgaria');
INSERT INTO public.dt_pais VALUES (2787, 'Burkina Faso');
INSERT INTO public.dt_pais VALUES (2788, 'Burundi');
INSERT INTO public.dt_pais VALUES (2789, 'Cabo Verde');
INSERT INTO public.dt_pais VALUES (2790, 'Camboya');
INSERT INTO public.dt_pais VALUES (2791, 'Camerún');
INSERT INTO public.dt_pais VALUES (2792, 'Canadá');
INSERT INTO public.dt_pais VALUES (2793, 'Chad');
INSERT INTO public.dt_pais VALUES (2794, 'Chequia');
INSERT INTO public.dt_pais VALUES (2795, 'Chile');
INSERT INTO public.dt_pais VALUES (2796, 'China');
INSERT INTO public.dt_pais VALUES (2797, 'Chipre');
INSERT INTO public.dt_pais VALUES (2798, 'Colombia');
INSERT INTO public.dt_pais VALUES (2799, 'Comoras s');
INSERT INTO public.dt_pais VALUES (2800, 'Congo');
INSERT INTO public.dt_pais VALUES (2801, 'Costa Rica');
INSERT INTO public.dt_pais VALUES (2802, 'Côte d’Ivoire');
INSERT INTO public.dt_pais VALUES (2803, 'Croacia');
INSERT INTO public.dt_pais VALUES (2804, 'Cuba');
INSERT INTO public.dt_pais VALUES (2805, 'Dinamarca');
INSERT INTO public.dt_pais VALUES (2806, 'Djibouti');
INSERT INTO public.dt_pais VALUES (2807, 'Dominica');
INSERT INTO public.dt_pais VALUES (2808, 'Ecuador');
INSERT INTO public.dt_pais VALUES (2809, 'Egipto');
INSERT INTO public.dt_pais VALUES (2810, ' Salvador');
INSERT INTO public.dt_pais VALUES (2811, 'Emiratos Árabes Unidos');
INSERT INTO public.dt_pais VALUES (2812, 'Eritrea');
INSERT INTO public.dt_pais VALUES (2813, 'Eslovaquia');
INSERT INTO public.dt_pais VALUES (2814, 'Eslovenia');
INSERT INTO public.dt_pais VALUES (2815, 'España');
INSERT INTO public.dt_pais VALUES (2816, 'Estados Unidos de América');
INSERT INTO public.dt_pais VALUES (2817, 'Estonia');
INSERT INTO public.dt_pais VALUES (2818, 'Eswatini');
INSERT INTO public.dt_pais VALUES (2819, 'Etiopía');
INSERT INTO public.dt_pais VALUES (2820, 'Federación de Rusia');
INSERT INTO public.dt_pais VALUES (2821, 'Fiji');
INSERT INTO public.dt_pais VALUES (2822, 'Filipinas');
INSERT INTO public.dt_pais VALUES (2823, 'Finndia');
INSERT INTO public.dt_pais VALUES (2824, 'Francia');
INSERT INTO public.dt_pais VALUES (2825, 'Gabón');
INSERT INTO public.dt_pais VALUES (2826, 'Gambia');
INSERT INTO public.dt_pais VALUES (2827, 'Georgia');
INSERT INTO public.dt_pais VALUES (2828, 'Ghana');
INSERT INTO public.dt_pais VALUES (2829, 'Granada');
INSERT INTO public.dt_pais VALUES (2830, 'Grecia');
INSERT INTO public.dt_pais VALUES (2831, 'Guatema');
INSERT INTO public.dt_pais VALUES (2832, 'Guinea');
INSERT INTO public.dt_pais VALUES (2833, 'Guinea Ecuatorial');
INSERT INTO public.dt_pais VALUES (2834, 'Guinea-Bissau');
INSERT INTO public.dt_pais VALUES (2835, 'Guyana');
INSERT INTO public.dt_pais VALUES (2836, 'Haití');
INSERT INTO public.dt_pais VALUES (2837, 'Honduras');
INSERT INTO public.dt_pais VALUES (2838, 'Hungría');
INSERT INTO public.dt_pais VALUES (2839, 'India');
INSERT INTO public.dt_pais VALUES (2840, 'Indonesia');
INSERT INTO public.dt_pais VALUES (2841, 'Irán República Islámica d');
INSERT INTO public.dt_pais VALUES (2842, 'Iraq');
INSERT INTO public.dt_pais VALUES (2843, 'Irnda');
INSERT INTO public.dt_pais VALUES (2844, 'Isndia');
INSERT INTO public.dt_pais VALUES (2845, 'Iss Cook s');
INSERT INTO public.dt_pais VALUES (2846, 'Iss Marshall s');
INSERT INTO public.dt_pais VALUES (2847, 'Iss Salomón s');
INSERT INTO public.dt_pais VALUES (2848, 'Isra');
INSERT INTO public.dt_pais VALUES (2849, 'Italia');
INSERT INTO public.dt_pais VALUES (2850, 'Jamaica');
INSERT INTO public.dt_pais VALUES (2851, 'Japón');
INSERT INTO public.dt_pais VALUES (2852, 'Jordania');
INSERT INTO public.dt_pais VALUES (2853, 'Kazajstán');
INSERT INTO public.dt_pais VALUES (2854, 'Kenya');
INSERT INTO public.dt_pais VALUES (2855, 'Kirguistán');
INSERT INTO public.dt_pais VALUES (2856, 'Kiribati');
INSERT INTO public.dt_pais VALUES (2857, 'Kuwait');
INSERT INTO public.dt_pais VALUES (2858, 'Lesotho');
INSERT INTO public.dt_pais VALUES (2859, 'Letonia');
INSERT INTO public.dt_pais VALUES (2860, 'Líbano');
INSERT INTO public.dt_pais VALUES (2861, 'Liberia');
INSERT INTO public.dt_pais VALUES (2862, 'Libia');
INSERT INTO public.dt_pais VALUES (2863, 'Liechtenstein');
INSERT INTO public.dt_pais VALUES (2864, 'Lituania');
INSERT INTO public.dt_pais VALUES (2865, 'Luxemburgo');
INSERT INTO public.dt_pais VALUES (2866, 'Madagascar');
INSERT INTO public.dt_pais VALUES (2867, 'Masia');
INSERT INTO public.dt_pais VALUES (2868, 'Mawi');
INSERT INTO public.dt_pais VALUES (2869, 'Maldivas');
INSERT INTO public.dt_pais VALUES (2870, 'Malí');
INSERT INTO public.dt_pais VALUES (2871, 'Malta');
INSERT INTO public.dt_pais VALUES (2872, 'Marruecos');
INSERT INTO public.dt_pais VALUES (2873, 'Mauricio');
INSERT INTO public.dt_pais VALUES (2874, 'Mauritania');
INSERT INTO public.dt_pais VALUES (2875, 'México');
INSERT INTO public.dt_pais VALUES (2876, 'Micronesia Estados Federados de');
INSERT INTO public.dt_pais VALUES (2877, 'Mónaco');
INSERT INTO public.dt_pais VALUES (2878, 'Mongolia');
INSERT INTO public.dt_pais VALUES (2879, 'Montenegro');
INSERT INTO public.dt_pais VALUES (2880, 'Mozambique');
INSERT INTO public.dt_pais VALUES (2881, 'Myanmar');
INSERT INTO public.dt_pais VALUES (2882, 'Namibia');
INSERT INTO public.dt_pais VALUES (2883, 'Nauru');
INSERT INTO public.dt_pais VALUES (2884, 'Nepal');
INSERT INTO public.dt_pais VALUES (2885, 'Nicaragua');
INSERT INTO public.dt_pais VALUES (2886, 'Níger');
INSERT INTO public.dt_pais VALUES (2887, 'Nigeria');
INSERT INTO public.dt_pais VALUES (2888, 'Niue');
INSERT INTO public.dt_pais VALUES (2889, 'Noruega');
INSERT INTO public.dt_pais VALUES (2890, 'Nueva Zandia');
INSERT INTO public.dt_pais VALUES (2891, 'Omán');
INSERT INTO public.dt_pais VALUES (2892, 'Países Bajos');
INSERT INTO public.dt_pais VALUES (2893, 'Pakistán');
INSERT INTO public.dt_pais VALUES (2894, 'Pau');
INSERT INTO public.dt_pais VALUES (2895, 'Panamá');
INSERT INTO public.dt_pais VALUES (2896, 'Papua Nueva Guinea');
INSERT INTO public.dt_pais VALUES (2897, 'Paraguay');
INSERT INTO public.dt_pais VALUES (2898, 'Perú');
INSERT INTO public.dt_pais VALUES (2899, 'Polonia');
INSERT INTO public.dt_pais VALUES (2900, 'Portugal');
INSERT INTO public.dt_pais VALUES (2901, 'Qatar');
INSERT INTO public.dt_pais VALUES (2902, 'Reino Unido de Gran Bretaña e Irnda d Norte');
INSERT INTO public.dt_pais VALUES (2903, 'República Árabe Siria');
INSERT INTO public.dt_pais VALUES (2904, 'República Centroafricana');
INSERT INTO public.dt_pais VALUES (2905, 'República de Corea');
INSERT INTO public.dt_pais VALUES (2906, 'República de Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (2907, 'Nombre corto: Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (2908, 'República de Moldova');
INSERT INTO public.dt_pais VALUES (2909, 'República Democrática d Congo');
INSERT INTO public.dt_pais VALUES (2910, 'República Democrática Popur o');
INSERT INTO public.dt_pais VALUES (2911, 'República Dominicana');
INSERT INTO public.dt_pais VALUES (2912, 'República Popur Democrática de Corea');
INSERT INTO public.dt_pais VALUES (2913, 'República Unida de Tanzanía');
INSERT INTO public.dt_pais VALUES (2914, 'Rumania');
INSERT INTO public.dt_pais VALUES (2915, 'Rwanda');
INSERT INTO public.dt_pais VALUES (2916, 'Saint Kitts y Nevis');
INSERT INTO public.dt_pais VALUES (2917, 'Samoa');
INSERT INTO public.dt_pais VALUES (2918, 'San Marino');
INSERT INTO public.dt_pais VALUES (2919, 'San Vicente y s Granadinas');
INSERT INTO public.dt_pais VALUES (2920, 'Santa Lucía');
INSERT INTO public.dt_pais VALUES (2921, 'Santa Sede');
INSERT INTO public.dt_pais VALUES (2922, 'Santo Tomé y Príncipe');
INSERT INTO public.dt_pais VALUES (2923, 'Senegal');
INSERT INTO public.dt_pais VALUES (2924, 'Serbia');
INSERT INTO public.dt_pais VALUES (2925, 'Seychles');
INSERT INTO public.dt_pais VALUES (2926, 'Sierra Leona');
INSERT INTO public.dt_pais VALUES (2927, 'Singapur');
INSERT INTO public.dt_pais VALUES (2928, 'Somalia');
INSERT INTO public.dt_pais VALUES (2929, 'Sri nka');
INSERT INTO public.dt_pais VALUES (2930, 'Sudáfrica');
INSERT INTO public.dt_pais VALUES (2931, 'Sudán');
INSERT INTO public.dt_pais VALUES (2932, 'Sudán d Sur');
INSERT INTO public.dt_pais VALUES (2933, 'Suecia');
INSERT INTO public.dt_pais VALUES (2934, 'Suiza');
INSERT INTO public.dt_pais VALUES (2935, 'Suriname');
INSERT INTO public.dt_pais VALUES (2936, 'Taindia');
INSERT INTO public.dt_pais VALUES (2937, 'Tayikistán');
INSERT INTO public.dt_pais VALUES (2938, 'Timor-Leste');
INSERT INTO public.dt_pais VALUES (2939, 'Togo');
INSERT INTO public.dt_pais VALUES (2940, 'Tonga');
INSERT INTO public.dt_pais VALUES (2941, 'Trinidad y Tabago');
INSERT INTO public.dt_pais VALUES (2942, 'Túnez');
INSERT INTO public.dt_pais VALUES (2943, 'Turkmenistán');
INSERT INTO public.dt_pais VALUES (2944, 'Turquía');
INSERT INTO public.dt_pais VALUES (2945, 'Tuvalu');
INSERT INTO public.dt_pais VALUES (2946, 'Ucrania');
INSERT INTO public.dt_pais VALUES (2947, 'Uganda');
INSERT INTO public.dt_pais VALUES (2948, 'Uruguay');
INSERT INTO public.dt_pais VALUES (2949, 'Uzbekistán');
INSERT INTO public.dt_pais VALUES (2950, 'Vanuatu');
INSERT INTO public.dt_pais VALUES (2951, 'Venezua República Bolivariana de');
INSERT INTO public.dt_pais VALUES (2952, 'Viet Nam');
INSERT INTO public.dt_pais VALUES (2953, 'Yemen');
INSERT INTO public.dt_pais VALUES (2954, 'Zambia');
INSERT INTO public.dt_pais VALUES (2955, 'Zimbabwe');
INSERT INTO public.dt_pais VALUES (2956, 'Afganistán');
INSERT INTO public.dt_pais VALUES (2957, 'Albania');
INSERT INTO public.dt_pais VALUES (2958, 'Alemania');
INSERT INTO public.dt_pais VALUES (2959, 'Andorra');
INSERT INTO public.dt_pais VALUES (2960, 'Ango');
INSERT INTO public.dt_pais VALUES (2961, 'Antigua y Barbuda');
INSERT INTO public.dt_pais VALUES (2962, 'Arabia Saudita');
INSERT INTO public.dt_pais VALUES (2963, 'Argia');
INSERT INTO public.dt_pais VALUES (2964, 'Argentina');
INSERT INTO public.dt_pais VALUES (2965, 'Armenia');
INSERT INTO public.dt_pais VALUES (2966, 'Australia');
INSERT INTO public.dt_pais VALUES (2967, 'Austria');
INSERT INTO public.dt_pais VALUES (2968, 'Azerbaiyán');
INSERT INTO public.dt_pais VALUES (2969, 'Bahamas s');
INSERT INTO public.dt_pais VALUES (2970, 'Bahrein');
INSERT INTO public.dt_pais VALUES (2971, 'Bangdesh');
INSERT INTO public.dt_pais VALUES (2972, 'Barbados');
INSERT INTO public.dt_pais VALUES (2973, 'Barús');
INSERT INTO public.dt_pais VALUES (2974, 'Bélgica');
INSERT INTO public.dt_pais VALUES (2975, 'Bice');
INSERT INTO public.dt_pais VALUES (2976, 'Benin');
INSERT INTO public.dt_pais VALUES (2977, 'Bhután');
INSERT INTO public.dt_pais VALUES (2978, 'Bolivia Estado Plurinacional de');
INSERT INTO public.dt_pais VALUES (2979, 'Bosnia y Herzegovina');
INSERT INTO public.dt_pais VALUES (2980, 'Botswana');
INSERT INTO public.dt_pais VALUES (2981, 'Brasil');
INSERT INTO public.dt_pais VALUES (2982, 'Brunei Darussam');
INSERT INTO public.dt_pais VALUES (2983, 'Bulgaria');
INSERT INTO public.dt_pais VALUES (2984, 'Burkina Faso');
INSERT INTO public.dt_pais VALUES (2985, 'Burundi');
INSERT INTO public.dt_pais VALUES (2986, 'Cabo Verde');
INSERT INTO public.dt_pais VALUES (2987, 'Camboya');
INSERT INTO public.dt_pais VALUES (2988, 'Camerún');
INSERT INTO public.dt_pais VALUES (2989, 'Canadá');
INSERT INTO public.dt_pais VALUES (2990, 'Chad');
INSERT INTO public.dt_pais VALUES (2991, 'Chequia');
INSERT INTO public.dt_pais VALUES (2992, 'Chile');
INSERT INTO public.dt_pais VALUES (2993, 'China');
INSERT INTO public.dt_pais VALUES (2994, 'Chipre');
INSERT INTO public.dt_pais VALUES (2995, 'Colombia');
INSERT INTO public.dt_pais VALUES (2996, 'Comoras s');
INSERT INTO public.dt_pais VALUES (2997, 'Congo');
INSERT INTO public.dt_pais VALUES (2998, 'Costa Rica');
INSERT INTO public.dt_pais VALUES (2999, 'Côte d’Ivoire');
INSERT INTO public.dt_pais VALUES (3000, 'Croacia');
INSERT INTO public.dt_pais VALUES (3001, 'Cuba');
INSERT INTO public.dt_pais VALUES (3002, 'Dinamarca');
INSERT INTO public.dt_pais VALUES (3003, 'Djibouti');
INSERT INTO public.dt_pais VALUES (3004, 'Dominica');
INSERT INTO public.dt_pais VALUES (3005, 'Ecuador');
INSERT INTO public.dt_pais VALUES (3006, 'Egipto');
INSERT INTO public.dt_pais VALUES (3007, ' Salvador');
INSERT INTO public.dt_pais VALUES (3008, 'Emiratos Árabes Unidos');
INSERT INTO public.dt_pais VALUES (3009, 'Eritrea');
INSERT INTO public.dt_pais VALUES (3010, 'Eslovaquia');
INSERT INTO public.dt_pais VALUES (3011, 'Eslovenia');
INSERT INTO public.dt_pais VALUES (3012, 'España');
INSERT INTO public.dt_pais VALUES (3013, 'Estados Unidos de América');
INSERT INTO public.dt_pais VALUES (3014, 'Estonia');
INSERT INTO public.dt_pais VALUES (3015, 'Eswatini');
INSERT INTO public.dt_pais VALUES (3016, 'Etiopía');
INSERT INTO public.dt_pais VALUES (3017, 'Federación de Rusia');
INSERT INTO public.dt_pais VALUES (3018, 'Fiji');
INSERT INTO public.dt_pais VALUES (3019, 'Filipinas');
INSERT INTO public.dt_pais VALUES (3020, 'Finndia');
INSERT INTO public.dt_pais VALUES (3021, 'Francia');
INSERT INTO public.dt_pais VALUES (3022, 'Gabón');
INSERT INTO public.dt_pais VALUES (3023, 'Gambia');
INSERT INTO public.dt_pais VALUES (3024, 'Georgia');
INSERT INTO public.dt_pais VALUES (3025, 'Ghana');
INSERT INTO public.dt_pais VALUES (3026, 'Granada');
INSERT INTO public.dt_pais VALUES (3027, 'Grecia');
INSERT INTO public.dt_pais VALUES (3028, 'Guatema');
INSERT INTO public.dt_pais VALUES (3029, 'Guinea');
INSERT INTO public.dt_pais VALUES (3030, 'Guinea Ecuatorial');
INSERT INTO public.dt_pais VALUES (3031, 'Guinea-Bissau');
INSERT INTO public.dt_pais VALUES (3032, 'Guyana');
INSERT INTO public.dt_pais VALUES (3033, 'Haití');
INSERT INTO public.dt_pais VALUES (3034, 'Honduras');
INSERT INTO public.dt_pais VALUES (3035, 'Hungría');
INSERT INTO public.dt_pais VALUES (3036, 'India');
INSERT INTO public.dt_pais VALUES (3037, 'Indonesia');
INSERT INTO public.dt_pais VALUES (3038, 'Irán República Islámica d');
INSERT INTO public.dt_pais VALUES (3039, 'Iraq');
INSERT INTO public.dt_pais VALUES (3040, 'Irnda');
INSERT INTO public.dt_pais VALUES (3041, 'Isndia');
INSERT INTO public.dt_pais VALUES (3042, 'Iss Cook s');
INSERT INTO public.dt_pais VALUES (3043, 'Iss Marshall s');
INSERT INTO public.dt_pais VALUES (3044, 'Iss Salomón s');
INSERT INTO public.dt_pais VALUES (3045, 'Isra');
INSERT INTO public.dt_pais VALUES (3046, 'Italia');
INSERT INTO public.dt_pais VALUES (3047, 'Jamaica');
INSERT INTO public.dt_pais VALUES (3048, 'Japón');
INSERT INTO public.dt_pais VALUES (3049, 'Jordania');
INSERT INTO public.dt_pais VALUES (3050, 'Kazajstán');
INSERT INTO public.dt_pais VALUES (3051, 'Kenya');
INSERT INTO public.dt_pais VALUES (3052, 'Kirguistán');
INSERT INTO public.dt_pais VALUES (3053, 'Kiribati');
INSERT INTO public.dt_pais VALUES (3054, 'Kuwait');
INSERT INTO public.dt_pais VALUES (3055, 'Lesotho');
INSERT INTO public.dt_pais VALUES (3056, 'Letonia');
INSERT INTO public.dt_pais VALUES (3057, 'Líbano');
INSERT INTO public.dt_pais VALUES (3058, 'Liberia');
INSERT INTO public.dt_pais VALUES (3059, 'Libia');
INSERT INTO public.dt_pais VALUES (3060, 'Liechtenstein');
INSERT INTO public.dt_pais VALUES (3061, 'Lituania');
INSERT INTO public.dt_pais VALUES (3062, 'Luxemburgo');
INSERT INTO public.dt_pais VALUES (3063, 'Madagascar');
INSERT INTO public.dt_pais VALUES (3064, 'Masia');
INSERT INTO public.dt_pais VALUES (3065, 'Mawi');
INSERT INTO public.dt_pais VALUES (3066, 'Maldivas');
INSERT INTO public.dt_pais VALUES (3067, 'Malí');
INSERT INTO public.dt_pais VALUES (3068, 'Malta');
INSERT INTO public.dt_pais VALUES (3069, 'Marruecos');
INSERT INTO public.dt_pais VALUES (3070, 'Mauricio');
INSERT INTO public.dt_pais VALUES (3071, 'Mauritania');
INSERT INTO public.dt_pais VALUES (3072, 'México');
INSERT INTO public.dt_pais VALUES (3073, 'Micronesia Estados Federados de');
INSERT INTO public.dt_pais VALUES (3074, 'Mónaco');
INSERT INTO public.dt_pais VALUES (3075, 'Mongolia');
INSERT INTO public.dt_pais VALUES (3076, 'Montenegro');
INSERT INTO public.dt_pais VALUES (3077, 'Mozambique');
INSERT INTO public.dt_pais VALUES (3078, 'Myanmar');
INSERT INTO public.dt_pais VALUES (3079, 'Namibia');
INSERT INTO public.dt_pais VALUES (3080, 'Nauru');
INSERT INTO public.dt_pais VALUES (3081, 'Nepal');
INSERT INTO public.dt_pais VALUES (3082, 'Nicaragua');
INSERT INTO public.dt_pais VALUES (3083, 'Níger');
INSERT INTO public.dt_pais VALUES (3084, 'Nigeria');
INSERT INTO public.dt_pais VALUES (3085, 'Niue');
INSERT INTO public.dt_pais VALUES (3086, 'Noruega');
INSERT INTO public.dt_pais VALUES (3087, 'Nueva Zandia');
INSERT INTO public.dt_pais VALUES (3088, 'Omán');
INSERT INTO public.dt_pais VALUES (3089, 'Países Bajos');
INSERT INTO public.dt_pais VALUES (3090, 'Pakistán');
INSERT INTO public.dt_pais VALUES (3091, 'Pau');
INSERT INTO public.dt_pais VALUES (3092, 'Panamá');
INSERT INTO public.dt_pais VALUES (3093, 'Papua Nueva Guinea');
INSERT INTO public.dt_pais VALUES (3094, 'Paraguay');
INSERT INTO public.dt_pais VALUES (3095, 'Perú');
INSERT INTO public.dt_pais VALUES (3096, 'Polonia');
INSERT INTO public.dt_pais VALUES (3097, 'Portugal');
INSERT INTO public.dt_pais VALUES (3098, 'Qatar');
INSERT INTO public.dt_pais VALUES (3099, 'Reino Unido de Gran Bretaña e Irnda d Norte');
INSERT INTO public.dt_pais VALUES (3100, 'República Árabe Siria');
INSERT INTO public.dt_pais VALUES (3101, 'República Centroafricana');
INSERT INTO public.dt_pais VALUES (3102, 'República de Corea');
INSERT INTO public.dt_pais VALUES (3103, 'República de Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (3104, 'Nombre corto: Macedonia d Norte');
INSERT INTO public.dt_pais VALUES (3105, 'República de Moldova');
INSERT INTO public.dt_pais VALUES (3106, 'República Democrática d Congo');
INSERT INTO public.dt_pais VALUES (3107, 'República Democrática Popur o');
INSERT INTO public.dt_pais VALUES (3108, 'República Dominicana');
INSERT INTO public.dt_pais VALUES (3109, 'República Popur Democrática de Corea');
INSERT INTO public.dt_pais VALUES (3110, 'República Unida de Tanzanía');
INSERT INTO public.dt_pais VALUES (3111, 'Rumania');
INSERT INTO public.dt_pais VALUES (3112, 'Rwanda');
INSERT INTO public.dt_pais VALUES (3113, 'Saint Kitts y Nevis');
INSERT INTO public.dt_pais VALUES (3114, 'Samoa');
INSERT INTO public.dt_pais VALUES (3115, 'San Marino');
INSERT INTO public.dt_pais VALUES (3116, 'San Vicente y s Granadinas');
INSERT INTO public.dt_pais VALUES (3117, 'Santa Lucía');
INSERT INTO public.dt_pais VALUES (3118, 'Santa Sede');
INSERT INTO public.dt_pais VALUES (3119, 'Santo Tomé y Príncipe');
INSERT INTO public.dt_pais VALUES (3120, 'Senegal');
INSERT INTO public.dt_pais VALUES (3121, 'Serbia');
INSERT INTO public.dt_pais VALUES (3122, 'Seychles');
INSERT INTO public.dt_pais VALUES (3123, 'Sierra Leona');
INSERT INTO public.dt_pais VALUES (3124, 'Singapur');
INSERT INTO public.dt_pais VALUES (3125, 'Somalia');
INSERT INTO public.dt_pais VALUES (3126, 'Sri nka');
INSERT INTO public.dt_pais VALUES (3127, 'Sudáfrica');
INSERT INTO public.dt_pais VALUES (3128, 'Sudán');
INSERT INTO public.dt_pais VALUES (3129, 'Sudán d Sur');
INSERT INTO public.dt_pais VALUES (3130, 'Suecia');
INSERT INTO public.dt_pais VALUES (3131, 'Suiza');
INSERT INTO public.dt_pais VALUES (3132, 'Suriname');
INSERT INTO public.dt_pais VALUES (3133, 'Taindia');
INSERT INTO public.dt_pais VALUES (3134, 'Tayikistán');
INSERT INTO public.dt_pais VALUES (3135, 'Timor-Leste');
INSERT INTO public.dt_pais VALUES (3136, 'Togo');
INSERT INTO public.dt_pais VALUES (3137, 'Tonga');
INSERT INTO public.dt_pais VALUES (3138, 'Trinidad y Tabago');
INSERT INTO public.dt_pais VALUES (3139, 'Túnez');
INSERT INTO public.dt_pais VALUES (3140, 'Turkmenistán');
INSERT INTO public.dt_pais VALUES (3141, 'Turquía');
INSERT INTO public.dt_pais VALUES (3142, 'Tuvalu');
INSERT INTO public.dt_pais VALUES (3143, 'Ucrania');
INSERT INTO public.dt_pais VALUES (3144, 'Uganda');
INSERT INTO public.dt_pais VALUES (3145, 'Uruguay');
INSERT INTO public.dt_pais VALUES (3146, 'Uzbekistán');
INSERT INTO public.dt_pais VALUES (3147, 'Vanuatu');
INSERT INTO public.dt_pais VALUES (3148, 'Venezua República Bolivariana de');
INSERT INTO public.dt_pais VALUES (3149, 'Viet Nam');
INSERT INTO public.dt_pais VALUES (3150, 'Yemen');
INSERT INTO public.dt_pais VALUES (3151, 'Zambia');
INSERT INTO public.dt_pais VALUES (3152, 'Zimbabwe');


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


--
-- Data for Name: habitaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.habitaciones VALUES (101, 2, 'Desc hab 101', 500, 1, 101);
INSERT INTO public.habitaciones VALUES (102, 4, 'Desc hab 102', 1400, 2, 102);
INSERT INTO public.habitaciones VALUES (103, 1, 'Desc hab 103', 1200, 3, 103);
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


--
-- Data for Name: huesped_push_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: password_reset_token; Type: TABLE DATA; Schema: public; Owner: postgres
--



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
INSERT INTO public.reservas VALUES (380, 3, 'EJECUTADA', '2022-07-08 00:00:00', '2022-07-06 00:00:00', NULL, 351, 121, 10085);
INSERT INTO public.reservas VALUES (382, 3, 'PENDIENTE', '2022-07-18 00:00:00', '2022-07-16 00:00:00', NULL, 351, 114, 10080);
INSERT INTO public.reservas VALUES (384, 3, 'PENDIENTE', '2022-07-28 00:00:00', '2022-07-26 00:00:00', NULL, 351, 109, 10076);
INSERT INTO public.reservas VALUES (374, 10, 'RECHAZADO', '2022-07-03 00:00:00', '2022-06-24 00:00:00', NULL, 351, 125, 10085);
INSERT INTO public.reservas VALUES (367, 3, 'EJECUTADA', '2022-05-15 00:00:00', '2022-05-13 00:00:00', NULL, 367, 120, 10095);
INSERT INTO public.reservas VALUES (368, 4, 'EJECUTADA', '2022-05-22 00:00:00', '2022-05-19 00:00:00', NULL, 351, 119, 10067);
INSERT INTO public.reservas VALUES (373, 9, 'EJECUTADA', '2022-06-26 00:00:00', '2022-06-18 00:00:00', NULL, 373, 124, 10091);
INSERT INTO public.reservas VALUES (354, 5, 'EJECUTADA', '2022-03-22 00:00:00', '2022-03-18 00:00:00', NULL, 351, 122, 10053);
INSERT INTO public.reservas VALUES (360, 11, 'EJECUTADA', '2022-05-03 00:00:00', '2022-04-23 00:00:00', NULL, 351, 108, 10060);
INSERT INTO public.reservas VALUES (376, 12, 'EJECUTADA', '2022-07-17 00:00:00', '2022-07-06 00:00:00', NULL, 351, 125, 10094);
INSERT INTO public.reservas VALUES (362, 13, 'EJECUTADA', '2022-05-17 00:00:00', '2022-05-05 00:00:00', NULL, 351, 128, 10051);
INSERT INTO public.reservas VALUES (356, 7, 'APROBADO', '2022-04-05 00:00:00', '2022-03-30 00:00:00', NULL, 351, 108, 10085);
INSERT INTO public.reservas VALUES (351, 2, 'APROBADO', '2022-03-01 00:00:00', '2022-02-28 00:00:00', NULL, 351, 128, 10072);
INSERT INTO public.reservas VALUES (353, 4, 'APROBADO', '2022-03-15 00:00:00', '2022-03-12 00:00:00', NULL, 353, 126, 10080);
INSERT INTO public.reservas VALUES (355, 6, 'APROBADO', '2022-03-29 00:00:00', '2022-03-24 00:00:00', NULL, 355, 103, 10053);
INSERT INTO public.reservas VALUES (357, 8, 'APROBADO', '2022-04-12 00:00:00', '2022-04-05 00:00:00', NULL, 357, 104, 10064);
INSERT INTO public.reservas VALUES (359, 10, 'APROBADO', '2022-04-26 00:00:00', '2022-04-17 00:00:00', NULL, 359, 126, 10088);
INSERT INTO public.reservas VALUES (361, 12, 'APROBADO', '2022-05-10 00:00:00', '2022-04-29 00:00:00', NULL, 361, 103, 10055);
INSERT INTO public.reservas VALUES (363, 14, 'APROBADO', '2022-05-24 00:00:00', '2022-05-11 00:00:00', NULL, 363, 121, 10070);
INSERT INTO public.reservas VALUES (365, 1, 'APROBADO', '2022-05-01 00:00:00', '2022-05-01 00:00:00', NULL, 365, 122, 10079);
INSERT INTO public.reservas VALUES (369, 5, 'APROBADO', '2022-05-29 00:00:00', '2022-05-25 00:00:00', NULL, 369, 111, 10089);
INSERT INTO public.reservas VALUES (371, 7, 'APROBADO', '2022-06-12 00:00:00', '2022-06-06 00:00:00', NULL, 371, 107, 10051);
INSERT INTO public.reservas VALUES (375, 11, 'APROBADO', '2022-07-10 00:00:00', '2022-06-30 00:00:00', NULL, 375, 117, 10054);
INSERT INTO public.reservas VALUES (377, 13, 'APROBADO', '2022-07-24 00:00:00', '2022-07-12 00:00:00', NULL, 377, 106, 10063);
INSERT INTO public.reservas VALUES (379, 3, 'APROBADO', '2022-07-03 00:00:00', '2022-07-01 00:00:00', NULL, 379, 124, 10097);
INSERT INTO public.reservas VALUES (381, 3, 'APROBADO', '2022-07-13 00:00:00', '2022-07-11 00:00:00', NULL, 381, 109, 10079);
INSERT INTO public.reservas VALUES (383, 3, 'APROBADO', '2022-07-23 00:00:00', '2022-07-21 00:00:00', NULL, 383, 113, 10074);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios VALUES ('Ad', 1001, true, 'apeAd 1001', false, 'emailAd 1001', 'nomAd 1001', 'adPass 1001', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10073, false, 'apeHu 10073', false, 'emailHu 10073', 'nomHu 10073', 'huPass 10073', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1002, true, 'apeAd 1002', false, 'emailAd 1002', 'nomAd 1002', 'adPass 1002', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1003, true, 'apeAd 1003', false, 'emailAd 1003', 'nomAd 1003', 'adPass 1003', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1004, true, 'apeAd 1004', false, 'emailAd 1004', 'nomAd 1004', 'adPass 1004', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1005, false, 'apeAd 1005', false, 'emailAd 1005', 'nomAd 1005', 'adPass 1005', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1006, true, 'apeAd 1006', false, 'emailAd 1006', 'nomAd 1006', 'adPass 1006', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1007, true, 'apeAd 1007', true, 'emailAd 1007', 'nomAd 1007', 'adPass 1007', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1008, true, 'apeAd 1008', false, 'emailAd 1008', 'nomAd 1008', 'adPass 1008', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 1009, true, 'apeAd 1009', false, 'emailAd 1009', 'nomAd 1009', 'adPass 1009', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10010, true, 'apeAd 10010', false, 'emailAd 10010', 'nomAd 10010', 'adPass 10010', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10011, true, 'apeAd 10011', false, 'emailAd 10011', 'nomAd 10011', 'adPass 10011', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10012, true, 'apeAd 10012', false, 'emailAd 10012', 'nomAd 10012', 'adPass 10012', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10013, false, 'apeAd 10013', false, 'emailAd 10013', 'nomAd 10013', 'adPass 10013', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10014, true, 'apeAd 10014', false, 'emailAd 10014', 'nomAd 10014', 'adPass 10014', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10015, true, 'apeAd 10015', false, 'emailAd 10015', 'nomAd 10015', 'adPass 10015', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10016, true, 'apeAd 10016', false, 'emailAd 10016', 'nomAd 10016', 'adPass 10016', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10017, true, 'apeAd 10017', false, 'emailAd 10017', 'nomAd 10017', 'adPass 10017', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10018, true, 'apeAd 10018', false, 'emailAd 10018', 'nomAd 10018', 'adPass 10018', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10019, true, 'apeAd 10019', false, 'emailAd 10019', 'nomAd 10019', 'adPass 10019', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 10020, true, 'apeAd 10020', false, 'emailAd 10020', 'nomAd 10020', 'adPass 10020', 1000, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10021, true, 'apeAn 10021', false, 'emailAn 10021', 'nomAn 10021', 'anPass 10021', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10022, true, 'apeAn 10022', false, 'emailAn 10022', 'nomAn 10022', 'anPass 10022', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10023, false, 'apeAn 10023', false, 'emailAn 10023', 'nomAn 10023', 'anPass 10023', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10024, true, 'apeAn 10024', false, 'emailAn 10024', 'nomAn 10024', 'anPass 10024', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10025, true, 'apeAn 10025', false, 'emailAn 10025', 'nomAn 10025', 'anPass 10025', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10026, true, 'apeAn 10026', false, 'emailAn 10026', 'nomAn 10026', 'anPass 10026', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10027, true, 'apeAn 10027', false, 'emailAn 10027', 'nomAn 10027', 'anPass 10027', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10028, true, 'apeAn 10028', false, 'emailAn 10028', 'nomAn 10028', 'anPass 10028', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10029, true, 'apeAn 10029', false, 'emailAn 10029', 'nomAn 10029', 'anPass 10029', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10030, true, 'apeAn 10030', false, 'emailAn 10030', 'nomAn 10030', 'anPass 10030', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10032, true, 'apeAn 10032', false, 'emailAn 10032', 'nomAn 10032', 'anPass 10032', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10033, false, 'apeAn 10033', false, 'emailAn 10033', 'nomAn 10033', 'anPass 10033', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10034, true, 'apeAn 10034', false, 'emailAn 10034', 'nomAn 10034', 'anPass 10034', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10035, true, 'apeAn 10035', true, 'emailAn 10035', 'nomAn 10035', 'anPass 10035', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10036, true, 'apeAn 10036', false, 'emailAn 10036', 'nomAn 10036', 'anPass 10036', 1000, 'RECHAZADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10037, true, 'apeAn 10037', false, 'emailAn 10037', 'nomAn 10037', 'anPass 10037', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10038, true, 'apeAn 10038', true, 'emailAn 10038', 'nomAn 10038', 'anPass 10038', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10039, true, 'apeAn 10039', false, 'emailAn 10039', 'nomAn 10039', 'anPass 10039', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10040, true, 'apeAn 10040', false, 'emailAn 10040', 'nomAn 10040', 'anPass 10040', 1000, 'PENDIENTE', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10041, true, 'apeAn 10041', false, 'emailAn 10041', 'nomAn 10041', 'anPass 10041', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10042, true, 'apeAn 10042', false, 'emailAn 10042', 'nomAn 10042', 'anPass 10042', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10043, false, 'apeAn 10043', false, 'emailAn 10043', 'nomAn 10043', 'anPass 10043', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10044, true, 'apeAn 10044', false, 'emailAn 10044', 'nomAn 10044', 'anPass 10044', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10045, true, 'apeAn 10045', false, 'emailAn 10045', 'nomAn 10045', 'anPass 10045', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10046, true, 'apeAn 10046', false, 'emailAn 10046', 'nomAn 10046', 'anPass 10046', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10047, true, 'apeAn 10047', false, 'emailAn 10047', 'nomAn 10047', 'anPass 10047', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10048, true, 'apeAn 10048', false, 'emailAn 10048', 'nomAn 10048', 'anPass 10048', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10049, true, 'apeAn 10049', false, 'emailAn 10049', 'nomAn 10049', 'anPass 10049', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10050, true, 'apeAn 10050', false, 'emailAn 10050', 'nomAn 10050', 'anPass 10050', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10051, true, 'apeHu 10051', false, 'emailHu 10051', 'nomHu 10051', 'huPass 10051', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10052, true, 'apeHu 10052', false, 'emailHu 10052', 'nomHu 10052', 'huPass 10052', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10053, true, 'apeHu 10053', false, 'emailHu 10053', 'nomHu 10053', 'huPass 10053', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10054, true, 'apeHu 10054', false, 'emailHu 10054', 'nomHu 10054', 'huPass 10054', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100140, true, 'apeHu 100140', false, 'emailHu 100140', 'nomHu 100140', 'huPass 100140', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 1, true, 'string', false, 'string', 'string', 'string', 0, NULL, NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10055, true, 'apeHu 10055', false, 'emailHu 10055', 'nomHu 10055', 'huPass 10055', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10056, true, 'apeHu 10056', false, 'emailHu 10056', 'nomHu 10056', 'huPass 10056', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10057, true, 'apeHu 10057', false, 'emailHu 10057', 'nomHu 10057', 'huPass 10057', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10058, true, 'apeHu 10058', false, 'emailHu 10058', 'nomHu 10058', 'huPass 10058', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10059, true, 'apeHu 10059', false, 'emailHu 10059', 'nomHu 10059', 'huPass 10059', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10060, true, 'apeHu 10060', true, 'emailHu 10060', 'nomHu 10060', 'huPass 10060', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10061, true, 'apeHu 10061', false, 'emailHu 10061', 'nomHu 10061', 'huPass 10061', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10062, true, 'apeHu 10062', false, 'emailHu 10062', 'nomHu 10062', 'huPass 10062', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10063, true, 'apeHu 10063', false, 'emailHu 10063', 'nomHu 10063', 'huPass 10063', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10064, true, 'apeHu 10064', false, 'emailHu 10064', 'nomHu 10064', 'huPass 10064', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10065, true, 'apeHu 10065', false, 'emailHu 10065', 'nomHu 10065', 'huPass 10065', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10066, true, 'apeHu 10066', false, 'emailHu 10066', 'nomHu 10066', 'huPass 10066', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10067, false, 'apeHu 10067', false, 'emailHu 10067', 'nomHu 10067', 'huPass 10067', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10068, true, 'apeHu 10068', false, 'emailHu 10068', 'nomHu 10068', 'huPass 10068', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10069, true, 'apeHu 10069', false, 'emailHu 10069', 'nomHu 10069', 'huPass 10069', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10070, true, 'apeHu 10070', false, 'emailHu 10070', 'nomHu 10070', 'huPass 10070', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10071, true, 'apeHu 10071', false, 'emailHu 10071', 'nomHu 10071', 'huPass 10071', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10072, true, 'apeHu 10072', false, 'emailHu 10072', 'nomHu 10072', 'huPass 10072', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10074, true, 'apeHu 10074', false, 'emailHu 10074', 'nomHu 10074', 'huPass 10074', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10075, true, 'apeHu 10075', false, 'emailHu 10075', 'nomHu 10075', 'huPass 10075', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10076, true, 'apeHu 10076', false, 'emailHu 10076', 'nomHu 10076', 'huPass 10076', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10077, true, 'apeHu 10077', false, 'emailHu 10077', 'nomHu 10077', 'huPass 10077', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10078, true, 'apeHu 10078', false, 'emailHu 10078', 'nomHu 10078', 'huPass 10078', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10079, true, 'apeHu 10079', false, 'emailHu 10079', 'nomHu 10079', 'huPass 10079', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10080, true, 'apeHu 10080', false, 'emailHu 10080', 'nomHu 10080', 'huPass 10080', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10081, true, 'apeHu 10081', false, 'emailHu 10081', 'nomHu 10081', 'huPass 10081', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10082, true, 'apeHu 10082', false, 'emailHu 10082', 'nomHu 10082', 'huPass 10082', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10083, true, 'apeHu 10083', false, 'emailHu 10083', 'nomHu 10083', 'huPass 10083', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10084, true, 'apeHu 10084', true, 'emailHu 10084', 'nomHu 10084', 'huPass 10084', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10085, true, 'apeHu 10085', false, 'emailHu 10085', 'nomHu 10085', 'huPass 10085', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10086, true, 'apeHu 10086', false, 'emailHu 10086', 'nomHu 10086', 'huPass 10086', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10087, true, 'apeHu 10087', false, 'emailHu 10087', 'nomHu 10087', 'huPass 10087', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10088, true, 'apeHu 10088', false, 'emailHu 10088', 'nomHu 10088', 'huPass 10088', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10089, true, 'apeHu 10089', false, 'emailHu 10089', 'nomHu 10089', 'huPass 10089', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10090, true, 'apeHu 10090', false, 'emailHu 10090', 'nomHu 10090', 'huPass 10090', 1000, 'RECHAZADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10091, true, 'apeHu 10091', false, 'emailHu 10091', 'nomHu 10091', 'huPass 10091', 1000, 'RECHAZADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10092, false, 'apeHu 10092', false, 'emailHu 10092', 'nomHu 10092', 'huPass 10092', 1000, 'RECHAZADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10093, true, 'apeHu 10093', false, 'emailHu 10093', 'nomHu 10093', 'huPass 10093', 1000, 'RECHAZADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10094, true, 'apeHu 10094', false, 'emailHu 10094', 'nomHu 10094', 'huPass 10094', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10095, true, 'apeHu 10095', false, 'emailHu 10095', 'nomHu 10095', 'huPass 10095', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10096, true, 'apeHu 10096', false, 'emailHu 10096', 'nomHu 10096', 'huPass 10096', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10097, true, 'apeHu 10097', true, 'emailHu 10097', 'nomHu 10097', 'huPass 10097', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10098, true, 'apeHu 10098', false, 'emailHu 10098', 'nomHu 10098', 'huPass 10098', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 10099, true, 'apeHu 10099', false, 'emailHu 10099', 'nomHu 10099', 'huPass 10099', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100100, true, 'apeHu 100100', false, 'emailHu 100100', 'nomHu 100100', 'huPass 100100', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100101, true, 'apeHu 100101', false, 'emailHu 100101', 'nomHu 100101', 'huPass 100101', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100102, true, 'apeHu 100102', false, 'emailHu 100102', 'nomHu 100102', 'huPass 100102', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100103, true, 'apeHu 100103', false, 'emailHu 100103', 'nomHu 100103', 'huPass 100103', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100104, true, 'apeHu 100104', false, 'emailHu 100104', 'nomHu 100104', 'huPass 100104', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100105, true, 'apeHu 100105', false, 'emailHu 100105', 'nomHu 100105', 'huPass 100105', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100106, true, 'apeHu 100106', false, 'emailHu 100106', 'nomHu 100106', 'huPass 100106', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100107, true, 'apeHu 100107', false, 'emailHu 100107', 'nomHu 100107', 'huPass 100107', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100108, true, 'apeHu 100108', false, 'emailHu 100108', 'nomHu 100108', 'huPass 100108', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100109, true, 'apeHu 100109', false, 'emailHu 100109', 'nomHu 100109', 'huPass 100109', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100111, true, 'apeHu 100111', false, 'emailHu 100111', 'nomHu 100111', 'huPass 100111', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100112, true, 'apeHu 100112', false, 'emailHu 100112', 'nomHu 100112', 'huPass 100112', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100113, true, 'apeHu 100113', false, 'emailHu 100113', 'nomHu 100113', 'huPass 100113', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100114, true, 'apeHu 100114', false, 'emailHu 100114', 'nomHu 100114', 'huPass 100114', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100116, true, 'apeHu 100116', false, 'emailHu 100116', 'nomHu 100116', 'huPass 100116', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100117, true, 'apeHu 100117', false, 'emailHu 100117', 'nomHu 100117', 'huPass 100117', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100118, true, 'apeHu 100118', false, 'emailHu 100118', 'nomHu 100118', 'huPass 100118', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100119, true, 'apeHu 100119', false, 'emailHu 100119', 'nomHu 100119', 'huPass 100119', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100120, true, 'apeHu 100120', false, 'emailHu 100120', 'nomHu 100120', 'huPass 100120', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100121, true, 'apeHu 100121', false, 'emailHu 100121', 'nomHu 100121', 'huPass 100121', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100122, true, 'apeHu 100122', false, 'emailHu 100122', 'nomHu 100122', 'huPass 100122', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100123, true, 'apeHu 100123', false, 'emailHu 100123', 'nomHu 100123', 'huPass 100123', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100124, true, 'apeHu 100124', true, 'emailHu 100124', 'nomHu 100124', 'huPass 100124', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100125, true, 'apeHu 100125', false, 'emailHu 100125', 'nomHu 100125', 'huPass 100125', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100126, true, 'apeHu 100126', false, 'emailHu 100126', 'nomHu 100126', 'huPass 100126', 1000, 'PENDIENTE', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100127, true, 'apeHu 100127', false, 'emailHu 100127', 'nomHu 100127', 'huPass 100127', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100128, true, 'apeHu 100128', false, 'emailHu 100128', 'nomHu 100128', 'huPass 100128', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100129, true, 'apeHu 100129', false, 'emailHu 100129', 'nomHu 100129', 'huPass 100129', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100130, true, 'apeHu 100130', false, 'emailHu 100130', 'nomHu 100130', 'huPass 100130', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100131, true, 'apeHu 100131', false, 'emailHu 100131', 'nomHu 100131', 'huPass 100131', 1000, 'PENDIENTE', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100132, true, 'apeHu 100132', false, 'emailHu 100132', 'nomHu 100132', 'huPass 100132', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100133, true, 'apeHu 100133', false, 'emailHu 100133', 'nomHu 100133', 'huPass 100133', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100134, true, 'apeHu 100134', false, 'emailHu 100134', 'nomHu 100134', 'huPass 100134', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100135, true, 'apeHu 100135', false, 'emailHu 100135', 'nomHu 100135', 'huPass 100135', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100136, true, 'apeHu 100136', false, 'emailHu 100136', 'nomHu 100136', 'huPass 100136', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100137, true, 'apeHu 100137', false, 'emailHu 100137', 'nomHu 100137', 'huPass 100137', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100138, true, 'apeHu 100138', false, 'emailHu 100138', 'nomHu 100138', 'huPass 100138', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100139, true, 'apeHu 100139', false, 'emailHu 100139', 'nomHu 100139', 'huPass 100139', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100115, true, 'apeHu 100115', true, 'emailHu 100115', 'nomHu 100115', 'huPass 100115', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100141, true, 'apeHu 100141', false, 'emailHu 100141', 'nomHu 100141', 'huPass 100141', 1000, 'PENDIENTE', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100142, true, 'apeHu 100142', false, 'emailHu 100142', 'nomHu 100142', 'huPass 100142', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100143, true, 'apeHu 100143', false, 'emailHu 100143', 'nomHu 100143', 'huPass 100143', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100144, true, 'apeHu 100144', false, 'emailHu 100144', 'nomHu 100144', 'huPass 100144', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100145, true, 'apeHu 100145', false, 'emailHu 100145', 'nomHu 100145', 'huPass 100145', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100146, true, 'apeHu 100146', false, 'emailHu 100146', 'nomHu 100146', 'huPass 100146', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100147, true, 'apeHu 100147', false, 'emailHu 100147', 'nomHu 100147', 'huPass 100147', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100148, true, 'apeHu 100148', false, 'emailHu 100148', 'nomHu 100148', 'huPass 100148', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100149, true, 'apeHu 100149', false, 'emailHu 100149', 'nomHu 100149', 'huPass 100149', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100150, true, 'apeHu 100150', false, 'emailHu 100150', 'nomHu 100150', 'huPass 100150', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 100110, true, 'apeHu 100110', false, 'emailHu 100110', 'nomHu 100110', 'huPass 100110', 1000, 'APROBADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('An', 10031, true, 'apeAn 10031', false, 'emailAn 10031', 'nomAn 10031', 'anPass 10031', 1000, 'RECHAZADO', NULL, '2022-05-13 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 15001, true, 'Thompson', false, 'e.thompson@randatmail.com', 'Eddy', '15001', 0, NULL, NULL, '2021-10-14 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 15002, true, 'Lloyd', false, 'm.lloyd@randatmail.com', 'Melanie', '15002', 0, NULL, NULL, '2021-02-18 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 15003, true, 'Johnston', false, 'j.johnston@randatmail.com', 'Jared', '15003', 0, NULL, NULL, '2020-09-01 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 15004, false, 'Clark', false, 'k.clark@randatmail.com', 'Kimberly', '15004', 0, NULL, NULL, '2021-06-17 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 15005, true, 'Perkins', false, 'a.perkins@randatmail.com', 'Adam', '15005', 0, NULL, NULL, '2021-12-21 00:00:00');
INSERT INTO public.usuarios VALUES ('Ad', 15006, true, 'Morrison', false, 'a.morrison@randatmail.com', 'Abraham', '15006', 0, NULL, NULL, '2020-03-15 00:00:00');
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
INSERT INTO public.usuarios VALUES ('Hu', 15197, true, 'Ferguson', false, 'e.ferguson@randatmail.com', 'Ellia', '15197', 0, 'APROBADO', NULL, '2020-05-05 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15198, true, 'Craig', false, 'm.craig@randatmail.com', 'Mary', '15198', 0, 'PENDIENTE', NULL, '2020-12-12 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15199, true, 'Stewart', false, 'v.stewart@randatmail.com', 'Vivian', '15199', 0, 'APROBADO', NULL, '2021-12-21 00:00:00');
INSERT INTO public.usuarios VALUES ('Hu', 15200, true, 'Foster', false, 'g.foster@randatmail.com', 'Garry', '15200', 0, 'APROBADO', NULL, '2022-06-09 00:00:00');


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

