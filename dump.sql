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
-- Name: channel_member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel_member (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    channel_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.channel_member OWNER TO postgres;

--
-- Name: channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channels (
    id integer NOT NULL,
    name character varying(255),
    public boolean DEFAULT true,
    dm boolean DEFAULT false,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    team_id integer
);


ALTER TABLE public.channels OWNER TO postgres;

--
-- Name: channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.channels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channels_id_seq OWNER TO postgres;

--
-- Name: channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.channels_id_seq OWNED BY public.channels.id;


--
-- Name: direct_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.direct_messages (
    id integer NOT NULL,
    text character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    team_id integer,
    receiver_id integer,
    sender_id integer
);


ALTER TABLE public.direct_messages OWNER TO postgres;

--
-- Name: direct_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.direct_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.direct_messages_id_seq OWNER TO postgres;

--
-- Name: direct_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.direct_messages_id_seq OWNED BY public.direct_messages.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    admin boolean DEFAULT false,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.members OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    text character varying(255),
    url character varying(255),
    filetype character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    channel_id integer,
    user_id integer
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: pcmembers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pcmembers (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    channel_id integer NOT NULL
);


ALTER TABLE public.pcmembers OWNER TO postgres;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    password character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: channels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channels ALTER COLUMN id SET DEFAULT nextval('public.channels_id_seq'::regclass);


--
-- Name: direct_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direct_messages ALTER COLUMN id SET DEFAULT nextval('public.direct_messages_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: channel_member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channel_member (created_at, updated_at, channel_id, user_id) FROM stdin;
\.


--
-- Data for Name: channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channels (id, name, public, dm, created_at, updated_at, team_id) FROM stdin;
1	general	t	f	2020-03-15 23:50:06.135+05:30	2020-03-15 23:50:06.135+05:30	1
2	general	t	f	2020-03-15 23:53:45.29+05:30	2020-03-15 23:53:45.29+05:30	2
3	public	t	f	2020-03-15 23:54:07.305+05:30	2020-03-15 23:54:07.305+05:30	1
4	pvc	f	f	2020-03-15 23:55:26.961+05:30	2020-03-15 23:55:26.961+05:30	1
5	pvc 2	f	f	2020-03-15 23:56:01.507+05:30	2020-03-15 23:56:01.507+05:30	1
6	Hello	f	t	2020-03-16 00:27:07.402+05:30	2020-03-16 00:27:07.402+05:30	1
7	bob3138, bob4148, bob5158	f	t	2020-03-16 01:07:47.091+05:30	2020-03-16 01:07:47.091+05:30	1
8	bob5158	f	t	2020-03-16 01:11:02.809+05:30	2020-03-16 01:11:02.809+05:30	1
9	bob4148	f	t	2020-03-16 01:11:38.054+05:30	2020-03-16 01:11:38.054+05:30	1
10	bob3138	f	t	2020-03-16 01:28:36.078+05:30	2020-03-16 01:28:36.078+05:30	1
11	bob3138	f	t	2020-03-16 01:31:12.62+05:30	2020-03-16 01:31:12.62+05:30	1
12	bob3138, bob4148	f	t	2020-03-16 01:31:22.676+05:30	2020-03-16 01:31:22.676+05:30	1
13	bob4148, bob5158	f	t	2020-03-16 01:31:38.038+05:30	2020-03-16 01:31:38.038+05:30	1
14	bob3138, bob4148, bob5158	f	t	2020-03-16 01:32:01.5+05:30	2020-03-16 01:32:01.5+05:30	1
15	bob4148	f	t	2020-03-16 01:32:10.822+05:30	2020-03-16 01:32:10.822+05:30	1
16	bob5158	f	t	2020-03-16 01:33:02.835+05:30	2020-03-16 01:33:02.835+05:30	1
17	bob3138, bob5158	f	t	2020-03-16 01:55:44.874+05:30	2020-03-16 01:55:44.874+05:30	1
18	bob3138, bob6168	f	t	2020-03-16 02:00:49.38+05:30	2020-03-16 02:00:49.38+05:30	1
19	bob3138, bob5158, bob6168	f	t	2020-03-16 02:01:42.161+05:30	2020-03-16 02:01:42.161+05:30	1
20	general	t	f	2020-03-16 22:27:15.811+05:30	2020-03-16 22:27:15.811+05:30	4
21	new	t	f	2020-03-16 23:01:59.619+05:30	2020-03-16 23:01:59.619+05:30	1
\.


--
-- Data for Name: direct_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.direct_messages (id, text, created_at, updated_at, team_id, receiver_id, sender_id) FROM stdin;
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (admin, created_at, updated_at, user_id, team_id) FROM stdin;
t	2020-03-15 23:50:06.142+05:30	2020-03-15 23:50:06.142+05:30	1	1
t	2020-03-15 23:53:45.295+05:30	2020-03-15 23:53:45.295+05:30	2	2
f	2020-03-15 23:53:52.107+05:30	2020-03-15 23:53:52.107+05:30	2	1
f	2020-03-15 23:55:03.181+05:30	2020-03-15 23:55:03.181+05:30	3	1
f	2020-03-16 01:07:40.433+05:30	2020-03-16 01:07:40.433+05:30	4	1
f	2020-03-16 02:00:40.971+05:30	2020-03-16 02:00:40.971+05:30	5	1
t	2020-03-16 22:27:15.85+05:30	2020-03-16 22:27:15.85+05:30	1	4
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, text, url, filetype, created_at, updated_at, channel_id, user_id) FROM stdin;
1	hii	\N	\N	2020-03-15 23:54:27.431+05:30	2020-03-15 23:54:27.431+05:30	1	2
2	hey	\N	\N	2020-03-16 01:37:02.506+05:30	2020-03-16 01:37:02.506+05:30	12	1
3	hii	\N	\N	2020-03-16 01:37:44.484+05:30	2020-03-16 01:37:44.484+05:30	12	1
4	hii	\N	\N	2020-03-16 01:39:11.559+05:30	2020-03-16 01:39:11.559+05:30	13	1
5	Cool its working	\N	\N	2020-03-16 01:39:20.097+05:30	2020-03-16 01:39:20.097+05:30	13	1
6	hey	\N	\N	2020-03-16 01:40:19.431+05:30	2020-03-16 01:40:19.431+05:30	14	1
7	hey	\N	\N	2020-03-16 01:40:30.841+05:30	2020-03-16 01:40:30.841+05:30	14	3
8	working fine	\N	\N	2020-03-16 01:40:38.066+05:30	2020-03-16 01:40:38.066+05:30	14	1
9	yeah cool man	\N	\N	2020-03-16 01:40:43.355+05:30	2020-03-16 01:40:43.355+05:30	14	3
10	hmm	\N	\N	2020-03-16 01:50:13.997+05:30	2020-03-16 01:50:13.997+05:30	14	1
11	Hey bob3	\N	\N	2020-03-16 02:02:03.126+05:30	2020-03-16 02:02:03.126+05:30	19	1
12	hello everyone	\N	\N	2020-03-16 02:59:33.675+05:30	2020-03-16 02:59:33.675+05:30	3	1
13	hello	\N	\N	2020-03-16 03:00:00.086+05:30	2020-03-16 03:00:00.086+05:30	1	1
14	hello	\N	\N	2020-03-16 03:00:15.706+05:30	2020-03-16 03:00:15.706+05:30	11	1
15	hii man	\N	\N	2020-03-16 03:01:13.483+05:30	2020-03-16 03:01:13.483+05:30	1	2
16	hello	\N	\N	2020-03-16 03:01:22.099+05:30	2020-03-16 03:01:22.099+05:30	1	2
17	This message is served by redis	\N	\N	2020-03-16 03:01:53.926+05:30	2020-03-16 03:01:53.926+05:30	11	1
18	Cool Redis working ..	\N	\N	2020-03-16 03:02:10.339+05:30	2020-03-16 03:02:10.339+05:30	11	2
19	hii	\N	\N	2020-03-16 03:05:17.919+05:30	2020-03-16 03:05:17.919+05:30	1	1
20	Cool	\N	\N	2020-03-16 03:05:20.904+05:30	2020-03-16 03:05:20.904+05:30	1	1
21	Cool Redis	\N	\N	2020-03-16 03:05:31.796+05:30	2020-03-16 03:05:31.796+05:30	1	1
22	Cool Redis	\N	\N	2020-03-16 03:05:33.628+05:30	2020-03-16 03:05:33.628+05:30	1	1
23	Cool Redis	\N	\N	2020-03-16 03:05:34.438+05:30	2020-03-16 03:05:34.438+05:30	1	1
24	Cool Redis	\N	\N	2020-03-16 03:05:35.355+05:30	2020-03-16 03:05:35.355+05:30	1	1
25	Cool Redis	\N	\N	2020-03-16 03:05:36.196+05:30	2020-03-16 03:05:36.196+05:30	1	1
26	Cool Redis	\N	\N	2020-03-16 03:05:37.275+05:30	2020-03-16 03:05:37.275+05:30	1	1
27	Cool Redis	\N	\N	2020-03-16 03:05:38.16+05:30	2020-03-16 03:05:38.16+05:30	1	1
28	Cool Redis	\N	\N	2020-03-16 03:05:39.206+05:30	2020-03-16 03:05:39.206+05:30	1	1
29	Cool Redis	\N	\N	2020-03-16 03:05:40.152+05:30	2020-03-16 03:05:40.152+05:30	1	1
30	Cool Redis	\N	\N	2020-03-16 03:05:41.129+05:30	2020-03-16 03:05:41.129+05:30	1	1
31	Cool Redis	\N	\N	2020-03-16 03:05:42.148+05:30	2020-03-16 03:05:42.148+05:30	1	1
32	Cool Redis	\N	\N	2020-03-16 03:05:43.09+05:30	2020-03-16 03:05:43.09+05:30	1	1
33	Cool Redis	\N	\N	2020-03-16 03:05:44.019+05:30	2020-03-16 03:05:44.019+05:30	1	1
34	Cool Redis	\N	\N	2020-03-16 03:05:45.057+05:30	2020-03-16 03:05:45.057+05:30	1	1
35	Cool Redis	\N	\N	2020-03-16 03:05:46.075+05:30	2020-03-16 03:05:46.075+05:30	1	1
36	Cool Redis	\N	\N	2020-03-16 03:05:47.044+05:30	2020-03-16 03:05:47.044+05:30	1	1
37	Cool Redis	\N	\N	2020-03-16 03:05:48.291+05:30	2020-03-16 03:05:48.291+05:30	1	1
38	qqdw	\N	\N	2020-03-16 03:06:11.752+05:30	2020-03-16 03:06:11.752+05:30	1	1
39	reet	\N	\N	2020-03-16 03:06:13.825+05:30	2020-03-16 03:06:13.825+05:30	1	1
40	erefc	\N	\N	2020-03-16 03:06:14.808+05:30	2020-03-16 03:06:14.808+05:30	1	1
41	f e	\N	\N	2020-03-16 03:06:15.641+05:30	2020-03-16 03:06:15.641+05:30	1	1
42	ec	\N	\N	2020-03-16 03:06:16.45+05:30	2020-03-16 03:06:16.45+05:30	1	1
43	ecef	\N	\N	2020-03-16 03:06:17.295+05:30	2020-03-16 03:06:17.295+05:30	1	1
44	fc	\N	\N	2020-03-16 03:06:18.061+05:30	2020-03-16 03:06:18.061+05:30	1	1
45	efc 	\N	\N	2020-03-16 03:06:18.709+05:30	2020-03-16 03:06:18.709+05:30	1	1
46	e	\N	\N	2020-03-16 03:06:19.035+05:30	2020-03-16 03:06:19.035+05:30	1	1
47	efc	\N	\N	2020-03-16 03:06:19.393+05:30	2020-03-16 03:06:19.393+05:30	1	1
48	cef	\N	\N	2020-03-16 03:06:19.767+05:30	2020-03-16 03:06:19.767+05:30	1	1
49	fc	\N	\N	2020-03-16 03:06:20.089+05:30	2020-03-16 03:06:20.089+05:30	1	1
50	cf	\N	\N	2020-03-16 03:06:20.332+05:30	2020-03-16 03:06:20.332+05:30	1	1
51	e	\N	\N	2020-03-16 03:06:20.582+05:30	2020-03-16 03:06:20.582+05:30	1	1
52	fce	\N	\N	2020-03-16 03:06:20.861+05:30	2020-03-16 03:06:20.861+05:30	1	1
53	fc	\N	\N	2020-03-16 03:06:21.116+05:30	2020-03-16 03:06:21.116+05:30	1	1
54	fe	\N	\N	2020-03-16 03:06:21.558+05:30	2020-03-16 03:06:21.558+05:30	1	1
55	c ef	\N	\N	2020-03-16 03:06:21.809+05:30	2020-03-16 03:06:21.809+05:30	1	1
56	 cf	\N	\N	2020-03-16 03:06:22.022+05:30	2020-03-16 03:06:22.022+05:30	1	1
57	fc	\N	\N	2020-03-16 03:06:22.256+05:30	2020-03-16 03:06:22.256+05:30	1	1
58	f	\N	\N	2020-03-16 03:06:22.502+05:30	2020-03-16 03:06:22.502+05:30	1	1
59	c	\N	\N	2020-03-16 03:06:22.733+05:30	2020-03-16 03:06:22.733+05:30	1	1
60	c	\N	\N	2020-03-16 03:06:23.164+05:30	2020-03-16 03:06:23.164+05:30	1	1
61	cfecf	\N	\N	2020-03-16 03:06:23.63+05:30	2020-03-16 03:06:23.63+05:30	1	1
62	e	\N	\N	2020-03-16 03:06:23.86+05:30	2020-03-16 03:06:23.86+05:30	1	1
63	c	\N	\N	2020-03-16 03:06:24.066+05:30	2020-03-16 03:06:24.066+05:30	1	1
64	cef	\N	\N	2020-03-16 03:06:24.513+05:30	2020-03-16 03:06:24.513+05:30	1	1
65	ec	\N	\N	2020-03-16 03:06:24.97+05:30	2020-03-16 03:06:24.97+05:30	1	1
66	ce	\N	\N	2020-03-16 03:06:25.215+05:30	2020-03-16 03:06:25.215+05:30	1	1
67	ce	\N	\N	2020-03-16 03:06:25.634+05:30	2020-03-16 03:06:25.634+05:30	1	1
68	c	\N	\N	2020-03-16 03:06:25.853+05:30	2020-03-16 03:06:25.853+05:30	1	1
69	f	\N	\N	2020-03-16 03:06:26.089+05:30	2020-03-16 03:06:26.089+05:30	1	1
70	c	\N	\N	2020-03-16 03:06:26.358+05:30	2020-03-16 03:06:26.358+05:30	1	1
71	e	\N	\N	2020-03-16 03:06:27.015+05:30	2020-03-16 03:06:27.015+05:30	1	1
72	f	\N	\N	2020-03-16 03:06:27.215+05:30	2020-03-16 03:06:27.215+05:30	1	1
73	cf	\N	\N	2020-03-16 03:06:27.653+05:30	2020-03-16 03:06:27.653+05:30	1	1
74	ef	\N	\N	2020-03-16 03:06:28.37+05:30	2020-03-16 03:06:28.37+05:30	1	1
75	fe	\N	\N	2020-03-16 03:06:28.587+05:30	2020-03-16 03:06:28.587+05:30	1	1
76	e	\N	\N	2020-03-16 03:06:28.944+05:30	2020-03-16 03:06:28.944+05:30	1	1
77	effc	\N	\N	2020-03-16 03:06:29.568+05:30	2020-03-16 03:06:29.568+05:30	1	1
78	ecf	\N	\N	2020-03-16 03:06:30.131+05:30	2020-03-16 03:06:30.131+05:30	1	1
79	c	\N	\N	2020-03-16 03:06:30.309+05:30	2020-03-16 03:06:30.309+05:30	1	1
80	ef	\N	\N	2020-03-16 03:06:30.535+05:30	2020-03-16 03:06:30.535+05:30	1	1
81	\N	files\\upload_0b76dabed6b129c2a735da04a280a4e1	image/jpeg	2020-03-16 03:06:59.534+05:30	2020-03-16 03:06:59.534+05:30	1	1
82	\N	files\\upload_a8fd74c622cae214382421b8eb25e962	audio/mp3	2020-03-16 03:07:06.336+05:30	2020-03-16 03:07:06.336+05:30	1	1
83	\N	\N	\N	2020-03-16 03:13:48.022+05:30	2020-03-16 03:13:48.022+05:30	1	1
84	later message	\N	\N	2020-03-16 03:41:37.825+05:30	2020-03-16 03:41:37.825+05:30	1	1
85	event later mesage	\N	\N	2020-03-16 03:43:09.901+05:30	2020-03-16 03:43:09.901+05:30	1	1
86	lslk	\N	\N	2020-03-16 21:32:59.395+05:30	2020-03-16 21:32:59.395+05:30	1	1
87	hello	\N	\N	2020-03-16 21:34:37.733+05:30	2020-03-16 21:34:37.733+05:30	1	1
88	hii	\N	\N	2020-03-16 22:43:20.217+05:30	2020-03-16 22:43:20.217+05:30	1	1
89	hello	\N	\N	2020-03-16 22:43:24.059+05:30	2020-03-16 22:43:24.059+05:30	1	1
90	jhj	\N	\N	2020-03-16 22:43:52.514+05:30	2020-03-16 22:43:52.514+05:30	1	1
91	hdhd	\N	\N	2020-03-16 22:46:16.437+05:30	2020-03-16 22:46:16.437+05:30	1	1
92	klksl	\N	\N	2020-03-16 22:46:49.227+05:30	2020-03-16 22:46:49.227+05:30	1	1
93	Hey	\N	\N	2020-03-16 22:51:39.803+05:30	2020-03-16 22:51:39.803+05:30	1	1
94	Hey Reconect	\N	\N	2020-03-16 22:52:23.39+05:30	2020-03-16 22:52:23.39+05:30	1	1
95	hey rec	\N	\N	2020-03-16 22:53:48.106+05:30	2020-03-16 22:53:48.106+05:30	1	1
96	jjaj	\N	\N	2020-03-16 22:56:09.075+05:30	2020-03-16 22:56:09.075+05:30	1	1
97	js	\N	\N	2020-03-16 22:56:46.067+05:30	2020-03-16 22:56:46.067+05:30	1	1
98	sd	\N	\N	2020-03-16 23:02:06.286+05:30	2020-03-16 23:02:06.286+05:30	21	1
99	ds	\N	\N	2020-03-16 23:02:06.652+05:30	2020-03-16 23:02:06.652+05:30	21	1
100	sd	\N	\N	2020-03-16 23:02:06.911+05:30	2020-03-16 23:02:06.911+05:30	21	1
101	sd	\N	\N	2020-03-16 23:02:07.355+05:30	2020-03-16 23:02:07.355+05:30	21	1
102	s	\N	\N	2020-03-16 23:02:07.724+05:30	2020-03-16 23:02:07.724+05:30	21	1
103	s	\N	\N	2020-03-16 23:02:07.932+05:30	2020-03-16 23:02:07.932+05:30	21	1
104	sf	\N	\N	2020-03-16 23:02:08.274+05:30	2020-03-16 23:02:08.274+05:30	21	1
105	f	\N	\N	2020-03-16 23:02:08.437+05:30	2020-03-16 23:02:08.437+05:30	21	1
106	s	\N	\N	2020-03-16 23:02:08.765+05:30	2020-03-16 23:02:08.765+05:30	21	1
107	a	\N	\N	2020-03-16 23:02:08.943+05:30	2020-03-16 23:02:08.943+05:30	21	1
108	f	\N	\N	2020-03-16 23:02:09.147+05:30	2020-03-16 23:02:09.147+05:30	21	1
109	f	\N	\N	2020-03-16 23:02:09.382+05:30	2020-03-16 23:02:09.382+05:30	21	1
110	df	\N	\N	2020-03-16 23:02:09.615+05:30	2020-03-16 23:02:09.615+05:30	21	1
111	d	\N	\N	2020-03-16 23:02:10.044+05:30	2020-03-16 23:02:10.044+05:30	21	1
112	adfa	\N	\N	2020-03-16 23:02:10.464+05:30	2020-03-16 23:02:10.464+05:30	21	1
113	adf	\N	\N	2020-03-16 23:02:10.695+05:30	2020-03-16 23:02:10.695+05:30	21	1
114	f	\N	\N	2020-03-16 23:02:10.889+05:30	2020-03-16 23:02:10.889+05:30	21	1
115	asf	\N	\N	2020-03-16 23:02:11.208+05:30	2020-03-16 23:02:11.208+05:30	21	1
116	f	\N	\N	2020-03-16 23:02:11.542+05:30	2020-03-16 23:02:11.542+05:30	21	1
117	af	\N	\N	2020-03-16 23:02:11.876+05:30	2020-03-16 23:02:11.876+05:30	21	1
118	af	\N	\N	2020-03-16 23:02:12.12+05:30	2020-03-16 23:02:12.12+05:30	21	1
119	af	\N	\N	2020-03-16 23:02:12.339+05:30	2020-03-16 23:02:12.339+05:30	21	1
120	df	\N	\N	2020-03-16 23:02:12.421+05:30	2020-03-16 23:02:12.421+05:30	21	1
121	af	\N	\N	2020-03-16 23:02:12.602+05:30	2020-03-16 23:02:12.602+05:30	21	1
122	klkasl	\N	\N	2020-03-16 23:02:39.571+05:30	2020-03-16 23:02:39.571+05:30	21	1
123	dsf	\N	\N	2020-03-16 23:02:40.716+05:30	2020-03-16 23:02:40.716+05:30	21	1
124	fsf	\N	\N	2020-03-16 23:02:41.116+05:30	2020-03-16 23:02:41.116+05:30	21	1
125	f	\N	\N	2020-03-16 23:02:41.336+05:30	2020-03-16 23:02:41.336+05:30	21	1
126	sf	\N	\N	2020-03-16 23:02:41.65+05:30	2020-03-16 23:02:41.65+05:30	21	1
127	f	\N	\N	2020-03-16 23:02:41.921+05:30	2020-03-16 23:02:41.921+05:30	21	1
128	f	\N	\N	2020-03-16 23:02:42.139+05:30	2020-03-16 23:02:42.139+05:30	21	1
129	f	\N	\N	2020-03-16 23:02:42.491+05:30	2020-03-16 23:02:42.491+05:30	21	1
130	f	\N	\N	2020-03-16 23:02:42.836+05:30	2020-03-16 23:02:42.836+05:30	21	1
131	f	\N	\N	2020-03-16 23:02:43.034+05:30	2020-03-16 23:02:43.034+05:30	21	1
132	d	\N	\N	2020-03-16 23:02:43.945+05:30	2020-03-16 23:02:43.945+05:30	21	1
133	efrf	\N	\N	2020-03-16 23:02:44.316+05:30	2020-03-16 23:02:44.316+05:30	21	1
134	g	\N	\N	2020-03-16 23:02:44.684+05:30	2020-03-16 23:02:44.684+05:30	21	1
135	g	\N	\N	2020-03-16 23:02:44.97+05:30	2020-03-16 23:02:44.97+05:30	21	1
136	gd	\N	\N	2020-03-16 23:02:45.226+05:30	2020-03-16 23:02:45.226+05:30	21	1
137	g	\N	\N	2020-03-16 23:02:45.494+05:30	2020-03-16 23:02:45.494+05:30	21	1
138	dg	\N	\N	2020-03-16 23:02:45.763+05:30	2020-03-16 23:02:45.763+05:30	21	1
139	g	\N	\N	2020-03-16 23:02:46.033+05:30	2020-03-16 23:02:46.033+05:30	21	1
140	g	\N	\N	2020-03-16 23:02:46.284+05:30	2020-03-16 23:02:46.284+05:30	21	1
141	g	\N	\N	2020-03-16 23:02:46.573+05:30	2020-03-16 23:02:46.573+05:30	21	1
142	g	\N	\N	2020-03-16 23:02:46.81+05:30	2020-03-16 23:02:46.81+05:30	21	1
143	g	\N	\N	2020-03-16 23:02:47.008+05:30	2020-03-16 23:02:47.008+05:30	21	1
144	g	\N	\N	2020-03-16 23:02:47.354+05:30	2020-03-16 23:02:47.354+05:30	21	1
145	g	\N	\N	2020-03-16 23:02:47.669+05:30	2020-03-16 23:02:47.669+05:30	21	1
146	G	\N	\N	2020-03-16 23:02:47.789+05:30	2020-03-16 23:02:47.789+05:30	21	1
147	G	\N	\N	2020-03-16 23:02:48.084+05:30	2020-03-16 23:02:48.084+05:30	21	1
148	D	\N	\N	2020-03-16 23:02:48.248+05:30	2020-03-16 23:02:48.248+05:30	21	1
149	G	\N	\N	2020-03-16 23:02:48.386+05:30	2020-03-16 23:02:48.386+05:30	21	1
150	G	\N	\N	2020-03-16 23:02:48.855+05:30	2020-03-16 23:02:48.855+05:30	21	1
151	G	\N	\N	2020-03-16 23:02:48.995+05:30	2020-03-16 23:02:48.995+05:30	21	1
152	G	\N	\N	2020-03-16 23:02:49.254+05:30	2020-03-16 23:02:49.254+05:30	21	1
153	ADG	\N	\N	2020-03-16 23:02:49.422+05:30	2020-03-16 23:02:49.422+05:30	21	1
154	G	\N	\N	2020-03-16 23:02:49.717+05:30	2020-03-16 23:02:49.717+05:30	21	1
155	D	\N	\N	2020-03-16 23:02:50.143+05:30	2020-03-16 23:02:50.143+05:30	21	1
156	DG	\N	\N	2020-03-16 23:02:50.309+05:30	2020-03-16 23:02:50.309+05:30	21	1
157	DF	\N	\N	2020-03-16 23:02:50.468+05:30	2020-03-16 23:02:50.468+05:30	21	1
158	G	\N	\N	2020-03-16 23:02:50.759+05:30	2020-03-16 23:02:50.759+05:30	21	1
159	DG	\N	\N	2020-03-16 23:02:51.049+05:30	2020-03-16 23:02:51.049+05:30	21	1
160	DG	\N	\N	2020-03-16 23:02:51.403+05:30	2020-03-16 23:02:51.403+05:30	21	1
161	DG	\N	\N	2020-03-16 23:02:51.561+05:30	2020-03-16 23:02:51.561+05:30	21	1
162	G	\N	\N	2020-03-16 23:02:51.872+05:30	2020-03-16 23:02:51.872+05:30	21	1
163	G	\N	\N	2020-03-16 23:02:52.181+05:30	2020-03-16 23:02:52.181+05:30	21	1
164	G	\N	\N	2020-03-16 23:02:52.489+05:30	2020-03-16 23:02:52.489+05:30	21	1
165	GD	\N	\N	2020-03-16 23:02:52.633+05:30	2020-03-16 23:02:52.633+05:30	21	1
166	DG	\N	\N	2020-03-16 23:02:52.962+05:30	2020-03-16 23:02:52.962+05:30	21	1
167	G	\N	\N	2020-03-16 23:02:53.102+05:30	2020-03-16 23:02:53.102+05:30	21	1
168	DG	\N	\N	2020-03-16 23:02:53.427+05:30	2020-03-16 23:02:53.427+05:30	21	1
169	GD	\N	\N	2020-03-16 23:02:53.582+05:30	2020-03-16 23:02:53.582+05:30	21	1
170	DG	\N	\N	2020-03-16 23:02:53.77+05:30	2020-03-16 23:02:53.77+05:30	21	1
171	G	\N	\N	2020-03-16 23:02:54.09+05:30	2020-03-16 23:02:54.09+05:30	21	1
172	GD	\N	\N	2020-03-16 23:02:54.477+05:30	2020-03-16 23:02:54.477+05:30	21	1
173	D	\N	\N	2020-03-16 23:02:54.61+05:30	2020-03-16 23:02:54.61+05:30	21	1
174	DG	\N	\N	2020-03-16 23:02:54.808+05:30	2020-03-16 23:02:54.808+05:30	21	1
175	G	\N	\N	2020-03-16 23:02:55.115+05:30	2020-03-16 23:02:55.115+05:30	21	1
176	DG	\N	\N	2020-03-16 23:02:55.291+05:30	2020-03-16 23:02:55.291+05:30	21	1
177	DG	\N	\N	2020-03-16 23:02:55.662+05:30	2020-03-16 23:02:55.662+05:30	21	1
178	DG	\N	\N	2020-03-16 23:02:55.88+05:30	2020-03-16 23:02:55.88+05:30	21	1
179	G	\N	\N	2020-03-16 23:02:56.078+05:30	2020-03-16 23:02:56.078+05:30	21	1
180	G	\N	\N	2020-03-16 23:02:56.407+05:30	2020-03-16 23:02:56.407+05:30	21	1
181	DG	\N	\N	2020-03-16 23:02:56.57+05:30	2020-03-16 23:02:56.57+05:30	21	1
182	DG	\N	\N	2020-03-16 23:02:56.886+05:30	2020-03-16 23:02:56.886+05:30	21	1
183	GD	\N	\N	2020-03-16 23:02:57.053+05:30	2020-03-16 23:02:57.053+05:30	21	1
184	DG	\N	\N	2020-03-16 23:02:57.411+05:30	2020-03-16 23:02:57.411+05:30	21	1
185	DG	\N	\N	2020-03-16 23:02:57.559+05:30	2020-03-16 23:02:57.559+05:30	21	1
186	G	\N	\N	2020-03-16 23:02:57.921+05:30	2020-03-16 23:02:57.921+05:30	21	1
187	DG	\N	\N	2020-03-16 23:02:58.288+05:30	2020-03-16 23:02:58.288+05:30	21	1
188	DGG	\N	\N	2020-03-16 23:02:58.641+05:30	2020-03-16 23:02:58.641+05:30	21	1
189	HII	\N	\N	2020-03-16 23:04:04.085+05:30	2020-03-16 23:04:04.085+05:30	21	1
190	\N	files\\upload_ae55cf1f4e25ca298116a6166a83aa74	image/jpeg	2020-03-17 09:08:47.355+05:30	2020-03-17 09:08:47.355+05:30	1	1
191	hii	\N	\N	2020-03-17 09:09:08.98+05:30	2020-03-17 09:09:08.98+05:30	1	1
192	\N	files\\upload_484e90273af0473eaeb4d457d1758c93	image/jpeg	2020-03-17 09:09:21.68+05:30	2020-03-17 09:09:21.68+05:30	1	1
193	hey	\N	\N	2020-03-17 09:23:09.033+05:30	2020-03-17 09:23:09.033+05:30	1	1
194	Hmm	\N	\N	2020-03-17 09:44:49.269+05:30	2020-03-17 09:44:49.269+05:30	1	1
\.


--
-- Data for Name: pcmembers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pcmembers (created_at, updated_at, user_id, channel_id) FROM stdin;
2020-03-16 01:31:12.626+05:30	2020-03-16 01:31:12.626+05:30	2	11
2020-03-16 01:31:12.626+05:30	2020-03-16 01:31:12.626+05:30	1	11
2020-03-16 01:31:22.68+05:30	2020-03-16 01:31:22.68+05:30	2	12
2020-03-16 01:31:22.68+05:30	2020-03-16 01:31:22.68+05:30	3	12
2020-03-16 01:31:22.68+05:30	2020-03-16 01:31:22.68+05:30	1	12
2020-03-16 01:31:38.04+05:30	2020-03-16 01:31:38.04+05:30	3	13
2020-03-16 01:31:38.04+05:30	2020-03-16 01:31:38.04+05:30	4	13
2020-03-16 01:31:38.04+05:30	2020-03-16 01:31:38.04+05:30	1	13
2020-03-16 01:32:01.504+05:30	2020-03-16 01:32:01.504+05:30	2	14
2020-03-16 01:32:01.504+05:30	2020-03-16 01:32:01.504+05:30	3	14
2020-03-16 01:32:01.504+05:30	2020-03-16 01:32:01.504+05:30	4	14
2020-03-16 01:32:01.504+05:30	2020-03-16 01:32:01.504+05:30	1	14
2020-03-16 01:32:10.841+05:30	2020-03-16 01:32:10.841+05:30	3	15
2020-03-16 01:32:10.841+05:30	2020-03-16 01:32:10.841+05:30	1	15
2020-03-16 01:33:02.845+05:30	2020-03-16 01:33:02.845+05:30	4	16
2020-03-16 01:33:02.845+05:30	2020-03-16 01:33:02.845+05:30	1	16
2020-03-16 01:55:44.889+05:30	2020-03-16 01:55:44.889+05:30	2	17
2020-03-16 01:55:44.889+05:30	2020-03-16 01:55:44.889+05:30	4	17
2020-03-16 01:55:44.889+05:30	2020-03-16 01:55:44.889+05:30	1	17
2020-03-16 02:00:49.388+05:30	2020-03-16 02:00:49.388+05:30	2	18
2020-03-16 02:00:49.388+05:30	2020-03-16 02:00:49.388+05:30	5	18
2020-03-16 02:00:49.388+05:30	2020-03-16 02:00:49.388+05:30	1	18
2020-03-16 02:01:42.167+05:30	2020-03-16 02:01:42.167+05:30	2	19
2020-03-16 02:01:42.167+05:30	2020-03-16 02:01:42.167+05:30	4	19
2020-03-16 02:01:42.167+05:30	2020-03-16 02:01:42.167+05:30	5	19
2020-03-16 02:01:42.167+05:30	2020-03-16 02:01:42.167+05:30	1	19
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, name, created_at, updated_at) FROM stdin;
1	A Team	2020-03-15 23:50:06.129+05:30	2020-03-15 23:50:06.129+05:30
2	B Team	2020-03-15 23:53:45.274+05:30	2020-03-15 23:53:45.274+05:30
4	C Team	2020-03-16 22:27:15.77+05:30	2020-03-16 22:27:15.77+05:30
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, created_at, updated_at) FROM stdin;
1	bob2128	bob2128@gmail.com	$2a$12$bem7Oo9MsttGtE5iyVUrVuVP5DBYLZrWr.iJ.dFGckcSlPstusRcW	2020-03-15 23:48:47.984+05:30	2020-03-15 23:48:47.984+05:30
2	bob3138	bob3138@gmail.com	$2a$12$khR3zS/Q3El0YqKuAZkL1eclDzr4qV7BnrcFRNlAID5NGth3j/NHe	2020-03-15 23:49:23.569+05:30	2020-03-15 23:49:23.569+05:30
3	bob4148	bob4148@gmail.com	$2a$12$Bixp0iNN275KUxqiRPEo7uZwKC47kvKvbUlLtkGIE.OpPWAAL2ej.	2020-03-15 23:49:45.074+05:30	2020-03-15 23:49:45.074+05:30
4	bob5158	bob5158@gmail.com	$2a$12$O5RRwDco0Sj.2TtUI8QU3efcz3uWt82ZcunJwz0hIKRwcB60.9brm	2020-03-16 01:07:27.871+05:30	2020-03-16 01:07:27.871+05:30
5	bob6168	bob6168@gmail.com	$2a$12$AYAjBBNxeVr68pCxG5jfo.LyTfLpfy354x4AkfzC66hGx0lgBNJeS	2020-03-16 02:00:21.911+05:30	2020-03-16 02:00:21.911+05:30
\.


