---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Max Gold
-- SQL to initiate schema for comp bio database
---------------------------------------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS genes;

CREATE TABLE IF NOT EXISTS genes(
    id SERIAL PRIMARY KEY,
    symbol VARCHAR NOT NULL,
    rvis DOUBLE PRECISION,

    created_at TIMESTAMP default now(),
    updated_at TIMESTAMP default now()

);



DROP TABLE IF EXISTS networks;

CREATE TABLE IF NOT EXISTS networks(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,


    created_at TIMESTAMP default now(),
    updated_at TIMESTAMP default now()
);

DROP TABLE IF EXISTS genes_networks;

CREATE TABLE IF NOT EXISTS genes_networks(
    id SERIAL PRIMARY KEY,
    -- indegree INT,
    -- outdegree INT,
    -- connectivity DOUBLE PRECISION,

    created_at TIMESTAMP default now(),
    updated_at TIMESTAMP default now()

);

DROP TABLE IF EXISTS gene_connections;

CREATE TABLE IF NOT EXISTS gene_connections(
    id SERIAL PRIMARY KEY,
    upstream_gene_id INT REFERENCES genes(id) NOT NULL,
    downstream_gene_id INT REFERENCES genes(id) NOT NULL,
    network_id INT REFERENCES networks(id) NOT NULL,
    interaction_id INT REFERENCES interactions(id) NOT NULL,


    created_at TIMESTAMP default now(),
    updated_at TIMESTAMP default now()
);

DROP TABLE IF EXISTS interactions;

CREATE TABLE IF NOT EXISTS interactions(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    created_at TIMESTAMP default now(),
    updated_at TIMESTAMP default now()
);



DROP TABLE IF EXISTS motifs;

CREATE TABLE IF NOT EXISTS motifs(
    id SERIAL PRIMARY KEY,
    motif_type_id INT REFERENCES motif_types(id) NOT NULL,


    created_at TIMESTAMP default now(),
    updated_at TIMESTAMP default now()
);

DROP TABLE IF EXISTS genes_motifs;

CREATE TABLE IF NOT EXISTS genes_motifs(
    id SERIAL PRIMARY KEY,
    gene_id INT REFERENCES genes(id) NOT NULL,
    motif_id INT REFERENCES motifs(id) NOT NULL,


    created_at TIMESTAMP default now(),
    updated_at TIMESTAMP default now()
);

DROP TABLE IF EXISTS motif_positions;

CREATE TABLE IF NOT EXISTS motif_positions(
    id SERIAL PRIMARY KEY,
    motif_type_id INT REFERENCES motif_types(id) NOT NULL,
    name VARCHAR NOT NULL,
    created_at TIMESTAMP default now(),
    updated_at TIMESTAMP default now()

);


DROP TABLE IF EXISTS motif_types;

CREATE TABLE IF NOT EXISTS motif_types(
    id SERIAL PRIMARY KEY,

    created_at TIMESTAMP default now(),
    updated_at TIMESTAMP default now()
);

