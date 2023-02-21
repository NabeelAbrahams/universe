--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    discovery_year integer,
    star_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    discovery_year integer,
    description text,
    constellation_id integer NOT NULL,
    CONSTRAINT positive_discovery_year CHECK ((discovery_year >= 0))
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(50) NOT NULL,
    moon_id integer NOT NULL,
    discovery_year integer,
    distance_from_earth numeric,
    description text,
    planet_id integer NOT NULL,
    CONSTRAINT positive_discovery_year CHECK ((discovery_year >= 0))
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    discovery_year integer,
    distance_from_earth numeric,
    description text,
    has_ring boolean,
    has_moon boolean,
    star_id integer NOT NULL,
    CONSTRAINT positive_discovery_year CHECK ((discovery_year >= 0))
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    discovery_year integer,
    distance_from_earth numeric,
    description text,
    galaxy_id integer,
    CONSTRAINT positive_discovery_year CHECK ((discovery_year >= 0))
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Aquarius', NULL, 1);
INSERT INTO public.constellation VALUES (2, 'Aries', NULL, 2);
INSERT INTO public.constellation VALUES (3, 'Bootes', NULL, 3);
INSERT INTO public.constellation VALUES (4, 'Capricornus', NULL, 4);
INSERT INTO public.constellation VALUES (5, 'Centaurus', NULL, 5);
INSERT INTO public.constellation VALUES (6, 'Cetus', NULL, 9);
INSERT INTO public.constellation VALUES (7, 'Coma Berenices', NULL, 6);
INSERT INTO public.constellation VALUES (8, 'Leo', NULL, 7);
INSERT INTO public.constellation VALUES (9, 'Ophiucus', NULL, 12);
INSERT INTO public.constellation VALUES (10, 'Pegasus', NULL, 10);
INSERT INTO public.constellation VALUES (11, 'Sagittarius', NULL, 11);
INSERT INTO public.constellation VALUES (12, 'Taurus', NULL, 8);
INSERT INTO public.constellation VALUES (13, 'Virgo', NULL, 13);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Backward Galaxy', 1, NULL, NULL, 5);
INSERT INTO public.galaxy VALUES ('Centaurus A', 2, NULL, NULL, 5);
INSERT INTO public.galaxy VALUES ('Black Eye Galaxy', 3, NULL, NULL, 7);
INSERT INTO public.galaxy VALUES ('Coma Pinwheel Galaxy', 4, NULL, NULL, 7);
INSERT INTO public.galaxy VALUES ('Malin 1', 5, NULL, NULL, 7);
INSERT INTO public.galaxy VALUES ('Mice Galaxies', 6, NULL, NULL, 7);
INSERT INTO public.galaxy VALUES ('Needle Galaxy', 7, NULL, NULL, 7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 17, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Phobos', 18, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Deimos', 19, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Io', 20, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Europa', 21, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Ganymede', 22, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Callisto', 23, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Amalthea', 24, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Himalia', 25, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Thebe', 26, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Mimas', 27, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Enceladus', 28, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Moo', 29, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Phbos', 30, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Deims', 31, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Iio', 32, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Euopa', 33, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Gaymede', 34, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Callito', 35, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Amlthea', 36, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Himala', 37, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Theb', 38, NULL, NULL, NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 5, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Venus', 6, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.planet VALUES ('Earth', 7, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES ('Saturn', 8, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Jupiter', 9, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.planet VALUES ('Mars', 10, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES ('Uranus', 11, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Neptune', 12, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.planet VALUES ('Ceres', 13, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES ('Haumea', 14, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Pluto', 15, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.planet VALUES ('Orcus', 16, NULL, NULL, NULL, NULL, NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sadalsuud', 1, NULL, 612, NULL, NULL);
INSERT INTO public.star VALUES ('Hamal', 2, NULL, 66, NULL, NULL);
INSERT INTO public.star VALUES ('Arcturus', 3, NULL, 37, NULL, NULL);
INSERT INTO public.star VALUES ('Deneb Algedi', 4, NULL, 39, NULL, NULL);
INSERT INTO public.star VALUES ('Rigil Kentaurus', 5, NULL, 4, NULL, NULL);
INSERT INTO public.star VALUES ('Beta Comae Berenices', 6, NULL, 30, NULL, NULL);
INSERT INTO public.star VALUES ('Regulus', 7, NULL, 77, NULL, NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 13, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 38, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy pk_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT pk_galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

