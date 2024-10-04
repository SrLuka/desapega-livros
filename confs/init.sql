CREATE USER livraria IDENTIFIED BY B4nco#5;
GRANT CONNECT, RESOURCE, INSERT ANY TABLE, UPDATE ANY TABLE, DELETE ANY TABLE TO livraria;

CONNECT livraria/B4nco#5@//localhost:1521/XEPDB1;

CREATE TABLE editora(
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome_ed VARCHAR2(100) NOT NULL
);

CREATE TABLE lingua(
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome_lingua VARCHAR2(100) NOT NULL
);

CREATE TABLE categoria(
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL
);

CREATE TABLE autor(
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    nacionalidade VARCHAR2(100) NOT NULL
);

CREATE TABLE capa(
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome_img VARCHAR2(100) NOT NULL,
    tipo_img VARCHAR2(7) NULL,
    categoria VARCHAR2(100) NOT NULL,
    descricao VARCHAR2(200) NOT NULL,
    imagem BLOB NOT NULL
);

CREATE TABLE livro(
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(100) NOT NULL,
    id_editora NUMBER NOT NULL,
    isbn VARCHAR2(60) NULL,
    dt_publicacao DATE NOT NULL,
    descricao VARCHAR2(300) NOT NULL,
    lingua_original NUMBER NULL,
    id_capa NUMBER NOT NULL,
    FOREIGN KEY(id_editora) REFERENCES editora(id),
    FOREIGN KEY(lingua_original) REFERENCES lingua(id),
    FOREIGN KEY(id_capa) REFERENCES capa(id)
);

CREATE TABLE lingua_livro(
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    id_livro NUMBER NOT NULL,
    id_lingua NUMBER NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES livro(id),
    FOREIGN KEY (id_lingua) REFERENCES lingua(id)
);

CREATE TABLE livro_autor(
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    id_livro NUMBER,
    id_autor NUMBER,
    FOREIGN KEY (id_livro) REFERENCES livro(id),
    FOREIGN KEY (id_autor) REFERENCES autor(id)
);

CREATE TABLE livro_categoria(
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    id_livro NUMBER,
    id_categoria NUMBER,
    FOREIGN KEY (id_livro) REFERENCES livro(id),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

CREATE TABLE inventario(
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    id_livro NUMBER,
    qtd_livro NUMBER,
    FOREIGN KEY (id_livro) REFERENCES livro(id)
);