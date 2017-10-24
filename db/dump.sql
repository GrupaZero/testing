--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.4
-- Dumped by pg_dump version 9.6.4

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
-- Name: acl_permission_role; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE acl_permission_role (
    permission_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE acl_permission_role OWNER TO gzero_cms;

--
-- Name: acl_permissions; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE acl_permissions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    category character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE acl_permissions OWNER TO gzero_cms;

--
-- Name: acl_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE acl_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE acl_permissions_id_seq OWNER TO gzero_cms;

--
-- Name: acl_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE acl_permissions_id_seq OWNED BY acl_permissions.id;


--
-- Name: acl_roles; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE acl_roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE acl_roles OWNER TO gzero_cms;

--
-- Name: acl_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE acl_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE acl_roles_id_seq OWNER TO gzero_cms;

--
-- Name: acl_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE acl_roles_id_seq OWNED BY acl_roles.id;


--
-- Name: acl_user_role; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE acl_user_role (
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE acl_user_role OWNER TO gzero_cms;

--
-- Name: block_translations; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE block_translations (
    id integer NOT NULL,
    lang_code character varying(2) NOT NULL,
    block_id integer NOT NULL,
    title character varying(255) NOT NULL,
    body text,
    custom_fields text,
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE block_translations OWNER TO gzero_cms;

--
-- Name: block_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE block_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE block_translations_id_seq OWNER TO gzero_cms;

--
-- Name: block_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE block_translations_id_seq OWNED BY block_translations.id;


--
-- Name: block_types; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE block_types (
    name character varying(255) NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE block_types OWNER TO gzero_cms;

--
-- Name: blocks; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE blocks (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    region character varying(255),
    theme character varying(255),
    blockable_id integer,
    blockable_type character varying(255),
    author_id integer,
    filter text,
    options text,
    weight integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    is_cacheable boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE blocks OWNER TO gzero_cms;

--
-- Name: blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blocks_id_seq OWNER TO gzero_cms;

--
-- Name: blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE blocks_id_seq OWNED BY blocks.id;


--
-- Name: content_translations; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE content_translations (
    id integer NOT NULL,
    lang_code character varying(2) NOT NULL,
    content_id integer NOT NULL,
    title character varying(255),
    teaser text,
    body text,
    seo_title character varying(255),
    seo_description character varying(255),
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE content_translations OWNER TO gzero_cms;

--
-- Name: content_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE content_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE content_translations_id_seq OWNER TO gzero_cms;

--
-- Name: content_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE content_translations_id_seq OWNED BY content_translations.id;


--
-- Name: content_types; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE content_types (
    name character varying(255) NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE content_types OWNER TO gzero_cms;

--
-- Name: contents; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE contents (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    theme character varying(255),
    author_id integer,
    path character varying(255),
    parent_id integer,
    level integer DEFAULT 0 NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    rating integer DEFAULT 0 NOT NULL,
    visits integer DEFAULT 0 NOT NULL,
    is_on_home boolean DEFAULT false NOT NULL,
    is_comment_allowed boolean DEFAULT false NOT NULL,
    is_promoted boolean DEFAULT false NOT NULL,
    is_sticky boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    published_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    thumb_id integer
);


ALTER TABLE contents OWNER TO gzero_cms;

--
-- Name: contents_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contents_id_seq OWNER TO gzero_cms;

--
-- Name: contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE contents_id_seq OWNED BY contents.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT ('now'::text)::timestamp(0) with time zone NOT NULL
);


ALTER TABLE failed_jobs OWNER TO gzero_cms;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE failed_jobs_id_seq OWNER TO gzero_cms;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE failed_jobs_id_seq OWNED BY failed_jobs.id;


--
-- Name: file_translations; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE file_translations (
    id integer NOT NULL,
    lang_code character varying(2) NOT NULL,
    file_id integer NOT NULL,
    title character varying(255),
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE file_translations OWNER TO gzero_cms;

--
-- Name: file_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE file_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE file_translations_id_seq OWNER TO gzero_cms;

--
-- Name: file_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE file_translations_id_seq OWNED BY file_translations.id;


--
-- Name: file_types; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE file_types (
    name character varying(255) NOT NULL,
    extensions text,
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE file_types OWNER TO gzero_cms;

--
-- Name: files; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE files (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    name character varying(255),
    extension character varying(255),
    size integer,
    mime_type character varying(255),
    info text,
    created_by integer,
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE files OWNER TO gzero_cms;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE files_id_seq OWNER TO gzero_cms;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE files_id_seq OWNED BY files.id;


--
-- Name: langs; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE langs (
    code character varying(2) NOT NULL,
    i18n character varying(5) NOT NULL,
    is_enabled boolean DEFAULT false NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE langs OWNER TO gzero_cms;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE migrations OWNER TO gzero_cms;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE migrations_id_seq OWNER TO gzero_cms;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE migrations_id_seq OWNED BY migrations.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: gzero_cms
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


ALTER TABLE oauth_access_tokens OWNER TO gzero_cms;

--
-- Name: oauth_auth_codes; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE oauth_auth_codes (
    id character varying(100) NOT NULL,
    user_id integer NOT NULL,
    client_id integer NOT NULL,
    scopes text,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE oauth_auth_codes OWNER TO gzero_cms;

--
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: gzero_cms
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


ALTER TABLE oauth_clients OWNER TO gzero_cms;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE oauth_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth_clients_id_seq OWNER TO gzero_cms;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE oauth_clients_id_seq OWNED BY oauth_clients.id;


--
-- Name: oauth_personal_access_clients; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE oauth_personal_access_clients (
    id integer NOT NULL,
    client_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE oauth_personal_access_clients OWNER TO gzero_cms;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE oauth_personal_access_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth_personal_access_clients_id_seq OWNER TO gzero_cms;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE oauth_personal_access_clients_id_seq OWNED BY oauth_personal_access_clients.id;


--
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE oauth_refresh_tokens (
    id character varying(100) NOT NULL,
    access_token_id character varying(100) NOT NULL,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE oauth_refresh_tokens OWNER TO gzero_cms;

--
-- Name: option_categories; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE option_categories (
    key character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE option_categories OWNER TO gzero_cms;

--
-- Name: options; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE options (
    id integer NOT NULL,
    key character varying(255) NOT NULL,
    category_key character varying(255) NOT NULL,
    value text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE options OWNER TO gzero_cms;

--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE options_id_seq OWNER TO gzero_cms;

--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE options_id_seq OWNED BY options.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE password_resets OWNER TO gzero_cms;

--
-- Name: route_translations; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE route_translations (
    id integer NOT NULL,
    lang_code character varying(2) NOT NULL,
    route_id integer NOT NULL,
    url character varying(255) NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE route_translations OWNER TO gzero_cms;

--
-- Name: route_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE route_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE route_translations_id_seq OWNER TO gzero_cms;

--
-- Name: route_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE route_translations_id_seq OWNED BY route_translations.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE routes (
    id integer NOT NULL,
    routable_id integer,
    routable_type character varying(255),
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE routes OWNER TO gzero_cms;

--
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE routes_id_seq OWNER TO gzero_cms;

--
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE routes_id_seq OWNED BY routes.id;


--
-- Name: uploadables; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE uploadables (
    file_id integer NOT NULL,
    uploadable_id integer NOT NULL,
    uploadable_type character varying(255) NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE uploadables OWNER TO gzero_cms;

--
-- Name: users; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    nick character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    is_admin boolean DEFAULT false NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE users OWNER TO gzero_cms;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO gzero_cms;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: widgets; Type: TABLE; Schema: public; Owner: gzero_cms
--

CREATE TABLE widgets (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    args text,
    is_active boolean DEFAULT false NOT NULL,
    is_cacheable boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE widgets OWNER TO gzero_cms;

--
-- Name: widgets_id_seq; Type: SEQUENCE; Schema: public; Owner: gzero_cms
--

CREATE SEQUENCE widgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE widgets_id_seq OWNER TO gzero_cms;

--
-- Name: widgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gzero_cms
--

ALTER SEQUENCE widgets_id_seq OWNED BY widgets.id;


--
-- Name: acl_permissions id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY acl_permissions ALTER COLUMN id SET DEFAULT nextval('acl_permissions_id_seq'::regclass);


--
-- Name: acl_roles id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY acl_roles ALTER COLUMN id SET DEFAULT nextval('acl_roles_id_seq'::regclass);


--
-- Name: block_translations id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY block_translations ALTER COLUMN id SET DEFAULT nextval('block_translations_id_seq'::regclass);


--
-- Name: blocks id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY blocks ALTER COLUMN id SET DEFAULT nextval('blocks_id_seq'::regclass);


--
-- Name: content_translations id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY content_translations ALTER COLUMN id SET DEFAULT nextval('content_translations_id_seq'::regclass);


--
-- Name: contents id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY contents ALTER COLUMN id SET DEFAULT nextval('contents_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY failed_jobs ALTER COLUMN id SET DEFAULT nextval('failed_jobs_id_seq'::regclass);


--
-- Name: file_translations id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY file_translations ALTER COLUMN id SET DEFAULT nextval('file_translations_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY files ALTER COLUMN id SET DEFAULT nextval('files_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY migrations ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- Name: oauth_clients id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY oauth_clients ALTER COLUMN id SET DEFAULT nextval('oauth_clients_id_seq'::regclass);


--
-- Name: oauth_personal_access_clients id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY oauth_personal_access_clients ALTER COLUMN id SET DEFAULT nextval('oauth_personal_access_clients_id_seq'::regclass);


--
-- Name: options id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY options ALTER COLUMN id SET DEFAULT nextval('options_id_seq'::regclass);


--
-- Name: route_translations id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY route_translations ALTER COLUMN id SET DEFAULT nextval('route_translations_id_seq'::regclass);


--
-- Name: routes id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY routes ALTER COLUMN id SET DEFAULT nextval('routes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: widgets id; Type: DEFAULT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY widgets ALTER COLUMN id SET DEFAULT nextval('widgets_id_seq'::regclass);


--
-- Data for Name: acl_permission_role; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY acl_permission_role (permission_id, role_id, created_at, updated_at) FROM stdin;
1	1	2017-10-24 13:02:10	2017-10-24 13:02:10
200	1	2017-10-24 13:02:10	2017-10-24 13:02:10
201	1	2017-10-24 13:02:10	2017-10-24 13:02:10
202	1	2017-10-24 13:02:10	2017-10-24 13:02:10
203	1	2017-10-24 13:02:10	2017-10-24 13:02:10
204	1	2017-10-24 13:02:10	2017-10-24 13:02:10
205	1	2017-10-24 13:02:10	2017-10-24 13:02:10
206	1	2017-10-24 13:02:10	2017-10-24 13:02:10
207	1	2017-10-24 13:02:10	2017-10-24 13:02:10
208	1	2017-10-24 13:02:10	2017-10-24 13:02:10
209	1	2017-10-24 13:02:10	2017-10-24 13:02:10
210	1	2017-10-24 13:02:10	2017-10-24 13:02:10
211	1	2017-10-24 13:02:10	2017-10-24 13:02:10
212	1	2017-10-24 13:02:10	2017-10-24 13:02:10
213	1	2017-10-24 13:02:10	2017-10-24 13:02:10
214	1	2017-10-24 13:02:10	2017-10-24 13:02:10
215	1	2017-10-24 13:02:10	2017-10-24 13:02:10
216	1	2017-10-24 13:02:10	2017-10-24 13:02:10
217	1	2017-10-24 13:02:10	2017-10-24 13:02:10
218	1	2017-10-24 13:02:10	2017-10-24 13:02:10
219	1	2017-10-24 13:02:10	2017-10-24 13:02:10
220	1	2017-10-24 13:02:10	2017-10-24 13:02:10
221	1	2017-10-24 13:02:10	2017-10-24 13:02:10
222	1	2017-10-24 13:02:10	2017-10-24 13:02:10
1	2	2017-10-24 13:02:10	2017-10-24 13:02:10
200	2	2017-10-24 13:02:10	2017-10-24 13:02:10
201	2	2017-10-24 13:02:10	2017-10-24 13:02:10
202	2	2017-10-24 13:02:10	2017-10-24 13:02:10
203	2	2017-10-24 13:02:10	2017-10-24 13:02:10
204	2	2017-10-24 13:02:10	2017-10-24 13:02:10
205	2	2017-10-24 13:02:10	2017-10-24 13:02:10
206	2	2017-10-24 13:02:10	2017-10-24 13:02:10
207	2	2017-10-24 13:02:10	2017-10-24 13:02:10
212	2	2017-10-24 13:02:10	2017-10-24 13:02:10
213	2	2017-10-24 13:02:10	2017-10-24 13:02:10
214	2	2017-10-24 13:02:10	2017-10-24 13:02:10
215	2	2017-10-24 13:02:10	2017-10-24 13:02:10
\.


--
-- Data for Name: acl_permissions; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY acl_permissions (id, name, category, created_at, updated_at) FROM stdin;
1	admin-api-access	general	\N	\N
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
-- Name: acl_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('acl_permissions_id_seq', 1, false);


--
-- Data for Name: acl_roles; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY acl_roles (id, name, created_at, updated_at) FROM stdin;
1	Admin	2017-10-24 13:02:10	2017-10-24 13:02:10
2	Moderator	2017-10-24 13:02:10	2017-10-24 13:02:10
\.


--
-- Name: acl_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('acl_roles_id_seq', 33, true);


--
-- Data for Name: acl_user_role; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY acl_user_role (user_id, role_id, created_at, updated_at) FROM stdin;
1	1	2017-10-24 13:02:10	2017-10-24 13:02:10
\.


--
-- Data for Name: block_translations; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY block_translations (id, lang_code, block_id, title, body, custom_fields, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Name: block_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('block_translations_id_seq', 1, false);


--
-- Data for Name: block_types; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY block_types (name, is_active, created_at, updated_at) FROM stdin;
basic	t	2017-10-24 13:02:10	2017-10-24 13:02:10
menu	t	2017-10-24 13:02:10	2017-10-24 13:02:10
slider	t	2017-10-24 13:02:10	2017-10-24 13:02:10
widget	t	2017-10-24 13:02:10	2017-10-24 13:02:10
\.


--
-- Data for Name: blocks; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY blocks (id, type, region, theme, blockable_id, blockable_type, author_id, filter, options, weight, is_active, is_cacheable, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Name: blocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('blocks_id_seq', 1, false);


--
-- Data for Name: content_translations; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY content_translations (id, lang_code, content_id, title, teaser, body, seo_title, seo_description, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Name: content_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('content_translations_id_seq', 1, false);


--
-- Data for Name: content_types; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY content_types (name, is_active, created_at, updated_at) FROM stdin;
content	t	2017-10-24 13:02:10	2017-10-24 13:02:10
category	t	2017-10-24 13:02:10	2017-10-24 13:02:10
\.


--
-- Data for Name: contents; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY contents (id, type, theme, author_id, path, parent_id, level, weight, rating, visits, is_on_home, is_comment_allowed, is_promoted, is_sticky, is_active, published_at, deleted_at, created_at, updated_at, thumb_id) FROM stdin;
\.


--
-- Name: contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('contents_id_seq', 1, false);


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('failed_jobs_id_seq', 1, false);


--
-- Data for Name: file_translations; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY file_translations (id, lang_code, file_id, title, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: file_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('file_translations_id_seq', 1, false);


--
-- Data for Name: file_types; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY file_types (name, extensions, is_active, created_at, updated_at) FROM stdin;
image	\N	t	2017-10-24 13:02:10	2017-10-24 13:02:10
document	\N	t	2017-10-24 13:02:10	2017-10-24 13:02:10
video	\N	t	2017-10-24 13:02:10	2017-10-24 13:02:10
music	\N	t	2017-10-24 13:02:10	2017-10-24 13:02:10
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY files (id, type, name, extension, size, mime_type, info, created_by, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('files_id_seq', 1, false);


--
-- Data for Name: langs; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY langs (code, i18n, is_enabled, is_default, created_at, updated_at) FROM stdin;
pl	pl_PL	t	f	2017-10-24 13:02:10	2017-10-24 13:02:10
de	de_DE	f	f	2017-10-24 13:02:10	2017-10-24 13:02:10
fr	fr_FR	f	f	2017-10-24 13:02:10	2017-10-24 13:02:10
en	en_US	t	t	2017-10-24 13:02:10	2017-10-24 13:02:10
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY migrations (id, migration, batch) FROM stdin;
109	2014_10_12_100000_create_password_resets_table	1
110	2014_11_16_114110_create_lang	1
111	2014_11_16_114111_create_user	1
112	2014_11_16_114112_create_route	1
113	2014_11_16_114113_create_content	1
114	2015_09_07_100656_create_options	1
115	2015_11_26_115322_create_block	1
116	2016_05_08_111342_create_files_table	1
117	2016_05_08_140929_add_file_column_to_contents_table	1
118	2016_06_01_000001_create_oauth_auth_codes_table	1
119	2016_06_01_000002_create_oauth_access_tokens_table	1
120	2016_06_01_000003_create_oauth_refresh_tokens_table	1
121	2016_06_01_000004_create_oauth_clients_table	1
122	2016_06_01_000005_create_oauth_personal_access_clients_table	1
123	2016_08_13_113755_create_roles_and_permissions_table	1
124	2017_03_09_134604_passport_create_clients	1
125	2017_04_26_135124_create_failed_jobs_table	1
126	2017_10_24_094825_create_google_tag_manager_id_row_and_delete_google_analytics_id_row	1
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('migrations_id_seq', 141, true);


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) FROM stdin;
\.


--
-- Data for Name: oauth_auth_codes; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY oauth_auth_codes (id, user_id, client_id, scopes, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY oauth_clients (id, user_id, name, secret, redirect, personal_access_client, password_client, revoked, created_at, updated_at) FROM stdin;
1	\N	Password Grant Client	86q2qddWS41QlIi7llmSYAp814TKdyASgzFJXiIm	http://localhost	f	t	f	2017-10-24 13:02:10	2017-10-24 13:02:10
2	\N	Personal Access Client	Kfr83HRJjnAfyBOWwgcoFp2CIQmKV1QBLnpyoCgR	http://localhost	t	f	f	2017-10-24 13:02:10	2017-10-24 13:02:10
\.


--
-- Name: oauth_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('oauth_clients_id_seq', 33, true);


--
-- Data for Name: oauth_personal_access_clients; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
1	2	2017-10-24 13:02:10	2017-10-24 13:02:10
\.


--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('oauth_personal_access_clients_id_seq', 33, true);


--
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY oauth_refresh_tokens (id, access_token_id, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: option_categories; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY option_categories (key, created_at, updated_at) FROM stdin;
general	2017-10-24 13:02:10	2017-10-24 13:02:10
seo	2017-10-24 13:02:10	2017-10-24 13:02:10
\.


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY options (id, key, category_key, value, created_at, updated_at) FROM stdin;
1	site_name	general	{"pl":"GZERO-CMS","de":"GZERO-CMS","fr":"GZERO-CMS","en":"GZERO-CMS"}	2017-10-24 13:02:10	2017-10-24 13:02:10
2	site_desc	general	{"pl":"GZERO-CMS Content management system.","de":"GZERO-CMS Content management system.","fr":"GZERO-CMS Content management system.","en":"GZERO-CMS Content management system."}	2017-10-24 13:02:10	2017-10-24 13:02:10
3	default_page_size	general	{"pl":5,"de":5,"fr":5,"en":5}	2017-10-24 13:02:10	2017-10-24 13:02:10
4	cookies_policy_url	general	{"pl":null,"de":null,"fr":null,"en":null}	2017-10-24 13:02:10	2017-10-24 13:02:10
5	desc_length	seo	{"pl":160,"de":160,"fr":160,"en":160}	2017-10-24 13:02:10	2017-10-24 13:02:10
7	google_tag_manager_id	seo	{"pl":null,"de":null,"fr":null,"en":null}	2017-10-24 13:02:10	2017-10-24 13:02:10
\.


--
-- Name: options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('options_id_seq', 33, true);


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: route_translations; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY route_translations (id, lang_code, route_id, url, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Name: route_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('route_translations_id_seq', 1, false);


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY routes (id, routable_id, routable_type, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('routes_id_seq', 1, false);


--
-- Data for Name: uploadables; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY uploadables (file_id, uploadable_id, uploadable_type, weight, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY users (id, email, password, nick, first_name, last_name, is_admin, remember_token, created_at, updated_at) FROM stdin;
1	admin@gzero.pl	$2y$10$RBSDbpEdf8mic408yh8zLuod2P4ukx5U18Ptrj8RBeDYNmWA.zNoK	Admin	John	Doe	t	\N	2017-10-24 13:02:10	2017-10-24 13:02:10
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('users_id_seq', 33, true);


--
-- Data for Name: widgets; Type: TABLE DATA; Schema: public; Owner: gzero_cms
--

COPY widgets (id, name, args, is_active, is_cacheable, created_at, updated_at) FROM stdin;
\.


--
-- Name: widgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gzero_cms
--

SELECT pg_catalog.setval('widgets_id_seq', 1, false);


--
-- Name: acl_permissions acl_permissions_name_unique; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY acl_permissions
    ADD CONSTRAINT acl_permissions_name_unique UNIQUE (name);


--
-- Name: acl_permissions acl_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY acl_permissions
    ADD CONSTRAINT acl_permissions_pkey PRIMARY KEY (id);


--
-- Name: acl_roles acl_roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY acl_roles
    ADD CONSTRAINT acl_roles_name_unique UNIQUE (name);


--
-- Name: acl_roles acl_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY acl_roles
    ADD CONSTRAINT acl_roles_pkey PRIMARY KEY (id);


--
-- Name: block_translations block_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY block_translations
    ADD CONSTRAINT block_translations_pkey PRIMARY KEY (id);


--
-- Name: block_types block_types_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY block_types
    ADD CONSTRAINT block_types_pkey PRIMARY KEY (name);


--
-- Name: blocks blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY blocks
    ADD CONSTRAINT blocks_pkey PRIMARY KEY (id);


--
-- Name: content_translations content_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY content_translations
    ADD CONSTRAINT content_translations_pkey PRIMARY KEY (id);


--
-- Name: content_types content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY content_types
    ADD CONSTRAINT content_types_pkey PRIMARY KEY (name);


--
-- Name: contents contents_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY contents
    ADD CONSTRAINT contents_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: file_translations file_translations_file_id_lang_code_unique; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY file_translations
    ADD CONSTRAINT file_translations_file_id_lang_code_unique UNIQUE (file_id, lang_code);


--
-- Name: file_translations file_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY file_translations
    ADD CONSTRAINT file_translations_pkey PRIMARY KEY (id);


--
-- Name: file_types file_types_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY file_types
    ADD CONSTRAINT file_types_pkey PRIMARY KEY (name);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: langs langs_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY langs
    ADD CONSTRAINT langs_pkey PRIMARY KEY (code);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_auth_codes oauth_auth_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_personal_access_clients oauth_personal_access_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY oauth_personal_access_clients
    ADD CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_refresh_tokens oauth_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: option_categories option_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY option_categories
    ADD CONSTRAINT option_categories_pkey PRIMARY KEY (key);


--
-- Name: options options_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- Name: route_translations route_translations_lang_code_route_id_unique; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY route_translations
    ADD CONSTRAINT route_translations_lang_code_route_id_unique UNIQUE (lang_code, route_id);


--
-- Name: route_translations route_translations_lang_code_url_unique; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY route_translations
    ADD CONSTRAINT route_translations_lang_code_url_unique UNIQUE (lang_code, url);


--
-- Name: route_translations route_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY route_translations
    ADD CONSTRAINT route_translations_pkey PRIMARY KEY (id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_nick_unique; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_nick_unique UNIQUE (nick);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: widgets widgets_name_unique; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY widgets
    ADD CONSTRAINT widgets_name_unique UNIQUE (name);


--
-- Name: widgets widgets_pkey; Type: CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY widgets
    ADD CONSTRAINT widgets_pkey PRIMARY KEY (id);


--
-- Name: acl_permission_role_permission_id_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX acl_permission_role_permission_id_index ON acl_permission_role USING btree (permission_id);


--
-- Name: acl_permission_role_role_id_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX acl_permission_role_role_id_index ON acl_permission_role USING btree (role_id);


--
-- Name: acl_user_role_role_id_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX acl_user_role_role_id_index ON acl_user_role USING btree (role_id);


--
-- Name: acl_user_role_user_id_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX acl_user_role_user_id_index ON acl_user_role USING btree (user_id);


--
-- Name: blocks_blockable_id_blockable_type_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX blocks_blockable_id_blockable_type_index ON blocks USING btree (blockable_id, blockable_type);


--
-- Name: contents_type_path_parent_id_level_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX contents_type_path_parent_id_level_index ON contents USING btree (type, path, parent_id, level);


--
-- Name: oauth_access_tokens_user_id_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX oauth_access_tokens_user_id_index ON oauth_access_tokens USING btree (user_id);


--
-- Name: oauth_clients_user_id_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX oauth_clients_user_id_index ON oauth_clients USING btree (user_id);


--
-- Name: oauth_personal_access_clients_client_id_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX oauth_personal_access_clients_client_id_index ON oauth_personal_access_clients USING btree (client_id);


--
-- Name: oauth_refresh_tokens_access_token_id_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX oauth_refresh_tokens_access_token_id_index ON oauth_refresh_tokens USING btree (access_token_id);


--
-- Name: options_category_key_key_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX options_category_key_key_index ON options USING btree (category_key, key);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX password_resets_email_index ON password_resets USING btree (email);


--
-- Name: route_translations_url_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX route_translations_url_index ON route_translations USING btree (url);


--
-- Name: uploadables_file_id_index; Type: INDEX; Schema: public; Owner: gzero_cms
--

CREATE INDEX uploadables_file_id_index ON uploadables USING btree (file_id);


--
-- Name: acl_permission_role acl_permission_role_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY acl_permission_role
    ADD CONSTRAINT acl_permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES acl_permissions(id) ON DELETE CASCADE;


--
-- Name: acl_permission_role acl_permission_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY acl_permission_role
    ADD CONSTRAINT acl_permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES acl_roles(id) ON DELETE CASCADE;


--
-- Name: acl_user_role acl_user_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY acl_user_role
    ADD CONSTRAINT acl_user_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES acl_roles(id) ON DELETE CASCADE;


--
-- Name: acl_user_role acl_user_role_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY acl_user_role
    ADD CONSTRAINT acl_user_role_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- Name: block_translations block_translations_block_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY block_translations
    ADD CONSTRAINT block_translations_block_id_foreign FOREIGN KEY (block_id) REFERENCES blocks(id) ON DELETE CASCADE;


--
-- Name: block_translations block_translations_lang_code_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY block_translations
    ADD CONSTRAINT block_translations_lang_code_foreign FOREIGN KEY (lang_code) REFERENCES langs(code) ON DELETE CASCADE;


--
-- Name: blocks blocks_author_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY blocks
    ADD CONSTRAINT blocks_author_id_foreign FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE SET NULL;


--
-- Name: blocks blocks_type_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY blocks
    ADD CONSTRAINT blocks_type_foreign FOREIGN KEY (type) REFERENCES block_types(name) ON DELETE CASCADE;


--
-- Name: content_translations content_translations_content_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY content_translations
    ADD CONSTRAINT content_translations_content_id_foreign FOREIGN KEY (content_id) REFERENCES contents(id) ON DELETE CASCADE;


--
-- Name: content_translations content_translations_lang_code_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY content_translations
    ADD CONSTRAINT content_translations_lang_code_foreign FOREIGN KEY (lang_code) REFERENCES langs(code) ON DELETE CASCADE;


--
-- Name: contents contents_author_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY contents
    ADD CONSTRAINT contents_author_id_foreign FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE SET NULL;


--
-- Name: contents contents_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY contents
    ADD CONSTRAINT contents_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES contents(id) ON DELETE CASCADE;


--
-- Name: contents contents_thumb_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY contents
    ADD CONSTRAINT contents_thumb_id_foreign FOREIGN KEY (thumb_id) REFERENCES files(id) ON DELETE SET NULL;


--
-- Name: contents contents_type_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY contents
    ADD CONSTRAINT contents_type_foreign FOREIGN KEY (type) REFERENCES content_types(name) ON DELETE CASCADE;


--
-- Name: file_translations file_translations_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY file_translations
    ADD CONSTRAINT file_translations_file_id_foreign FOREIGN KEY (file_id) REFERENCES files(id) ON DELETE CASCADE;


--
-- Name: file_translations file_translations_lang_code_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY file_translations
    ADD CONSTRAINT file_translations_lang_code_foreign FOREIGN KEY (lang_code) REFERENCES langs(code) ON DELETE CASCADE;


--
-- Name: files files_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL;


--
-- Name: files files_type_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_type_foreign FOREIGN KEY (type) REFERENCES file_types(name) ON DELETE CASCADE;


--
-- Name: options options_category_key_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY options
    ADD CONSTRAINT options_category_key_foreign FOREIGN KEY (category_key) REFERENCES option_categories(key) ON DELETE CASCADE;


--
-- Name: route_translations route_translations_lang_code_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY route_translations
    ADD CONSTRAINT route_translations_lang_code_foreign FOREIGN KEY (lang_code) REFERENCES langs(code) ON DELETE CASCADE;


--
-- Name: route_translations route_translations_route_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY route_translations
    ADD CONSTRAINT route_translations_route_id_foreign FOREIGN KEY (route_id) REFERENCES routes(id) ON DELETE CASCADE;


--
-- Name: uploadables uploadables_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: gzero_cms
--

ALTER TABLE ONLY uploadables
    ADD CONSTRAINT uploadables_file_id_foreign FOREIGN KEY (file_id) REFERENCES files(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

