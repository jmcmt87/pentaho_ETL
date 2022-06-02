--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: dim_auditor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_auditor (
    surr_auditor_id integer NOT NULL,
    cod_auditor character varying DEFAULT 'N/A'::character varying NOT NULL
);


ALTER TABLE public.dim_auditor OWNER TO postgres;

--
-- Name: dim_evaluacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_evaluacion (
    surr_evaluacion_id integer NOT NULL,
    id_evaluacion character varying DEFAULT 'N/A'::character varying NOT NULL,
    titulo_cuestionario character varying DEFAULT 'N/A'::character varying
);


ALTER TABLE public.dim_evaluacion OWNER TO postgres;

--
-- Name: dim_localizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_localizacion (
    surr_localizacion_id integer NOT NULL,
    cod_loc character varying DEFAULT 'N/A'::character varying NOT NULL,
    cp character varying DEFAULT 'N/A'::character varying,
    nom_loc character varying DEFAULT 'N/A'::character varying,
    poblacion character varying DEFAULT 'N/A'::character varying,
    provincia character varying DEFAULT 'N/A'::character varying
);


ALTER TABLE public.dim_localizacion OWNER TO postgres;

--
-- Name: dim_oficina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_oficina (
    surr_oficina_id integer NOT NULL,
    oficina character varying DEFAULT 'N/A'::character varying NOT NULL
);


ALTER TABLE public.dim_oficina OWNER TO postgres;

--
-- Name: dim_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_proyecto (
    surr_proyecto_id integer NOT NULL,
    cod_proyecto character varying DEFAULT 'N/A'::character varying NOT NULL
);


ALTER TABLE public.dim_proyecto OWNER TO postgres;

--
-- Name: dim_temporal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_temporal (
    surr_temporal_id integer NOT NULL,
    fecha_ejecucion date NOT NULL,
    dia integer,
    mes integer,
    year integer
);


ALTER TABLE public.dim_temporal OWNER TO postgres;

--
-- Name: tabla_hechos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tabla_hechos (
    surr_auditor_id integer NOT NULL,
    surr_evaluacion_id integer NOT NULL,
    surr_localizacion_id integer NOT NULL,
    surr_oficina_id integer NOT NULL,
    surr_proyecto_id integer NOT NULL,
    surr_temporal_id integer NOT NULL,
    resultado numeric(5,4)
);


ALTER TABLE public.tabla_hechos OWNER TO postgres;

--
-- Name: dim_auditor dim_auditor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_auditor
    ADD CONSTRAINT dim_auditor_pkey PRIMARY KEY (surr_auditor_id);


--
-- Name: dim_evaluacion dim_evaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_evaluacion
    ADD CONSTRAINT dim_evaluacion_pkey PRIMARY KEY (surr_evaluacion_id);


--
-- Name: dim_localizacion dim_localizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_localizacion
    ADD CONSTRAINT dim_localizacion_pkey PRIMARY KEY (surr_localizacion_id);


--
-- Name: dim_oficina dim_oficina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_oficina
    ADD CONSTRAINT dim_oficina_pkey PRIMARY KEY (surr_oficina_id);


--
-- Name: dim_proyecto dim_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_proyecto
    ADD CONSTRAINT dim_proyecto_pkey PRIMARY KEY (surr_proyecto_id);


--
-- Name: dim_temporal dim_temporal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_temporal
    ADD CONSTRAINT dim_temporal_pkey PRIMARY KEY (surr_temporal_id);


--
-- Name: tabla_hechos tabla_hechos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabla_hechos
    ADD CONSTRAINT tabla_hechos_pkey PRIMARY KEY (surr_auditor_id, surr_evaluacion_id, surr_localizacion_id, surr_oficina_id, surr_proyecto_id, surr_temporal_id);


--
-- Name: tabla_hechos tabla_hechos_surr_auditor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabla_hechos
    ADD CONSTRAINT tabla_hechos_surr_auditor_id_fkey FOREIGN KEY (surr_auditor_id) REFERENCES public.dim_auditor(surr_auditor_id);


--
-- Name: tabla_hechos tabla_hechos_surr_evaluacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabla_hechos
    ADD CONSTRAINT tabla_hechos_surr_evaluacion_id_fkey FOREIGN KEY (surr_evaluacion_id) REFERENCES public.dim_evaluacion(surr_evaluacion_id);


--
-- Name: tabla_hechos tabla_hechos_surr_localizacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabla_hechos
    ADD CONSTRAINT tabla_hechos_surr_localizacion_id_fkey FOREIGN KEY (surr_localizacion_id) REFERENCES public.dim_localizacion(surr_localizacion_id);


--
-- Name: tabla_hechos tabla_hechos_surr_oficina_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabla_hechos
    ADD CONSTRAINT tabla_hechos_surr_oficina_id_fkey FOREIGN KEY (surr_oficina_id) REFERENCES public.dim_oficina(surr_oficina_id);


--
-- Name: tabla_hechos tabla_hechos_surr_proyecto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabla_hechos
    ADD CONSTRAINT tabla_hechos_surr_proyecto_id_fkey FOREIGN KEY (surr_proyecto_id) REFERENCES public.dim_proyecto(surr_proyecto_id);


--
-- Name: tabla_hechos tabla_hechos_surr_temporal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabla_hechos
    ADD CONSTRAINT tabla_hechos_surr_temporal_id_fkey FOREIGN KEY (surr_temporal_id) REFERENCES public.dim_temporal(surr_temporal_id);


--
-- PostgreSQL database dump complete
--

