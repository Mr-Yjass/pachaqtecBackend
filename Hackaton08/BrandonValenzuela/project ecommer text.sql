-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."user"
(
    id serial,
    first_name bit varying(100),
    last_name bit varying(100),
    username bit varying(100) NOT NULL,
    email bit varying(100),
    password bit varying(100),
    address bit varying(100) NOT NULL,
    role bit varying(100),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."Product"
(
    id serial,
    name bit varying(100),
    description bit varying(100),
    price money,
    characteristic character varying(100),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.comentario
(
    id serial,
    content text,
    report boolean DEFAULT false,
    user_id bigint,
    parent_id bigint,
    create_date date,
    product_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.payment_method
(
    id serial,
    "number" bit varying,
    cvv bigint,
    name bit varying,
    date date,
    user_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.categorie
(
    id bigint,
    name bit varying(100),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."categorie_Product"
(
    categorie_id bigint,
    "Product_id" serial
);

CREATE TABLE IF NOT EXISTS public.promotion
(
    id serial,
    name bit varying(100),
    date_start date,
    date_end date,
    "discount " double precision,
    description bit varying(100),
    is_active boolean,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."promotion_Product"
(
    promotion_id serial,
    "Product_id" serial
);

CREATE TABLE IF NOT EXISTS public.shipping
(
    id serial,
    order_id bigint,
    person_recivos bit varying,
    address bit varying,
    estimated_date date,
    send_date date,
    status bit varying,
    description bit varying,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.orden
(
    id serial,
    total double precision,
    method_pay_id bit varying(100),
    date date,
    user_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."orden_Product"
(
    orden_id serial,
    "Product_id" serial
);

CREATE TABLE IF NOT EXISTS public.shopping_cart
(
    id serial,
    total double precision,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."shopping_cart_Product"
(
    shopping_cart_id serial,
    "Product_id" serial
);

ALTER TABLE IF EXISTS public.comentario
    ADD CONSTRAINT "user" FOREIGN KEY (user_id)
    REFERENCES public."user" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.comentario
    ADD FOREIGN KEY (parent_id)
    REFERENCES public.comentario (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.comentario
    ADD FOREIGN KEY (product_id)
    REFERENCES public."Product" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.payment_method
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
    REFERENCES public."user" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."categorie_Product"
    ADD FOREIGN KEY (categorie_id)
    REFERENCES public.categorie (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."categorie_Product"
    ADD FOREIGN KEY ("Product_id")
    REFERENCES public."Product" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."promotion_Product"
    ADD FOREIGN KEY (promotion_id)
    REFERENCES public.promotion (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."promotion_Product"
    ADD FOREIGN KEY ("Product_id")
    REFERENCES public."Product" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.shipping
    ADD FOREIGN KEY (order_id)
    REFERENCES public.orden (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.orden
    ADD FOREIGN KEY (user_id)
    REFERENCES public."user" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."orden_Product"
    ADD FOREIGN KEY (orden_id)
    REFERENCES public.orden (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."orden_Product"
    ADD FOREIGN KEY ("Product_id")
    REFERENCES public."Product" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."shopping_cart_Product"
    ADD FOREIGN KEY (shopping_cart_id)
    REFERENCES public.shopping_cart (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."shopping_cart_Product"
    ADD FOREIGN KEY ("Product_id")
    REFERENCES public."Product" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;