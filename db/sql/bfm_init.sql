\c postgres

create database bfm_development;
\c bfm_development
\ir ./include/bfm_schema.sql
\ir ./include/bfm_seed.sql

create database bfm_test;
\c bfm_test
\ir ./include/bfm_schema.sql


