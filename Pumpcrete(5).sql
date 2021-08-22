PGDMP         0                y         	   Pumpcrete    13.3    13.3 0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16454 	   Pumpcrete    DATABASE     o   CREATE DATABASE "Pumpcrete" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "Pumpcrete";
                postgres    false            �            1259    18769    billings    TABLE       CREATE TABLE public.billings (
    bill_no bigint NOT NULL,
    client_name character varying NOT NULL,
    project_name character varying NOT NULL,
    project_add character varying NOT NULL,
    date_doc date NOT NULL,
    date_used date NOT NULL,
    psc_id bigint NOT NULL,
    conc_structure character varying NOT NULL,
    floor_level bigint NOT NULL,
    qty numeric NOT NULL,
    unit_price numeric NOT NULL,
    total numeric NOT NULL,
    posted boolean NOT NULL,
    filled_by character varying,
    posted_by character varying
);
    DROP TABLE public.billings;
       public         heap    postgres    false            �           0    0    TABLE billings    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.billings TO staff_role;
GRANT SELECT,UPDATE ON TABLE public.billings TO supervisor_role;
          public          postgres    false    206            �            1259    18767    billings_bill_no_seq    SEQUENCE     }   CREATE SEQUENCE public.billings_bill_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.billings_bill_no_seq;
       public          postgres    false    206            �           0    0    billings_bill_no_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.billings_bill_no_seq OWNED BY public.billings.bill_no;
          public          postgres    false    205            �           0    0    SEQUENCE billings_bill_no_seq    ACL     �   GRANT SELECT,USAGE ON SEQUENCE public.billings_bill_no_seq TO staff_role;
GRANT SELECT,USAGE ON SEQUENCE public.billings_bill_no_seq TO supervisor_role;
GRANT SELECT,USAGE ON SEQUENCE public.billings_bill_no_seq TO admin_role;
          public          postgres    false    205            �            1259    18735    client    TABLE     \  CREATE TABLE public.client (
    client_id bigint NOT NULL,
    client_name character varying NOT NULL,
    client_position character varying NOT NULL,
    client_address character varying NOT NULL,
    client_landline integer NOT NULL,
    client_cellphone bigint NOT NULL,
    client_email character varying NOT NULL,
    latest_doc_date date
);
    DROP TABLE public.client;
       public         heap    postgres    false            �           0    0    TABLE client    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.client TO staff_role;
GRANT SELECT,UPDATE ON TABLE public.client TO supervisor_role;
          public          postgres    false    204            �            1259    18733    client_client_id_seq    SEQUENCE     }   CREATE SEQUENCE public.client_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_client_id_seq;
       public          postgres    false    204            �           0    0    client_client_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;
          public          postgres    false    203            �           0    0    SEQUENCE client_client_id_seq    ACL     �   GRANT SELECT,USAGE ON SEQUENCE public.client_client_id_seq TO staff_role;
GRANT SELECT,USAGE ON SEQUENCE public.client_client_id_seq TO supervisor_role;
GRANT SELECT,USAGE ON SEQUENCE public.client_client_id_seq TO admin_role;
          public          postgres    false    203            �            1259    16546    credit_memo    TABLE     %   CREATE TABLE public.credit_memo (
);
    DROP TABLE public.credit_memo;
       public         heap    postgres    false            �           0    0    TABLE credit_memo    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.credit_memo TO staff_role;
GRANT SELECT,UPDATE ON TABLE public.credit_memo TO supervisor_role;
          public          postgres    false    201            �            1259    18793 	   pumpcrete    TABLE     d  CREATE TABLE public.pumpcrete (
    pumpcrete_id bigint NOT NULL,
    description character varying NOT NULL,
    plate_no character varying NOT NULL,
    fuel_type character varying NOT NULL,
    purchase_date date NOT NULL,
    cr_no bigint,
    or_no bigint,
    tires integer NOT NULL,
    rented boolean NOT NULL,
    client_name character varying
);
    DROP TABLE public.pumpcrete;
       public         heap    postgres    false            �            1259    18791    pumpcrete_pumpcrete_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pumpcrete_pumpcrete_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.pumpcrete_pumpcrete_id_seq;
       public          postgres    false    208            �           0    0    pumpcrete_pumpcrete_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.pumpcrete_pumpcrete_id_seq OWNED BY public.pumpcrete.pumpcrete_id;
          public          postgres    false    207            �           0    0 #   SEQUENCE pumpcrete_pumpcrete_id_seq    ACL     �   GRANT SELECT,USAGE ON SEQUENCE public.pumpcrete_pumpcrete_id_seq TO staff_role;
