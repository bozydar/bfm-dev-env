\c postgres

create database service2_development;
\c service2_development
\ir ./include/service2_schema.sql
\ir ./include/service2_seed.sql

create database service2_test;
\c service2_test
\ir ./include/service2_schema.sql