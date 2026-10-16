--
-- PostgreSQL database dump
--

\restrict KgAIJdQqJMa6PU0J6XCVIvXcPmtoWrG2HdyyiDIo6u20pZjQaxlS19IfYS7c0R8

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

--
-- Data for Name: sensors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sensors VALUES (1, 'Sensor_Temperatura_01', 'Centro de Canatlán, Durango', 24.523100, -104.778200, true);
INSERT INTO public.sensors VALUES (2, 'Sensor_Humedad_02', 'Parque Municipal de Durango', 24.027700, -104.653200, true);
INSERT INTO public.sensors VALUES (3, 'Sensor_Calidad_Aire_03', 'Zona Industrial de Gómez Palacio', 25.569900, -103.495800, false);


--
-- Data for Name: humidity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.humidity VALUES (1, 1, '2026-10-14 14:00:00+00', 45.20);
INSERT INTO public.humidity VALUES (2, 2, '2026-10-14 14:05:00+00', 62.70);
INSERT INTO public.humidity VALUES (3, 3, '2026-10-14 14:10:00+00', 38.90);


--
-- Data for Name: pressure; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pressure VALUES (1, 1, '2026-10-14 14:00:00+00', 1013.25);
INSERT INTO public.pressure VALUES (2, 2, '2026-10-14 14:05:00+00', 1010.80);
INSERT INTO public.pressure VALUES (3, 3, '2026-10-14 14:10:00+00', 1015.60);


--
-- Data for Name: temperature; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.temperature VALUES (1, 1, '2026-10-14 14:00:00+00', 24.50);
INSERT INTO public.temperature VALUES (2, 2, '2026-10-14 14:05:00+00', 28.30);
INSERT INTO public.temperature VALUES (3, 3, '2026-10-14 14:10:00+00', 19.80);


--
-- Name: humidity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.humidity_id_seq', 3, true);


--
-- Name: pressure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pressure_id_seq', 3, true);


--
-- Name: sensors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sensors_id_seq', 3, true);


--
-- Name: temperature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temperature_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

\unrestrict KgAIJdQqJMa6PU0J6XCVIvXcPmtoWrG2HdyyiDIo6u20pZjQaxlS19IfYS7c0R8