GRANT SELECT,USAGE ON SEQUENCE public.pumpcrete_pumpcrete_id_seq TO supervisor_role;
GRANT SELECT,USAGE ON SEQUENCE public.pumpcrete_pumpcrete_id_seq TO admin_role;
          public          postgres    false    207            �            1259    16549 
   pumpcretes    TABLE     $   CREATE TABLE public.pumpcretes (
);
    DROP TABLE public.pumpcretes;
       public         heap    postgres    false            �           0    0    TABLE pumpcretes    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.pumpcretes TO staff_role;
GRANT SELECT,UPDATE ON TABLE public.pumpcretes TO supervisor_role;
          public          postgres    false    202            �            1259    16505    users    TABLE     D  CREATE TABLE public.users (
    username character varying(50) NOT NULL,
    email character varying(150) NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    password character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    middle_name character varying
);
    DROP TABLE public.users;
       public         heap    postgres    false            �           0    0    TABLE users    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.users TO admin_role;
GRANT SELECT,UPDATE ON TABLE public.users TO staff_role;
GRANT SELECT,UPDATE ON TABLE public.users TO supervisor_role;
          public          postgres    false    200            ?           2604    18772    billings bill_no    DEFAULT     t   ALTER TABLE ONLY public.billings ALTER COLUMN bill_no SET DEFAULT nextval('public.billings_bill_no_seq'::regclass);
 ?   ALTER TABLE public.billings ALTER COLUMN bill_no DROP DEFAULT;
       public          postgres    false    206    205    206            >           2604    18738    client client_id    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN client_id DROP DEFAULT;
       public          postgres    false    204    203    204            @           2604    18796    pumpcrete pumpcrete_id    DEFAULT     �   ALTER TABLE ONLY public.pumpcrete ALTER COLUMN pumpcrete_id SET DEFAULT nextval('public.pumpcrete_pumpcrete_id_seq'::regclass);
 E   ALTER TABLE public.pumpcrete ALTER COLUMN pumpcrete_id DROP DEFAULT;
       public          postgres    false    207    208    208            �          0    18769    billings 
   TABLE DATA           �   COPY public.billings (bill_no, client_name, project_name, project_add, date_doc, date_used, psc_id, conc_structure, floor_level, qty, unit_price, total, posted, filled_by, posted_by) FROM stdin;
    public          postgres    false    206   W:       �          0    18735    client 
   TABLE DATA           �   COPY public.client (client_id, client_name, client_position, client_address, client_landline, client_cellphone, client_email, latest_doc_date) FROM stdin;
    public          postgres    false    204   ;       �          0    16546    credit_memo 
   TABLE DATA           %   COPY public.credit_memo  FROM stdin;
    public          postgres    false    201   �;       �          0    18793 	   pumpcrete 
   TABLE DATA           �   COPY public.pumpcrete (pumpcrete_id, description, plate_no, fuel_type, purchase_date, cr_no, or_no, tires, rented, client_name) FROM stdin;
    public          postgres    false    208   �;       �          0    16549 
   pumpcretes 
   TABLE DATA           $   COPY public.pumpcretes  FROM stdin;
    public          postgres    false    202   5<       �          0    16505    users 
   TABLE DATA           d   COPY public.users (username, email, first_name, last_name, password, role, middle_name) FROM stdin;
    public          postgres    false    200   R<       �           0    0    billings_bill_no_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.billings_bill_no_seq', 8, true);
          public          postgres    false    205            �           0    0    client_client_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.client_client_id_seq', 6, true);
          public          postgres    false    203            �           0    0    pumpcrete_pumpcrete_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.pumpcrete_pumpcrete_id_seq', 2, true);
          public          postgres    false    207            H           2606    18777    billings billings_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.billings
    ADD CONSTRAINT billings_pkey PRIMARY KEY (bill_no);
 @   ALTER TABLE ONLY public.billings DROP CONSTRAINT billings_pkey;
       public            postgres    false    206            J           2606    18779    billings billings_psc_id_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.billings
    ADD CONSTRAINT billings_psc_id_key UNIQUE (psc_id);
 F   ALTER TABLE ONLY public.billings DROP CONSTRAINT billings_psc_id_key;
       public            postgres    false    206            D           2606    18745    client client_client_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_client_name_key UNIQUE (client_name);
 G   ALTER TABLE ONLY public.client DROP CONSTRAINT client_client_name_key;
       public            postgres    false    204            F           2606    18743    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    204            L           2606    18807    pumpcrete pumpcrete_cr_no_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.pumpcrete
    ADD CONSTRAINT pumpcrete_cr_no_key UNIQUE (cr_no);
 G   ALTER TABLE ONLY public.pumpcrete DROP CONSTRAINT pumpcrete_cr_no_key;
       public            postgres    false    208            N           2606    18803 #   pumpcrete pumpcrete_description_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.pumpcrete
    ADD CONSTRAINT pumpcrete_description_key UNIQUE (description);
 M   ALTER TABLE ONLY public.pumpcrete DROP CONSTRAINT pumpcrete_description_key;
       public            postgres    false    208            P           2606    18809    pumpcrete pumpcrete_or_no_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.pumpcrete
    ADD CONSTRAINT pumpcrete_or_no_key UNIQUE (or_no);
 G   ALTER TABLE ONLY public.pumpcrete DROP CONSTRAINT pumpcrete_or_no_key;
       public            postgres    false    208            R           2606    18801    pumpcrete pumpcrete_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.pumpcrete
    ADD CONSTRAINT pumpcrete_pkey PRIMARY KEY (pumpcrete_id);
 B   ALTER TABLE ONLY public.pumpcrete DROP CONSTRAINT pumpcrete_pkey;
       public            postgres    false    208            T           2606    18805     pumpcrete pumpcrete_plate_no_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.pumpcrete
    ADD CONSTRAINT pumpcrete_plate_no_key UNIQUE (plate_no);
 J   ALTER TABLE ONLY public.pumpcrete DROP CONSTRAINT pumpcrete_plate_no_key;
       public            postgres    false    208            B           2606    16728    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    200            U           2606    18780     billings billings_filled_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.billings
    ADD CONSTRAINT billings_filled_by_fkey FOREIGN KEY (filled_by) REFERENCES public.users(username);
 J   ALTER TABLE ONLY public.billings DROP CONSTRAINT billings_filled_by_fkey;
       public          postgres    false    206    2882    200            V           2606    18785     billings billings_posted_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.billings
    ADD CONSTRAINT billings_posted_by_fkey FOREIGN KEY (posted_by) REFERENCES public.users(username);
 J   ALTER TABLE ONLY public.billings DROP CONSTRAINT billings_posted_by_fkey;
       public          postgres    false    200    2882    206            �   �   x��ν
�0���)���U]k��Ү���B�$��o�U���p��p�bHp�6�7�ZvS��˿p�e��(�Fwd�;)�C_)i$.��*3��E1J"B���mʺ~�[	z�z5zP����9�𫕃�x3�`[���/�rpw�oq!��s��CظS�b��!��Mn��      �   }   x�e�;
�0�z���bv���^<��h��1`r�f`��)hD���OV	��&���,ˡ��K���*��Nf�gg�
�YqKh?�=�J�-�Y�t�_���U�z[��T�9"�j�@�      �      x������ � �      �   d   x�3�tI-N.�,(���S0�ttr642�t�L-N���u@�-8�8c���Pty�n&�f0]FP]F@�	��%��
�9��y%
~���
�\1z\\\ ��      �      x������ � �      �   �   x�]�;�0C��0,�.��"~�Di��>$@U���Įis��5Y�7@A)&�zN:k�"��3�DBS)�^�@�(�d~cd)	�b3�8��C\�9t`�����FF�������>K�􉼼M��:�Zby     