--
-- Name: channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channels_id_seq', 21, true);


--
-- Name: direct_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.direct_messages_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 194, true);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: channel_member channel_member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_member
    ADD CONSTRAINT channel_member_pkey PRIMARY KEY (channel_id, user_id);


--
-- Name: channels channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channels
    ADD CONSTRAINT channels_pkey PRIMARY KEY (id);


--
-- Name: direct_messages direct_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direct_messages
    ADD CONSTRAINT direct_messages_pkey PRIMARY KEY (id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (user_id, team_id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: pcmembers pcmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pcmembers
    ADD CONSTRAINT pcmembers_pkey PRIMARY KEY (user_id, channel_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_password_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_password_key UNIQUE (password);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: messages_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_created_at ON public.messages USING btree (created_at);


--
-- Name: channel_member channel_member_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_member
    ADD CONSTRAINT channel_member_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channels(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: channel_member channel_member_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_member
    ADD CONSTRAINT channel_member_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: channels channels_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channels
    ADD CONSTRAINT channels_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: direct_messages direct_messages_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direct_messages
    ADD CONSTRAINT direct_messages_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: direct_messages direct_messages_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direct_messages
    ADD CONSTRAINT direct_messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: direct_messages direct_messages_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direct_messages
    ADD CONSTRAINT direct_messages_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: members members_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: members members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: messages messages_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channels(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messages messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pcmembers pcmembers_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pcmembers
    ADD CONSTRAINT pcmembers_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channels(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pcmembers pcmembers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pcmembers
    ADD CONSTRAINT pcmembers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

