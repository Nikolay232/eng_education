--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-19 13:58:18 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 16404)
-- Name: eng_education; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "eng_education";


ALTER SCHEMA "eng_education" OWNER TO postgres;

SET search_path = "eng_education", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


--
-- TOC entry 178 (class 1259 OID 16786)
-- Name: auth_group; Type: TABLE; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE "eng_education".auth_group OWNER TO "eng_education.app";

--
-- TOC entry 177 (class 1259 OID 16784)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: eng_education; Owner: eng_education.app
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "eng_education".auth_group_id_seq OWNER TO "eng_education.app";

--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 177
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: eng_education; Owner: eng_education.app
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 180 (class 1259 OID 16796)
-- Name: auth_group_permissions; Type: TABLE; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE "eng_education".auth_group_permissions OWNER TO "eng_education.app";

--
-- TOC entry 179 (class 1259 OID 16794)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: eng_education; Owner: eng_education.app
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "eng_education".auth_group_permissions_id_seq OWNER TO "eng_education.app";

--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 179
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: eng_education; Owner: eng_education.app
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 176 (class 1259 OID 16776)
-- Name: auth_permission; Type: TABLE; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE "eng_education".auth_permission OWNER TO "eng_education.app";

--
-- TOC entry 175 (class 1259 OID 16774)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: eng_education; Owner: eng_education.app
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "eng_education".auth_permission_id_seq OWNER TO "eng_education.app";

--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 175
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: eng_education; Owner: eng_education.app
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 182 (class 1259 OID 16806)
-- Name: auth_user; Type: TABLE; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE "eng_education".auth_user OWNER TO "eng_education.app";

--
-- TOC entry 184 (class 1259 OID 16816)
-- Name: auth_user_groups; Type: TABLE; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE "eng_education".auth_user_groups OWNER TO "eng_education.app";

--
-- TOC entry 183 (class 1259 OID 16814)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: eng_education; Owner: eng_education.app
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "eng_education".auth_user_groups_id_seq OWNER TO "eng_education.app";

--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 183
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: eng_education; Owner: eng_education.app
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 181 (class 1259 OID 16804)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: eng_education; Owner: eng_education.app
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "eng_education".auth_user_id_seq OWNER TO "eng_education.app";

--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 181
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: eng_education; Owner: eng_education.app
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 186 (class 1259 OID 16826)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE "eng_education".auth_user_user_permissions OWNER TO "eng_education.app";

--
-- TOC entry 185 (class 1259 OID 16824)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: eng_education; Owner: eng_education.app
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "eng_education".auth_user_user_permissions_id_seq OWNER TO "eng_education.app";

--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 185
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: eng_education; Owner: eng_education.app
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 192 (class 1259 OID 16916)
-- Name: django_admin_log; Type: TABLE; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE "eng_education".django_admin_log OWNER TO "eng_education.app";

--
-- TOC entry 191 (class 1259 OID 16914)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: eng_education; Owner: eng_education.app
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "eng_education".django_admin_log_id_seq OWNER TO "eng_education.app";

--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 191
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: eng_education; Owner: eng_education.app
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 174 (class 1259 OID 16766)
-- Name: django_content_type; Type: TABLE; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE "eng_education".django_content_type OWNER TO "eng_education.app";

--
-- TOC entry 173 (class 1259 OID 16764)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: eng_education; Owner: eng_education.app
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "eng_education".django_content_type_id_seq OWNER TO "eng_education.app";

--
-- TOC entry 2132 (class 0 OID 0)
-- Dependencies: 173
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: eng_education; Owner: eng_education.app
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 172 (class 1259 OID 16755)
-- Name: django_migrations; Type: TABLE; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE "eng_education".django_migrations OWNER TO "eng_education.app";

--
-- TOC entry 171 (class 1259 OID 16753)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: eng_education; Owner: eng_education.app
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "eng_education".django_migrations_id_seq OWNER TO "eng_education.app";

--
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 171
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: eng_education; Owner: eng_education.app
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 193 (class 1259 OID 16938)
-- Name: django_session; Type: TABLE; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE "eng_education".django_session OWNER TO "eng_education.app";


--
-- TOC entry 1936 (class 2604 OID 16789)
-- Name: id; Type: DEFAULT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 1937 (class 2604 OID 16799)
-- Name: id; Type: DEFAULT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 1935 (class 2604 OID 16779)
-- Name: id; Type: DEFAULT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 1938 (class 2604 OID 16809)
-- Name: id; Type: DEFAULT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 1939 (class 2604 OID 16819)
-- Name: id; Type: DEFAULT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 1940 (class 2604 OID 16829)
-- Name: id; Type: DEFAULT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 1943 (class 2604 OID 16919)
-- Name: id; Type: DEFAULT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 1934 (class 2604 OID 16769)
-- Name: id; Type: DEFAULT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 1933 (class 2604 OID 16758)
-- Name: id; Type: DEFAULT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 1958 (class 2606 OID 16793)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 1964 (class 2606 OID 16803)
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- TOC entry 1966 (class 2606 OID 16801)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1960 (class 2606 OID 16791)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 1953 (class 2606 OID 16783)
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- TOC entry 1955 (class 2606 OID 16781)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 1975 (class 2606 OID 16821)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 1977 (class 2606 OID 16823)
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- TOC entry 1968 (class 2606 OID 16811)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 1981 (class 2606 OID 16831)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1983 (class 2606 OID 16833)
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 1971 (class 2606 OID 16813)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 1995 (class 2606 OID 16925)
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 1948 (class 2606 OID 16773)
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- TOC entry 1950 (class 2606 OID 16771)
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 1946 (class 2606 OID 16763)
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 1998 (class 2606 OID 16945)
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 1956 (class 1259 OID 16840)
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 1961 (class 1259 OID 16851)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 1962 (class 1259 OID 16852)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 1951 (class 1259 OID 16839)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- TOC entry 1972 (class 1259 OID 16865)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- TOC entry 1973 (class 1259 OID 16864)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- TOC entry 1978 (class 1259 OID 16877)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 1979 (class 1259 OID 16876)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 1969 (class 1259 OID 16853)
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 1992 (class 1259 OID 16936)
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 1993 (class 1259 OID 16937)
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- TOC entry 1996 (class 1259 OID 16946)
-- Name: django_session_de54fa62; Type: INDEX; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- TOC entry 1999 (class 1259 OID 16947)
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: eng_education; Owner: eng_education.app; Tablespace:
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2000 (class 2606 OID 16834)
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2001 (class 2606 OID 16841)
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2002 (class 2606 OID 16846)
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2006 (class 2606 OID 16871)
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2004 (class 2606 OID 16859)
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2003 (class 2606 OID 16854)
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2005 (class 2606 OID 16866)
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2009 (class 2606 OID 16926)
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2010 (class 2606 OID 16931)
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: eng_education; Owner: eng_education.app
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 7
-- Name: eng_education; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA "eng_education" FROM PUBLIC;
REVOKE ALL ON SCHEMA "eng_education" FROM postgres;
GRANT ALL ON SCHEMA "eng_education" TO postgres;
GRANT USAGE ON SCHEMA "eng_education" TO role_ro;
GRANT ALL ON SCHEMA "eng_education" TO role_rw;


-- Completed on 2015-05-19 13:58:18 MSK

--
-- PostgreSQL database dump complete
--
