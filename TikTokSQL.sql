-- Script de creación y carga de datos

-- Crear la base de datos TikTokDB
create database TikTokDB;
use TikTokDB;

-- Crear tablas de la base 

-- Tabla de usuarios
create table usuarios (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nombre_usuario VARCHAR(50) NOT NULL, 
 correo VARCHAR(100) NOT NULL UNIQUE, 
 fecha_registro DATE NOT NULL,
 pais VARCHAR(50) NOT NULL
);

-- Tabla videos 
create table videos (
id_video INT AUTO_INCREMENT PRIMARY KEY,
id_usuario INT NOT NULL,
titulo VARCHAR(100) NOT NULL, 
descripcion TEXT, 
fecha_publicacion DATE NOT NULL,
duracion_segundos INT NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
); 

-- Crear tabla comentatios 
create table comentarios (
id_comentarios INT AUTO_INCREMENT PRIMARY KEY,
id_video INT NOT NULL,
id_usuario INT NOT NULL, 
texto TEXT NOT NULL,
fecha_comentarios DATE NOT NULL,
FOREIGN KEY (id_video) REFERENCES videos(id_video),
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Crear Tabla Likes
create table likes (
id_like INT AUTO_INCREMENT PRIMARY KEY,
id_video INT NOT NULL,
id_usuario INT NOT NULL, 
fecha_like DATE NOT NULL,
FOREIGN KEY (id_video) REFERENCES videos(id_video),
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Crear Tabla Seguidores 
create table seguidores (
id_seguidor INT AUTO_INCREMENT PRIMARY KEY,
id_usuario_seguidor INT NOT NULL, 
id_usuario_seguido INT NOT NULL,
fecha_seguimiento DATE NOT NULL,
FOREIGN KEY (id_usuario_seguidor) REFERENCES usuarios(id_usuario),
FOREIGN KEY (id_usuario_seguido) REFERENCES usuarios(id_usuario),
CONSTRAINT chk_seguirse CHECK (id_usuario_seguidor <> id_usuario_seguido)
);

