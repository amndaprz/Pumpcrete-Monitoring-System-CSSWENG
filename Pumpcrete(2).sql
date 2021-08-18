PGDMP     #                    y         	   Pumpcrete    13.3    13.3 /    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16454 	   Pumpcrete    DATABASE     o   CREATE DATABASE "Pumpcrete" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "Pumpcrete";
                postgres    false            �            1259    17627    billings    TABLE     �  CREATE TABLE public.billings (
    bill_no bigint NOT NULL,
    client_id bigint NOT NULL,
    project_name character varying(50) NOT NULL,
    project_add character varying(50) NOT NULL,
    date_doc date NOT NULL,
    date_used date NOT NULL,
    psc_id bigint NOT NULL,
    concrete_struct character varying NOT NULL,
    floor_level integer NOT NULL,
    quantity numeric NOT NULL,
    unit_price numeric NOT NULL,
    total numeric NOT NULL,
    grand_total numeric NOT NULL,
    posted boolean NOT NULL,
    checked_by character varying,
    approved_by character varying,
    posted_by character varying,
    received_by character varying
);
    DROP TABLE public.billings;
       public         heap    postgres    false            �           0    0    TABLE billings    ACL     J   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.billings TO staff_role;
          public          postgres    false    210            �            1259    17623    billings_bill_no_seq    SEQUENCE     }   CREATE SEQUENCE public.billings_bill_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.billings_bill_no_seq;
       public          postgres    false    210            �           0    0    billings_bill_no_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.billings_bill_no_seq OWNED BY public.billings.bill_no;
          public          postgres    false    208            �            1259    17625    billings_psc_id_seq    SEQUENCE     |   CREATE SEQUENCE public.billings_psc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.billings_psc_id_seq;
       public          postgres    false    210            �           0    0    billings_psc_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.billings_psc_id_seq OWNED BY public.billings.psc_id;
          public          postgres    false    209            �            1259    17469    client    TABLE     }  CREATE TABLE public.client (
    client_id bigint NOT NULL,
    client_name character varying NOT NULL,
    client_position character varying NOT NULL,
    client_address character varying NOT NULL,
    client_landline integer NOT NULL,
    client_cellphone integer NOT NULL,
    client_email character varying NOT NULL,
    latest_doc_date timestamp without time zone NOT NULL
);
    DROP TABLE public.client;
       public         heap    postgres    false            �           0    0    TABLE client    ACL     H   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.client TO staff_role;
          public          postgres    false    204            �            1259    17467    client_client_id_seq    SEQUENCE     }   CREATE SEQUENCE public.client_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_client_id_seq;
       public          postgres    false    204            �           0    0    client_client_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;
          public          postgres    false    203            �            1259    16546    credit_memo    TABLE     %   CREATE TABLE public.credit_memo (
);
    DROP TABLE public.credit_memo;
       public         heap    postgres    false            �           0    0    TABLE credit_memo    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.credit_memo TO staff_role;
GRANT SELECT,UPDATE ON TABLE public.credit_memo TO supervisor_role;
          public          postgres    false    201            �            1259    17529    psc    TABLE     ^  CREATE TABLE public.psc (
    psc_id bigint NOT NULL,
    client_id bigint NOT NULL,
    concrete_struct character varying NOT NULL,
    floor_level integer NOT NULL,
    quantity numeric NOT NULL,
    unit_price numeric NOT NULL,
    total numeric NOT NULL,
    project_name character varying NOT NULL,
    project_add character varying NOT NULL
);
    DROP TABLE public.psc;
       public         heap    postgres    false            �            1259    17527    psc_client_id_seq    SEQUENCE     z   CREATE SEQUENCE public.psc_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.psc_client_id_seq;
       public          postgres    false    207            �           0    0    psc_client_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.psc_client_id_seq OWNED BY public.psc.client_id;
          public          postgres    false    206            �            1259    17525    psc_psc_id_seq    SEQUENCE     w   CREATE SEQUENCE public.psc_psc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.psc_psc_id_seq;
       public          postgres    false    207            �           0    0    psc_psc_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.psc_psc_id_seq OWNED BY public.psc.psc_id;
          public          postgres    false    205            �            1259    16549 
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
       public         heap    postgres    false            �           0    0    TABLE users    ACL     �   GRANT SELECT,INSERT,UPDATE ON TABLE public.users TO admin_role;
