--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: contestants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contestants (
    contestant_id integer NOT NULL,
    name character varying(255) NOT NULL,
    score integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "participantsQuizId" integer
);


ALTER TABLE public.contestants OWNER TO postgres;

--
-- Name: contestants_contestant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contestants_contestant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contestants_contestant_id_seq OWNER TO postgres;

--
-- Name: contestants_contestant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contestants_contestant_id_seq OWNED BY public.contestants.contestant_id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    question_id integer NOT NULL,
    question character varying(255) NOT NULL,
    correct_ans character varying(300) NOT NULL,
    duration integer NOT NULL,
    min_pt integer NOT NULL,
    max_pt integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "quizquestionsQuizId" integer
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: questions_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_question_id_seq OWNER TO postgres;

--
-- Name: questions_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_question_id_seq OWNED BY public.questions.question_id;


--
-- Name: quizzes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quizzes (
    quiz_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "quizmasterUserId" integer
);


ALTER TABLE public.quizzes OWNER TO postgres;

--
-- Name: quizzes_quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quizzes_quiz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizzes_quiz_id_seq OWNER TO postgres;

--
-- Name: quizzes_quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quizzes_quiz_id_seq OWNED BY public.quizzes.quiz_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(300) NOT NULL,
    "isAdmin" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: contestants contestant_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contestants ALTER COLUMN contestant_id SET DEFAULT nextval('public.contestants_contestant_id_seq'::regclass);


--
-- Name: questions question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions ALTER COLUMN question_id SET DEFAULT nextval('public.questions_question_id_seq'::regclass);


--
-- Name: quizzes quiz_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes ALTER COLUMN quiz_id SET DEFAULT nextval('public.quizzes_quiz_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: contestants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contestants (contestant_id, name, score, "createdAt", "updatedAt", "participantsQuizId") FROM stdin;
8	john	0	2021-08-15 16:18:17.363+01	2021-08-15 16:18:17.363+01	8
9	doe	0	2021-08-15 16:18:17.363+01	2021-08-15 16:18:17.363+01	8
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (question_id, question, correct_ans, duration, min_pt, max_pt, "createdAt", "updatedAt", "quizquestionsQuizId") FROM stdin;
5	when is the next world cup	2022	30	1	3	2021-08-15 16:18:17.355+01	2021-08-15 16:18:17.355+01	8
6	which team won the last world cup	france	30	1	3	2021-08-15 16:18:17.355+01	2021-08-15 16:18:17.355+01	8
\.


--
-- Data for Name: quizzes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quizzes (quiz_id, title, description, "createdAt", "updatedAt", "quizmasterUserId") FROM stdin;
8	General knowledge	This is a quiz that you will test your knowledge	2021-08-15 16:18:17.095+01	2021-08-15 16:18:17.095+01	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password, "isAdmin", "createdAt", "updatedAt") FROM stdin;
1	admin	admin	t	2021-08-10 19:05:39.675+01	2021-08-10 19:05:39.675+01
2	director	director	f	2021-08-11 10:41:24.125+01	2021-08-11 10:41:24.125+01
15	johnson	johnson	f	2021-08-16 16:59:09.134+01	2021-08-16 16:59:09.134+01
\.


--
-- Name: contestants_contestant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contestants_contestant_id_seq', 9, true);


--
-- Name: questions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_question_id_seq', 6, true);


--
-- Name: quizzes_quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quizzes_quiz_id_seq', 8, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 15, true);


--
-- Name: contestants contestants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contestants
    ADD CONSTRAINT contestants_pkey PRIMARY KEY (contestant_id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (question_id);


--
-- Name: quizzes quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (quiz_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: contestants contestants_participantsQuizId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contestants
    ADD CONSTRAINT "contestants_participantsQuizId_fkey" FOREIGN KEY ("participantsQuizId") REFERENCES public.quizzes(quiz_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: questions questions_quizquestionsQuizId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT "questions_quizquestionsQuizId_fkey" FOREIGN KEY ("quizquestionsQuizId") REFERENCES public.quizzes(quiz_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: quizzes quizzes_quizmasterUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT "quizzes_quizmasterUserId_fkey" FOREIGN KEY ("quizmasterUserId") REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

