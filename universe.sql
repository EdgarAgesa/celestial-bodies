--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    composition character varying(20),
    orbit_radius integer,
    is_hazardous boolean DEFAULT false
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(20),
    has_life boolean DEFAULT false,
    distance_from_earth numeric(10,2)
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
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    is_spherical boolean DEFAULT true,
    distance_from_earth numeric(10,2)
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
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    planet_type character varying(20),
    star_id integer,
    has_life boolean DEFAULT false
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
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    description text,
    galaxy_id integer,
    has_planets boolean DEFAULT true
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Rocky', 413690000, false);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 'Rocky', 414500000, false);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 'Rocky', 353400000, false);
INSERT INTO public.asteroid VALUES (4, 'Eros', 'Metallic', 218000000, true);
INSERT INTO public.asteroid VALUES (5, 'Apophis', 'Metallic', 118000000, true);
INSERT INTO public.asteroid VALUES (6, 'Bennu', 'Carbonaceous', 101200000, true);
INSERT INTO public.asteroid VALUES (7, 'Hygiea', 'Carbonaceous', 470000000, false);
INSERT INTO public.asteroid VALUES (8, 'Juno', 'Silicaceous', 395400000, false);
INSERT INTO public.asteroid VALUES (9, 'Florence', 'Metallic', 201000000, true);
INSERT INTO public.asteroid VALUES (10, 'Gaspra', 'Silicaceous', 330000000, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', false, 2500000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', false, 3000000.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', false, 23000000.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', false, 29000000.00);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Spiral', false, 17000000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 384400.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, true, 9376.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, true, 23460.00);
INSERT INTO public.moon VALUES (4, 'Europa', 3, true, 628730.00);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, true, 1070400.00);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, true, 1882700.00);
INSERT INTO public.moon VALUES (7, 'Titan', 3, true, 1221870.00);
INSERT INTO public.moon VALUES (8, 'Enceladus', 3, true, 1274700.00);
INSERT INTO public.moon VALUES (9, 'Triton', 4, true, 2700000.00);
INSERT INTO public.moon VALUES (10, 'Charon', 4, true, 19000.00);
INSERT INTO public.moon VALUES (11, 'Io', 3, true, 421700.00);
INSERT INTO public.moon VALUES (12, 'Mimas', 3, true, 1152700.00);
INSERT INTO public.moon VALUES (13, 'Oberon', 4, true, 5820000.00);
INSERT INTO public.moon VALUES (14, 'Rhea', 3, true, 1352700.00);
INSERT INTO public.moon VALUES (15, 'Iapetus', 3, true, 3560000.00);
INSERT INTO public.moon VALUES (16, 'Miranda', 4, true, 1293900.00);
INSERT INTO public.moon VALUES (17, 'Ariel', 4, true, 1193900.00);
INSERT INTO public.moon VALUES (18, 'Umbriel', 4, true, 1100000.00);
INSERT INTO public.moon VALUES (19, 'Titania', 4, true, 7400000.00);
INSERT INTO public.moon VALUES (20, 'Proteus', 4, true, 4180000.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, 'Terrestrial', 1, true);
INSERT INTO public.planet VALUES (2, 'Mars', 4500, 'Terrestrial', 1, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4500, 'Gas Giant', 1, false);
INSERT INTO public.planet VALUES (4, 'Neptune', 4500, 'Gas Giant', 1, false);
INSERT INTO public.planet VALUES (5, 'Gliese 581g', 7500, 'Terrestrial', 3, false);
INSERT INTO public.planet VALUES (6, 'Kepler-22b', 6000, 'Exoplanet', 3, false);
INSERT INTO public.planet VALUES (7, 'K2-18b', 8000, 'Exoplanet', 2, false);
INSERT INTO public.planet VALUES (8, 'HD 189733 b', 3000, 'Gas Giant', 2, false);
INSERT INTO public.planet VALUES (9, 'TrES-2b', 4000, 'Gas Giant', 4, false);
INSERT INTO public.planet VALUES (10, 'GJ 1214 b', 5000, 'Terrestrial', 5, false);
INSERT INTO public.planet VALUES (11, 'WASP-17b', 3500, 'Gas Giant', 6, false);
INSERT INTO public.planet VALUES (12, 'LHS 1140 b', 1000, 'Terrestrial', 6, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 'Main sequence star', 1, true);
INSERT INTO public.star VALUES (2, 'Sirius', 200, 'Brightest star in the night sky', 1, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 10000, 'Red supergiant', 2, true);
INSERT INTO public.star VALUES (4, 'Rigel', 9000, 'Blue supergiant', 2, true);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 4500, 'Closest star to Sun', 1, true);
INSERT INTO public.star VALUES (6, 'Vega', 450, 'Bright star in Lyra constellation', 3, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