GRANT SELECT,UPDATE ON TABLE public.users TO staff_role;
GRANT SELECT,UPDATE ON TABLE public.users TO supervisor_role;
          public          postgres    false    200            E           2604    17630    billings bill_no    DEFAULT     t   ALTER TABLE ONLY public.billings ALTER COLUMN bill_no SET DEFAULT nextval('public.billings_bill_no_seq'::regclass);
 ?   ALTER TABLE public.billings ALTER COLUMN bill_no DROP DEFAULT;
       public          postgres    false    210    208    210            F           2604    17631    billings psc_id    DEFAULT     r   ALTER TABLE ONLY public.billings ALTER COLUMN psc_id SET DEFAULT nextval('public.billings_psc_id_seq'::regclass);
 >   ALTER TABLE public.billings ALTER COLUMN psc_id DROP DEFAULT;
       public          postgres    false    210    209    210            B           2604    17472    client client_id    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN client_id DROP DEFAULT;
       public          postgres    false    203    204    204            C           2604    17532 
   psc psc_id    DEFAULT     h   ALTER TABLE ONLY public.psc ALTER COLUMN psc_id SET DEFAULT nextval('public.psc_psc_id_seq'::regclass);
 9   ALTER TABLE public.psc ALTER COLUMN psc_id DROP DEFAULT;
       public          postgres    false    205    207    207            D           2604    17533    psc client_id    DEFAULT     n   ALTER TABLE ONLY public.psc ALTER COLUMN client_id SET DEFAULT nextval('public.psc_client_id_seq'::regclass);
 <   ALTER TABLE public.psc ALTER COLUMN client_id DROP DEFAULT;
       public          postgres    false    207    206    207            �          0    17627    billings 
   TABLE DATA           �   COPY public.billings (bill_no, client_id, project_name, project_add, date_doc, date_used, psc_id, concrete_struct, floor_level, quantity, unit_price, total, grand_total, posted, checked_by, approved_by, posted_by, received_by) FROM stdin;
    public          postgres    false    210   �5       �          0    17469    client 
   TABLE DATA           �   COPY public.client (client_id, client_name, client_position, client_address, client_landline, client_cellphone, client_email, latest_doc_date) FROM stdin;
    public          postgres    false    204   v6       �          0    16546    credit_memo 
   TABLE DATA           %   COPY public.credit_memo  FROM stdin;
    public          postgres    false    201   7       �          0    17529    psc 
   TABLE DATA           �   COPY public.psc (psc_id, client_id, concrete_struct, floor_level, quantity, unit_price, total, project_name, project_add) FROM stdin;
    public          postgres    false    207   (7       �          0    16549 
   pumpcretes 
   TABLE DATA           $   COPY public.pumpcretes  FROM stdin;
    public          postgres    false    202   E7       �          0    16505    users 
   TABLE DATA           d   COPY public.users (username, email, first_name, last_name, password, role, middle_name) FROM stdin;
    public          postgres    false    200   b7       �           0    0    billings_bill_no_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.billings_bill_no_seq', 1, false);
          public          postgres    false    208            �           0    0    billings_psc_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.billings_psc_id_seq', 1, false);
          public          postgres    false    209            �           0    0    client_client_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.client_client_id_seq', 1, false);
          public          postgres    false    203            �           0    0    psc_client_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.psc_client_id_seq', 1, false);
          public          postgres    false    206            �           0    0    psc_psc_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.psc_psc_id_seq', 1, false);
          public          postgres    false    205            N           2606    17636    billings billings_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.billings
    ADD CONSTRAINT billings_pkey PRIMARY KEY (bill_no);
 @   ALTER TABLE ONLY public.billings DROP CONSTRAINT billings_pkey;
       public            postgres    false    210            J           2606    17477    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    204            L           2606    17538    psc psc_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.psc
    ADD CONSTRAINT psc_pkey PRIMARY KEY (psc_id);
 6   ALTER TABLE ONLY public.psc DROP CONSTRAINT psc_pkey;
       public            postgres    false    207            H           2606    16728    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    200            P           2606    17637    billings billings_psc_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.billings
    ADD CONSTRAINT billings_psc_id_fkey FOREIGN KEY (psc_id) REFERENCES public.client(client_id);
 G   ALTER TABLE ONLY public.billings DROP CONSTRAINT billings_psc_id_fkey;
       public          postgres    false    204    2890    210            O           2606    17539    psc psc_client_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.psc
    ADD CONSTRAINT psc_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 @   ALTER TABLE ONLY public.psc DROP CONSTRAINT psc_client_id_fkey;
       public          postgres    false    2890    207    204            �   �   x�3�4���R�Q
�..A����FF�� ��4�tTp��K.J-IU.)*M.j5�4�44�30 *��`����� ��,�8�(�81� '�<.#�`��(4g
s`�is�1�Bs�1!3��8ӈ��4�4Fq�	�3M��9@Ό���� ��q      �   �   x�e�M
�0��uz�^`�I:W����F�k�z��"��A�Ahu�z�z���cL��q�g�,�K)_H,���o��Z�1 ����%���P.(_(۷�D���\A	�J�% ���ʹ�~*��ָF
      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�]�;�0C��0,�.��"~�Di��>$@U���Įis��5Y�7@A)&�zN:k�"��3�DBS)�^�@�(�d~cd)	�b3�8��C\�9t`�����FF�������>K�􉼼M��:�Zby     