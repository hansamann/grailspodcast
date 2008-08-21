--
-- PostgreSQL database dump
--

-- Started on 2008-08-18 21:47:53 PDT

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1469 (class 1259 OID 18087)
-- Dependencies: 3
-- Name: authentication_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE authentication_user (
    id bigint NOT NULL,
    version bigint NOT NULL,
    email character varying(255),
    login character varying(64) NOT NULL,
    password character varying(32) NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public.authentication_user OWNER TO postgres;

--
-- TOC entry 1470 (class 1259 OID 18094)
-- Dependencies: 3
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    author character varying(255) NOT NULL,
    content character varying(255) NOT NULL,
    created timestamp without time zone NOT NULL,
    entry_id bigint NOT NULL,
    comments_idx integer
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 1471 (class 1259 OID 18102)
-- Dependencies: 3
-- Name: entry; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entry (
    id bigint NOT NULL,
    version bigint NOT NULL,
    content character varying(10000) NOT NULL,
    created timestamp without time zone NOT NULL,
    enclosure_length integer,
    enclosure_type character varying(255),
    enclosureurl character varying(255),
    tags character varying(255) NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.entry OWNER TO postgres;

--
-- TOC entry 1472 (class 1259 OID 18115)
-- Dependencies: 3
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 1756 (class 0 OID 0)
-- Dependencies: 1472
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 65, true);


--
-- TOC entry 1748 (class 0 OID 18087)
-- Dependencies: 1469
-- Data for Name: authentication_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO authentication_user (id, version, email, login, password, status) VALUES (64, 0, 'hansamann@yahoo.de', 'hansamann', '5434DAD493D7B0F3281860E3EEA5EAC2', 1);
INSERT INTO authentication_user (id, version, email, login, password, status) VALUES (65, 0, 'glen.smith@gmail.com', 'glen.smith', '354083264AFF0A94E404F1F4E5DE5EFD', 1);


--
-- TOC entry 1749 (class 0 OID 18094)
-- Dependencies: 1470
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1750 (class 0 OID 18102)
-- Dependencies: 1471
-- Data for Name: entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (1, 0, 'This is content number 1, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 1, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 1, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 1, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-04-03 21:21:06.755', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_1.mp3', 'groovy grails new', 'Grails Podcast Episode 1');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (2, 0, 'This is content number 2, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 2, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 2, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 2, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-04-17 21:21:06.817', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_2.mp3', 'groovy grails new', 'Grails Podcast Episode 2');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (3, 0, 'This is content number 3, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 3, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 3, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 3, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-05-01 21:21:06.822', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_3.mp3', 'groovy grails new', 'Grails Podcast Episode 3');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (4, 0, 'This is content number 4, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 4, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 4, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 4, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-05-15 21:21:06.826', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_4.mp3', 'groovy grails new', 'Grails Podcast Episode 4');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (5, 0, 'This is content number 5, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 5, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 5, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 5, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-05-29 21:21:06.829', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_5.mp3', 'groovy grails new', 'Grails Podcast Episode 5');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (6, 0, 'This is content number 6, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 6, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 6, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 6, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-06-12 21:21:06.832', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_6.mp3', 'groovy grails new', 'Grails Podcast Episode 6');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (7, 0, 'This is content number 7, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 7, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 7, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 7, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-06-26 21:21:06.837', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_7.mp3', 'groovy grails new', 'Grails Podcast Episode 7');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (8, 0, 'This is content number 8, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 8, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 8, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 8, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-07-10 21:21:06.84', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_8.mp3', 'groovy grails new', 'Grails Podcast Episode 8');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (9, 0, 'This is content number 9, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 9, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 9, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 9, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-07-24 21:21:06.846', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_9.mp3', 'groovy grails new', 'Grails Podcast Episode 9');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (10, 0, 'This is content number 10, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 10, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 10, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 10, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-08-07 21:21:06.849', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_10.mp3', 'groovy grails new', 'Grails Podcast Episode 10');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (11, 0, 'This is content number 11, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 11, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 11, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 11, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-08-21 21:21:06.863', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_11.mp3', 'groovy grails new', 'Grails Podcast Episode 11');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (12, 0, 'This is content number 12, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 12, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 12, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 12, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-09-04 21:21:06.867', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_12.mp3', 'groovy grails new', 'Grails Podcast Episode 12');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (13, 0, 'This is content number 13, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 13, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 13, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 13, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-09-18 21:21:06.877', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_13.mp3', 'groovy grails new', 'Grails Podcast Episode 13');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (14, 0, 'This is content number 14, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 14, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 14, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 14, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-10-02 21:21:06.879', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_14.mp3', 'groovy grails new', 'Grails Podcast Episode 14');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (15, 0, 'This is content number 15, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 15, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 15, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 15, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-10-16 21:21:06.882', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_15.mp3', 'groovy grails new', 'Grails Podcast Episode 15');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (16, 0, 'This is content number 16, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 16, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 16, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 16, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-10-30 21:21:06.902', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_16.mp3', 'groovy grails new', 'Grails Podcast Episode 16');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (17, 0, 'This is content number 17, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 17, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 17, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 17, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-11-13 21:21:06.908', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_17.mp3', 'groovy grails new', 'Grails Podcast Episode 17');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (18, 0, 'This is content number 18, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 18, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 18, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 18, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-11-27 21:21:06.91', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_18.mp3', 'groovy grails new', 'Grails Podcast Episode 18');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (19, 0, 'This is content number 19, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 19, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 19, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 19, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-12-11 21:21:06.913', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_19.mp3', 'groovy grails new', 'Grails Podcast Episode 19');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (20, 0, 'This is content number 20, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 20, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 20, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 20, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2006-12-25 21:21:06.925', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_20.mp3', 'groovy grails new', 'Grails Podcast Episode 20');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (21, 0, 'This is content number 21, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 21, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 21, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 21, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-01-08 21:21:06.933', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_21.mp3', 'groovy grails new', 'Grails Podcast Episode 21');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (22, 0, 'This is content number 22, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 22, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 22, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 22, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-01-22 21:21:06.939', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_22.mp3', 'groovy grails new', 'Grails Podcast Episode 22');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (23, 0, 'This is content number 23, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 23, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 23, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 23, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-02-05 21:21:06.947', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_23.mp3', 'groovy grails new', 'Grails Podcast Episode 23');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (24, 0, 'This is content number 24, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 24, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 24, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 24, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-02-19 21:21:06.951', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_24.mp3', 'groovy grails new', 'Grails Podcast Episode 24');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (25, 0, 'This is content number 25, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 25, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 25, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 25, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-03-05 21:21:06.959', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_25.mp3', 'groovy grails new', 'Grails Podcast Episode 25');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (26, 0, 'This is content number 26, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 26, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 26, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 26, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-03-19 21:21:06.961', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_26.mp3', 'groovy grails new', 'Grails Podcast Episode 26');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (27, 0, 'This is content number 27, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 27, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 27, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 27, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-04-02 21:21:06.963', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_27.mp3', 'groovy grails new', 'Grails Podcast Episode 27');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (28, 0, 'This is content number 28, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 28, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 28, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 28, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-04-16 21:21:06.967', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_28.mp3', 'groovy grails new', 'Grails Podcast Episode 28');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (29, 0, 'This is content number 29, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 29, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 29, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 29, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-04-30 21:21:06.97', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_29.mp3', 'groovy grails new', 'Grails Podcast Episode 29');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (30, 0, 'This is content number 30, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 30, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 30, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 30, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-05-14 21:21:06.972', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_30.mp3', 'groovy grails new', 'Grails Podcast Episode 30');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (31, 0, 'This is content number 31, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 31, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 31, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 31, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-05-28 21:21:06.976', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_31.mp3', 'groovy grails new', 'Grails Podcast Episode 31');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (32, 0, 'This is content number 32, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 32, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 32, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 32, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-06-11 21:21:06.979', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_32.mp3', 'groovy grails new', 'Grails Podcast Episode 32');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (33, 0, 'This is content number 33, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 33, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 33, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 33, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-06-25 21:21:06.982', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_33.mp3', 'groovy grails new', 'Grails Podcast Episode 33');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (34, 0, 'This is content number 34, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 34, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 34, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 34, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-07-09 21:21:06.985', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_34.mp3', 'groovy grails new', 'Grails Podcast Episode 34');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (35, 0, 'This is content number 35, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 35, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 35, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 35, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-07-23 21:21:06.987', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_35.mp3', 'groovy grails new', 'Grails Podcast Episode 35');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (36, 0, 'This is content number 36, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 36, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 36, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 36, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-08-06 21:21:06.99', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_36.mp3', 'groovy grails new', 'Grails Podcast Episode 36');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (37, 0, 'This is content number 37, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 37, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 37, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 37, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-08-20 21:21:06.994', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_37.mp3', 'groovy grails new', 'Grails Podcast Episode 37');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (38, 0, 'This is content number 38, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 38, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 38, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 38, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-09-03 21:21:06.998', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_38.mp3', 'groovy grails new', 'Grails Podcast Episode 38');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (39, 0, 'This is content number 39, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 39, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 39, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 39, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-09-17 21:21:07.001', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_39.mp3', 'groovy grails new', 'Grails Podcast Episode 39');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (40, 0, 'This is content number 40, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 40, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 40, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 40, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-10-01 21:21:07.011', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_40.mp3', 'groovy grails new', 'Grails Podcast Episode 40');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (41, 0, 'This is content number 41, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 41, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 41, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 41, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-10-15 21:21:07.014', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_41.mp3', 'groovy grails new', 'Grails Podcast Episode 41');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (42, 0, 'This is content number 42, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 42, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 42, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 42, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-10-29 21:21:07.017', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_42.mp3', 'groovy grails new', 'Grails Podcast Episode 42');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (43, 0, 'This is content number 43, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 43, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 43, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 43, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-11-12 21:21:07.019', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_43.mp3', 'groovy grails new', 'Grails Podcast Episode 43');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (44, 0, 'This is content number 44, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 44, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 44, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 44, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-11-26 21:21:07.022', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_44.mp3', 'groovy grails new', 'Grails Podcast Episode 44');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (45, 0, 'This is content number 45, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 45, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 45, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 45, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-12-10 21:21:07.024', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_45.mp3', 'groovy grails new', 'Grails Podcast Episode 45');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (46, 0, 'This is content number 46, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 46, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 46, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 46, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2007-12-24 21:21:07.027', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_46.mp3', 'groovy grails new', 'Grails Podcast Episode 46');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (47, 0, 'This is content number 47, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 47, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 47, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 47, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-01-07 21:21:07.029', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_47.mp3', 'groovy grails new', 'Grails Podcast Episode 47');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (48, 0, 'This is content number 48, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 48, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 48, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 48, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-01-21 21:21:07.032', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_48.mp3', 'groovy grails new', 'Grails Podcast Episode 48');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (49, 0, 'This is content number 49, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 49, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 49, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 49, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-02-04 21:21:07.035', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_49.mp3', 'groovy grails new', 'Grails Podcast Episode 49');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (50, 0, 'This is content number 50, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 50, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 50, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 50, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-02-18 21:21:07.037', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_50.mp3', 'groovy grails new', 'Grails Podcast Episode 50');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (51, 0, 'This is content number 51, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 51, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 51, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 51, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-03-03 21:21:07.041', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_51.mp3', 'groovy grails new', 'Grails Podcast Episode 51');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (52, 0, 'This is content number 52, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 52, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 52, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 52, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-03-17 21:21:07.044', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_52.mp3', 'groovy grails new', 'Grails Podcast Episode 52');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (53, 0, 'This is content number 53, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 53, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 53, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 53, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-03-31 21:21:07.046', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_53.mp3', 'groovy grails new', 'Grails Podcast Episode 53');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (54, 0, 'This is content number 54, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 54, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 54, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 54, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-04-14 21:21:07.049', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_54.mp3', 'groovy grails new', 'Grails Podcast Episode 54');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (55, 0, 'This is content number 55, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 55, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 55, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 55, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-04-28 21:21:07.054', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_55.mp3', 'groovy grails new', 'Grails Podcast Episode 55');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (56, 0, 'This is content number 56, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 56, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 56, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 56, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-05-12 21:21:07.06', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_56.mp3', 'groovy grails new', 'Grails Podcast Episode 56');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (57, 0, 'This is content number 57, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 57, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 57, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 57, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-05-26 21:21:07.063', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_57.mp3', 'groovy grails new', 'Grails Podcast Episode 57');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (58, 0, 'This is content number 58, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 58, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 58, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 58, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-06-09 21:21:07.066', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_58.mp3', 'groovy grails new', 'Grails Podcast Episode 58');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (59, 0, 'This is content number 59, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 59, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 59, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 59, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-06-23 21:21:07.069', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_59.mp3', 'groovy grails new', 'Grails Podcast Episode 59');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (60, 0, 'This is content number 60, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 60, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 60, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 60, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-07-07 21:21:07.098', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_60.mp3', 'groovy grails new', 'Grails Podcast Episode 60');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (61, 0, 'This is content number 61, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 61, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 61, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 61, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-07-21 21:21:07.10', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_61.mp3', 'groovy grails new', 'Grails Podcast Episode 61');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (62, 0, 'This is content number 62, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 62, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 62, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 62, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-08-04 21:21:07.102', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_62.mp3', 'groovy grails new', 'Grails Podcast Episode 62');
INSERT INTO entry (id, version, content, created, enclosure_length, enclosure_type, enclosureurl, tags, title) VALUES (63, 0, 'This is content number 63, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 63, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 63, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number 63, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!', '2008-08-18 21:21:07.104', 0, 'audio/mpeg', 'http://hansamann.podspot.de/files/grails_podcast_episode_63.mp3', 'groovy grails new', 'Grails Podcast Episode 63');


--
-- TOC entry 1740 (class 2606 OID 18093)
-- Dependencies: 1469 1469
-- Name: authentication_user_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authentication_user
    ADD CONSTRAINT authentication_user_login_key UNIQUE (login);


--
-- TOC entry 1742 (class 2606 OID 18091)
-- Dependencies: 1469 1469
-- Name: authentication_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authentication_user
    ADD CONSTRAINT authentication_user_pkey PRIMARY KEY (id);


--
-- TOC entry 1744 (class 2606 OID 18101)
-- Dependencies: 1470 1470
-- Name: comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- TOC entry 1746 (class 2606 OID 18109)
-- Dependencies: 1471 1471
-- Name: entry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entry
    ADD CONSTRAINT entry_pkey PRIMARY KEY (id);


--
-- TOC entry 1747 (class 2606 OID 18110)
-- Dependencies: 1745 1471 1470
-- Name: fk38a5ee5f8735545a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk38a5ee5f8735545a FOREIGN KEY (entry_id) REFERENCES entry(id);


--
-- TOC entry 1755 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2008-08-18 21:47:53 PDT

--
-- PostgreSQL database dump complete
--

