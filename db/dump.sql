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

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY public.route_translations DROP CONSTRAINT IF EXISTS route_translations_route_id_foreign;
ALTER TABLE IF EXISTS ONLY public.route_translations DROP CONSTRAINT IF EXISTS route_translations_language_code_foreign;
ALTER TABLE IF EXISTS ONLY public.options DROP CONSTRAINT IF EXISTS options_category_key_foreign;
ALTER TABLE IF EXISTS ONLY public.acl_user_role DROP CONSTRAINT IF EXISTS acl_user_role_user_id_foreign;
ALTER TABLE IF EXISTS ONLY public.acl_user_role DROP CONSTRAINT IF EXISTS acl_user_role_role_id_foreign;
ALTER TABLE IF EXISTS ONLY public.acl_permission_role DROP CONSTRAINT IF EXISTS acl_permission_role_role_id_foreign;
ALTER TABLE IF EXISTS ONLY public.acl_permission_role DROP CONSTRAINT IF EXISTS acl_permission_role_permission_id_foreign;
DROP INDEX IF EXISTS public.route_translations_path_index;
DROP INDEX IF EXISTS public.password_resets_email_index;
DROP INDEX IF EXISTS public.options_category_key_key_index;
DROP INDEX IF EXISTS public.oauth_refresh_tokens_access_token_id_index;
DROP INDEX IF EXISTS public.oauth_personal_access_clients_client_id_index;
DROP INDEX IF EXISTS public.oauth_clients_user_id_index;
DROP INDEX IF EXISTS public.oauth_access_tokens_user_id_index;
DROP INDEX IF EXISTS public.acl_user_role_user_id_index;
DROP INDEX IF EXISTS public.acl_user_role_role_id_index;
DROP INDEX IF EXISTS public.acl_permission_role_role_id_index;
DROP INDEX IF EXISTS public.acl_permission_role_permission_id_index;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_name_unique;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_email_unique;
ALTER TABLE IF EXISTS ONLY public.routes DROP CONSTRAINT IF EXISTS routes_pkey;
ALTER TABLE IF EXISTS ONLY public.route_translations DROP CONSTRAINT IF EXISTS route_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.route_translations DROP CONSTRAINT IF EXISTS route_translations_language_code_route_id_unique;
ALTER TABLE IF EXISTS ONLY public.route_translations DROP CONSTRAINT IF EXISTS route_translations_language_code_path_unique;
ALTER TABLE IF EXISTS ONLY public.options DROP CONSTRAINT IF EXISTS options_pkey;
ALTER TABLE IF EXISTS ONLY public.option_categories DROP CONSTRAINT IF EXISTS option_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.oauth_refresh_tokens DROP CONSTRAINT IF EXISTS oauth_refresh_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.oauth_personal_access_clients DROP CONSTRAINT IF EXISTS oauth_personal_access_clients_pkey;
ALTER TABLE IF EXISTS ONLY public.oauth_clients DROP CONSTRAINT IF EXISTS oauth_clients_pkey;
ALTER TABLE IF EXISTS ONLY public.oauth_auth_codes DROP CONSTRAINT IF EXISTS oauth_auth_codes_pkey;
ALTER TABLE IF EXISTS ONLY public.oauth_access_tokens DROP CONSTRAINT IF EXISTS oauth_access_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.migrations DROP CONSTRAINT IF EXISTS migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.languages DROP CONSTRAINT IF EXISTS languages_pkey;
ALTER TABLE IF EXISTS ONLY public.failed_jobs DROP CONSTRAINT IF EXISTS failed_jobs_pkey;
ALTER TABLE IF EXISTS ONLY public.acl_roles DROP CONSTRAINT IF EXISTS acl_roles_pkey;
ALTER TABLE IF EXISTS ONLY public.acl_roles DROP CONSTRAINT IF EXISTS acl_roles_name_unique;
ALTER TABLE IF EXISTS ONLY public.acl_permissions DROP CONSTRAINT IF EXISTS acl_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.acl_permissions DROP CONSTRAINT IF EXISTS acl_permissions_name_unique;
ALTER TABLE IF EXISTS public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.routes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.route_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.options ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.oauth_personal_access_clients ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.oauth_clients ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.failed_jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.acl_roles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.acl_permissions ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.users_id_seq;
DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.routes_id_seq;
DROP TABLE IF EXISTS public.routes;
DROP SEQUENCE IF EXISTS public.route_translations_id_seq;
DROP TABLE IF EXISTS public.route_translations;
DROP TABLE IF EXISTS public.password_resets;
DROP SEQUENCE IF EXISTS public.options_id_seq;
DROP TABLE IF EXISTS public.options;
DROP TABLE IF EXISTS public.option_categories;
DROP TABLE IF EXISTS public.oauth_refresh_tokens;
DROP SEQUENCE IF EXISTS public.oauth_personal_access_clients_id_seq;
DROP TABLE IF EXISTS public.oauth_personal_access_clients;
DROP SEQUENCE IF EXISTS public.oauth_clients_id_seq;
DROP TABLE IF EXISTS public.oauth_clients;
DROP TABLE IF EXISTS public.oauth_auth_codes;
DROP TABLE IF EXISTS public.oauth_access_tokens;
DROP SEQUENCE IF EXISTS public.migrations_id_seq;
DROP TABLE IF EXISTS public.migrations;
DROP TABLE IF EXISTS public.languages;
DROP SEQUENCE IF EXISTS public.failed_jobs_id_seq;
DROP TABLE IF EXISTS public.failed_jobs;
DROP TABLE IF EXISTS public.acl_user_role;
DROP SEQUENCE IF EXISTS public.acl_roles_id_seq;
DROP TABLE IF EXISTS public.acl_roles;
DROP SEQUENCE IF EXISTS public.acl_permissions_id_seq;
DROP TABLE IF EXISTS public.acl_permissions;
DROP TABLE IF EXISTS public.acl_permission_role;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acl_permission_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE acl_permission_role (
    permission_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: acl_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE acl_permissions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    category character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: acl_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE acl_permissions_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- Name: acl_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE acl_permissions_id_seq OWNED BY acl_permissions.id;


--
-- Name: acl_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE acl_roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: acl_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE acl_roles_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- Name: acl_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE acl_roles_id_seq OWNED BY acl_roles.id;


--
-- Name: acl_user_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE acl_user_role (
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT ('now'::text)::timestamp(0) with time zone NOT NULL
);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE failed_jobs_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE failed_jobs_id_seq OWNED BY failed_jobs.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE languages (
    code character varying(2) NOT NULL,
    i18n character varying(5) NOT NULL,
    is_enabled boolean DEFAULT false NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE migrations_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE migrations_id_seq OWNED BY migrations.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oauth_access_tokens (
    id character varying(100) NOT NULL,
    user_id integer,
    client_id integer NOT NULL,
    name character varying(255),
    scopes text,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone
);


--
-- Name: oauth_auth_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oauth_auth_codes (
    id character varying(100) NOT NULL,
    user_id integer NOT NULL,
    client_id integer NOT NULL,
    scopes text,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


--
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oauth_clients (
    id integer NOT NULL,
    user_id integer,
    name character varying(255) NOT NULL,
    secret character varying(100) NOT NULL,
    redirect text NOT NULL,
    personal_access_client boolean NOT NULL,
    password_client boolean NOT NULL,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: oauth_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE oauth_clients_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- Name: oauth_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE oauth_clients_id_seq OWNED BY oauth_clients.id;


--
-- Name: oauth_personal_access_clients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oauth_personal_access_clients (
    id integer NOT NULL,
    client_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE oauth_personal_access_clients_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE oauth_personal_access_clients_id_seq OWNED BY oauth_personal_access_clients.id;


--
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oauth_refresh_tokens (
    id character varying(100) NOT NULL,
    access_token_id character varying(100) NOT NULL,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


--
-- Name: option_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE option_categories (
    key character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE options (
    id integer NOT NULL,
    key character varying(255) NOT NULL,
    category_key character varying(255) NOT NULL,
    value text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE options_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE options_id_seq OWNED BY options.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- Name: route_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE route_translations (
    id integer NOT NULL,
    language_code character varying(2) NOT NULL,
    route_id integer NOT NULL,
    path character varying(255) NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: route_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE route_translations_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- Name: route_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE route_translations_id_seq OWNED BY route_translations.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE routes (
    id integer NOT NULL,
    routable_id integer,
    routable_type character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE routes_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE routes_id_seq OWNED BY routes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    name character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    is_admin boolean DEFAULT false NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: acl_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY acl_permissions ALTER COLUMN id SET DEFAULT nextval('acl_permissions_id_seq'::regclass);


--
-- Name: acl_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY acl_roles ALTER COLUMN id SET DEFAULT nextval('acl_roles_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY failed_jobs ALTER COLUMN id SET DEFAULT nextval('failed_jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- Name: oauth_clients id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth_clients ALTER COLUMN id SET DEFAULT nextval('oauth_clients_id_seq'::regclass);


--
-- Name: oauth_personal_access_clients id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth_personal_access_clients ALTER COLUMN id SET DEFAULT nextval('oauth_personal_access_clients_id_seq'::regclass);


--
-- Name: options id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY options ALTER COLUMN id SET DEFAULT nextval('options_id_seq'::regclass);


--
-- Name: route_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY route_translations ALTER COLUMN id SET DEFAULT nextval('route_translations_id_seq'::regclass);


--
-- Name: routes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY routes ALTER COLUMN id SET DEFAULT nextval('routes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: acl_permission_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY acl_permission_role (permission_id, role_id, created_at, updated_at) FROM stdin;
1	1	2017-11-08 15:24:05	2017-11-08 15:24:05
200	1	2017-11-08 15:24:05	2017-11-08 15:24:05
201	1	2017-11-08 15:24:05	2017-11-08 15:24:05
202	1	2017-11-08 15:24:05	2017-11-08 15:24:05
203	1	2017-11-08 15:24:05	2017-11-08 15:24:05
204	1	2017-11-08 15:24:05	2017-11-08 15:24:05
205	1	2017-11-08 15:24:05	2017-11-08 15:24:05
206	1	2017-11-08 15:24:05	2017-11-08 15:24:05
207	1	2017-11-08 15:24:05	2017-11-08 15:24:05
208	1	2017-11-08 15:24:05	2017-11-08 15:24:05
209	1	2017-11-08 15:24:05	2017-11-08 15:24:05
210	1	2017-11-08 15:24:05	2017-11-08 15:24:05
211	1	2017-11-08 15:24:05	2017-11-08 15:24:05
212	1	2017-11-08 15:24:05	2017-11-08 15:24:05
213	1	2017-11-08 15:24:05	2017-11-08 15:24:05
214	1	2017-11-08 15:24:05	2017-11-08 15:24:05
215	1	2017-11-08 15:24:05	2017-11-08 15:24:05
216	1	2017-11-08 15:24:05	2017-11-08 15:24:05
217	1	2017-11-08 15:24:05	2017-11-08 15:24:05
218	1	2017-11-08 15:24:05	2017-11-08 15:24:05
219	1	2017-11-08 15:24:05	2017-11-08 15:24:05
220	1	2017-11-08 15:24:05	2017-11-08 15:24:05
221	1	2017-11-08 15:24:05	2017-11-08 15:24:05
222	1	2017-11-08 15:24:05	2017-11-08 15:24:05
1	2	2017-11-08 15:24:05	2017-11-08 15:24:05
200	2	2017-11-08 15:24:05	2017-11-08 15:24:05
201	2	2017-11-08 15:24:05	2017-11-08 15:24:05
202	2	2017-11-08 15:24:05	2017-11-08 15:24:05
203	2	2017-11-08 15:24:05	2017-11-08 15:24:05
204	2	2017-11-08 15:24:05	2017-11-08 15:24:05
205	2	2017-11-08 15:24:05	2017-11-08 15:24:05
206	2	2017-11-08 15:24:05	2017-11-08 15:24:05
207	2	2017-11-08 15:24:05	2017-11-08 15:24:05
212	2	2017-11-08 15:24:05	2017-11-08 15:24:05
213	2	2017-11-08 15:24:05	2017-11-08 15:24:05
214	2	2017-11-08 15:24:05	2017-11-08 15:24:05
215	2	2017-11-08 15:24:05	2017-11-08 15:24:05
\.


--
-- Data for Name: acl_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY acl_permissions (id, name, category, created_at, updated_at) FROM stdin;
1	admin-access	general	\N	\N
200	content-create	content	\N	\N
201	content-read	content	\N	\N
202	content-update	content	\N	\N
203	content-delete	content	\N	\N
204	block-create	block	\N	\N
205	block-read	block	\N	\N
206	block-update	block	\N	\N
207	block-delete	block	\N	\N
208	user-create	user	\N	\N
209	user-read	user	\N	\N
210	user-update	user	\N	\N
211	user-delete	user	\N	\N
212	file-create	file	\N	\N
213	file-read	file	\N	\N
214	file-update	file	\N	\N
215	file-delete	file	\N	\N
216	role-create	role	\N	\N
217	role-read	role	\N	\N
218	role-update	role	\N	\N
219	role-delete	role	\N	\N
220	options-read	options	\N	\N
221	options-update-general	options	\N	\N
222	options-update-seo	options	\N	\N
\.


--
-- Name: acl_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('acl_permissions_id_seq', 1, false);


--
-- Data for Name: acl_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY acl_roles (id, name, created_at, updated_at) FROM stdin;
1	Admin	2017-11-08 15:24:04	2017-11-08 15:24:04
2	Moderator	2017-11-08 15:24:05	2017-11-08 15:24:05
\.


--
-- Name: acl_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('acl_roles_id_seq', 2, true);


--
-- Data for Name: acl_user_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY acl_user_role (user_id, role_id, created_at, updated_at) FROM stdin;
1	1	2017-11-08 15:24:05	2017-11-08 15:24:05
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('failed_jobs_id_seq', 1, false);


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY languages (code, i18n, is_enabled, is_default, created_at, updated_at) FROM stdin;
en	en_US	t	t	2017-11-08 15:23:00	2017-11-08 15:23:00
de	de_DE	f	f	2017-11-08 15:23:00	2017-11-08 15:23:00
fr	fr_FR	f	f	2017-11-08 15:23:00	2017-11-08 15:23:00
pl	pl_PL	t	f	2017-11-08 15:23:00	2017-11-08 15:23:00
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY migrations (id, migration, batch) FROM stdin;
1	2014_10_12_100000_create_password_resets_table	1
2	2014_11_16_114110_create_language	1
3	2014_11_16_114111_create_user	1
4	2014_11_16_114112_create_route	2
5	2014_11_16_114113_create_options	2
6	2014_11_16_114114_create_roles_and_permissions_table	2
7	2016_06_01_000001_create_oauth_auth_codes_table	2
8	2016_06_01_000002_create_oauth_access_tokens_table	2
9	2016_06_01_000003_create_oauth_refresh_tokens_table	2
10	2016_06_01_000004_create_oauth_clients_table	2
11	2016_06_01_000005_create_oauth_personal_access_clients_table	2
12	2017_03_09_134604_passport_create_clients	2
13	2017_04_26_135124_create_failed_jobs_table	2
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('migrations_id_seq', 13, true);


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) FROM stdin;
\.


--
-- Data for Name: oauth_auth_codes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oauth_auth_codes (id, user_id, client_id, scopes, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oauth_clients (id, user_id, name, secret, redirect, personal_access_client, password_client, revoked, created_at, updated_at) FROM stdin;
1	\N	Password Grant Client	GCIp3h7bAedMuTLVWO32ScL8EleAMwh7dKxN07oI	http://localhost	f	t	f	2017-11-08 15:24:05	2017-11-08 15:24:05
2	\N	Personal Access Client	AGcMXjSFdq3ZENRCiXtSfX6XEwItBV7gZVcqPTlU	http://localhost	t	f	f	2017-11-08 15:24:05	2017-11-08 15:24:05
\.


--
-- Name: oauth_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('oauth_clients_id_seq', 2, true);


--
-- Data for Name: oauth_personal_access_clients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
1	2	2017-11-08 15:24:05	2017-11-08 15:24:05
\.


--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('oauth_personal_access_clients_id_seq', 1, true);


--
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oauth_refresh_tokens (id, access_token_id, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: option_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option_categories (key, created_at, updated_at) FROM stdin;
general	2017-11-08 15:24:04	2017-11-08 15:24:04
seo	2017-11-08 15:24:04	2017-11-08 15:24:04
\.


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY options (id, key, category_key, value, created_at, updated_at) FROM stdin;
1	site_name	general	{"en":"GZERO-CMS","de":"GZERO-CMS","fr":"GZERO-CMS","pl":"GZERO-CMS"}	2017-11-08 15:24:04	2017-11-08 15:24:04
2	site_desc	general	{"en":"GZERO-CMS Content management system.","de":"GZERO-CMS Content management system.","fr":"GZERO-CMS Content management system.","pl":"GZERO-CMS Content management system."}	2017-11-08 15:24:04	2017-11-08 15:24:04
3	default_page_size	general	{"en":10,"de":10,"fr":10,"pl":10}	2017-11-08 15:24:04	2017-11-08 15:24:04
4	cookies_policy_url	general	{"en":null,"de":null,"fr":null,"pl":null}	2017-11-08 15:24:04	2017-11-08 15:24:04
5	desc_length	seo	{"en":160,"de":160,"fr":160,"pl":160}	2017-11-08 15:24:04	2017-11-08 15:24:04
6	google_analytics_id	seo	{"en":null,"de":null,"fr":null,"pl":null}	2017-11-08 15:24:04	2017-11-08 15:24:04
\.


--
-- Name: options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('options_id_seq', 6, true);


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: route_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY route_translations (id, language_code, route_id, path, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Name: route_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('route_translations_id_seq', 1, false);


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY routes (id, routable_id, routable_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('routes_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, email, password, name, first_name, last_name, is_admin, remember_token, created_at, updated_at) FROM stdin;
1	admin@gzero.pl	$2y$10$5Oju0L5rjct2NfPLaPf/n.xSoB2ED7RbVwaXhZV19uhMXOzDhdMSG	Admin	John	Doe	t	\N	2017-11-08 15:23:00	2017-11-08 15:23:00
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: acl_permissions acl_permissions_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acl_permissions
    ADD CONSTRAINT acl_permissions_name_unique UNIQUE (name);


--
-- Name: acl_permissions acl_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acl_permissions
    ADD CONSTRAINT acl_permissions_pkey PRIMARY KEY (id);


--
-- Name: acl_roles acl_roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acl_roles
    ADD CONSTRAINT acl_roles_name_unique UNIQUE (name);


--
-- Name: acl_roles acl_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acl_roles
    ADD CONSTRAINT acl_roles_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (code);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_auth_codes oauth_auth_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_personal_access_clients oauth_personal_access_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth_personal_access_clients
    ADD CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_refresh_tokens oauth_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: option_categories option_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option_categories
    ADD CONSTRAINT option_categories_pkey PRIMARY KEY (key);


--
-- Name: options options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- Name: route_translations route_translations_language_code_path_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY route_translations
    ADD CONSTRAINT route_translations_language_code_path_unique UNIQUE (language_code, path);


--
-- Name: route_translations route_translations_language_code_route_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY route_translations
    ADD CONSTRAINT route_translations_language_code_route_id_unique UNIQUE (language_code, route_id);


--
-- Name: route_translations route_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY route_translations
    ADD CONSTRAINT route_translations_pkey PRIMARY KEY (id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_name_unique UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: acl_permission_role_permission_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX acl_permission_role_permission_id_index ON acl_permission_role USING btree (permission_id);


--
-- Name: acl_permission_role_role_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX acl_permission_role_role_id_index ON acl_permission_role USING btree (role_id);


--
-- Name: acl_user_role_role_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX acl_user_role_role_id_index ON acl_user_role USING btree (role_id);


--
-- Name: acl_user_role_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX acl_user_role_user_id_index ON acl_user_role USING btree (user_id);


--
-- Name: oauth_access_tokens_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX oauth_access_tokens_user_id_index ON oauth_access_tokens USING btree (user_id);


--
-- Name: oauth_clients_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX oauth_clients_user_id_index ON oauth_clients USING btree (user_id);


--
-- Name: oauth_personal_access_clients_client_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX oauth_personal_access_clients_client_id_index ON oauth_personal_access_clients USING btree (client_id);


--
-- Name: oauth_refresh_tokens_access_token_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX oauth_refresh_tokens_access_token_id_index ON oauth_refresh_tokens USING btree (access_token_id);


--
-- Name: options_category_key_key_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX options_category_key_key_index ON options USING btree (category_key, key);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX password_resets_email_index ON password_resets USING btree (email);


--
-- Name: route_translations_path_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX route_translations_path_index ON route_translations USING btree (path);


--
-- Name: acl_permission_role acl_permission_role_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acl_permission_role
    ADD CONSTRAINT acl_permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES acl_permissions(id) ON DELETE CASCADE;


--
-- Name: acl_permission_role acl_permission_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acl_permission_role
    ADD CONSTRAINT acl_permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES acl_roles(id) ON DELETE CASCADE;


--
-- Name: acl_user_role acl_user_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acl_user_role
    ADD CONSTRAINT acl_user_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES acl_roles(id) ON DELETE CASCADE;


--
-- Name: acl_user_role acl_user_role_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acl_user_role
    ADD CONSTRAINT acl_user_role_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- Name: options options_category_key_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY options
    ADD CONSTRAINT options_category_key_foreign FOREIGN KEY (category_key) REFERENCES option_categories(key) ON DELETE CASCADE;


--
-- Name: route_translations route_translations_language_code_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY route_translations
    ADD CONSTRAINT route_translations_language_code_foreign FOREIGN KEY (language_code) REFERENCES languages(code) ON DELETE CASCADE;


--
-- Name: route_translations route_translations_route_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY route_translations
    ADD CONSTRAINT route_translations_route_id_foreign FOREIGN KEY (route_id) REFERENCES routes(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

