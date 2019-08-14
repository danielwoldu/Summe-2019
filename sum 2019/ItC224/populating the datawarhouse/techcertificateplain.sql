PGDMP                         w           techcertificate    11.4    11.4 �    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            -           1262    16671    techcertificate    DATABASE     �   CREATE DATABASE techcertificate WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE techcertificate;
             postgres    false                        3079    16672    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                  false            .           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                       false    2            %           1255    16709    assign_grade(integer)    FUNCTION     �   CREATE FUNCTION public.assign_grade(skey integer) RETURNS numeric
    LANGUAGE sql
    AS $$

Update Roster
set finalgrade=Random()*(5-1)+1
where studentkey=skey
returning finalgrade

$$;
 1   DROP FUNCTION public.assign_grade(skey integer);
       public       postgres    false            �            1259    16710    businessrule    TABLE     f   CREATE TABLE public.businessrule (
    businessrulekey integer NOT NULL,
    businessruletext text
);
     DROP TABLE public.businessrule;
       public         postgres    false            �            1259    16716     businessrule_businessrulekey_seq    SEQUENCE     �   CREATE SEQUENCE public.businessrule_businessrulekey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.businessrule_businessrulekey_seq;
       public       postgres    false    205            /           0    0     businessrule_businessrulekey_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.businessrule_businessrulekey_seq OWNED BY public.businessrule.businessrulekey;
            public       postgres    false    206            �            1259    16718 	   certadmin    TABLE     s   CREATE TABLE public.certadmin (
    certadminkey integer NOT NULL,
    personkey integer,
    statuskey integer
);
    DROP TABLE public.certadmin;
       public         postgres    false            �            1259    16721    certadmin_certadminkey_seq    SEQUENCE     �   CREATE SEQUENCE public.certadmin_certadminkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.certadmin_certadminkey_seq;
       public       postgres    false    207            0           0    0    certadmin_certadminkey_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.certadmin_certadminkey_seq OWNED BY public.certadmin.certadminkey;
            public       postgres    false    208            �            1259    16723    certificate    TABLE     �   CREATE TABLE public.certificate (
    certificatekey integer NOT NULL,
    certificatename text NOT NULL,
    certificatedescription text
);
    DROP TABLE public.certificate;
       public         postgres    false            �            1259    17062    certificate2    TABLE     |   CREATE TABLE public.certificate2 (
    certificatekey integer,
    certificatename text,
    certificatedescription text
);
     DROP TABLE public.certificate2;
       public         daniel    false            �            1259    16729    certificate_certificatekey_seq    SEQUENCE     �   CREATE SEQUENCE public.certificate_certificatekey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.certificate_certificatekey_seq;
       public       postgres    false    209            1           0    0    certificate_certificatekey_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.certificate_certificatekey_seq OWNED BY public.certificate.certificatekey;
            public       postgres    false    210            �            1259    16731    certificatecourse    TABLE     �   CREATE TABLE public.certificatecourse (
    certificatekey integer NOT NULL,
    coursekey integer NOT NULL,
    minimumgrade numeric NOT NULL
);
 %   DROP TABLE public.certificatecourse;
       public         postgres    false            �            1259    16737    course    TABLE     �   CREATE TABLE public.course (
    coursekey integer NOT NULL,
    coursename text NOT NULL,
    credits integer NOT NULL,
    coursedescription text
);
    DROP TABLE public.course;
       public         postgres    false            �            1259    17068    course2    TABLE     F   CREATE TABLE public.course2 (
    coursename text,
    credit text
);
    DROP TABLE public.course2;
       public         daniel    false            �            1259    16743    course_coursekey_seq    SEQUENCE     �   CREATE SEQUENCE public.course_coursekey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.course_coursekey_seq;
       public       postgres    false    212            2           0    0    course_coursekey_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.course_coursekey_seq OWNED BY public.course.coursekey;
            public       postgres    false    213            �            1259    16745    coursesection    TABLE     �   CREATE TABLE public.coursesection (
    sectionkey integer NOT NULL,
    coursekey integer,
    instructorkey integer,
    sectionyear integer NOT NULL,
    pricehistorykey integer,
    quarterkey integer
);
 !   DROP TABLE public.coursesection;
       public         postgres    false            �            1259    16748    coursesection_sectionkey_seq    SEQUENCE     �   CREATE SEQUENCE public.coursesection_sectionkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.coursesection_sectionkey_seq;
       public       postgres    false    214            3           0    0    coursesection_sectionkey_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.coursesection_sectionkey_seq OWNED BY public.coursesection.sectionkey;
            public       postgres    false    215            �            1259    16750    instructionalarea    TABLE     �   CREATE TABLE public.instructionalarea (
    instructionalareakey integer NOT NULL,
    areaname text NOT NULL,
    description text
);
 %   DROP TABLE public.instructionalarea;
       public         postgres    false            �            1259    16756 *   instructionalarea_instructionalareakey_seq    SEQUENCE     �   CREATE SEQUENCE public.instructionalarea_instructionalareakey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.instructionalarea_instructionalareakey_seq;
       public       postgres    false    216            4           0    0 *   instructionalarea_instructionalareakey_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.instructionalarea_instructionalareakey_seq OWNED BY public.instructionalarea.instructionalareakey;
            public       postgres    false    217            �            1259    16758 
   instructor    TABLE     �   CREATE TABLE public.instructor (
    instructorkey integer NOT NULL,
    personkey integer,
    hiredate date NOT NULL,
    statuskey integer
);
    DROP TABLE public.instructor;
       public         postgres    false            �            1259    16761    instructor_instructorkey_seq    SEQUENCE     �   CREATE SEQUENCE public.instructor_instructorkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.instructor_instructorkey_seq;
       public       postgres    false    218            5           0    0    instructor_instructorkey_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.instructor_instructorkey_seq OWNED BY public.instructor.instructorkey;
            public       postgres    false    219            �            1259    16763    instructorarea    TABLE     v   CREATE TABLE public.instructorarea (
    instructionalareakey integer NOT NULL,
    instructorkey integer NOT NULL
);
 "   DROP TABLE public.instructorarea;
       public         postgres    false            �            1259    17114    jsoncertsawarded    TABLE     e   CREATE TABLE public.jsoncertsawarded (
    certsawardedid integer NOT NULL,
    certsawarded json
);
 $   DROP TABLE public.jsoncertsawarded;
       public         daniel    false            �            1259    17112 #   jsoncertsawarded_certsawardedid_seq    SEQUENCE     �   CREATE SEQUENCE public.jsoncertsawarded_certsawardedid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.jsoncertsawarded_certsawardedid_seq;
       public       daniel    false    242            6           0    0 #   jsoncertsawarded_certsawardedid_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.jsoncertsawarded_certsawardedid_seq OWNED BY public.jsoncertsawarded.certsawardedid;
            public       daniel    false    241            �            1259    16766    loginhistory    TABLE     �   CREATE TABLE public.loginhistory (
    loginhistorykey integer NOT NULL,
    logintablekey integer,
    logindate date DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.loginhistory;
       public         postgres    false            �            1259    16770     loginhistory_loginhistorykey_seq    SEQUENCE     �   CREATE SEQUENCE public.loginhistory_loginhistorykey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.loginhistory_loginhistorykey_seq;
       public       postgres    false    221            7           0    0     loginhistory_loginhistorykey_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.loginhistory_loginhistorykey_seq OWNED BY public.loginhistory.loginhistorykey;
            public       postgres    false    222            �            1259    16772 
   logintable    TABLE     �   CREATE TABLE public.logintable (
    logintablekey integer NOT NULL,
    username text,
    personkey integer,
    userpassword text,
    datelastchanged date
);
    DROP TABLE public.logintable;
       public         postgres    false            �            1259    16778    logintable_logintablekey_seq    SEQUENCE     �   CREATE SEQUENCE public.logintable_logintablekey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.logintable_logintablekey_seq;
       public       postgres    false    223            8           0    0    logintable_logintablekey_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.logintable_logintablekey_seq OWNED BY public.logintable.logintablekey;
            public       postgres    false    224            �            1259    16780    person    TABLE       CREATE TABLE public.person (
    personkey integer NOT NULL,
    lastname text NOT NULL,
    firstname text,
    email text NOT NULL,
    address text,
    city text,
    state character(2),
    postalcode text,
    phone character(14),
    dateadded date
);
    DROP TABLE public.person;
       public         postgres    false            �            1259    16786    person_personkey_seq    SEQUENCE     �   CREATE SEQUENCE public.person_personkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.person_personkey_seq;
       public       postgres    false    225            9           0    0    person_personkey_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.person_personkey_seq OWNED BY public.person.personkey;
            public       postgres    false    226            �            1259    16788    pricehistory    TABLE     �   CREATE TABLE public.pricehistory (
    pricehistorykey integer NOT NULL,
    pricebegindate date NOT NULL,
    pricepercredit numeric(10,2) NOT NULL,
    pricediscount numeric(3,2)
);
     DROP TABLE public.pricehistory;
       public         postgres    false            �            1259    16791     pricehistory_pricehistorykey_seq    SEQUENCE     �   CREATE SEQUENCE public.pricehistory_pricehistorykey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.pricehistory_pricehistorykey_seq;
       public       postgres    false    227            :           0    0     pricehistory_pricehistorykey_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.pricehistory_pricehistorykey_seq OWNED BY public.pricehistory.pricehistorykey;
            public       postgres    false    228            �            1259    16793    quarter    TABLE     W   CREATE TABLE public.quarter (
    quarterkey integer NOT NULL,
    quartername text
);
    DROP TABLE public.quarter;
       public         postgres    false            �            1259    16799    quarter_quarterkey_seq    SEQUENCE     �   CREATE SEQUENCE public.quarter_quarterkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.quarter_quarterkey_seq;
       public       postgres    false    229            ;           0    0    quarter_quarterkey_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.quarter_quarterkey_seq OWNED BY public.quarter.quarterkey;
            public       postgres    false    230            �            1259    16801    roster    TABLE     �   CREATE TABLE public.roster (
    rosterkey integer NOT NULL,
    sectionkey integer,
    studentkey integer,
    finalgrade numeric
);
    DROP TABLE public.roster;
       public         postgres    false            �            1259    16807    roster_rosterkey_seq    SEQUENCE     �   CREATE SEQUENCE public.roster_rosterkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.roster_rosterkey_seq;
       public       postgres    false    231            <           0    0    roster_rosterkey_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.roster_rosterkey_seq OWNED BY public.roster.rosterkey;
            public       postgres    false    232            �            1259    16809    status    TABLE     ]   CREATE TABLE public.status (
    statuskey integer NOT NULL,
    statusname text NOT NULL
);
    DROP TABLE public.status;
       public         postgres    false            �            1259    16815    status_statuskey_seq    SEQUENCE     �   CREATE SEQUENCE public.status_statuskey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.status_statuskey_seq;
       public       postgres    false    233            =           0    0    status_statuskey_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.status_statuskey_seq OWNED BY public.status.statuskey;
            public       postgres    false    234            �            1259    16817    student    TABLE     �   CREATE TABLE public.student (
    studentkey integer NOT NULL,
    personkey integer,
    studentstartdate date NOT NULL,
    statuskey integer
);
    DROP TABLE public.student;
       public         postgres    false            �            1259    16820    student_studentkey_seq    SEQUENCE     �   CREATE SEQUENCE public.student_studentkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.student_studentkey_seq;
       public       postgres    false    235            >           0    0    student_studentkey_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.student_studentkey_seq OWNED BY public.student.studentkey;
            public       postgres    false    236            �            1259    16822    substitution    TABLE     �   CREATE TABLE public.substitution (
    substitutionkey integer NOT NULL,
    certificatekey integer,
    coursekey integer,
    substitutekey integer,
    studentkey integer,
    certadminkey integer
);
     DROP TABLE public.substitution;
       public         postgres    false            �            1259    16825     substitution_substitutionkey_seq    SEQUENCE     �   CREATE SEQUENCE public.substitution_substitutionkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.substitution_substitutionkey_seq;
       public       postgres    false    237            ?           0    0     substitution_substitutionkey_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.substitution_substitutionkey_seq OWNED BY public.substitution.substitutionkey;
            public       postgres    false    238            �            1259    17125    xmlquarternotes    TABLE     _   CREATE TABLE public.xmlquarternotes (
    xmlquarternotesid integer NOT NULL,
    notes xml
);
 #   DROP TABLE public.xmlquarternotes;
       public         daniel    false            �            1259    17123 %   xmlquarternotes_xmlquarternotesid_seq    SEQUENCE     �   CREATE SEQUENCE public.xmlquarternotes_xmlquarternotesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.xmlquarternotes_xmlquarternotesid_seq;
       public       daniel    false    244            @           0    0 %   xmlquarternotes_xmlquarternotesid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.xmlquarternotes_xmlquarternotesid_seq OWNED BY public.xmlquarternotes.xmlquarternotesid;
            public       daniel    false    243            /           2604    16827    businessrule businessrulekey    DEFAULT     �   ALTER TABLE ONLY public.businessrule ALTER COLUMN businessrulekey SET DEFAULT nextval('public.businessrule_businessrulekey_seq'::regclass);
 K   ALTER TABLE public.businessrule ALTER COLUMN businessrulekey DROP DEFAULT;
       public       postgres    false    206    205            0           2604    16828    certadmin certadminkey    DEFAULT     �   ALTER TABLE ONLY public.certadmin ALTER COLUMN certadminkey SET DEFAULT nextval('public.certadmin_certadminkey_seq'::regclass);
 E   ALTER TABLE public.certadmin ALTER COLUMN certadminkey DROP DEFAULT;
       public       postgres    false    208    207            1           2604    16829    certificate certificatekey    DEFAULT     �   ALTER TABLE ONLY public.certificate ALTER COLUMN certificatekey SET DEFAULT nextval('public.certificate_certificatekey_seq'::regclass);
 I   ALTER TABLE public.certificate ALTER COLUMN certificatekey DROP DEFAULT;
       public       postgres    false    210    209            2           2604    16830    course coursekey    DEFAULT     t   ALTER TABLE ONLY public.course ALTER COLUMN coursekey SET DEFAULT nextval('public.course_coursekey_seq'::regclass);
 ?   ALTER TABLE public.course ALTER COLUMN coursekey DROP DEFAULT;
       public       postgres    false    213    212            3           2604    16831    coursesection sectionkey    DEFAULT     �   ALTER TABLE ONLY public.coursesection ALTER COLUMN sectionkey SET DEFAULT nextval('public.coursesection_sectionkey_seq'::regclass);
 G   ALTER TABLE public.coursesection ALTER COLUMN sectionkey DROP DEFAULT;
       public       postgres    false    215    214            4           2604    16832 &   instructionalarea instructionalareakey    DEFAULT     �   ALTER TABLE ONLY public.instructionalarea ALTER COLUMN instructionalareakey SET DEFAULT nextval('public.instructionalarea_instructionalareakey_seq'::regclass);
 U   ALTER TABLE public.instructionalarea ALTER COLUMN instructionalareakey DROP DEFAULT;
       public       postgres    false    217    216            5           2604    16833    instructor instructorkey    DEFAULT     �   ALTER TABLE ONLY public.instructor ALTER COLUMN instructorkey SET DEFAULT nextval('public.instructor_instructorkey_seq'::regclass);
 G   ALTER TABLE public.instructor ALTER COLUMN instructorkey DROP DEFAULT;
       public       postgres    false    219    218            @           2604    17117    jsoncertsawarded certsawardedid    DEFAULT     �   ALTER TABLE ONLY public.jsoncertsawarded ALTER COLUMN certsawardedid SET DEFAULT nextval('public.jsoncertsawarded_certsawardedid_seq'::regclass);
 N   ALTER TABLE public.jsoncertsawarded ALTER COLUMN certsawardedid DROP DEFAULT;
       public       daniel    false    241    242    242            7           2604    16834    loginhistory loginhistorykey    DEFAULT     �   ALTER TABLE ONLY public.loginhistory ALTER COLUMN loginhistorykey SET DEFAULT nextval('public.loginhistory_loginhistorykey_seq'::regclass);
 K   ALTER TABLE public.loginhistory ALTER COLUMN loginhistorykey DROP DEFAULT;
       public       postgres    false    222    221            8           2604    16835    logintable logintablekey    DEFAULT     �   ALTER TABLE ONLY public.logintable ALTER COLUMN logintablekey SET DEFAULT nextval('public.logintable_logintablekey_seq'::regclass);
 G   ALTER TABLE public.logintable ALTER COLUMN logintablekey DROP DEFAULT;
       public       postgres    false    224    223            9           2604    16836    person personkey    DEFAULT     t   ALTER TABLE ONLY public.person ALTER COLUMN personkey SET DEFAULT nextval('public.person_personkey_seq'::regclass);
 ?   ALTER TABLE public.person ALTER COLUMN personkey DROP DEFAULT;
       public       postgres    false    226    225            :           2604    16837    pricehistory pricehistorykey    DEFAULT     �   ALTER TABLE ONLY public.pricehistory ALTER COLUMN pricehistorykey SET DEFAULT nextval('public.pricehistory_pricehistorykey_seq'::regclass);
 K   ALTER TABLE public.pricehistory ALTER COLUMN pricehistorykey DROP DEFAULT;
       public       postgres    false    228    227            ;           2604    16838    quarter quarterkey    DEFAULT     x   ALTER TABLE ONLY public.quarter ALTER COLUMN quarterkey SET DEFAULT nextval('public.quarter_quarterkey_seq'::regclass);
 A   ALTER TABLE public.quarter ALTER COLUMN quarterkey DROP DEFAULT;
       public       postgres    false    230    229            <           2604    16839    roster rosterkey    DEFAULT     t   ALTER TABLE ONLY public.roster ALTER COLUMN rosterkey SET DEFAULT nextval('public.roster_rosterkey_seq'::regclass);
 ?   ALTER TABLE public.roster ALTER COLUMN rosterkey DROP DEFAULT;
       public       postgres    false    232    231            =           2604    16840    status statuskey    DEFAULT     t   ALTER TABLE ONLY public.status ALTER COLUMN statuskey SET DEFAULT nextval('public.status_statuskey_seq'::regclass);
 ?   ALTER TABLE public.status ALTER COLUMN statuskey DROP DEFAULT;
       public       postgres    false    234    233            >           2604    16841    student studentkey    DEFAULT     x   ALTER TABLE ONLY public.student ALTER COLUMN studentkey SET DEFAULT nextval('public.student_studentkey_seq'::regclass);
 A   ALTER TABLE public.student ALTER COLUMN studentkey DROP DEFAULT;
       public       postgres    false    236    235            ?           2604    16842    substitution substitutionkey    DEFAULT     �   ALTER TABLE ONLY public.substitution ALTER COLUMN substitutionkey SET DEFAULT nextval('public.substitution_substitutionkey_seq'::regclass);
 K   ALTER TABLE public.substitution ALTER COLUMN substitutionkey DROP DEFAULT;
       public       postgres    false    238    237            A           2604    17128 !   xmlquarternotes xmlquarternotesid    DEFAULT     �   ALTER TABLE ONLY public.xmlquarternotes ALTER COLUMN xmlquarternotesid SET DEFAULT nextval('public.xmlquarternotes_xmlquarternotesid_seq'::regclass);
 P   ALTER TABLE public.xmlquarternotes ALTER COLUMN xmlquarternotesid DROP DEFAULT;
       public       daniel    false    244    243    244                       0    16710    businessrule 
   TABLE DATA                     public       postgres    false    205   ��                 0    16718 	   certadmin 
   TABLE DATA                     public       postgres    false    207   ��                 0    16723    certificate 
   TABLE DATA                     public       postgres    false    209   -�       "          0    17062    certificate2 
   TABLE DATA                     public       daniel    false    239   o�                 0    16731    certificatecourse 
   TABLE DATA                     public       postgres    false    211   ��                 0    16737    course 
   TABLE DATA                     public       postgres    false    212   s�       #          0    17068    course2 
   TABLE DATA                     public       daniel    false    240   *�       	          0    16745    coursesection 
   TABLE DATA                     public       postgres    false    214   ��                 0    16750    instructionalarea 
   TABLE DATA                     public       postgres    false    216   &�                 0    16758 
   instructor 
   TABLE DATA                     public       postgres    false    218   �                 0    16763    instructorarea 
   TABLE DATA                     public       postgres    false    220   ��       %          0    17114    jsoncertsawarded 
   TABLE DATA                     public       daniel    false    242   N�                 0    16766    loginhistory 
   TABLE DATA                     public       postgres    false    221   h�                 0    16772 
   logintable 
   TABLE DATA                     public       postgres    false    223   ��                 0    16780    person 
   TABLE DATA                     public       postgres    false    225   �                0    16788    pricehistory 
   TABLE DATA                     public       postgres    false    227   <6                0    16793    quarter 
   TABLE DATA                     public       postgres    false    229   �6                0    16801    roster 
   TABLE DATA                     public       postgres    false    231   !7                0    16809    status 
   TABLE DATA                     public       postgres    false    233   i                0    16817    student 
   TABLE DATA                     public       postgres    false    235   �i                 0    16822    substitution 
   TABLE DATA                     public       postgres    false    237   �p      '          0    17125    xmlquarternotes 
   TABLE DATA                     public       daniel    false    244   �p      A           0    0     businessrule_businessrulekey_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.businessrule_businessrulekey_seq', 16, true);
            public       postgres    false    206            B           0    0    certadmin_certadminkey_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.certadmin_certadminkey_seq', 4, true);
            public       postgres    false    208            C           0    0    certificate_certificatekey_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.certificate_certificatekey_seq', 19, true);
            public       postgres    false    210            D           0    0    course_coursekey_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.course_coursekey_seq', 28, true);
            public       postgres    false    213            E           0    0    coursesection_sectionkey_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.coursesection_sectionkey_seq', 115, true);
            public       postgres    false    215            F           0    0 *   instructionalarea_instructionalareakey_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.instructionalarea_instructionalareakey_seq', 6, true);
            public       postgres    false    217            G           0    0    instructor_instructorkey_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.instructor_instructorkey_seq', 11, true);
            public       postgres    false    219            H           0    0 #   jsoncertsawarded_certsawardedid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.jsoncertsawarded_certsawardedid_seq', 1, false);
            public       daniel    false    241            I           0    0     loginhistory_loginhistorykey_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.loginhistory_loginhistorykey_seq', 1, false);
            public       postgres    false    222            J           0    0    logintable_logintablekey_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.logintable_logintablekey_seq', 214, true);
            public       postgres    false    224            K           0    0    person_personkey_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.person_personkey_seq', 404, true);
            public       postgres    false    226            L           0    0     pricehistory_pricehistorykey_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.pricehistory_pricehistorykey_seq', 3, true);
            public       postgres    false    228            M           0    0    quarter_quarterkey_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.quarter_quarterkey_seq', 4, true);
            public       postgres    false    230            N           0    0    roster_rosterkey_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.roster_rosterkey_seq', 2005, true);
            public       postgres    false    232            O           0    0    status_statuskey_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.status_statuskey_seq', 4, true);
            public       postgres    false    234            P           0    0    student_studentkey_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.student_studentkey_seq', 200, true);
            public       postgres    false    236            Q           0    0     substitution_substitutionkey_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.substitution_substitutionkey_seq', 1, false);
            public       postgres    false    238            R           0    0 %   xmlquarternotes_xmlquarternotesid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.xmlquarternotes_xmlquarternotesid_seq', 4, true);
            public       daniel    false    243            C           2606    16844    businessrule businessrule_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.businessrule
    ADD CONSTRAINT businessrule_pkey PRIMARY KEY (businessrulekey);
 H   ALTER TABLE ONLY public.businessrule DROP CONSTRAINT businessrule_pkey;
       public         postgres    false    205            E           2606    16846    certadmin certadmin_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.certadmin
    ADD CONSTRAINT certadmin_pkey PRIMARY KEY (certadminkey);
 B   ALTER TABLE ONLY public.certadmin DROP CONSTRAINT certadmin_pkey;
       public         postgres    false    207            G           2606    16848    certificate certificate_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.certificate
    ADD CONSTRAINT certificate_pkey PRIMARY KEY (certificatekey);
 F   ALTER TABLE ONLY public.certificate DROP CONSTRAINT certificate_pkey;
       public         postgres    false    209            K           2606    16850    course course_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (coursekey);
 <   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pkey;
       public         postgres    false    212            M           2606    16852     coursesection coursesection_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.coursesection
    ADD CONSTRAINT coursesection_pkey PRIMARY KEY (sectionkey);
 J   ALTER TABLE ONLY public.coursesection DROP CONSTRAINT coursesection_pkey;
       public         postgres    false    214            O           2606    16854 (   instructionalarea instructionalarea_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.instructionalarea
    ADD CONSTRAINT instructionalarea_pkey PRIMARY KEY (instructionalareakey);
 R   ALTER TABLE ONLY public.instructionalarea DROP CONSTRAINT instructionalarea_pkey;
       public         postgres    false    216            Q           2606    16856    instructor instructor_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (instructorkey);
 D   ALTER TABLE ONLY public.instructor DROP CONSTRAINT instructor_pkey;
       public         postgres    false    218            m           2606    17122 &   jsoncertsawarded jsoncertsawarded_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.jsoncertsawarded
    ADD CONSTRAINT jsoncertsawarded_pkey PRIMARY KEY (certsawardedid);
 P   ALTER TABLE ONLY public.jsoncertsawarded DROP CONSTRAINT jsoncertsawarded_pkey;
       public         daniel    false    242            U           2606    16858    loginhistory loginhistory_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.loginhistory
    ADD CONSTRAINT loginhistory_pkey PRIMARY KEY (loginhistorykey);
 H   ALTER TABLE ONLY public.loginhistory DROP CONSTRAINT loginhistory_pkey;
       public         postgres    false    221            W           2606    16860    logintable logintable_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.logintable
    ADD CONSTRAINT logintable_pkey PRIMARY KEY (logintablekey);
 D   ALTER TABLE ONLY public.logintable DROP CONSTRAINT logintable_pkey;
       public         postgres    false    223            Z           2606    16862    person person_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (personkey);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public         postgres    false    225            I           2606    16864 &   certificatecourse pk_certificatecourse 
   CONSTRAINT     {   ALTER TABLE ONLY public.certificatecourse
    ADD CONSTRAINT pk_certificatecourse PRIMARY KEY (certificatekey, coursekey);
 P   ALTER TABLE ONLY public.certificatecourse DROP CONSTRAINT pk_certificatecourse;
       public         postgres    false    211    211            S           2606    16866     instructorarea pk_instructorarea 
   CONSTRAINT        ALTER TABLE ONLY public.instructorarea
    ADD CONSTRAINT pk_instructorarea PRIMARY KEY (instructionalareakey, instructorkey);
 J   ALTER TABLE ONLY public.instructorarea DROP CONSTRAINT pk_instructorarea;
       public         postgres    false    220    220            ^           2606    16868    pricehistory pricehistory_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.pricehistory
    ADD CONSTRAINT pricehistory_pkey PRIMARY KEY (pricehistorykey);
 H   ALTER TABLE ONLY public.pricehistory DROP CONSTRAINT pricehistory_pkey;
       public         postgres    false    227            `           2606    16870    quarter quarter_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.quarter
    ADD CONSTRAINT quarter_pkey PRIMARY KEY (quarterkey);
 >   ALTER TABLE ONLY public.quarter DROP CONSTRAINT quarter_pkey;
       public         postgres    false    229            b           2606    16872    roster roster_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.roster
    ADD CONSTRAINT roster_pkey PRIMARY KEY (rosterkey);
 <   ALTER TABLE ONLY public.roster DROP CONSTRAINT roster_pkey;
       public         postgres    false    231            f           2606    16874    status status_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (statuskey);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public         postgres    false    233            i           2606    16876    student student_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (studentkey);
 >   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
       public         postgres    false    235            k           2606    16878    substitution substitution_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.substitution
    ADD CONSTRAINT substitution_pkey PRIMARY KEY (substitutionkey);
 H   ALTER TABLE ONLY public.substitution DROP CONSTRAINT substitution_pkey;
       public         postgres    false    237            \           2606    16880    person unique_email 
   CONSTRAINT     O   ALTER TABLE ONLY public.person
    ADD CONSTRAINT unique_email UNIQUE (email);
 =   ALTER TABLE ONLY public.person DROP CONSTRAINT unique_email;
       public         postgres    false    225            o           2606    17133 $   xmlquarternotes xmlquarternotes_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.xmlquarternotes
    ADD CONSTRAINT xmlquarternotes_pkey PRIMARY KEY (xmlquarternotesid);
 N   ALTER TABLE ONLY public.xmlquarternotes DROP CONSTRAINT xmlquarternotes_pkey;
       public         daniel    false    244            X           1259    17528    person_lastname_idx    INDEX     J   CREATE INDEX person_lastname_idx ON public.person USING btree (lastname);
 '   DROP INDEX public.person_lastname_idx;
       public         postgres    false    225            c           1259    17526    roster_sectionkey_idx    INDEX     N   CREATE INDEX roster_sectionkey_idx ON public.roster USING btree (sectionkey);
 )   DROP INDEX public.roster_sectionkey_idx;
       public         postgres    false    231            d           1259    17525    roster_studentkey_idx    INDEX     N   CREATE INDEX roster_studentkey_idx ON public.roster USING btree (studentkey);
 )   DROP INDEX public.roster_studentkey_idx;
       public         postgres    false    231            g           1259    17527    student_personkey_idx    INDEX     N   CREATE INDEX student_personkey_idx ON public.student USING btree (personkey);
 )   DROP INDEX public.student_personkey_idx;
       public         postgres    false    235            p           2606    16881 "   certadmin certadmin_personkey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.certadmin
    ADD CONSTRAINT certadmin_personkey_fkey FOREIGN KEY (personkey) REFERENCES public.person(personkey);
 L   ALTER TABLE ONLY public.certadmin DROP CONSTRAINT certadmin_personkey_fkey;
       public       postgres    false    225    207    2906            q           2606    16886 "   certadmin certadmin_statuskey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.certadmin
    ADD CONSTRAINT certadmin_statuskey_fkey FOREIGN KEY (statuskey) REFERENCES public.status(statuskey);
 L   ALTER TABLE ONLY public.certadmin DROP CONSTRAINT certadmin_statuskey_fkey;
       public       postgres    false    233    2918    207            r           2606    16891 7   certificatecourse certificatecourse_certificatekey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.certificatecourse
    ADD CONSTRAINT certificatecourse_certificatekey_fkey FOREIGN KEY (certificatekey) REFERENCES public.certificate(certificatekey);
 a   ALTER TABLE ONLY public.certificatecourse DROP CONSTRAINT certificatecourse_certificatekey_fkey;
       public       postgres    false    209    211    2887            s           2606    16896 2   certificatecourse certificatecourse_coursekey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.certificatecourse
    ADD CONSTRAINT certificatecourse_coursekey_fkey FOREIGN KEY (coursekey) REFERENCES public.course(coursekey);
 \   ALTER TABLE ONLY public.certificatecourse DROP CONSTRAINT certificatecourse_coursekey_fkey;
       public       postgres    false    211    2891    212            t           2606    16901 *   coursesection coursesection_coursekey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.coursesection
    ADD CONSTRAINT coursesection_coursekey_fkey FOREIGN KEY (coursekey) REFERENCES public.course(coursekey);
 T   ALTER TABLE ONLY public.coursesection DROP CONSTRAINT coursesection_coursekey_fkey;
       public       postgres    false    212    214    2891            u           2606    16906 .   coursesection coursesection_instructorkey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.coursesection
    ADD CONSTRAINT coursesection_instructorkey_fkey FOREIGN KEY (instructorkey) REFERENCES public.instructor(instructorkey);
 X   ALTER TABLE ONLY public.coursesection DROP CONSTRAINT coursesection_instructorkey_fkey;
       public       postgres    false    214    2897    218            v           2606    16911    coursesection fk_price    FK CONSTRAINT     �   ALTER TABLE ONLY public.coursesection
    ADD CONSTRAINT fk_price FOREIGN KEY (pricehistorykey) REFERENCES public.pricehistory(pricehistorykey);
 @   ALTER TABLE ONLY public.coursesection DROP CONSTRAINT fk_price;
       public       postgres    false    227    2910    214            w           2606    16916    coursesection fk_quarter    FK CONSTRAINT     �   ALTER TABLE ONLY public.coursesection
    ADD CONSTRAINT fk_quarter FOREIGN KEY (quarterkey) REFERENCES public.quarter(quarterkey);
 B   ALTER TABLE ONLY public.coursesection DROP CONSTRAINT fk_quarter;
       public       postgres    false    214    2912    229            x           2606    16921 $   instructor instructor_personkey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_personkey_fkey FOREIGN KEY (personkey) REFERENCES public.person(personkey);
 N   ALTER TABLE ONLY public.instructor DROP CONSTRAINT instructor_personkey_fkey;
       public       postgres    false    218    225    2906            y           2606    16926 $   instructor instructor_statuskey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_statuskey_fkey FOREIGN KEY (statuskey) REFERENCES public.status(statuskey);
 N   ALTER TABLE ONLY public.instructor DROP CONSTRAINT instructor_statuskey_fkey;
       public       postgres    false    2918    218    233            z           2606    16931 7   instructorarea instructorarea_instructionalareakey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instructorarea
    ADD CONSTRAINT instructorarea_instructionalareakey_fkey FOREIGN KEY (instructionalareakey) REFERENCES public.instructionalarea(instructionalareakey);
 a   ALTER TABLE ONLY public.instructorarea DROP CONSTRAINT instructorarea_instructionalareakey_fkey;
       public       postgres    false    220    216    2895            {           2606    16936 0   instructorarea instructorarea_instructorkey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instructorarea
    ADD CONSTRAINT instructorarea_instructorkey_fkey FOREIGN KEY (instructorkey) REFERENCES public.instructor(instructorkey);
 Z   ALTER TABLE ONLY public.instructorarea DROP CONSTRAINT instructorarea_instructorkey_fkey;
       public       postgres    false    220    2897    218            |           2606    16941 ,   loginhistory loginhistory_logintablekey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.loginhistory
    ADD CONSTRAINT loginhistory_logintablekey_fkey FOREIGN KEY (logintablekey) REFERENCES public.logintable(logintablekey);
 V   ALTER TABLE ONLY public.loginhistory DROP CONSTRAINT loginhistory_logintablekey_fkey;
       public       postgres    false    2903    223    221            }           2606    16946 $   logintable logintable_personkey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.logintable
    ADD CONSTRAINT logintable_personkey_fkey FOREIGN KEY (personkey) REFERENCES public.person(personkey);
 N   ALTER TABLE ONLY public.logintable DROP CONSTRAINT logintable_personkey_fkey;
       public       postgres    false    223    2906    225            ~           2606    16951    roster roster_sectionkey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.roster
    ADD CONSTRAINT roster_sectionkey_fkey FOREIGN KEY (sectionkey) REFERENCES public.coursesection(sectionkey);
 G   ALTER TABLE ONLY public.roster DROP CONSTRAINT roster_sectionkey_fkey;
       public       postgres    false    231    214    2893                       2606    16956    roster roster_studentkey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.roster
    ADD CONSTRAINT roster_studentkey_fkey FOREIGN KEY (studentkey) REFERENCES public.student(studentkey);
 G   ALTER TABLE ONLY public.roster DROP CONSTRAINT roster_studentkey_fkey;
       public       postgres    false    2921    235    231            �           2606    16961    student student_personkey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_personkey_fkey FOREIGN KEY (personkey) REFERENCES public.person(personkey);
 H   ALTER TABLE ONLY public.student DROP CONSTRAINT student_personkey_fkey;
       public       postgres    false    225    2906    235            �           2606    16966    student student_statuskey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_statuskey_fkey FOREIGN KEY (statuskey) REFERENCES public.status(statuskey);
 H   ALTER TABLE ONLY public.student DROP CONSTRAINT student_statuskey_fkey;
       public       postgres    false    235    233    2918            �           2606    16971 +   substitution substitution_certadminkey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.substitution
    ADD CONSTRAINT substitution_certadminkey_fkey FOREIGN KEY (certadminkey) REFERENCES public.certadmin(certadminkey);
 U   ALTER TABLE ONLY public.substitution DROP CONSTRAINT substitution_certadminkey_fkey;
       public       postgres    false    237    2885    207            �           2606    16976 -   substitution substitution_certificatekey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.substitution
    ADD CONSTRAINT substitution_certificatekey_fkey FOREIGN KEY (certificatekey) REFERENCES public.certificate(certificatekey);
 W   ALTER TABLE ONLY public.substitution DROP CONSTRAINT substitution_certificatekey_fkey;
       public       postgres    false    209    2887    237            �           2606    16981 (   substitution substitution_coursekey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.substitution
    ADD CONSTRAINT substitution_coursekey_fkey FOREIGN KEY (coursekey) REFERENCES public.course(coursekey);
 R   ALTER TABLE ONLY public.substitution DROP CONSTRAINT substitution_coursekey_fkey;
       public       postgres    false    2891    237    212            �           2606    16986 )   substitution substitution_studentkey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.substitution
    ADD CONSTRAINT substitution_studentkey_fkey FOREIGN KEY (studentkey) REFERENCES public.student(studentkey);
 S   ALTER TABLE ONLY public.substitution DROP CONSTRAINT substitution_studentkey_fkey;
       public       postgres    false    235    2921    237            �           2606    16991 ,   substitution substitution_substitutekey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.substitution
    ADD CONSTRAINT substitution_substitutekey_fkey FOREIGN KEY (substitutekey) REFERENCES public.course(coursekey);
 V   ALTER TABLE ONLY public.substitution DROP CONSTRAINT substitution_substitutekey_fkey;
       public       postgres    false    212    237    2891                  x���Ak1����w)� ��z����B�Pm�Iv�t�%3��ob�"�R	d���R�������]�'vS��=��t"�o�߶{�����j�*h�(�	�Ip!�-E!����3_!<B�D8��;�$����/���5�5/,�3��Ѫ�a��G��1�)_���}��v�GWZD�Y'�I��O׋����h�Y��0]w�/3y��A,$YQ֤�`�Ry8�3հ�P��-��@���hLNC�_i��¥]n䇊�x��B�+����y�5         N   x���v
Q���W((M��L�KN-*IL���Ss�	uV�0�Q !Mk.Ob��(���XG���Un��`1�� �W62         2  x����N�0E�����
���UI�*mh�'�Ў�ؖ��<*V��wt�<\̪ɢ�bV�����LQH��
��h�:���|�n���ۖ�2����ZH+�#��A�1Q�f�w��0����mZ9�_�O
�w[e�ZИ�j���*�M����^
��S��l����zyU�p����ٛ��W���*�O<w�0�$7�sڵOa#�E�{Շk��l,ː��!�|+�N� ���Eӻf�z��̴��p㍐G����r �`+������ż:�t+آ������Y���l�� ^T�D      "   3  x���MO�0�����	��u�T�!��V��41��4��lh���1�D���<~���j��!��p�F����#}�'�o�
�.ǐ<����ەmKf��ۣ�-�5B#� �B+BD�K��G�?�&�����_�/���52RoW@�(@A������!�+|`S�2��~)nƐUUOW}�g39=�~��� =���3�2$"d���� 跜0�B8���y�)�/�e�ں��q�ZD�F�^6��k�j�}��ѩs����� �p��Aj���ze����אY�����͚i�t���k��         �   x���A
�0F�}O��B)Mb���E�`�{)���7�� �|��|׷�A�n8���x�P�8�iL�>��Z�OT�����j�J�Ke�z}(���Ph)� �l(�R�(�!���P�X�vD�xr9��#��#����4H$+H$K(ߨsCI�����Xt�H֐�o��D��fQ|�o�         �  x��VMs)��Wps�J�����VN���ʥ�����%y��~��#V*$��=�^�f:�n�d:_.�iVR��L7�q�i2{��ȋ񈜾�k��Pkrg����~���9�M���n�Z�Ɋ:�����k8��&΂]c�;�������g��/a�'�\� @%���?�3��q>�"��;�Ve���g�"wt�������g�ί�����0�Y�O�w�o�x�ٻ�Jq�~��4�?o����s���W´b���d��;��#��Sߋ�����,�����`�I�M�C��ٶO"�<���e4ނ��U�ʭ�A��/�w	�a�*nw��%_�o�l#<gl����u����V�*��S��+p�B�Bar|��t���#·f���"�Cbe)�=�����:�F*O0�5�q���[���s�����졁rD��E��%�Id����*TV��k�)H�PL���Ԍ�w��7���_�qС��Mh�GmI�� �,G��-U�42jJ�pF�}���>RLP�B�Ye�MY�
d���H�d��R��(�����P�*f�*�i^��Lr�:��[-�#
	)ܓG��A�K�.��@3T��C����/� vp�5lC�#s]����6rT}�e��3�Km��tR����֫�eO� Cs�!�B&Ȑ�n�SѴ}C����Y�%�w������	YZ�D�ͨ3M�#��&�x���	�P)���Kh��E!����0���<y�S�����V���P
�1+m)�fT�}���1�M]�&����V��P ��բ~�������o�#6���x�"+���&g���=�����	�;�����q��G6@�}��=P�+j�׊T;��0���B�vyhM��J��,+�	�+�t���(;��gΆ]NN��=Ai      #   �  x��U�N�@��+�*!TZ��ɐ�\EqȆrެ�� gw5;1�߳kB�����{3�o�˹�.WP�W�ݺ%se܎��?��i��b|�YK�����v�Ǘ0�5�v3*�`�'Kl���������X�q�`����	��\d呣t�@��6��5��@h�:�}�8�v�Τ�@�֝�"��/Q*&���gw�d�Ϙl%��q�iK�B��`��%��l�͢x�$/�9y�m7D�7�����<є�	j��d��ݵ�����o�,�uG�,��6�x�����d�u���Npe8�҆�j<�8{�8�z�r�լ�%zǹxh<(�x���.��(����u~+�����Σ9|�!�Ӽ�����������@t�͝�A����(�%�����xU���+8n      	   >  x���=NA���bJ�Vh=��'*��P�H� D�A�ܟ�u
�L��H)h�����a�ݭ��n��?������pw8]����������^_�;wC���)�߷���q?��Q|��0|�Cg"�<'�-x�x�x�x�\hȝ�Ε��Tߒ>M �9	P`
M���hT�L|P���Q��'� ���l�T�����B6b�'��@�Z�I$����sċ8��4@��}���G���U�x�=`���T�x����lՄyiB�@5!�ae�<�=h[D�m<�Yn㽚�6^{�Əj��x�&�mnH�6��Y�r�@�.ZLb�:�7� ��x�*���$��s��L�|� �|� �|� |}��Q���c�ϲ��"������m�x�F�� ��.���r��>�y�ċX0���8�5�L{m�;�E6�����;A��Q�"�1P`���<��u�jtjȀ��7)��F�=�
�?5�Ia�q{�� ڐ��)$}1���F�"�j��|1��E��qϗK�����O����M�P"i���K�T         �   x���1o�0�=��)B��,La
�¡���)X�e;��Aa���wE%����>��e��\�}���;���U�����޶/m�4��T��uR<�|���Rw�\xQY������Ehh��:�/r��������I%�?2��d^�A�%e��Q
PT����G�������Э�����6B wwg� o�y~�x�Ir��%         �   x���A�0��}O1;4i��Pl�+,�L=��H���[��.��{�?�ʪ8������zk�M{����.�ù�`E2		#��	��	�H����:�`B�Ei-�~5+��>:���>�0�4���W��D]���g��[�|�N>�mc�F�c�Ɓ�3�O��y@�7x��         |   x���v
Q���W((M��L���+.)*M.�/J,JMTs�	uV�0�Q0Դ��$Z�1��t�H�`L�R5���J&$i0#U���ƃ��jN��-HuiLH� t�%��`h ��� ���      %   
   x���             
   x���                x���ǲ�J���?Wq'�TE�o�Z�ީ�0�p�%���dFu>v5�ь13G>�囒���v�[>����*�j.E=��*�o�Ѽ�������]n�����#������Q�3(��W3E*s�!Z�3��Õ5y�.39�����`�+��P�?��?��������������#3���x�x��14�j�c˹?5�rꌑЀ�H��n�G
Oa�s�3�h�w�'.v���B����-��s�;WY�����q:YОe���9t*&7��!�q)z��ol��I�S
3W	���1����������9ߌ�:[��~�(S��`�>��e���)�Ρ�������/�Ƀ[^��ΐ��n�1CC�|��<o��4o��	�v>qd	�����X\q���A��ˢ�õ;�<����?7�xNqƪ*���A�K�܇N�Q�\r���(O���Ǡ6�#5��HȘr8��8��¸����kI����H��"���Mv�M���XR5[��wP�ޚh���>���o:���?v��_ȎCC}�͒r����B�#�a�G��S�=҅l#��W;G~�(�M�L��أ�܀�}������V���iRV�!�!��و�-:�&�?����$5�p�l=R2�?\�'o��y����.ƞM���U�9g����o��bc-/?��-�TS�cz90���0[b�0^�E��x:D4jck
D�0�CQ���~�xU��L�E����𡝭���⑺tї��?v��K��ExDg��O鿐�?e�~��a5dC�G��A��Dkp�3����,:�����?�� �?���=��ُ!���0��P��<o�t5eC�x�r<��_ɀ�K�G�Q������bX)q�Y��B�7{���q�GY����l���R����	oc ��0�1D�8H���J3}�õw((��!;h0�Jc��fl��֪�B�{��>]�9�/P��㻓�~zqS?��gCCD��@?;C��8��������/S�S�E� ��z��Ð��'G�b�H���ֆEͲ՘���O7lz�?���� ;�@Tғ����%�ZZ��@~<=?�9��x�d'��R�K����%Np���]��<�w����g�8)�c��e�VJRm��X��i3�9x��+t�#��)�EN�Gil��������� {�u��s/��j���}f.g���¨j6z��� �:��fZ�	]a^��<g=���he���'=��T�����؁l�bá=TR�'����9�����b���b/5"ȩAu��$�7�X��h���ܿ�>�l�::���K�9q���`F먒�^"���Ub<���}NI��ן���oE>$��:n�Վ-X�:�9^�0Oׂf%��M�NYL
B� 8Ѧ~3�./����xW��|0ʲq]~�eCU��#0��*�"`��q�`�44�j3T"�K����ԯ�,N��@�O���Dv��`4Ԛ�!��o~߉p�0!�!,6�m .�P�6V�>���K�hZJ���G����`�d�9b�M��WY��O���w���X�ӝ��(��ƥ�xj�En�b�o�kaU��6�z�G�/.�5� �ޠ�����^��1A\�飳Q�K@Ӌ�������Hڢ���k�zȞ�`����[F ���p��B�ݳq�l9r-<:պ��җ�t�x� p��s�z9*��ɥ�
/{Wx_C6HUO���R��Y�K�6����V϶GIq���-�˦����g䧺{��#A>��w���R�E����ƆW����:��9f�{u�X1�[szn�O�O'�#��{"/�a��]��]Z}�/��j�G�1�`��,�C%!�蜯R���s�յϗ���"����]dǚ��r��ź(膫֙R��`�)D���{*7cx�f89�D�m>��r}�,��0B�_<C�����L���8mVS6h��"J>\=�rMQ) lO�%Զ@g,�ʩ��6#�3v�b�4�aʚ�rͻ��6�\_\����wG1�KF�y��(����˗b/D�+��L`�'��덠�jI�+J�]1:&��3?����&b� ����M&S���V.F��Ρ �:�{V�SOx�$�n����/9X��������Ɍ���3���J,� *r� A�5�Ւ������sl6lM��H���Q$��j���%c4��_��'"��!��r�G���đ�.�Y��.B�Ǧi�X�n�?Χc�@��8t�Co"@X�X��{�OKE^H�q��L��*��_QoZ�J���gf5d�V�l{�>k}��^���ev�N %���zqR��vAz����Qw�Ǉ��?hE7h�q���X�ʕQ@���(xާx�m��!�����@Z��&���qTbW��}8���$ �`�*�?A��[)�K�x}�I@�����$�1�p�5�XS �i���up�FU=�� ��TM$��2�U���t���R$�L��D�������UM��Q��zU����i�1d��|��7�9l���j�#��z�N3���h���]|�缞(	�,�ϐBM�H�q��>�m�j���/_Σ��p�
�$خ��x��#K;�Yu��#�+�@;2xl��Q=��!���gN�� UK�����ҧ�󹯅�\,v��tnx�>�q?v ����ֽ��a*$>֞?�r�_XZX��'�� DoO���Q�T�����Vhl�fO%��� ����K6T%�\�)<CO�$��:g ;6U���'Sα�u��0����f�G���D�`��F$xJv��f�n��xj̜I'㦳{Z��'�E�i��tF���t$�]�7��(�ŏ���6Per��E���KF���4Z�;�d��2���RP��T�Ӵ��-�v�>U6xl��D�0.�癐G+��pRcV]��^7��t���f$��V�B�M�&K�wa�p���}���^|�՞zI�^=�]F��5���-�>�ʵ]}H�4��,�:�6�sf�]K�@*KY������qG_�Hs�3��Zvg�-U�ۭS��s�At:'��i�Ỻ ����=ּ�P�w�Kk�6�.�}8��B���7i2�Vb���1�]hD�C�@K�YbW�
�04�������j/`F�zsSOnV�^�=tԏ�C�|B_"��
l��}}@Ձ�]t��|(*��{���l���te�S^��4��/�W�I�$	_�ʮ�4�6���c�d6jWN�8��c��Y�f����
`�y��&Lf�8�}����q�K;�Y��C������|w�> =1�:���Y�QF\��@��td�5Ȓ�1�`p��#��{W��dvb����cs�Eɞ.�A)�O��7d��"̄U^�0�!�y&o�!��E�8���$&�3/��e�Q�v�:7��b��_;6h����\vW�G�,%{�t���W�*�8��p�?�����؅��_9��H����7�����N�ak+9�}�����Q'�	�,�"�c9�J?����C2D2��N����jZ��؀�r;V;�P��9Zqc�j�Y�+�w����������L�&���=5{�X� L��3C#6l��4����B|%f{�,�;ކDqX��ŷD���,݌h��[��f��X;��q��+�f�'��0��$�A���_�+7��~�O����b����v��^��z�)��U���:^-���O0��0�]]h/�ϱ� �Ĕ���Gz1gW�9�^a|�]Z��q�}(!>8=�M��=bWA@.�KC�y�&�Ѡ;��ݽH\�e桉�%��n��W�jO�����a���*�ɣ����-��w���(�oL�t(����	Zm���뛍�����Tv��;e]�	bCVyv{�a�������K\�2"��i��܍�Q�v�����6#�C4�R�Ϫx��o�#6t==����+��.B�V1w<�|�ܪ�`b/�Csk�Kb�����]�=�������i�����,���$L3uGY-�ЮM$3�    �Z����˵ 7��(x�oPR��Ow��hݳ&�7�$E�ݜ[)q��'��A�ę��� �r0���'�<��p~p��*��������pr^�M?|�_r���H����mH��`X̝������ �mn���������AŜ"����w��uz��(�oJBn�z��2�ϸ��x�*�
�]ȡ:���ȓ&��Tfl��X����m�J��;��}�d�V��=�T�;�h���^�4	9��C^�Q,m@�x6�����oZF������K�����U9�f�Ҝ�q�"᝽k���KW^&�����3Tyg��#[��@~�z����뵓Fn�=��T�*{���r2#g�e�F�5��S���R�24������+a�"뿈%7��@�xr-^ @S�o���a�A�D3����Je�=����Ș�_�o�!&?D��$��"�VS6���KϘ@��UYL4�ʐ0De*�pݤ��N�R�:^��Q����� ?@eN���(Ln ��E�<O�������q�H �����(�<�B��z�iI�͊[��r�Q9�/�WH�`+fv����c��*�x5��癰��$�]��ޑ3��2�[�X�`�,��w�������'P�v�d4��>�'�����UJq5��p��n�;��;��ө��"�zG�����m�R�:[Vj:�;u�`����ഀzrO�	��	 x��2V�����]׮�N55��w0@m���$�v���8��j �a�?K+��wn���*|(���wy�6\��q�v�^m���E.������0�ϧ`�����Y��杰A��j��<V?Yɯ�g�J��+��q���+��+ߏ��,�K�29Qc�ښ����r�ٰ�!��<��;T��|E�6�A	���!��7
S�V��Sgu�%W>ʤ���hd%�ةL_�����u�M��0��t��]��a)g7���Ԇ�uC�� ���S�r���l�q	S�Y�7�06�оqV��W7�Q|R�F��9�V��s)w��1q�G^�3(l�����N��Y8o�@-��a)�-���9�F�c�|��kVBm�//Zf��xOb���x��֐M��n:�_['�\��v7	�#�Nl7fO�E�W�$i�:��`Cm�zT��3��)e���)�O6sw�ZF��`/;!����Ql��W��'/������6t�C���Ц>��8<��.J�=�aV2� i�Py�U�!�U~����:��_�kBo�*��J�j6��SsKk�4��b�P��LQsa��I!�yy��40���ٗ5�k���wA�]�C�z��Ji`m,���j1r"�����U^���C��?��\g�y��u/�����9�8=|m���O�	^�ӫ�E����j�<�ۓCHʨu󪲵¡�}�k��^��L�|��^�k`X�*Y_z/1F�`b��}ئ��27�h|�%z��%_��Go��CgbJ��Sep��9� ��{�����H�egӺ\f��
Q�3��g�ˡ�O7~���l���2�& e�b�)q �a���F��r�'�����h��L<���5oO𞪏� ���~��"����n%)��q4��)f�8��8�+��=�vpM�M�ɬ����[�M_�Ou=y��_C6|m5��n^��x�� z�	@��\�T�3�\9I]�'1%�8�8��J�}��S���oRBoغ�xU��i��1�W�`������z�����lx�ZHD �f�_l�#�ם�����w]�y�`Tq^���0�,���gq��ЛO�����h�[�#?N���S.���<_ğ�
m�*tU䒥]HJ��P`N;���_��"m���ڶ��c�9�4���.��*�r�w��N�ѭ+J�t��9�H�<��� � ��RR�U
���C��,3�"�7Sql�E0x]i�xX�ؠ�A�&�>d�h�����C
#ܗ�S=5`��<���*Ǩ�0w[��;�#xU]�����V���@YpZ��Q'#M@st4 ��mt�c
�|K���(FDk��nFԮ���B�ͳ����lȪ_�$ >�@�0��o��y������,��]�0�̞�'͚�d���}k�Ai�7��gQ6h5��H_M�6W�	�-�������꡾\����$�����:O�.~��=څUy%qq���V���Ur�F,���sl3�ɫ��rk���d��:Y����i."غ	���l��:틤���^���W��SAĬ�N�B�#k��\֗0o_T�#�wv�`�ߥ�6�'@� ��ޥV��١�%����'L���F�0����qTx�y C�5�?�L��	��.�3!�WV��M�ՎaI���%*痚�}q!S��<Q���#xW1�iA/��I#�ի��Q�y�^5X����t���(�<^��Ǿ.��U�Fȸ�|��;&��P�XH��wb
;�)হ���U�u��s֯p�ʲ�9��T�-��yd0=�%�㪒��5p���:��)ξy=��e��9[UV�Ʈ��i�_�܎nB�#PF���d�HKsy��'���Nbv&�����gǇ���Uӯ�l(ke*
�Cd�2�����M�W��X�C���J?!�ј��t�����_ag��^eX�U�
�Э.KSrð�Z�pn� >�|���]�5O;���O�hv�HI7�w���m��3�X�-t+��8]dBM>�#��E��D���ñF����Z\x�#�[��s�V5g���E�jʆ��L�ҋ7��:=��˓�g��҈s����Bp�_	 �����KͰK4���d��|��gu=�ň�*�Kw���H�j߿��,F�"�I���93��=�p?"���bע|�:C\�mʆ�)�C�\r(�_p.��d�s�:����9ɡ��\ޛ�e��d	R�� �5߂��,����ѭ<�N��%7��Ԡ~0S-(��Ȁ �m"��,��;�"��tF&��=��%�=���G�[y�
�QH-�`~� eX$˛��]��	8\n�[�:}�g�6������*�:�ڹՐb��=�R��K�O��H����d��\�^L�s�p�=�bY��)�׈�
���O��nZ��>��2��Z���́�=�ɫ�;O�6FD����2h[js��Ut��&�]{���$@��{4�ǳ��cY���@C4�܁�%<�q���S�f$��ө~XC����kM>L��*��p�[���^.�Bz����I:41�	-0X0ٍ~���"Fi֞*9�e��Ϯu�p����C�^���8�O	�@�!=Cj��Q8��C%�'��8�.������X�Y��>�k�@�;q��C%�-SȜ������� O�wr�']x ��%��s!	^�Y,����[�VݱW|���}�|��=q�U��p�;�F�X�R�S�3��Z���ǻж���\s>�vl��l)3�n�)W?!=���z��Qէ��R�RK`��F2�_�~g(����
��0��V��
vr�w�������D�̜�~�Gp�Φ��j��Ȍ4i���8��8^�Y��{#ݪ���D=YbH��T�>b��F�6`O�+_�64�V�m�$���W�qW\�Yf05��V���BW���� Ht��U���i4�����ٍٛ�%�����ZS���v�-Vq�A�ޚ�X�ս�����+���������)��Tn��sG�`-�G�
Ώ%Ⱦ\ig�A<�I��b��^�"�\Z䙭O�=Y��OC�Z\����8C�ߦ�{�N�}���st��k�ށ�Le�o��
�f���Se$~0�eYcs1�H=�Kء����W8��4�Hd밻ҶU��ӂ�ٶ�-+ bj|�]�d��(�Y5`hF�!��G� \H�{�Y(�s��F��J�"�*���l�2p��/g+t^����.��e�`��R���RT����7\�َۿ~]ޕ�2-�o5�Um��ÔҖ}��u$:�f�i�p�q	rJ��`�p��.� Ԙ�����w���lK����>���x��A���W��3ԛQ�xl������
u�����Уv����wmΪ1�N�Эxw�    �!��&S�au��βx��Kޖ��Nf3OҼq�|0摟6מr�k1N�k�[�V��'3��*�Ln0��%��%��t�����c4��f��M´O���-�o=��oy��SDV�0�T��\�(�F�5V"R[����sJ\��pZ6��}�H�>�W���t���;� G!_�4v�����d���Fz�{QN���S��O��̿������-�Ί5}�ʷ��قU1OoA��
,�܌>u��y&SW�.�c���;����P���ewe�`K�G�ЭzK?jg�с�Q�[��0� :�T�iMUq���ǔ��p�P��d?"�ϐi��Y�Z��K����'��FR ��n|ה2l� �0�U=I(��G�G:�&:[��j>~�[�"��hC��-��>*��?�^����8�t�����2jn ;���q�jK����H�k權-}}vh5dC��]�"�(��Ӎ����XԨP����r�&>k�qV9�.:c���r�c�ϐu����K�,��Ml�����zD툺)�� &�6�1����B��F���}�쬚-Io�~-з.������4��Kz���dcW���za��^���û-�mΜ�MB��?�j�$�N��Bm+�
yJ�N�b̼T���Q�^Du!�V��*��a��)�tWٵʶ|=)W��Uq������U�|\�#�!��Uc�VĄ������jO�.�*�X���Z�L-;���d5eCW�%�����9�/��01�6Z�M�a��9@�'G�	9)��
��ɮG�V�)6U��ح���	1����ٻe�E��6 Tu�<��{l`sa��5��t��d'Ⱦ�תܒ��Okk+����fO�Q.�{�����@�m>�Hsn���F�D �vW�`�mm���Vȕ^W*�����V	�up���� �V���揲�I�)��_�]�����w=���aǷ�~+�����`�Vtӧ��)*^��0{)Wud�S&3w�����	�%Vq�:5Y�[��K7�V�E�b���B�C�Q=�Ӌl@u�V���v�=�#� �%i�����y`�i��^���)��W6����W�A?9�5|�[�?�4�x�3c��&��	�%?kF%+�����:>��|<^�Y�-4����E1n�Hu�!��@g���J��C3T[p�k|2���f�vNWV��Ͻ-t��JP�NS�Q�JD�Pm:��D�������R"�3����{)0��v�v�-V��e�?�V�%����
z��)t��4a�4����*�{�$˲90�[6o��S��ğ	���&[QWJ"�\q*�m�ehv'S��sV5P�=���d�~1�5M�/_�㶫�����N���.�5(#�O^�X�&� �x-��4�U_��y�f����S:���m��kX�
�8���5nu]r}%���IA�~D���r0��r�I�,� #��Rޮ�\P�k��&�*���;��Vە�VE����І��1�o|�Li�x�JJI�[(]��;�Ԛ��+{�����?I�VٵH|PG�t��s��F��'oA�`��ӈN%��<�H��>�.�:.��\/�Ɵ_�.1���92=P��m��Zf��֒�0�y&XLaὌ��ܨ3w&֫�K�&��Y�훯	-ܹ�x)e^CU��=��f^4J��4>���6]�6j����yrf߻s�*�R��mȲ��)ޤ��C�L0�g�Τ��B1O��tj�N�3e"\��K��kwV-���<m�n�]��,���XV�z5'y���f<�`u5���X�d������lж����?[/
�[i�y9��y��G���ݹ�jԞ+�!,.�K�)�2���I ^��A����U�u����#���K�Id����d��U1 �zp^�����
US��j%�^m�s�L�
�t5����יsS�-- ���@ �c1$��:��5УK�{�,h�t\x]7O�쬾V�u���~���^2�;^�x�^ ����:�x�Ų�h�S�1	���#���2�
�$��(�Uv����&8���[�8ޟuF\�E�c��2)�C����s�C��5\�\��}Z��jc+�z\���;n0���8�y�1��~��q�u��0�Z6TI�R����=ƻ����5�q��V�e���*�>j����6�4���Z�z_���'����r�|���gv��I��_A�Үۑ��ˑ2�K|X���3pV|���_:e��Qs����ڵ'�|�w����4~��Uv18�/C�f�!!�����N��K�^�	^.{I���� �;K�n�s�^�\N��|�*ѭ�K%G������x��
pY�t3n]	���qX�:L�H��R�[���j.=��?qx���&G���<��f�c<=���FS,_���+�����$��#HE�/���CTV;��[u�~�Vca�S*�y�!�RFن!تi�{q����8H��N�JN��&о�x�rq�?�����Aؾ�������1�
��M2=w�	_�s&�a1�{��j���kUs�Aqy��הb��z&��2�y=��A�f6�Ž�����W�.�A�{^&Ba����O��]ΐ=��oW��- x��I�����`ѴgR��OD�f@|�31h�q9(��b�=�Ux�uq����Vꅴn�/J�l
�dg�����A�iL��%~���$������+���.���Vꥨ=�,���?Q�X�N)S�sEpyP�3�5�[؆�Nu���/���~v1v�����r����/���>��*�D!	�f;��5ɗؚV^"ȏ��ص=�\�'/�j�F�Nc�]��L��]�9��4��,$�	��]��P�������g�w]�ZE]��j@t��Y?|Xv�UQI��e fp���v?�u�!���M� �S�mr��]�U�e���[���E�y��n3�+_d�ԀF��8^u�̲­
dֳ��ȳ�%;o[��.��h���NW�J�"������LA�y����D��%Ⱦ��H3l5zÀ�D�5u7����c�*��cs��۳ᬀ����Kk)z��c��X��s��d>���V1_;{��7OY ����ܿ�F�2/����T�y����\����˄�^.�y���^�h������]ӯmY�����f�[��M`��n��1d+l1�=�o����{��gC#��63:�ߥ��U��·�7f���}�pi�Q}�9�"e�Vj�Ɓ��E#a��<E���x %Ư/��5�\�]�}���%S'��yF�?�ą$.�N�X��2u7�ei)���<��Z_)�Ǻ���k+��0"�\���C�g�h&K�~�Gr��|3�F�]l8d����ʮti�w��Wp�n�^X$q��y<�A	{q1�ӁP��o��~�5X]p�<��F�m^&v݆AV}����m"�|�	�	9[�^�:n85��4z-y���2��S��Ņ�����<U��M���K���o}��2�q�H��b:V��ч�QIrN�Ú�hvS3�)av,����=�4�<��j��ϐ�+�� ����iĖ�����
d6�lY1Pх ��p��6�s�7Ӎ����=�^����C���8MG�m#�X�aYtI]3�yy��l�L��]�|�aٿ��TM���m�}yI�$�MA���ţ`|���ɢi�.�r1
�HIJ�eQP�?d%,�7�Ͼl�^�*��=:u�*׉D-�[c$��ґ%�{}i�3�����R�f����[�x.��f�fl�J�S4�#I����V�Ӹ�F�59?�|� ̧�&���F���	��!��/z����i� ��[q��_���40
��D�RV��Atң^-� Mk��v�Q��od�0���K��x�z�ѽ��2��_�����=��k�=��o�����~�ֻ]��^�:S�rOd1�8f�
��FJr�%�����G jVn�����ؑ,~�a�[�[�Hm�]�m
���HO�R:8���d���x ��L#
� �   ������Ol-�uXV1�~̪?4��pKH��3=��R���}'G����|O)�`N�����&dr���5�:�׊L5IR�#���S<��Ó��MNPl�a^�y4��h��L[�@+�_˱'w�~���4_�����uJ
�Ƀ�E~��z	��S��t8�\��-�|(�l�ShH���.�]�v�qqN�>����Y���>��U(�N�Z�.�c����Ge+1�fAfO`
�x��%3�M����j��            x��}]s�H�����z/&S����zo�$N���q&��;Z�mn(�K��d��Gw�e{��3�vdD��.N?)�~��/�v��m�}�+����~zQ<e�����8?�_n�ͦ��z׬�ݸ>���Uӵ�U�_�á��{���r�/���s�r�8���͡�8Ms�/��q{�����G��Y�K|�L9�k�L�P�t��.J���/����y;Cl�꼽kw��C���x�\�۶�8���x=6�xh�>B��{���Ъ*.�-�����f�_���Z���9}(o*I�
�AV��J9����+�D�����Y�nZ|q=�w��^���-�wh��Dqw,��m��DY.�v�8�)��]3t�nS|�z�.�V^��Z�k�t�pNG�ݢT��Ε\���T��5�Ͽ6C�kפ�]���ff��7 �a>ǡݭ�͸;L�i�qY���(�p��+^����ٍ���z{���/d+�X��/\	�aŤ��ʹ�B���v͟̦!�i����C=���7m>Ĳ��$�?/�R�xO�ρ���f��c����靓�E/������t�\�jg���&�kv���-��ͮ�.O-�OG���C�$c�����zM�d�z����g%�*�ZK0u���j2�U[�W��ͦ#M��Y֓f�Ի�U�m�5����O�������^�9���l}W���7}{�J����`��mD�������D�yѬI��z�eYo��fh����׷`) ��،���ow�f،�e�����?���D~{B��UE�|ft�k��\�J�d� �ٓٱ�>����B�l��aܮ�UG���ʪ�4��.���GqV���㦵��m���4���&U���6P�h�%}��E��� ��a,�a�*�n�J��G���!�D���]W���}�FF���a��-l%�*M�	�o3?��.��7�%�M>��~Xm����R+�=x��Xo�h������9�bP�`�N�7v�� �\�\a |1��w(v��~GFqU�[����!ր��qȕ�h*��-�XC��N<���C;0a8p��d���j��=�U���6X
� �r��C�� �޲K�X�<�>9�-�G���Ț�)=K�$X��r�+�Y3���L!����_
���n#<+�7�	�?�m����T����y�_���:Lg��%i=�I�
>�G ���C��xuEO��xI��f	�,�LV��q��ђ���	��{o�ͮާ1����vm�D��O-��>f�۫0����Q�=�����5D����x��a�<�s��h�� M�����)[|����U.�.3C!抈���z�լٳ� ȿ���:�5���9��� �M����߁aӧ��p�쑟A<}Ja��I���0RQ������ ܑ]o K,_���m�������P��0�SB�����s��YS��Fe�»t�<BP1��a��؆8w>~'�Ԝn,I��8V������O*�e�%aҤ�]}`ǰ���M���2���\\!0��=���#�&̨Br�"�F�*iA)�,އ�O�{ L�C��Ce�j2!���]��K�!������o!J&��|X��{p	�� Q���6�c�0�
Q���������|��#�V�	[��}�F�w����] 8�����O ?u��W ��P�3�:W-4���>��d���"\cKp�q,���*2z�'��~c݋z�}�^�玕��@���\��kv�^�_�A\.�� �;���,����W�J�E <7<r����w7u�Qe���z<Ч˱��p�^�ÞC2��o��IY��g7�o�*�L;�U��BL�/��h�u=C�O7������M�VrH_��x��q����n"NY�R��ȂC��.4`���|�&���~�7Mב�m�v	��
��m=@Z.�(�	�6-����d�*�,C,�01 ����vvb$,9��^����U/A��|ښ~t
`���,ſ���p�O�H�M)��UJ���0��7w��BTC�b��Z�E0�W�%I�*.֐;������M����-�6x�)&ɀ+�\3G�[��C�7@������؀$	�D	�R��3��4�kS�Lp��_)<W�s��W���r�(A��$���"�Z>h�e�L�
��2dc�Y�!/M>��=���g7��X� ��pTeU�\�b�ze�hB�HX�6�\J'�mH�W$V�ZMP}T�[�,�f�U#�a:��&���ұ�ɧlnp��N��z�7t���M��NZ���0�q��V����q��xE!9��opD�)��)��Nx�{�#Xt�<��Y>�G���Kt �w/M�'��_l\��h�W�x���j6�T����|��X�
+�ڂ��:O�KŞ���<nʑ	�D�*U|w��ў<��\���	]
v�W @<�3˅���58�5���ĺ�z[�xu�t�k��E�N�
g�;?
FU��*����\X%��C;�_I*Bv={�S@�[�4�2�{$h�^��oG�����)�9!���18PF��ĜT�Ӥ����] �A�
'��?��k \�v�A�JH��ט�<�"�#%^�t��Fb�ܪK^�����%�9�{�m삫��57�t�<VPu='$!�����&U����g2r��|(D*8X�.�Qf������v1���W+�(3H� �������>�^�E���x�l,G�g�z���Ͳ3�섵�`!�|�/n~�NƊ!L,Ew��Zxc��=V���a���;re@�ό���x@�ғ�r��R�؟|��5�Ād�m���-T跪��|�)�a�G
�FW ��j=<~�ug�3����.E��f��E}��,2�(�vP���
BBv��!��Mn�ꌕ��wH$o��+��	"b��ܮ1���~²C%.ܭ�ΑNDCj���' *��q����'F��r��Y�8��Q�/��
C��n�����
�ݒ�����n�9�NiS|�b�ö��􃝫E@訝��$��ߏR�4 γ��,:��i����ݬS��˅S� ��F�5�I���+KS��-U� ��*+�=��(h4�����,�j�d{�l���$�,5�3�Ջ�,�
��fR)U���Y�p7ū�	@a��v
��`[�lQ]�[,w�n��lS?�J�0%��	Sal
�����-����A� ]�fs�q�bU�����FR���ɱ�T�,�b�>J�Fɠ���aC��`a ��9EP,ύ�؍����5��utG���!�pC��^��`��Cl J@���!|�i�� ) ���,���B=7(iJ��aǕ����Áp��7����z��w��^ۅEH̋�x4V�2U0�F�����g5-9_���YSsE����l���zK�$��?���!�#p�7��{��8tS5�+%/V�*�==DY%�:C�z~!Qs�ړ,Q�{������
mfѨ��wM�q� HP 8Y/P��<!��Y���u֏1X������*�S�B�6uj,xk����ϋ��>�� n$<�x ��>��m��(�m�C�}��=$���Ƃ��@��C���X�*i�N� 2��k3�nt��%H+$����'��l4�1����K��|\��"_'�`�2��K��g�%x��!*�=�����bF�D���̋rQ���5�׮)`6��?��N�!�M���0�YM�$K{��}U|!��d�YS��߾"���&<Dۼ�k�wG��1ċiLd!�l���O��������5~�����pL"��4B�A�����������7`�$�����N��Ȫo�z��
�y���������=D�����Ӑ5��m	.D+ľ&�8��$X{�+C�9���3�˹��ڍ�@9)8全VB�����x    n��r�U��j�O{����Ȏ�:S������|�#�����!��� j���䐵*��>S��USr���l�5�N�J��fx�^��qXB�]a�q:^T�v�/����}�	y�]� ��B)k'���Ka���	�}=�9+ �8���V�ey]
Jȣy>Z�1!(<ss
"����;�b��q���pq�l_P�s[��M�[%�%���w%[��/���SH���HY��{5���kB:�ۤL{��> 2@�p�o�Z�ℸ �����u���H�2��Y��SQ�f7�5ƆqNz�G�VK���22 �ɱ��$]%�a,N�ܱcX�'J@�W�!�_��d���#eg-��y��]({C,MT6��J��_b'�Y'#�w�Yt|����CϜB҉p`ډ$A@w��7� Z����9��D��K�&!�Y��E0���)�O��I��v}����W:�B��X��C�����u;��TXS�jAW�tDز�`u�V��pҞ��c��8�����)h�G�p��Fɐ6e�]� �
��O�������� )s��f�-Yi͵����q蚚-���Ԟ�=������"�;׆m�<o=�51#�p�(�̉M$y������ؾBBNQ�C��<u�"ˇ9��&U"��U�ˉ�:a���P�7H�B=8P�	��ӵ)�ņ����-|�cN��v�k�۾c�m�m	��:Y.�=f���C�7$��L>���;�*ڒ�1��H&V��E�f�+!G���t�k(�B������y2���I� �a/1�r[C���Ϋ��� ���l�)Uq�,�y�V|�T|N||Um k�r�Γb9��h�s�*���C��DG��c��|��+�)*�=p��~���`�y�R�DƐ�L�\hpt��U?�;���/��f�n�7	��Z7W�b%
�K�����Y�{n���"T��I�����Gڝ]��_\o�]�(�e���/�b����n��`d��-�����V�ɻ�X�ZX���d�����[|���=S�?��Qp���t��܏$)��+I̕�Y~���[ݡ
(�		�����G}��L�F84���(.֣�tWH?9����f:Im����]} bPӏ��T<a�*���X	]��f��sXտ����"�2�@Ԍq|�d�D ��I��ߌ�U$ۼgZ�4!RfG�+QM	|���uG�/N|k���:��RcH���?�
@�gJ�r64��0��ڭ.�D�h��\�f�����w���U��q�F����V^'������SX��B���k@������m�a��p=����+��a��9�t�F��l �J�\��7y��%[��
Qbd��Z�M�r�%��M�{�&�Ű�s`W�5�
���,��V�3���cy��_(�qc/&բ�s=�S�y����Ǯ����(���<A���8�� �Cq^o�l�s*E�=X+�1����1�B�����]�A�޴��`�+�9@8�ʋuxԑє�{����	�  R,90��[rr�R�#���
h�<A�	�/�9sJ�����A�����\ӣ�X��7��v%�3|,緳�%�sW�?�����tc��V����(�m6�!bx*�(�(5�+�[��TUn��%�����+�c֬;v
�z�nf8��r��H*~9>t����6̷Gѧ
_ͽ�`%�w�C�_0�Ђ�Ũ������������M�d���^y�J��+��a>)����v�I�\��e(OiE�rٴ;2�������챮�;����Ds��/V�3'�^@X����H����*��KL��^�+9��&��U�GX���A���2�֐�l���J�ҕ�&cB<���wL�p��.8�*3<���1ޥ	���۵�O�3U��~o��z<�8�����/o���X?X ��$X���E���G�1�gx{�v�8����7�Z2�-����,R[�J(W|m���f��a��Y�a�U�� �X��q&���tn�1�*B�z`������|��i�3���,.Κ�ݧ�� ��<�
�{�3��j�RP���K���Ē���1DFQ�f��"}�v�ô]�g�~.QH71#%"Xe���s���RyV��fܽ���|�ð�䵶����m��A1��LH�����A<���yV�c!p��>��{�$|?�H�[U�� ���GkB��E���iL@~� ���vnO09���kF2��x�vm�Ă��N��۴Ԑ�<?��Thr��9�r
���9�[��[��T˄<�K��C}�e���1=̱��?�;
�x����鴨b���
y�ڕH<PF-|%�Һ��Y�:j�u�j���JU����4:���v����\ƕ��;r�\�v���<����$�	Sڒ6��ƠD�v�!��V��!� r$���u��Lm�ĵ��-5�� �t؉+�r��f�#H�Tr�w�N�z�i�<�NbZφ���	>M�����'�=��$�,R}T�% ����e�\�Z��x٨�#�fR|�a�#�5WW��1]� r�38���Z��<�fW�%-+y�#0J��*,������ת�H�|�.�	Qq
���ߤA�M}���q��|E%U8'�+p�WL[V��0[�D�D+ 5��޷\����p/$y;�N�S|��>K�:�!H?6&�@��*�������@^�:����Qyژ���qJFG�i�	^. ���4���{����*���	��J#B�reer���:*��k��ȱ_�̱�2��H~���z�7º��g����6�f��[aTXC�U6��":�����d�l�n�{w聎il�����r���ZB���	<�pGV�M��z�0J,C�Q{��`��n/��g�*$�%TLo���h��'�T�h��q���`i�$��2K���m7҃�F�T&�
{8���Dk��������B!�۶��H(�g��(� <���H���v�H��X{����ud٩�o�S0/.���FFh7E�C�����$�?]�����{��$��`����!eHT�,� ��c��D섫[TZ����ǚ���R�F���F�KL����k��-h2����!3�=+���d���־ �<4��N�j����$���B<u[��Z��%I�M�>t-/��t(��㧞�]ӥE��t�,�`�I�Sv2����6���V��jH2��p���A;H>Q�1��q:�a@�-r�7�4�g<ia���Ǌ�ۀWJ/"�.͓�>l��k���p��r�e,s��e�8��Hm*��}^�|<�vV�r�C
�A���ӳsjI[I^ ���v_�5�u��5a*���1�v�LK^V>l���J=ܴ#��M;�Xt5��&i'�rg�9�!� ������mZ���}�#��(�L���h^�Q�I�ٌI�I^B�hL�5�ǧ=uS`H��}G32[P�%N���Q5�����k	.s@�˳�Z8��*Ys8R�=��m�M,X���H�;F`�/�T��W���G�$��#]�H��.�̩M�'�%m,��5����p�C��x�X]2��nA�����������,|�O�󘗉�V)�/"�����_�ڒ�c�Y�=��[��S�~*�BD[�R���h��ȱb5�� 3AH3͡ on�J{Jΐ]�v�H�4�SƗ��;�׆<�k�W�d��aC�Ua�S�P+NQL�1��"i��:��QI�h�!�U�MOM�4�hm񊦃R�Ӑ&�7��R-��ټh�f��H�^���܍ECʘW�U�0�xY|��+i��8¾e]�|B�X��i4�T���	I?-+�*�i$�>�� �h*Xq�y������J�X�Fָ*�lTOO͖�F�þ�?C��!�#Fߌ�0�������������Q)BEQ����YW͏�'�//�ᴇ8v�����%�
����,ϴ.���ƀ�a���"�g�,������:����1-��������%E1�Q�'�    C�G���Q�*�L��!�\k*sm*����p�0NV��C\��w�ѽ�����8@���7�<��!��z(�!�WG�ِ�V�|�S���z h�v�����´�V^����,�*��4��Y_rb6bSn�pT���n~�<\��g,�W����e^�v ���!_������#��kχ����s�MVT�Q;m(���A���:5�����ݵ԰�s�罩Xw4�=��la�-x9�ʜǫ��%��gB�F���-��"+v��Mh���06ૻ�9����v(�>}q
��)���j+�"KTr�����p��tB2%e_����w���Sg Hh�Me5�7d�B ҁ��nա�Reᵚ�mi[ɧ��E�҃��_���a�f ^�c՚�W�#6���*D��N�"T��t���P�-[����m��W���@����o���qkd{���.k�Q�Y�1�� @B��^����u��'귀�o#mg�Ö��fF������?_�鍏5d�C�A3���'<~j��<��z��"�~Z������(��}v�A��ڋϑ\��ҷT6,�3أ�3N/��˱�]��\tu�5�tWC�y����p���*��a����H�}���p�"p��N��B�{����-/IaN7M����h�a�.��X��d3�z޺�˗����h�l>	I�ƒ�ۄ}��,�`��,>o�On�/����6m�~$Mڙ�B�#��.��yu�|/�kL^�r��as�l/���l�4 ��.�N%lq2ļ�}�A��o�t��@�B�t�b�'SL�/�G�p4��,�C��ށ��F2�k�}[o�4x���&Mpe�%�;^p5�g�V�7���ݻ&\��C�����Z�e���~�t�w�:��2���\��^�3��6q]���f{�3pE=�W���� ���l���x�*���H��^d����i�jB��Y��ʹ$�0bXm�PF��-��zC8p�xbWO\��GU�	��؟UG�c�g�Ւ�T�����zM�i���J����ȯ�ȗ#�:��t���a�����>�y��?V��)��[S�M��z)]Tj�CCJ�m��x�0�*'���LTK�{r�SN\v�Gx���
�0�#D�,�r��vPd��+T���U�\��EZr�~��gѳC��
�E^r��aRu�d�Mݶ{y�w:,�X8T�0��R�')���iP$�I����L&�/��ʴba�)�Q�R� ��ƙ�'3q���Y�V�7}�aE�2���1A�0���61lIfմ��Φ�U�*N�$<���	����Zfr�3��Ϛ#�i�)��v�'�>��nه��U�=���K�9;n��
����;��+c��Ȝ��NZ#��7B�ڴ��%�B��?��"�'wT�d����g,�la���S��Z���8,<��W��5ՙ��R�0:"3�U�Wk� piqI�v��~]����mh��X�#��2��!q^�/��d 2�ʆ��d�	1R�j���`m_��J�DN���S{��y-D����{�;<��1h��:o�������Ky4P4�A`�z n���G��q {���4h	���u�x�H����%Tm*���YS-���=�9`�'�1pj;�tNV{�N9��L�g\����\ ��x;�-��a��UQZ\2��C����8@��#��ۼ��mx/qؐ��p
ן�&a�HN<J8[D���U�2[�F�Q2�*Y��q^�8D��ޚ��cj��1\6"BD��, R�#S�{�hyɋ������o���k�z�M�P%1����o��T�l�3g:�a+��ʇ�/)�]�#�;��EM�w=j�c�iC�ЯNWh#��C2ݯ��x��+�Z��5a�`���޹O�����}��ɽ�/�ܼfLd������� �����l�6(��ɚ�2���!�9o//I�4S���S�>D��WUΫGx��m��)v��d������拁�U�&�.�m�Z��>��Y��~�_�8����p�<ו*�R�B��'�����M�o�_}�4W�D�uQw�~Ƚ������A�cw�(��a�05u~[3�6��;?$�1yQs8H�fe�%�y���/�%V��ە�am��m�nXSV*̲h��1+�,%��֙|�F�u���iE#B�bF\��q	y�8!���M���S@H���i])�i�g���� 2��iD85��{����T�}����� u��L��6��
"v�0�����G���߸~�ʸ�e߯�v���a��߷�
'�LY�4N�'$Y�@����h���A�h��;8x���5<�����^2�����D��Vg���p*S��EJ�F#}��2]��_g��
	�8�l��w�Q�^nX����N>=2=���>��p�+����(K@�"븈�S����|��O�A��==�1�{_&F�*_��Mi��f��{�Y�_\������
7o�tfsplh�5�P���4�sMT20��g|���
w3h�0����#� ����m�70#(R"��Aϯ�Һ�x����4S0�:���3Լs�hY)�OYb�+4�3�_5{@�m U�Mh.�{��Y�Y��l_��1m��c�C�~�~p�dT�Bדɤt_Ӿ���|W�2�oi�-�Vm����� ]`:��uN,�q��#{?��k���c5���� �F!=���B���lg��JZq��o�;��mP���Ffr-�x�W{�/F��V=8��_��b��}��0\he��ao#�m�Y&cq���[�.[�.fx|�f���Mx���>��t6����kBU�E�o�8 ��}��>�cŬp��h	
��p�+>��hU٧�t�߲�XE�ۏ�V������V�̍��
�S�g\Z2�{�JL����Ah��ͱ�_��p.�;H��kq��ZmA��^_��i~��w�˄�p��4�g ���*^�SK���hZ�{�5���o�l��q��8	�ۅ����ú෻�����ƒa~��1x� h�u�@�N9�1�M�mW��!y�p�Mt�'�Ö��h?X���_y�L�+�؋�r�����Fj���哩p'Ă]�5��<| [��@�E�٦B��i:�e�+����Bq�h�/�A�7��{��G��"�Ƌ�y� �~|��l�14~���'4��j����(��̓(����'�懛}n�B�aS��#qg[	�k���\�<,[^�xtO�DNQԺ�*�J���Gف>��5H����̦�ӂ������:.<��U�͌`w��j��r\\G�0)�!�uZx\јŗ'Thi#���!��>7�%�b0�����ļ68#�"��{�7�G���θ2�aˊ�ɕ���	DVZ�r��mw=�>7��wVm�z���h{�Ha�B�0��/X?\K�&�=��=�os?��x��}(�K>�/�>�_�۾ـ�D�o�VRk�`��F�t-F�?�lt�@|����R��ٽ���kS��k��̀2D�|��u
��o�c.��m�9�/�ϣ�"�7��? (�{ϴ���d�FC	��.�D����X
�^ZwAq�	�2������#mA�6J� ��u&�l(̈́���`h@�[�t��F;�h�#!�����(�O�-�S%	�\hAKP^4qA�������pgdXA�>.��9vg]�m�;�C��f��eO�j鍻��e������g�k�u�<�'�)�6��~XO�rV*d(�k��t����#l9��ꓳ���E�G�݊�#�����C�=����}S`�U��
pZ�/�KcV����{W�����}?�O{�\e�d��f�Xip��ĿJ�1ْ�'�'��6��q�g��W���@�/��l�r�( q�7?�������/����аqU1��Ukl�(YLW�!=g�T�Fq��qז_�#x\XQ�8�s�Q@�<�k�<l����t��D�oށhq���Η��K����}X8��ո>��@>8�)���o��!����%1����G,9�u�z^//�E�q����>h��Ց�s�& �  m)i�]�c��r��X��;$����C]��_BqIb���@�_����0g��.���r�?rRPB�	W��j�b���.��s$���N���P��R��_v|���7�KN(.P�qrd��hbv�v�����.�.�U�s�����Q�������/����I�K�  Ȟ�]����y $�m�]����b=l�����'�Ot��"�n�+~�;�F�c>�i�TO�R
w,�����BP�!��c�M�d�m��{���e4��s39E�ɈC�Z�x�/��¯���]��i��d|	\>��(�MvAwĤ��C���=�OD��ݦ޷�f����_W�F����o𫫛����n������~(a"��O�
�/H�W�S*�?��e�         k   x���v
Q���W((M��L�+(�LN��,.�/�Ts�	uV�0�QP7204�50"u#= i�i��I�9Fs,����1%�c�9�sL���� Ö8�         Z   x���v
Q���W((M��L�+,M,*I-Rs�	uV�0�QPwK��Q״��$���<<3(D�c�����̼t"5��4���Bl�� ��:�            x����mK���~�?���t�R��h�@HH�ޟU��<������j�\.�������������ÿ����?�����������������?�������W�����v��o����?�������!�:��叿�?���j)[�Ӱa���&��¦�F׷�,l9��o��e7Y}���o[+�M��V-�M�򾭦W�~ }��fv�6���Y�����ٲgЂ�����$��=r�?Ov��w�}�gq��V����2��d�yCU�Z��F5XӉ�W�{w��e�j��?:f/�l�j�;7}�v�J���0�c���I��ݹ���u�i����e��$�{w��x����rgG��|ٯ�<+���6��eo��C�P.�i2%-3W���e�$n׸�]��w�2�����V���;�3��Fb��K.���ʢ�opJ�eQ�Q��u��e�s K��$��av���U��P��|���A�s'a�L����Y��n����0�c����r�|��%⻓��Jh��P�0�)�::�,�ޘcdQ�Q�����l�N�:tWJvv	�Yݓ�u��������Z��yT�n��]���A���������.�=�UvCU_�3X�M2X7�S#	l8�66 I��&$�v�a0g�I�\��j#��2�s�f��%��p6����f������9�T�*c��'R��)��f	���r&�}R�3��s��{�O��	�N>X������p�1�������V	[�)k��r�a�ȟ��`�q�AL�sV�~Np�+�q�r^y���4�b+X^��_���"����\x�O �읤"|��:�Mi�,�j��>��C�E�kMC݉P.'%�j�7���[���|
I������[�������NH9[j�2�5�}�avk��<Y��bl6O�R��J�O��hqc������Ѝi�Q��%�N���m.�4�MeV{��e���ٵ��O�,a��$� ��+`�Ip��%�ߝ��ʒd�Ix8d��p)�Uލ6G{��U;�=�Z�����ӧ�l��9���߿M�a�a�V����,�Z���緒������c3�U:�r��[�٠�u�x�)���$ْ?�X߳�Ēz����$�Q:l��G���f��3{�=��V�-eG�tШ��C�j+=.��[%����e�O+AO�l𮕐)�.Y.k%���7�j%�ʑj����8���j��j�E������M�ٯSnŐ\���ɫה#1L��?g���3�G�tҏ�c�$����-�T����}v�[l/�0<����ä��Vm�ξ ���
 ��+{ߚ��X$�ښ3���`�m�%���!B.�Ӽ5��D�|��|���]��Pu/	�O!�/b��$�Cه�׺��Ҟ�D�X���ۍz���v�T�g7���}*��!�-��N�Z"���Bvx<��������T�?m7��H���P۷h�%�3;Ğ�]o�T�,j� N����Gw�R`K{w�'����=��]#ku��joR���?L)xiI���E������?�J�K�6���r1�t-�,��ٔ8>e<�h����(g�f_��Dqe�d��Q�rWۈ��D��p�}���>����,�V��	�������4�cǍ���#M�z��x�G`njH0�4���a��� ��K�0 ��f�.�R�Z�3K�5���0�7�g�a_���W,.b�V��0b6+����5hͅ
���>�)+���mCr_L�*��E5����'��[*ƓD}�p��,�0�r�=����3(!,�,oy��5��1Tck]C���ze��HLlY�F�3"#I;�[�����G�`>#�X�F���'<�p�qS'гZ��˧��z������ܤm��u?�%�m��[��N��'�ٝ�L���f�_���9���׊�3}��8�!�P��)w~~��leG�-p��eK����>�n��Ǯ8K����ڑZ���>�}�H�Oz4kS�h�EO�fǃ$U����h��+K����z�$��Nzk_0g����e\6�X����{��Ֆ���r��d�,K**�]��_��=,z�}n�_լ�{g�&���8�3[��:�,7˒8��^��^����w2x�LM����d��ou���G̬g�+�u>��}Gz�C�"��:�<��g�'O�W?�3I��^����w�ӛ�H��' ���Qِ^��Ro����h��8�ST~��0ɢ�|��L�(��)��#hA��������Y�mʵzCy�j�_g����=��=�v���w��)������K<��,��T�H�L���gK��<�/K�wb�;���[�3�"k�g�M�H�5�"��>��&��g�< ǋ��qU�ղ=�!�l�g^�ꐭ�W��-Ȫ��NݲN�WA�q� ��sF Y}�QZE��)}�={(�^�|��2��|�cuZ*�������@p5pp�8v�
?�A%*W�s`�PG�V��N�I���:7x5)�ހ��ʴw���q�����p�#*�}|��9��o���-�5�3�f�}ϰ:���TU`8Ģ�ð�;�#��������4t���a��� W�{}o�{}��P��i�c\v���lJx.n��T�>��ԯ[ERϛ���&5��ɄCww*�JͣkO����e��V%Ap�㸅d�T���{У4Uk��ĜS��j,�`�`��3�#�
m�ŉ���B[O8%�e0Vs9Uh�*������ I���q����ح[�%L���\R;����k��1b.g�����S��[;p��W��[7p�o�*�v��;�
��o���f���ɿ��<�i�S�N��)�q���2�� N.�HZ"��8f���Y�
C��:>A��<�'�2��	���q>a��<�'�T�����B�:�0�b^�f]�L��\��B�~҄�q��`f��8��s
�*���ՔO��v.%D
lWSZ��>C��v5�*p��/�]�S��R�w����	{���<,�D`�`��=��:��	Z(�x�o�ug�R��дQ�{��؉?��XO�����+pp�`1ؘ�:���15Xv�+qz�®O���1Xw���Ϙn��w>��y�3���}Ϙn�d\|޲.>oY��K.����*����*���*��[2.n�%���G� &�9�І[�y6�:�+�9�*�9�*P`�`��g*�-�[�`��n�7�|F_u�����-��[D���n�¯��A�w�|�Mtz�w)I!0���]�kإ�%����]>�a�~��i�}��cv�w	��7[H��L�m�J=4�"���Z�Et+�t��pHO��V��ЭTA�ϭ�1��V��l�V��5zv�X��v+��؂i*<��> \���|���#���ԑ�p��m��0Ϡz �,��?�a����0g]n��W��d�N�7���yr��7���)�z��j�-��gr�Щ�Ǧ/��T�l-DQE����nEq��KVz�p�:�,R�V�%��I�{U�WҐ��,�[LY���	To�H��l쒺��IHӗ.Hiŉ�W��(~����T�"�4�����"��.����(K�������e3�������_��p��Z돳���l���"�J�Y���S�2��E-q\������������P����;�`����Q���A�_�������L˱��k�#Ra�ި���a��zQ4����ɬbH�@z�0T��@�q��V��4T�����w-���7P���7L��G�kM�~8/�P�O[��y=W�Ù����4�{�OB?��#7_��\�1���+G�K�DvfZ����1�l�of�O��ϫ�n� ��j��Ji����l.��U�eE����)/[�<��1�
�xwG�:�F>�E���4�(:#Rų�2�Qt<~�c���m���l����S*����{��Q�nI��xˉl���<�F-�Հf����9���"ɘ�:-m8@���h�K�u̖"���*ٺ���pV��m�1�us"!������s����=`�cQ��F�7�����Z�aOm��ϞB�����K��    �����w����d�]ߥ�-�� ��mg�p]�C�(c�c�<�gO�1��tj��;�=�d`��(q�����\�,�3h-̰O��y�y���N��y}�	�3��˨�y�㫮y,$�G�S������ޠ	õO�@���g!B���,D�PZa!R��
�Y��/��-?=�VXѺ
:��?�����"]:�v��@����"4��Z�mCd:v(��|ԡ�W;Cx;�:��ngԡ���+�P��)����ԡt�o�Ci��{&��F$-޻yʻ���,��{%fD߲>�}�.1'�x��3#����^��D�����F��h53/�p�F�iC�E�������.X3<Yo�P,o��Ӎ:G��vV�#q��6Ej�e�9�-kz�	��F%-���IPn���Pl��L����!��P��[gV�;f{֍��Q�W�}H����N�S��ȒO�w�Z`�p5�YE�-���i/�Tl���&�:T�9����1acy��f�lR�����#�BT�<:���7��i�>�$.ۻv曓��c!?k�pŊŲ�#Z�{4#��>�VAC�|Z4�ϧU1Cx�O��F���*h��Ъ�vC�`Z��Kg8��A�0�X������0KX����A��c	�w������ϙ�<�v��6a6�N	������2L�8e@�b04�N���X�w-؊5��a��0����x�5��a��] k0��X?�����3�Gb�x�=1�}<Þ����lL�x��%kn���Jq��OZ�tZ���X�z��x���Ȩ1���l��q�Kѱ�������0���5�W�;���l&��i(��Y�l���n/�!�c08��8%� 6u��x[�Xp5? 8���lF�� ��qǊ=&mEq��#6XC1X����Xn3�-,�;=�-,'<���\��Oܲ��c)�?(�R���b)ŋ?(�S���2�O{P�%/|+,�x�[aYŋ�
�)^�VXJ�·b��[1�e識��[1?����2�7�#o�ěZ���7�#?�O>l^nY[�山%oY�}ʱ,�?�X��於%��+g��H�>��6�
�����W`T���
��VB�e�L�����͕�
5��ǔ<�݉�j�u����wI\zdV�5U7������;c��1�J)B��U�m��l/�"��0���0t g�� {���? ����w?�p�{ ����}����s���te�x����m�.�ߢ]�;�z���/��_�vz呬^���B�aÅ |A��=�\0��Ӳt#�ǭ��ms���}^9�kCol�����k�n�F/�!�p��4\��l�����k��F'�GW��� (�V��^���KF����B��D�2:����g/W��1��[��n}x��ROY����\:>��X�-�YȻ�*���8xrn�3
��}2��wK��g/�V���o,�^�-��˻e��h:�s��	ꬻޝ�S�:^so]+m��r���+,HhXoW��a�݆������Y�Q�1G�F$�-�{$��Uݒ��>�2Vpa0/�B���ݷo��<�8lc�j��%C��Ͼ�x*���E�Q��\���X7�En�&�R�ێc^�&�R� ܻf;RX�	�6z���j#�Ʉe��7��j3肼��r�|"�/�LW*�Lp�%;�h�L��T��|ױk�C�V6��mq9*��?���t��|3��4ɾ=l�,�DF���l/q�(g���4�e�m{���e����d�sw������ض��@8ֶ���G_�4�v���ع��F�dE��~TaۼA�o�?OavС�[KGa��}��E���]�[�8��W_�]�^=��A֕�X��J/>EJ/��]�˯�����!<�p�=Ks��6+
xZP��NL&ػ��K�Q�AKxz���Q�e�������J`�`���r
?��ۄg�j��l�ѧ��a���)*l�Ѽ�u�h'���݁3)�ՆO��H�<��1j����׌���rQ������,�ҭ.��qgd0��Z�ҭB����(x1�G����^KԒ�c��i�0	��}��9w�����
�~zW8?Y��]�lpT�]�;|�n�c7��{��n�mu��6���Wv<���y�a�dlS�..&2��5����5.\3��,HQ]%<�J�W�L�.�xLӵ�{�/��E�C����,���$|f���dJ���V�Ň-�<��-�1u�i�п�4P��`*��������
�����/�a���O�$����m����m����>�!���}\��~ӌ��o�|LÄ��&�5���g�k?�g�4���x6Eg��j�z-\J`�`���蟲XS-��}0F5?�֣���Ør�KX	���%��%�8�^w���d�q�ST�@p'p��WT8���R�n�,�-�%W�B�1�,�/��,�/�6�'5��@�,�1�7U�V�𛯊�����n*����B���4�B��TFn��oV�
��zN~�:�0�7�s	~���1��'p���(P�����l5p���
~������B�_����@�ׂ_�mx�oYS�,�`P�=�`�(O�=~/�t+~��
���0(�^��`�$�`�_r֭X�u�(��s	~���ר�c��(T�{���p��a��`a�wn�v��_;�1�w�Dɢ?Xt�U����*l@���sdc4�f�������<��E�W"́ε85>�������i����G��ih��)���0�&i��3��W����FYh����<�w��B���6h��4,g����-����'~��;�	r��42���~�盰�mv�	�﷈U��M�R*��a[ɬ^�J�?�+�L�U��j�&p�j'-w��8�:)�{���J��X�I�sL� ��P��뚾��FUi1�����W8���)����P����_�s� /z=K�;���,O�z�G���r%��^$A�p��P�[4�O2�z����-��KSٛ3bz�Z~bb��Xω�h�O��q?��]ٚ��n��yk�gX�Yq��'�����I�b��>�%^	@�]���fҳ������ؑ��IoD�`dW�z'����/t˯���d��Oq�#��'����Cv�D�>_�{�f�Lb1
��7Z#�S�h��I�E�v�F���ɨ9b���;�!bJ,F�s��)A#}��#�AT<�D��@/�Ы������Zz�O j�Kj�4=�GYv����գ�F^z?�k�4c�^����a�~����|�H��t��_v|�9�0xBњ�>K:K~�L�A�V7`-��W*y���_U�D^�q�GZmT�}���M��z�w7o��:��(��هP��{T%�
��7�$]��:bQ���ZM�ۄ���6�C*�mP�J_�һ�̤ˣ��Y5X�M&�@DF3I�Ť%�ouJ�p/��2�W�ق7&�e=IEުk�y�Z�N8L�u;��ְ|_*�9����K�H��.IK��\'�nUoف=�tb׮g��K'v�5���ub7<PY�_���ʢ��p�?sZ&a��W*��*s�H�U�����4���G��>i�z��*�CC.�~����V.�]݉�'���q�������3*��[���ܡ�35h�F-Gm�]�P�ͻ�=�|r�e͠�b�M'"���;�P
Ā&�t(��Pי��
�^�zzD7ҲT�z"3��U)Usf��x��#X~�뱨.K���AƬ�-y�y(�
���Pj�G7WcZhk�GWcZ�Ӹ���?����"n��U'bJ�:�af)%?�Y��XJ��˹?#�H4��@e�~�9�=G�6�)oy*?1�8I�1ŃRu���XԸ\ٖE�t�J�����ܻ�-)K�e
/9X^�������eu��9(K�-�	�JJ��۔���]�t�ֶ�V��] r������p}���w]��e�2d�_� *�����]w0��M�L��9�Vޛ0��??��/Qe������?*м�>��-���-�E���Qw��R@��˶�Sa����E�*�㞢㦟6��'�m�    iݚ���±=-�/�$�6ʲ���!��Tr��������ݘ�M[�U�$��$w������7�Iъ�MeI�Ho��n��5�wc��>�2�)j�6d���w�쳲,-�]y�ﶕ:���j�eܤϪz�'B)���0j��"���YY�ቋL;ۏ��Xd+�e@���m״e=���R��j3
��1s�����W*{�>�@IW��ഌ��5���"�ٻ��*�ƌ꙲�7�o��VY3�C���p�q�'_-�c�"d�e-��ܟ��kz�V�2��ui���r�,��IxGeyq��wT6m���*T���dy'GVHU�V�p�v���%������S3*"T� ��)kg���bm!	6В�^��y���墊�	��UB�l�In�o�Y٭@ŷ��5{�sQTS�����Ƌ{Iq5l�K�e����P��ʁ�4a��k���]�}/�G����,���Ro�'Q���Ɇ`�ZJ�LӼ<e��p���jP����#����"� /��b�2��>ύ==�����Vh1����G� :���#��Hw�m���+��Y5�����I\���I�6��U�=Z�+�,/�H������#?�
R���O�-�`~�Xe;)U������~����5���ᦟ
���Ĭtɓ�Q���$=�qXZ�<�nAR���M�Yr��O?x0c���yz�>��0'�8������6�B������k�B����b�C���R*�����	IZv�<�b��j�(_,��^"�e��5Q�����Mh��nQ9{H��n�3�z
,}څ����?/M+=��T�Q"ǵ�(���J�>|�����ˎf���^vFz�J��s67l�HvD��;=X"�҃V�*Ps[jxv��jA*������ӿ����� �i��05\�ݛ8�n2�{�5ي=�?`w������H��Mn���-Fd�f�C��M��d�6�<�3���#�YO���g=�f����=�RGD���R����;��۫��2j᳟��PL���I�b'��=꡴�'��f�b��d��x��쨏��2�s�����DA&�n�
"p_/�Fs%O��K�S<a��9%���p���§D!��.r�N�L|��ik�I�4"�i�����y�5�0t��}1 ,r��|�3"'M�:Ó��xF|RΈ�zfTX��X�����=�
=�c����mu�>�c�7�7S� �(�|k�g]m +��84fCe�+Is�7�+� j��:�@tu���Nyx� ���5�ha�0����r4�Nc��a��,�qV��0�<�����5���a��^�l�ۓ��!�DA���El-�`��1G!�:��� b{��@�c3����i���nK�a��}6ny[n�8�Js!��>c3+���!P��:�Pcx�۠^p����Y]%�'+������o$�!��1�`�D�/RB[������)@�)8QJ���fb���Q�h�}�� o�ר��?��H�FQͥ�e��E;�߲�Ԥ45
SNif���\]a
��a����/y����� �f�4y�L�C�®��1�Z�Q�Q��5:�7�A����I��>
\8��L�.�Μ��u��eyԗ�O?�̩��N �c�w5�Ra�b��ۂ�V�#�(ώsC*�ٞ@Ů̎��2��b��y�̓���!C�=)g�5�&�r8^O���%�Z0�(�Xex �1���8ɹ���A��EiZ��+�P���V�.&xn�#v�� WA����>�C�/r�������� ������C�ʁ�}�𠻓�]�+�u��s%k:L޹J��0��>�塐yy�f�e-�Y�y���Ě�&�l&��&��Gil�pl���&�)���<����{b�@���]�^��:�����h��ہ������D�W�XL�P��Í�A��W �CP#Bj�`��wb��Ӵ~��E:(�����4;��C��k�K�Y��uw�k��d�yS~�(�a�ʊ������>'���Z)6v�l?p6v�l����AM6�l��`3���6>�<ǪQ0��(ڀO�c-U�0؍m��z������rk��ą�Y4��{���4	�z�D���z�CC�/��,I�r[�$�H��P�;̺���V�wS�������/�]7���mi�'d(�7� ���=@�QWM�
T�q�vA�^��z�b�PY�_�2�PGZ���wUt�}Ti����y0����A���v�1I]fS[��,o�h�V_ޖ�Vv
x.x�#E5�Z��r+��1�ܻ��e���k�f��"�,oXr��@r~*�/����6;��x\e�� 3����ʋ��n<{�[�H!�~���ĠbZD�g�5L��\_�;���ʩimK�=�����Y�3�����q])��қ���@�P�.�Wz���n����4�%u�~Kl��=�����MNҋ�F:���]~���8�՚�ܸ���HO|ke;Vk,�tX^W�(6
i�@�t(OB5�/�w7��(�6kͲ5Ѝ��j4 �L9,iʣ�V%둙��"1��M,�D�#�T���'#��^�P�2�����zzὶ<�l�G�Ϗ�����;�m�%��!h�M=H�7kh?�z�z�WIOqi�&-6���a`���BT�i�WJw2Fh���S���Z�/k�Vͨ΢d0�o�죱=��l��n�1�Xn���ӥ̘1PV�I�Tv	iu�䘨��<)s���:()_������1e_|�lO��ٟ��4n�����T$���U�k�I�� d�����D������o_�m�*����O�b�ź_���x1����L�iUi���\�i��	%r��l��l
���ɷWqhT���ĵ�o�2����i̺����z����]B8g�Z��L�ó��D!8+�g���P�CS�F���@��_��J'��rL�[c5T%g�(\�Z%��5����ʌ �E����><��RT����w8��S�,���NwX��5G%׺n�^Ԇ_���Ny%z������Y�x��J[��$���i;d�J�� ���u��g5��՟{�g���e�|'�m=����+��b)?�ú�*{%7w|Vzp�)�Mζ"6,��^����� �Am*k�?uS�0*��)j�:�0	�*H�cQ�P�S^�953A�e���/)葶k��>�[,}U�Y%�j�q5��&�O1��Py��$zs��@���&l���b,e��W��.@��>����A�#Z�� �jҁ}��ηŬ����'��Pk���+?�D	�ayCmzNUE�Xl��B�ߗe���4�a�wO¾��M���j�����+ڰ��WY�6P��S�haL�׻\]��k�RT�ۺ�����2�WO����r���<��lTG���qڠ�M�����>�� ��j�Gbf�Z`Y����]��7�j_~��4<�Ֆ�ꓳz�x������Ce�0墹,͸�tN��.4W�q�ղ�r�)A�� O7K�q�h��H.�Z,�G�Z_����k-��Z� 6ø���"iQ�Y<t��B�o$Z2�*�X�>	yȚ{�.I2�.��9<U�5��O���lx� ��I͟�
�j�肄 ��Wr�w���~��%�Χ���T�}@s����Ǯ�Nr��?������d0}ПC��c�F(1��Y��eH����G.;��+5HU�P�z�VK�[ǯ�R��s7�_�A���x�c��'��H��饋��m�|�Et�bP=o�O�&a��?C.�]?�3[$'��M����C-��z�����gDo�X;��o����7+K�e4�o�O>$+�w/�Ƀ�n/�R�����;��~W�.җ����b��]z�R,����,��,����	�V�z�*��i/J�^"%X�$��P+�����*Ж��M���$���EK�V�Q�b���zK��WQfR�1�w�=U����N�Mf)!s�����#���r7} Q��`5�Z�h�\�(ji$'��(j1XZ(DQ�m2{�#�Z�(:�mի~U��A��`�G�� W�^��� ?  ��vzl��ʎ�b��ў��4�,�xA�ò*䍧c�b�O�$�̩�w��߬;��p�a�c�{�P��No\�[-MHO#����H��l�g#]�o�C�L�����:*�zΆ��^�������k��s�M&W;��E<���uV�2�U���fl/r�ղgm��zH��6���˘
�v8`~��t�Z�2�g�\k�i���@w��'I�/�AY�(t������7�B<-}l�{��OT⥧�ѳ(�=���t��6��:}��Ki�&Z�V���:�K�h��^�tez½_�l��J�`�V�ˋ���q>k��F½{��Fi��xY�V6�ҺBlrǍ�	l$͸����u��MR�zo�c�g��h�`?az#ب��������{�mn[:u�U����Em5<��#z=
*N�?����B��F�X
�*g	`�--����e0����ζ�j�H�C���+�5��1�0M��A�n�'e1�<�_�`��՚g1�/��e��=1��YCuA��|J��߃D�,��I���i�=Jl��\M�V����Q'jg�ݾ��[��P�u�����pWy         a   x���v
Q���W((M��L�+.I,)-Vs�	uV�0�QPO.-*J�+Q״��$���!#$D�zc���9�%�)�i1j)����/�i�� �<�         �  x���ˮ\5E��+z���U�O1b���P�H�x�B"�z_r��ѻ'gV���\e/����w?~�<������Ͽ��ǯ�����o������w������x{�r���}ǵ�k�7o/���O����#x^c���y-������z�<�Q�nn��vpgp?�=����kp�5�ў��ݎ�5~�b𒖝nG�E�sD�nD���c��5��ByD�&,�hReQ�p����Ƭ_� %�Y����ƄA���tg�$-�JX�Q�/�-��tF����V��B��`��07hI��!���$k����В�%�-Iֲ
�V4Y�v��Yk,�Zv�o'/%Y��茑��i��Έ&ky�k� k(�vm��!tԜ�G֐BK�Mր�6��Θ�6iA���D��ܠ�S��j��`IFvjI%-ug&Xc^IK=UA��JZꮂӋ&-Bj1�b%-��i�*3Sm�s'�V�V�
:�]�Z=���:V�Z�Z��*Y�K׷�Z#k�c��F��f�YU�����`����5Ȍ��o����kZ١���$�Y��ֺfc}7�ֆD[cN���jp��Z[��Ƙw�֋���ߝ����u�l��ZOɩ����uhf2滓�^5;8�@�֛�s�I�z������ZZK�U��Z�R��i����׊�߃��]Cê�����s8dml]��YR��� -�)�Ƙ�2��s'��2t�e����-NۤelZҪ����]��&i�궜���e���s���eBV�3ߓ�i��Yߓ���o1��d��مTg�4���s'�O�6��g�N�6���h{��U�;�/�����^dm�c��ڂd����ڪR��U���j2cN5Xdmu�cΌ��5��:3F�։5G����y��k��J�%j	U
{�m��-��%e��HAi1�Ӫ�Am���YP��Û��8Y�{�������!+���᪫,�J���9'6���vA	1��'6��9f5<�j�t�ф:o�Mll�w�@��ޝCRP�#v�Jk�t�-��V&(㑺gw�t��#��:�w����A�ăi>(䱭<��Z'u���LK%�W/o;⠓GYq6��ȩ�naC�DͧW��偓mu��<pڐY�N�|z�fP1�N궟�Cs�H�,Xkީ���:� g���'��@K�L]2V�I�V��]8ɊzUo��l���?j*�����C4����QO�*����G==����I]���-?���3+�ԉ�_�]==?ꮰ�B�~�"�V���G]�V뤮�̻�Ҁ�'�o(�є:�����i�+�R'��\���h��63��5uk�ȓ:��憜�]�U����CJ��1��GW�f�JZth�sr�?���p<U����s+UR��d�-hi��ǣ������W.A����k^�)�1�ͅ�5������T��o��Al�n��� �лp�0� ���
�+ �=��)� �bc=��% ƒ�X��- �驎�y^`���4�{ �/�����|�&�\�u<��+Y��c�+�S�c����c�Gk�<VH}���<��wG�RR"-lh�NO�g��f�k+Y��c���N�X���'�x݆�l���D��f띗��{K������7���_����m�����KG�G֘t�9��4�N8/T�����g�g���*��{z��>��          
   x���          '   �   x���v
Q���W((M��L֫��),M,*I-��/I-Vs�	uV�0�QP�	��@���srl�a<����";#CK}0��$��Į$#�X�<�X!?/U!'?/]��F� ´S״��$�IF�N
��R�(cLGe���L�8*17�!�� _Ϳ     