--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter integer,
    mass numeric,
    is_hazardous boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.asteroid ALTER COLUMN asteroid_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.asteroid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_milky double precision,
    galaxy_type character varying(50),
    distance_from_earth numeric,
    has_black_hole boolean,
    galaxy_code character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    mass numeric,
    distance_from_planet double precision,
    moon_code character varying(20)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    diameter integer,
    description text,
    has_moon boolean,
    is_habitable boolean,
    star_id integer,
    planet_code character varying(20)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass numeric,
    galaxy_id integer,
    is_supernova boolean,
    star_code character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.asteroid (asteroid_id, name, planet_id, diameter, mass, is_hazardous) FROM stdin;
1	Eros	3	16	6.69	f
2	Itokawa	3	0	0.035	f
3	Bennu	3	0	0.078	t
4	Ryugu	3	1	0.45	t
5	Apophis	3	0	0.061	t
6	Vesta	5	525	259	f
7	Pallas	5	512	211	f
8	Hygiea	5	434	88	f
9	Juno	5	233	20	f
10	Iris	5	200	13	f
11	Davida	5	326	39	f
12	Europa Asteroid	5	120	5	f
13	Flora	5	145	6	f
14	Eunomia	5	268	30	f
15	Hektor	5	203	7	f
16	Mathilde	3	53	103	f
17	Gaspra	3	12	1.0	f
18	Ida	3	31	4.2	f
19	Toutatis	3	4	0.05	t
20	Geographos	3	5	0.04	t
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, distance_from_milky, galaxy_type, distance_from_earth, has_black_hole, galaxy_code) FROM stdin;
1	Milky Way	\N	\N	\N	\N	\N
2	Milky Way	\N	\N	\N	\N	\N
3	Andromeda	\N	\N	\N	\N	\N
4	Triangulum	\N	\N	\N	\N	\N
5	Whirlpool	\N	\N	\N	\N	\N
6	Sombrero	\N	\N	\N	\N	\N
7	Black Eye	\N	\N	\N	\N	\N
8	Pinwheel	\N	\N	\N	\N	\N
9	Cartwheel	\N	\N	\N	\N	\N
10	Cigar	\N	\N	\N	\N	\N
11	Sunflower	\N	\N	\N	\N	\N
12	Bode	\N	\N	\N	\N	\N
13	Messier 87	\N	\N	\N	\N	\N
14	Large Magellanic Cloud	\N	\N	\N	\N	\N
15	Small Magellanic Cloud	\N	\N	\N	\N	\N
16	Centaurus A	\N	\N	\N	\N	\N
17	Sculptor	\N	\N	\N	\N	\N
18	M81	\N	\N	\N	\N	\N
19	M82	\N	\N	\N	\N	\N
20	NGC 1300	\N	\N	\N	\N	\N
21	NGC 1365	\N	\N	\N	\N	\N
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, planet_id, mass, distance_from_planet, moon_code) FROM stdin;
1	Moon	1	\N	\N	\N
2	Moon	3	\N	\N	\N
3	Phobos	4	\N	\N	\N
4	Deimos	4	\N	\N	\N
5	Io	5	\N	\N	\N
6	Europa	5	\N	\N	\N
7	Ganymede	5	\N	\N	\N
8	Callisto	5	\N	\N	\N
9	Titan	6	\N	\N	\N
10	Rhea	6	\N	\N	\N
11	Iapetus	6	\N	\N	\N
12	Dione	6	\N	\N	\N
13	Tethys	6	\N	\N	\N
14	Enceladus	6	\N	\N	\N
15	Mimas	6	\N	\N	\N
16	Titania	7	\N	\N	\N
17	Oberon	7	\N	\N	\N
18	Ariel	7	\N	\N	\N
19	Umbriel	7	\N	\N	\N
20	Miranda	7	\N	\N	\N
21	Triton	8	\N	\N	\N
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, age, diameter, description, has_moon, is_habitable, star_id, planet_code) FROM stdin;
1	Earth	\N	\N	\N	\N	\N	1	\N
2	Mercury	\N	\N	\N	\N	\N	1	\N
3	Venus	\N	\N	\N	\N	\N	1	\N
4	Earth	\N	\N	\N	\N	\N	1	\N
5	Mars	\N	\N	\N	\N	\N	1	\N
6	Jupiter	\N	\N	\N	\N	\N	1	\N
7	Saturn	\N	\N	\N	\N	\N	1	\N
8	Uranus	\N	\N	\N	\N	\N	1	\N
9	Neptune	\N	\N	\N	\N	\N	1	\N
10	Proxima Centauri b	\N	\N	\N	\N	\N	7	\N
11	Proxima Centauri c	\N	\N	\N	\N	\N	7	\N
12	Kepler-22b	\N	\N	\N	\N	\N	2	\N
13	Kepler-452b	\N	\N	\N	\N	\N	3	\N
14	TRAPPIST-1b	\N	\N	\N	\N	\N	4	\N
15	TRAPPIST-1c	\N	\N	\N	\N	\N	4	\N
16	TRAPPIST-1d	\N	\N	\N	\N	\N	4	\N
17	TRAPPIST-1e	\N	\N	\N	\N	\N	4	\N
18	TRAPPIST-1f	\N	\N	\N	\N	\N	4	\N
19	TRAPPIST-1g	\N	\N	\N	\N	\N	4	\N
20	TRAPPIST-1h	\N	\N	\N	\N	\N	4	\N
21	55 Cancri e	\N	\N	\N	\N	\N	5	\N
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, mass, galaxy_id, is_supernova, star_code) FROM stdin;
1	Sun	\N	1	\N	\N
2	Sun	\N	1	\N	\N
3	Sirius	\N	1	\N	\N
4	Betelgeuse	\N	1	\N	\N
5	Rigel	\N	1	\N	\N
6	Vega	\N	1	\N	\N
7	Polaris	\N	1	\N	\N
8	Proxima Centauri	\N	1	\N	\N
9	Antares	\N	1	\N	\N
10	Aldebaran	\N	1	\N	\N
11	Deneb	\N	1	\N	\N
12	Altair	\N	1	\N	\N
13	Spica	\N	1	\N	\N
14	Arcturus	\N	1	\N	\N
15	Regulus	\N	1	\N	\N
16	Bellatrix	\N	1	\N	\N
17	Fomalhaut	\N	1	\N	\N
18	Canopus	\N	1	\N	\N
19	Achernar	\N	1	\N	\N
20	Capella	\N	1	\N	\N
21	Pollux	\N	1	\N	\N
\.


--
-- Name: asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_id_seq', 20, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 21, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 21, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 21, true);


--
-- Name: asteroid asteroid_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_unique UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_galaxy_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_code_key UNIQUE (galaxy_code);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_code_key UNIQUE (moon_code);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_code_key UNIQUE (planet_code);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_code_key UNIQUE (star_code);


--
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

