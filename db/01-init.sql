create database bfm_development;

\c bfm_development

CREATE TABLE IF NOT EXISTS info
(
    id   SERIAL PRIMARY KEY,
    name TEXT
);

\c postgres

create database service2_development;

\c service2_development

CREATE TABLE IF NOT EXISTS info
(
    id   SERIAL PRIMARY KEY,
    name TEXT
);