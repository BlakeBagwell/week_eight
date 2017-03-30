--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: album; Type: TABLE; Schema: public; Owner: blakebagwell
--

CREATE TABLE album (
    id integer NOT NULL,
    name character varying,
    year integer,
    people_id integer
);


ALTER TABLE album OWNER TO blakebagwell;

--
-- Name: album_id_seq; Type: SEQUENCE; Schema: public; Owner: blakebagwell
--

CREATE SEQUENCE album_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE album_id_seq OWNER TO blakebagwell;

--
-- Name: album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blakebagwell
--

ALTER SEQUENCE album_id_seq OWNED BY album.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: blakebagwell
--

CREATE TABLE people (
    id integer NOT NULL,
    name character varying,
    profession character varying
);


ALTER TABLE people OWNER TO blakebagwell;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: blakebagwell
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE people_id_seq OWNER TO blakebagwell;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blakebagwell
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: song; Type: TABLE; Schema: public; Owner: blakebagwell
--

CREATE TABLE song (
    id integer NOT NULL,
    name character varying,
    people_id integer
);


ALTER TABLE song OWNER TO blakebagwell;

--
-- Name: song_id_seq; Type: SEQUENCE; Schema: public; Owner: blakebagwell
--

CREATE SEQUENCE song_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE song_id_seq OWNER TO blakebagwell;

--
-- Name: song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blakebagwell
--

ALTER SEQUENCE song_id_seq OWNED BY song.id;


--
-- Name: track; Type: TABLE; Schema: public; Owner: blakebagwell
--

CREATE TABLE track (
    id integer NOT NULL,
    song_id integer,
    album_id integer,
    duration interval minute to second
);


ALTER TABLE track OWNER TO blakebagwell;

--
-- Name: track_id_seq; Type: SEQUENCE; Schema: public; Owner: blakebagwell
--

CREATE SEQUENCE track_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE track_id_seq OWNER TO blakebagwell;

--
-- Name: track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blakebagwell
--

ALTER SEQUENCE track_id_seq OWNED BY track.id;


--
-- Name: album id; Type: DEFAULT; Schema: public; Owner: blakebagwell
--

ALTER TABLE ONLY album ALTER COLUMN id SET DEFAULT nextval('album_id_seq'::regclass);


--
-- Name: people id; Type: DEFAULT; Schema: public; Owner: blakebagwell
--

ALTER TABLE ONLY people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: song id; Type: DEFAULT; Schema: public; Owner: blakebagwell
--

ALTER TABLE ONLY song ALTER COLUMN id SET DEFAULT nextval('song_id_seq'::regclass);


--
-- Name: track id; Type: DEFAULT; Schema: public; Owner: blakebagwell
--

ALTER TABLE ONLY track ALTER COLUMN id SET DEFAULT nextval('track_id_seq'::regclass);


--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: blakebagwell
--

COPY album (id, name, year, people_id) FROM stdin;
2	Abbey Road	1969	1
3	Dark Side of the Moon	1973	2
5	Wu-Tang Forever	1997	4
6	...Baby one more time 	1999	5
7	Get the Guns	2006	6
4	True Blue	1982	3
8	Current-Album1	1970	1
9	Current-Album1	1974	2
10	Current-Album1	1983	3
11	Current-Album1	1998	4
12	Current-Album1	2000	5
13	Current-Album1	2007	6
\.


--
-- Name: album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blakebagwell
--

SELECT pg_catalog.setval('album_id_seq', 13, true);


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: blakebagwell
--

COPY people (id, name, profession) FROM stdin;
1	The Beatles	Artist
2	Pink Floyd	Artist
4	Wu-Tang Clan 	Artist
5	Britney Spears	Artist
6	Eminem 	Artist 
3	Madonna	Artist
7	Bobby Lobster 	Songwriter
8	Trixie Mattel 	Songwriter
9	Stacy Optimus	Songwriter
10	Sharon Needles	Songwriter
11	Linda 	Songwriter
12	Bill 	Songwriter 
\.


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blakebagwell
--

SELECT pg_catalog.setval('people_id_seq', 12, true);


--
-- Data for Name: song; Type: TABLE DATA; Schema: public; Owner: blakebagwell
--

COPY song (id, name, people_id) FROM stdin;
9	Reunited	12
4	Speak to Me/Breathe	8
5	On the Run 	8
7	White Heat 	10
3	Oh! Darling 	9
12	Countdown	9
8	Wu-Revolution 	11
10	Oops I did it again	11
1	Come Together	7
2	Something	7
6	Open Your Heart	7
11	Stronger	7
13	Get My Gun	11
\.


--
-- Name: song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blakebagwell
--

SELECT pg_catalog.setval('song_id_seq', 14, true);


--
-- Data for Name: track; Type: TABLE DATA; Schema: public; Owner: blakebagwell
--

COPY track (id, song_id, album_id, duration) FROM stdin;
4	4	3	00:03:00
3	3	2	00:02:40
2	2	2	00:03:05
1	1	2	00:02:05
5	5	3	00:02:59
6	6	4	00:02:30
7	7	4	00:01:50
8	8	5	00:02:50
9	9	5	00:04:01
10	10	6	00:03:45
11	11	6	00:04:30
12	12	7	00:00:11
13	13	7	00:04:45
14	3	5	00:03:21
15	3	7	00:03:46
16	6	8	00:02:18
19	10	7	00:05:00
18	2	12	00:03:18
17	2	9	00:01:18
\.


--
-- Name: track_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blakebagwell
--

SELECT pg_catalog.setval('track_id_seq', 19, true);


--
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: blakebagwell
--

ALTER TABLE ONLY album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: blakebagwell
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: song song_pkey; Type: CONSTRAINT; Schema: public; Owner: blakebagwell
--

ALTER TABLE ONLY song
    ADD CONSTRAINT song_pkey PRIMARY KEY (id);


--
-- Name: track track_pkey; Type: CONSTRAINT; Schema: public; Owner: blakebagwell
--

ALTER TABLE ONLY track
    ADD CONSTRAINT track_pkey PRIMARY KEY (id);


--
-- Name: album album_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blakebagwell
--

ALTER TABLE ONLY album
    ADD CONSTRAINT album_people_id_fkey FOREIGN KEY (people_id) REFERENCES people(id);


--
-- Name: song song_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blakebagwell
--

ALTER TABLE ONLY song
    ADD CONSTRAINT song_people_id_fkey FOREIGN KEY (people_id) REFERENCES people(id);


--
-- Name: track track_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blakebagwell
--

ALTER TABLE ONLY track
    ADD CONSTRAINT track_album_id_fkey FOREIGN KEY (album_id) REFERENCES album(id);


--
-- Name: track track_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blakebagwell
--

ALTER TABLE ONLY track
    ADD CONSTRAINT track_song_id_fkey FOREIGN KEY (song_id) REFERENCES song(id);


--
-- PostgreSQL database dump complete
--

