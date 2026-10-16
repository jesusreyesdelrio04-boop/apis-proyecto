--
-- PostgreSQL database dump
--

\restrict HrYvGIgW0iQ0tpyhXgApivgm0tMZUHnhCXdhYlrdV3xwIIA08iAEVbE74HSXd4P

-- Dumped from database version 18.6 (Debian 18.6-1.pgdg13+2)
-- Dumped by pg_dump version 18.6 (Debian 18.6-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: humidity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.humidity (
    id bigint NOT NULL,
    sensor_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    humidity numeric(5,2)
);


--
-- Name: humidity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.humidity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: humidity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.humidity_id_seq OWNED BY public.humidity.id;


--
-- Name: pressure; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pressure (
    id bigint NOT NULL,
    sensor_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    pressure numeric(7,2)
);


--
-- Name: pressure_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pressure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pressure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pressure_id_seq OWNED BY public.pressure.id;


--
-- Name: sensors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sensors (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    location character varying(150),
    latitude numeric(9,6),
    longitude numeric(9,6),
    active boolean
);


--
-- Name: sensors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sensors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sensors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sensors_id_seq OWNED BY public.sensors.id;


--
-- Name: temperature; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.temperature (
    id bigint NOT NULL,
    sensor_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    temperature numeric(5,2)
);


--
-- Name: temperature_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.temperature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: temperature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.temperature_id_seq OWNED BY public.temperature.id;


--
-- Name: humidity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.humidity ALTER COLUMN id SET DEFAULT nextval('public.humidity_id_seq'::regclass);


--
-- Name: pressure id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pressure ALTER COLUMN id SET DEFAULT nextval('public.pressure_id_seq'::regclass);


--
-- Name: sensors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sensors ALTER COLUMN id SET DEFAULT nextval('public.sensors_id_seq'::regclass);


--
-- Name: temperature id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.temperature ALTER COLUMN id SET DEFAULT nextval('public.temperature_id_seq'::regclass);


--
-- Name: humidity humidity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.humidity
    ADD CONSTRAINT humidity_pkey PRIMARY KEY (id);


--
-- Name: pressure pressure_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pressure
    ADD CONSTRAINT pressure_pkey PRIMARY KEY (id);


--
-- Name: sensors sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT sensors_pkey PRIMARY KEY (id);


--
-- Name: temperature temperature_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.temperature
    ADD CONSTRAINT temperature_pkey PRIMARY KEY (id);


--
-- Name: humidity fk_humidity_sensor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.humidity
    ADD CONSTRAINT fk_humidity_sensor FOREIGN KEY (sensor_id) REFERENCES public.sensors(id);


--
-- Name: pressure fk_pressure_sensor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pressure
    ADD CONSTRAINT fk_pressure_sensor FOREIGN KEY (sensor_id) REFERENCES public.sensors(id);


--
-- Name: temperature fk_temperature_sensor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.temperature
    ADD CONSTRAINT fk_temperature_sensor FOREIGN KEY (sensor_id) REFERENCES public.sensors(id);


--
-- PostgreSQL database dump complete
--

\unrestrict HrYvGIgW0iQ0tpyhXgApivgm0tMZUHnhCXdhYlrdV3xwIIA08iAEVbE74HSXd4P

