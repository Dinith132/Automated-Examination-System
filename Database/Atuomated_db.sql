PGDMP  .            
        }            Atuomated_db     16.6 (Ubuntu 16.6-1.pgdg24.04+1)     17.2 (Ubuntu 17.2-1.pgdg24.04+1) �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    16521    Atuomated_db    DATABASE     z   CREATE DATABASE "Atuomated_db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE "Atuomated_db";
                     postgres    false            �            1259    16523    admin_cordinator    TABLE     r   CREATE TABLE public.admin_cordinator (
    admin_cordinater_id integer NOT NULL,
    staff_id integer NOT NULL
);
 $   DROP TABLE public.admin_cordinator;
       public         heap r       postgres    false            �            1259    16522 (   admin_cordinator_admin_cordinater_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_cordinator_admin_cordinater_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.admin_cordinator_admin_cordinater_id_seq;
       public               postgres    false    216                       0    0 (   admin_cordinator_admin_cordinater_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.admin_cordinator_admin_cordinater_id_seq OWNED BY public.admin_cordinator.admin_cordinater_id;
          public               postgres    false    215            �            1259    16530    ar    TABLE     V   CREATE TABLE public.ar (
    ar_id integer NOT NULL,
    staff_id integer NOT NULL
);
    DROP TABLE public.ar;
       public         heap r       postgres    false            �            1259    16529    ar_ar_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ar_ar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.ar_ar_id_seq;
       public               postgres    false    218                       0    0    ar_ar_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.ar_ar_id_seq OWNED BY public.ar.ar_id;
          public               postgres    false    217            �            1259    16536    attempt    TABLE     �   CREATE TABLE public.attempt (
    strudent_id integer NOT NULL,
    exam_id integer NOT NULL,
    maks integer NOT NULL,
    grade integer NOT NULL
);
    DROP TABLE public.attempt;
       public         heap r       postgres    false            �            1259    16542    course    TABLE     �   CREATE TABLE public.course (
    coourse_id integer NOT NULL,
    "course name" integer NOT NULL,
    "Course code" integer NOT NULL,
    credits integer NOT NULL,
    department_id integer NOT NULL
);
    DROP TABLE public.course;
       public         heap r       postgres    false            �            1259    16541    course_coourse_id_seq    SEQUENCE     �   CREATE SEQUENCE public.course_coourse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.course_coourse_id_seq;
       public               postgres    false    221                       0    0    course_coourse_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.course_coourse_id_seq OWNED BY public.course.coourse_id;
          public               postgres    false    220            �            1259    16549    course_offering    TABLE       CREATE TABLE public.course_offering (
    offering_id integer NOT NULL,
    semester integer NOT NULL,
    start_date integer NOT NULL,
    end_date integer NOT NULL,
    course_id integer NOT NULL,
    admin_cordinate_id integer NOT NULL,
    course_cordinater integer NOT NULL
);
 #   DROP TABLE public.course_offering;
       public         heap r       postgres    false            �            1259    16548    course_offering_offering_id_seq    SEQUENCE     �   CREATE SEQUENCE public.course_offering_offering_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.course_offering_offering_id_seq;
       public               postgres    false    223                       0    0    course_offering_offering_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.course_offering_offering_id_seq OWNED BY public.course_offering.offering_id;
          public               postgres    false    222            �            1259    16556    course_register    TABLE     p   CREATE TABLE public.course_register (
    registration_id integer NOT NULL,
    offering_id integer NOT NULL
);
 #   DROP TABLE public.course_register;
       public         heap r       postgres    false            �            1259    16555 #   course_register_registration_id_seq    SEQUENCE     �   CREATE SEQUENCE public.course_register_registration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.course_register_registration_id_seq;
       public               postgres    false    225                        0    0 #   course_register_registration_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.course_register_registration_id_seq OWNED BY public.course_register.registration_id;
          public               postgres    false    224            �            1259    16563 
   department    TABLE     |   CREATE TABLE public.department (
    department_id integer NOT NULL,
    name integer NOT NULL,
    hod integer NOT NULL
);
    DROP TABLE public.department;
       public         heap r       postgres    false            �            1259    16562    department_department_id_seq    SEQUENCE     �   CREATE SEQUENCE public.department_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.department_department_id_seq;
       public               postgres    false    227            !           0    0    department_department_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.department_department_id_seq OWNED BY public.department.department_id;
          public               postgres    false    226            �            1259    16570    exam    TABLE       CREATE TABLE public.exam (
    exam_id integer NOT NULL,
    "Start_Data&Time" integer NOT NULL,
    duration integer NOT NULL,
    passing_criteria integer NOT NULL,
    type integer NOT NULL,
    total_maks integer NOT NULL,
    offering_id integer NOT NULL
);
    DROP TABLE public.exam;
       public         heap r       postgres    false            �            1259    16569    exam_exam_id_seq    SEQUENCE     �   CREATE SEQUENCE public.exam_exam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.exam_exam_id_seq;
       public               postgres    false    229            "           0    0    exam_exam_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.exam_exam_id_seq OWNED BY public.exam.exam_id;
          public               postgres    false    228            �            1259    16577    lecture    TABLE     `   CREATE TABLE public.lecture (
    lecture_id integer NOT NULL,
    satff_id integer NOT NULL
);
    DROP TABLE public.lecture;
       public         heap r       postgres    false            �            1259    16576    lecture_lecture_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lecture_lecture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.lecture_lecture_id_seq;
       public               postgres    false    231            #           0    0    lecture_lecture_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.lecture_lecture_id_seq OWNED BY public.lecture.lecture_id;
          public               postgres    false    230            �            1259    16583    prerequirest    TABLE     i   CREATE TABLE public.prerequirest (
    course_id integer NOT NULL,
    req_course_id integer NOT NULL
);
     DROP TABLE public.prerequirest;
       public         heap r       postgres    false            �            1259    16589    question    TABLE     �   CREATE TABLE public.question (
    q_id integer NOT NULL,
    "Question" integer NOT NULL,
    maks integer NOT NULL,
    answer integer NOT NULL,
    exam_id integer NOT NULL
);
    DROP TABLE public.question;
       public         heap r       postgres    false            �            1259    16588    question_q_id_seq    SEQUENCE     �   CREATE SEQUENCE public.question_q_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.question_q_id_seq;
       public               postgres    false    234            $           0    0    question_q_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.question_q_id_seq OWNED BY public.question.q_id;
          public               postgres    false    233            �            1259    16596    resitration    TABLE       CREATE TABLE public.resitration (
    registration_id integer NOT NULL,
    registration_date integer NOT NULL,
    semester integer NOT NULL,
    time_stamp integer NOT NULL,
    status integer NOT NULL,
    ar_id integer NOT NULL,
    student_id integer NOT NULL
);
    DROP TABLE public.resitration;
       public         heap r       postgres    false            �            1259    16595    resitration_registration_id_seq    SEQUENCE     �   CREATE SEQUENCE public.resitration_registration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.resitration_registration_id_seq;
       public               postgres    false    236            %           0    0    resitration_registration_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.resitration_registration_id_seq OWNED BY public.resitration.registration_id;
          public               postgres    false    235            �            1259    16603    staff    TABLE       CREATE TABLE public.staff (
    staff_id integer NOT NULL,
    email integer NOT NULL,
    nic integer NOT NULL,
    fullname integer NOT NULL,
    phone_number character varying(55) NOT NULL,
    password integer NOT NULL,
    department_id integer NOT NULL
);
    DROP TABLE public.staff;
       public         heap r       postgres    false            �            1259    16602    staff_staff_id_seq    SEQUENCE     �   CREATE SEQUENCE public.staff_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.staff_staff_id_seq;
       public               postgres    false    238            &           0    0    staff_staff_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.staff_staff_id_seq OWNED BY public.staff.staff_id;
          public               postgres    false    237            �            1259    16610    stored question    TABLE     �   CREATE TABLE public."stored question" (
    q_id integer NOT NULL,
    "Question" integer NOT NULL,
    answer integer NOT NULL,
    maks integer NOT NULL,
    type integer NOT NULL,
    lecture_id integer NOT NULL
);
 %   DROP TABLE public."stored question";
       public         heap r       postgres    false            �            1259    16609    stored question_q_id_seq    SEQUENCE     �   CREATE SEQUENCE public."stored question_q_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."stored question_q_id_seq";
       public               postgres    false    240            '           0    0    stored question_q_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."stored question_q_id_seq" OWNED BY public."stored question".q_id;
          public               postgres    false    239            �            1259    16617    student    TABLE     �  CREATE TABLE public.student (
    student_id integer NOT NULL,
    email character varying(255) NOT NULL,
    "Full Name" character varying(255) NOT NULL,
    nic integer NOT NULL,
    nationality integer NOT NULL,
    photo_link integer NOT NULL,
    address integer NOT NULL,
    gender integer NOT NULL,
    phone_no character varying(55) NOT NULL,
    departmnet_id integer NOT NULL,
    lecture_id integer NOT NULL
);
    DROP TABLE public.student;
       public         heap r       postgres    false            �            1259    16616    student_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.student_student_id_seq;
       public               postgres    false    242            (           0    0    student_student_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.student_student_id_seq OWNED BY public.student.student_id;
          public               postgres    false    241            �            1259    16625    teach    TABLE     a   CREATE TABLE public.teach (
    lecture_id integer NOT NULL,
    offering_id integer NOT NULL
);
    DROP TABLE public.teach;
       public         heap r       postgres    false                       2604    16526 $   admin_cordinator admin_cordinater_id    DEFAULT     �   ALTER TABLE ONLY public.admin_cordinator ALTER COLUMN admin_cordinater_id SET DEFAULT nextval('public.admin_cordinator_admin_cordinater_id_seq'::regclass);
 S   ALTER TABLE public.admin_cordinator ALTER COLUMN admin_cordinater_id DROP DEFAULT;
       public               postgres    false    216    215    216                       2604    16533    ar ar_id    DEFAULT     d   ALTER TABLE ONLY public.ar ALTER COLUMN ar_id SET DEFAULT nextval('public.ar_ar_id_seq'::regclass);
 7   ALTER TABLE public.ar ALTER COLUMN ar_id DROP DEFAULT;
       public               postgres    false    217    218    218                       2604    16545    course coourse_id    DEFAULT     v   ALTER TABLE ONLY public.course ALTER COLUMN coourse_id SET DEFAULT nextval('public.course_coourse_id_seq'::regclass);
 @   ALTER TABLE public.course ALTER COLUMN coourse_id DROP DEFAULT;
       public               postgres    false    221    220    221                       2604    16552    course_offering offering_id    DEFAULT     �   ALTER TABLE ONLY public.course_offering ALTER COLUMN offering_id SET DEFAULT nextval('public.course_offering_offering_id_seq'::regclass);
 J   ALTER TABLE public.course_offering ALTER COLUMN offering_id DROP DEFAULT;
       public               postgres    false    222    223    223                       2604    16559    course_register registration_id    DEFAULT     �   ALTER TABLE ONLY public.course_register ALTER COLUMN registration_id SET DEFAULT nextval('public.course_register_registration_id_seq'::regclass);
 N   ALTER TABLE public.course_register ALTER COLUMN registration_id DROP DEFAULT;
       public               postgres    false    224    225    225                        2604    16566    department department_id    DEFAULT     �   ALTER TABLE ONLY public.department ALTER COLUMN department_id SET DEFAULT nextval('public.department_department_id_seq'::regclass);
 G   ALTER TABLE public.department ALTER COLUMN department_id DROP DEFAULT;
       public               postgres    false    227    226    227            !           2604    16573    exam exam_id    DEFAULT     l   ALTER TABLE ONLY public.exam ALTER COLUMN exam_id SET DEFAULT nextval('public.exam_exam_id_seq'::regclass);
 ;   ALTER TABLE public.exam ALTER COLUMN exam_id DROP DEFAULT;
       public               postgres    false    229    228    229            "           2604    16580    lecture lecture_id    DEFAULT     x   ALTER TABLE ONLY public.lecture ALTER COLUMN lecture_id SET DEFAULT nextval('public.lecture_lecture_id_seq'::regclass);
 A   ALTER TABLE public.lecture ALTER COLUMN lecture_id DROP DEFAULT;
       public               postgres    false    231    230    231            #           2604    16592    question q_id    DEFAULT     n   ALTER TABLE ONLY public.question ALTER COLUMN q_id SET DEFAULT nextval('public.question_q_id_seq'::regclass);
 <   ALTER TABLE public.question ALTER COLUMN q_id DROP DEFAULT;
       public               postgres    false    234    233    234            $           2604    16599    resitration registration_id    DEFAULT     �   ALTER TABLE ONLY public.resitration ALTER COLUMN registration_id SET DEFAULT nextval('public.resitration_registration_id_seq'::regclass);
 J   ALTER TABLE public.resitration ALTER COLUMN registration_id DROP DEFAULT;
       public               postgres    false    235    236    236            %           2604    16606    staff staff_id    DEFAULT     p   ALTER TABLE ONLY public.staff ALTER COLUMN staff_id SET DEFAULT nextval('public.staff_staff_id_seq'::regclass);
 =   ALTER TABLE public.staff ALTER COLUMN staff_id DROP DEFAULT;
       public               postgres    false    237    238    238            &           2604    16613    stored question q_id    DEFAULT     �   ALTER TABLE ONLY public."stored question" ALTER COLUMN q_id SET DEFAULT nextval('public."stored question_q_id_seq"'::regclass);
 E   ALTER TABLE public."stored question" ALTER COLUMN q_id DROP DEFAULT;
       public               postgres    false    239    240    240            '           2604    16620    student student_id    DEFAULT     x   ALTER TABLE ONLY public.student ALTER COLUMN student_id SET DEFAULT nextval('public.student_student_id_seq'::regclass);
 A   ALTER TABLE public.student ALTER COLUMN student_id DROP DEFAULT;
       public               postgres    false    241    242    242            �          0    16523    admin_cordinator 
   TABLE DATA           I   COPY public.admin_cordinator (admin_cordinater_id, staff_id) FROM stdin;
    public               postgres    false    216   /�       �          0    16530    ar 
   TABLE DATA           -   COPY public.ar (ar_id, staff_id) FROM stdin;
    public               postgres    false    218   L�       �          0    16536    attempt 
   TABLE DATA           D   COPY public.attempt (strudent_id, exam_id, maks, grade) FROM stdin;
    public               postgres    false    219   i�       �          0    16542    course 
   TABLE DATA           b   COPY public.course (coourse_id, "course name", "Course code", credits, department_id) FROM stdin;
    public               postgres    false    221   ��                 0    16549    course_offering 
   TABLE DATA           �   COPY public.course_offering (offering_id, semester, start_date, end_date, course_id, admin_cordinate_id, course_cordinater) FROM stdin;
    public               postgres    false    223   ��                 0    16556    course_register 
   TABLE DATA           G   COPY public.course_register (registration_id, offering_id) FROM stdin;
    public               postgres    false    225   ��                 0    16563 
   department 
   TABLE DATA           >   COPY public.department (department_id, name, hod) FROM stdin;
    public               postgres    false    227   ݧ                 0    16570    exam 
   TABLE DATA           u   COPY public.exam (exam_id, "Start_Data&Time", duration, passing_criteria, type, total_maks, offering_id) FROM stdin;
    public               postgres    false    229   ��       	          0    16577    lecture 
   TABLE DATA           7   COPY public.lecture (lecture_id, satff_id) FROM stdin;
    public               postgres    false    231   �       
          0    16583    prerequirest 
   TABLE DATA           @   COPY public.prerequirest (course_id, req_course_id) FROM stdin;
    public               postgres    false    232   4�                 0    16589    question 
   TABLE DATA           K   COPY public.question (q_id, "Question", maks, answer, exam_id) FROM stdin;
    public               postgres    false    234   Q�                 0    16596    resitration 
   TABLE DATA           z   COPY public.resitration (registration_id, registration_date, semester, time_stamp, status, ar_id, student_id) FROM stdin;
    public               postgres    false    236   n�                 0    16603    staff 
   TABLE DATA           f   COPY public.staff (staff_id, email, nic, fullname, phone_number, password, department_id) FROM stdin;
    public               postgres    false    238   ��                 0    16610    stored question 
   TABLE DATA           ]   COPY public."stored question" (q_id, "Question", answer, maks, type, lecture_id) FROM stdin;
    public               postgres    false    240   ��                 0    16617    student 
   TABLE DATA           �   COPY public.student (student_id, email, "Full Name", nic, nationality, photo_link, address, gender, phone_no, departmnet_id, lecture_id) FROM stdin;
    public               postgres    false    242   Ũ                 0    16625    teach 
   TABLE DATA           8   COPY public.teach (lecture_id, offering_id) FROM stdin;
    public               postgres    false    243   �       )           0    0 (   admin_cordinator_admin_cordinater_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.admin_cordinator_admin_cordinater_id_seq', 1, false);
          public               postgres    false    215            *           0    0    ar_ar_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.ar_ar_id_seq', 1, false);
          public               postgres    false    217            +           0    0    course_coourse_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.course_coourse_id_seq', 1, false);
          public               postgres    false    220            ,           0    0    course_offering_offering_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.course_offering_offering_id_seq', 1, false);
          public               postgres    false    222            -           0    0 #   course_register_registration_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.course_register_registration_id_seq', 1, false);
          public               postgres    false    224            .           0    0    department_department_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.department_department_id_seq', 1, false);
          public               postgres    false    226            /           0    0    exam_exam_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.exam_exam_id_seq', 1, false);
          public               postgres    false    228            0           0    0    lecture_lecture_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.lecture_lecture_id_seq', 1, false);
          public               postgres    false    230            1           0    0    question_q_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.question_q_id_seq', 1, false);
          public               postgres    false    233            2           0    0    resitration_registration_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.resitration_registration_id_seq', 1, false);
          public               postgres    false    235            3           0    0    staff_staff_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.staff_staff_id_seq', 1, false);
          public               postgres    false    237            4           0    0    stored question_q_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."stored question_q_id_seq"', 1, false);
          public               postgres    false    239            5           0    0    student_student_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.student_student_id_seq', 1, false);
          public               postgres    false    241            )           2606    16528 &   admin_cordinator admin_cordinator_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.admin_cordinator
    ADD CONSTRAINT admin_cordinator_pkey PRIMARY KEY (admin_cordinater_id);
 P   ALTER TABLE ONLY public.admin_cordinator DROP CONSTRAINT admin_cordinator_pkey;
       public                 postgres    false    216            +           2606    16535 
   ar ar_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.ar
    ADD CONSTRAINT ar_pkey PRIMARY KEY (ar_id);
 4   ALTER TABLE ONLY public.ar DROP CONSTRAINT ar_pkey;
       public                 postgres    false    218            .           2606    16540    attempt attempt_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.attempt
    ADD CONSTRAINT attempt_pkey PRIMARY KEY (strudent_id, exam_id);
 >   ALTER TABLE ONLY public.attempt DROP CONSTRAINT attempt_pkey;
       public                 postgres    false    219    219            4           2606    16554 $   course_offering course_offering_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.course_offering
    ADD CONSTRAINT course_offering_pkey PRIMARY KEY (offering_id);
 N   ALTER TABLE ONLY public.course_offering DROP CONSTRAINT course_offering_pkey;
       public                 postgres    false    223            1           2606    16547    course course_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (coourse_id);
 <   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pkey;
       public                 postgres    false    221            7           2606    16561 $   course_register course_register_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.course_register
    ADD CONSTRAINT course_register_pkey PRIMARY KEY (registration_id);
 N   ALTER TABLE ONLY public.course_register DROP CONSTRAINT course_register_pkey;
       public                 postgres    false    225            :           2606    16568    department department_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);
 D   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pkey;
       public                 postgres    false    227            =           2606    16575    exam exam_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_pkey PRIMARY KEY (exam_id);
 8   ALTER TABLE ONLY public.exam DROP CONSTRAINT exam_pkey;
       public                 postgres    false    229            @           2606    16582    lecture lecture_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.lecture
    ADD CONSTRAINT lecture_pkey PRIMARY KEY (lecture_id);
 >   ALTER TABLE ONLY public.lecture DROP CONSTRAINT lecture_pkey;
       public                 postgres    false    231            C           2606    16587    prerequirest prerequirest_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.prerequirest
    ADD CONSTRAINT prerequirest_pkey PRIMARY KEY (course_id, req_course_id);
 H   ALTER TABLE ONLY public.prerequirest DROP CONSTRAINT prerequirest_pkey;
       public                 postgres    false    232    232            F           2606    16594    question question_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (q_id);
 @   ALTER TABLE ONLY public.question DROP CONSTRAINT question_pkey;
       public                 postgres    false    234            I           2606    16601    resitration resitration_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.resitration
    ADD CONSTRAINT resitration_pkey PRIMARY KEY (registration_id);
 F   ALTER TABLE ONLY public.resitration DROP CONSTRAINT resitration_pkey;
       public                 postgres    false    236            L           2606    16608    staff staff_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);
 :   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_pkey;
       public                 postgres    false    238            O           2606    16615 $   stored question stored question_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."stored question"
    ADD CONSTRAINT "stored question_pkey" PRIMARY KEY (q_id);
 R   ALTER TABLE ONLY public."stored question" DROP CONSTRAINT "stored question_pkey";
       public                 postgres    false    240            R           2606    16624    student student_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);
 >   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
       public                 postgres    false    242            T           2606    16629    teach teach_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.teach
    ADD CONSTRAINT teach_pkey PRIMARY KEY (lecture_id, offering_id);
 :   ALTER TABLE ONLY public.teach DROP CONSTRAINT teach_pkey;
       public                 postgres    false    243    243            8           1259    16739    idx_course_id    INDEX     P   CREATE INDEX idx_course_id ON public.course_register USING btree (offering_id);
 !   DROP INDEX public.idx_course_id;
       public                 postgres    false    225            2           1259    16737    idx_department_id    INDEX     M   CREATE INDEX idx_department_id ON public.course USING btree (department_id);
 %   DROP INDEX public.idx_department_id;
       public                 postgres    false    221            J           1259    16745    idx_department_staff    INDEX     O   CREATE INDEX idx_department_staff ON public.staff USING btree (department_id);
 (   DROP INDEX public.idx_department_staff;
       public                 postgres    false    238            /           1259    16736    idx_exam_id    INDEX     B   CREATE INDEX idx_exam_id ON public.attempt USING btree (exam_id);
    DROP INDEX public.idx_exam_id;
       public                 postgres    false    219            D           1259    16743    idx_exam_id_question    INDEX     L   CREATE INDEX idx_exam_id_question ON public.question USING btree (exam_id);
 (   DROP INDEX public.idx_exam_id_question;
       public                 postgres    false    234            ;           1259    16740    idx_hod    INDEX     =   CREATE INDEX idx_hod ON public.department USING btree (hod);
    DROP INDEX public.idx_hod;
       public                 postgres    false    227            M           1259    16746    idx_lecture_id_question    INDEX     [   CREATE INDEX idx_lecture_id_question ON public."stored question" USING btree (lecture_id);
 +   DROP INDEX public.idx_lecture_id_question;
       public                 postgres    false    240            P           1259    16747    idx_lecture_id_student    INDEX     P   CREATE INDEX idx_lecture_id_student ON public.student USING btree (lecture_id);
 *   DROP INDEX public.idx_lecture_id_student;
       public                 postgres    false    242            5           1259    16738    idx_offering_id    INDEX     R   CREATE INDEX idx_offering_id ON public.course_offering USING btree (offering_id);
 #   DROP INDEX public.idx_offering_id;
       public                 postgres    false    223            A           1259    16742    idx_prereq_course    INDEX     S   CREATE INDEX idx_prereq_course ON public.prerequirest USING btree (req_course_id);
 %   DROP INDEX public.idx_prereq_course;
       public                 postgres    false    232            >           1259    16741 	   idx_staff    INDEX     A   CREATE INDEX idx_staff ON public.lecture USING btree (satff_id);
    DROP INDEX public.idx_staff;
       public                 postgres    false    231            ,           1259    16735    idx_staff_id    INDEX     ?   CREATE INDEX idx_staff_id ON public.ar USING btree (staff_id);
     DROP INDEX public.idx_staff_id;
       public                 postgres    false    218            G           1259    16744    idx_student_id_registration    INDEX     Y   CREATE INDEX idx_student_id_registration ON public.resitration USING btree (student_id);
 /   DROP INDEX public.idx_student_id_registration;
       public                 postgres    false    236            U           2606    16630    ar ar_ibfk_1    FK CONSTRAINT     r   ALTER TABLE ONLY public.ar
    ADD CONSTRAINT ar_ibfk_1 FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id);
 6   ALTER TABLE ONLY public.ar DROP CONSTRAINT ar_ibfk_1;
       public               postgres    false    238    218    3404            V           2606    16635    attempt attempt_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.attempt
    ADD CONSTRAINT attempt_ibfk_1 FOREIGN KEY (strudent_id) REFERENCES public.student(student_id);
 @   ALTER TABLE ONLY public.attempt DROP CONSTRAINT attempt_ibfk_1;
       public               postgres    false    219    242    3410            W           2606    16640    attempt attempt_ibfk_2    FK CONSTRAINT     y   ALTER TABLE ONLY public.attempt
    ADD CONSTRAINT attempt_ibfk_2 FOREIGN KEY (exam_id) REFERENCES public.exam(exam_id);
 @   ALTER TABLE ONLY public.attempt DROP CONSTRAINT attempt_ibfk_2;
       public               postgres    false    3389    219    229            Y           2606    16650    course_offering cordinater_side    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_offering
    ADD CONSTRAINT cordinater_side FOREIGN KEY (admin_cordinate_id) REFERENCES public.admin_cordinator(admin_cordinater_id);
 I   ALTER TABLE ONLY public.course_offering DROP CONSTRAINT cordinater_side;
       public               postgres    false    223    216    3369            X           2606    16645    course course_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_ibfk_1 FOREIGN KEY (department_id) REFERENCES public.department(department_id);
 >   ALTER TABLE ONLY public.course DROP CONSTRAINT course_ibfk_1;
       public               postgres    false    227    221    3386            Z           2606    16655 &   course_offering course_offering_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_offering
    ADD CONSTRAINT course_offering_ibfk_1 FOREIGN KEY (course_cordinater) REFERENCES public.lecture(lecture_id);
 P   ALTER TABLE ONLY public.course_offering DROP CONSTRAINT course_offering_ibfk_1;
       public               postgres    false    3392    223    231            [           2606    16660    course_offering course_side    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_offering
    ADD CONSTRAINT course_side FOREIGN KEY (course_id) REFERENCES public.course(coourse_id);
 E   ALTER TABLE ONLY public.course_offering DROP CONSTRAINT course_side;
       public               postgres    false    221    3377    223            ^           2606    16675    department department_ibfk_1    FK CONSTRAINT     }   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_ibfk_1 FOREIGN KEY (hod) REFERENCES public.staff(staff_id);
 F   ALTER TABLE ONLY public.department DROP CONSTRAINT department_ibfk_1;
       public               postgres    false    238    3404    227            _           2606    16680    exam exam_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_ibfk_1 FOREIGN KEY (offering_id) REFERENCES public.course_offering(offering_id);
 :   ALTER TABLE ONLY public.exam DROP CONSTRAINT exam_ibfk_1;
       public               postgres    false    229    223    3380            `           2606    16685    lecture lecture_ibfk_1    FK CONSTRAINT     |   ALTER TABLE ONLY public.lecture
    ADD CONSTRAINT lecture_ibfk_1 FOREIGN KEY (satff_id) REFERENCES public.staff(staff_id);
 @   ALTER TABLE ONLY public.lecture DROP CONSTRAINT lecture_ibfk_1;
       public               postgres    false    3404    238    231            \           2606    16665    course_register offering_side    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_register
    ADD CONSTRAINT offering_side FOREIGN KEY (offering_id) REFERENCES public.course_offering(offering_id);
 G   ALTER TABLE ONLY public.course_register DROP CONSTRAINT offering_side;
       public               postgres    false    3380    225    223            a           2606    16690     prerequirest prerequirest_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.prerequirest
    ADD CONSTRAINT prerequirest_ibfk_1 FOREIGN KEY (req_course_id) REFERENCES public.course(coourse_id);
 J   ALTER TABLE ONLY public.prerequirest DROP CONSTRAINT prerequirest_ibfk_1;
       public               postgres    false    3377    221    232            b           2606    16695    question question_ibfk_1    FK CONSTRAINT     {   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_ibfk_1 FOREIGN KEY (exam_id) REFERENCES public.exam(exam_id);
 B   ALTER TABLE ONLY public.question DROP CONSTRAINT question_ibfk_1;
       public               postgres    false    234    3389    229            ]           2606    16670    course_register register_side    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_register
    ADD CONSTRAINT register_side FOREIGN KEY (registration_id) REFERENCES public.resitration(registration_id);
 G   ALTER TABLE ONLY public.course_register DROP CONSTRAINT register_side;
       public               postgres    false    236    3401    225            c           2606    16700    resitration resitration_ibfk_1    FK CONSTRAINT     {   ALTER TABLE ONLY public.resitration
    ADD CONSTRAINT resitration_ibfk_1 FOREIGN KEY (ar_id) REFERENCES public.ar(ar_id);
 H   ALTER TABLE ONLY public.resitration DROP CONSTRAINT resitration_ibfk_1;
       public               postgres    false    236    3371    218            d           2606    16705    resitration resitration_ibfk_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.resitration
    ADD CONSTRAINT resitration_ibfk_2 FOREIGN KEY (student_id) REFERENCES public.student(student_id);
 H   ALTER TABLE ONLY public.resitration DROP CONSTRAINT resitration_ibfk_2;
       public               postgres    false    3410    236    242            e           2606    16710    staff staff_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_ibfk_1 FOREIGN KEY (department_id) REFERENCES public.department(department_id);
 <   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_ibfk_1;
       public               postgres    false    3386    238    227            f           2606    16715 &   stored question stored_question_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public."stored question"
    ADD CONSTRAINT stored_question_ibfk_1 FOREIGN KEY (lecture_id) REFERENCES public.lecture(lecture_id);
 R   ALTER TABLE ONLY public."stored question" DROP CONSTRAINT stored_question_ibfk_1;
       public               postgres    false    3392    240    231            g           2606    16720    student student_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_ibfk_1 FOREIGN KEY (departmnet_id) REFERENCES public.department(department_id);
 @   ALTER TABLE ONLY public.student DROP CONSTRAINT student_ibfk_1;
       public               postgres    false    3386    242    227            h           2606    16725    student student_ibfk_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_ibfk_2 FOREIGN KEY (lecture_id) REFERENCES public.lecture(lecture_id);
 @   ALTER TABLE ONLY public.student DROP CONSTRAINT student_ibfk_2;
       public               postgres    false    242    3392    231            i           2606    16730    teach teach_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.teach
    ADD CONSTRAINT teach_ibfk_1 FOREIGN KEY (offering_id) REFERENCES public.course_offering(offering_id);
 <   ALTER TABLE ONLY public.teach DROP CONSTRAINT teach_ibfk_1;
       public               postgres    false    243    3380    223            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �      	      x������ � �      
      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     