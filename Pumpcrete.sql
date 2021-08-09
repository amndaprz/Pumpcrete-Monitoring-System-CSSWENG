PGDMP     $    ,        	        y         	   Pumpcrete    13.3    13.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16454 	   Pumpcrete    DATABASE     o   CREATE DATABASE "Pumpcrete" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "Pumpcrete";
                postgres    false            �            1259    16480    client    TABLE     �   CREATE TABLE public.client (
    client_id bigint NOT NULL,
    role_ character varying(50) NOT NULL,
    contact_id bigint NOT NULL
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    16478    client_client_id_seq    SEQUENCE     }   CREATE SEQUENCE public.client_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_client_id_seq;
       public          postgres    false    203            �           0    0    client_client_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;
          public          postgres    false    202            �            1259    16457    contact_details    TABLE     3  CREATE TABLE public.contact_details (
    contact_id bigint NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(25) NOT NULL,
    landline_num integer,
    cellphone_num integer,
    email character varying(50) NOT NULL,
    c_address character varying(200) NOT NULL
);
 #   DROP TABLE public.contact_details;
       public         heap    postgres    false            �            1259    16455    contact_details_contact_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contact_details_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.contact_details_contact_id_seq;
       public          postgres    false    201            �           0    0    contact_details_contact_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.contact_details_contact_id_seq OWNED BY public.contact_details.contact_id;
          public          postgres    false    200            �            1259    16505    users    TABLE     (  CREATE TABLE public.users (
    username character varying(20) NOT NULL,
    email character varying(20) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(20) NOT NULL,
    password character varying(50) NOT NULL,
    role character varying(50) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            -           2604    16483    client client_id    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN client_id DROP DEFAULT;
       public          postgres    false    202    203    203            ,           2604    16460    contact_details contact_id    DEFAULT     �   ALTER TABLE ONLY public.contact_details ALTER COLUMN contact_id SET DEFAULT nextval('public.contact_details_contact_id_seq'::regclass);
 I   ALTER TABLE public.contact_details ALTER COLUMN contact_id DROP DEFAULT;
       public          postgres    false    201    200    201            �          0    16480    client 
   TABLE DATA           >   COPY public.client (client_id, role_, contact_id) FROM stdin;
    public          postgres    false    203   o       �          0    16457    contact_details 
   TABLE DATA           {   COPY public.contact_details (contact_id, first_name, last_name, landline_num, cellphone_num, email, c_address) FROM stdin;
    public          postgres    false    201   �       �          0    16505    users 
   TABLE DATA           W   COPY public.users (username, email, first_name, last_name, password, role) FROM stdin;
    public          postgres    false    204   �       �           0    0    client_client_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.client_client_id_seq', 1, false);
          public          postgres    false    202            �           0    0    contact_details_contact_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.contact_details_contact_id_seq', 1, false);
          public          postgres    false    200            1           2606    16487    client client_contact_id_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_contact_id_key UNIQUE (contact_id);
 F   ALTER TABLE ONLY public.client DROP CONSTRAINT client_contact_id_key;
       public            postgres    false    203            3           2606    16485    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    203            /           2606    16462 $   contact_details contact_details_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.contact_details
    ADD CONSTRAINT contact_details_pkey PRIMARY KEY (contact_id);
 N   ALTER TABLE ONLY public.contact_details DROP CONSTRAINT contact_details_pkey;
       public            postgres    false    201            5           2606    16509    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    204            6           2606    16488    client client_contact_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contact_details(contact_id);
 G   ALTER TABLE ONLY public.client DROP CONSTRAINT client_contact_id_fkey;
       public          postgres    false    203    2863    201            �      x������ � �      �      x������ � �      �   P   x�+.ILK�/N�-�I�,s��R�s3s���s9�Ab��`�y����e\�)��y0��NG��Ό��B�=... ��+G     