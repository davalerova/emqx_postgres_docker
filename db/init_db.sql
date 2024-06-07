/* Crear la tabla mqtt_user */
CREATE TABLE mqtt_user (
  id SERIAL PRIMARY KEY,
  username CHARACTER VARYING(100),
  password CHARACTER VARYING(100),
  salt CHARACTER VARYING(40),
  is_superuser BOOLEAN,
  UNIQUE (username)
);

/* Insertar usuarios */
INSERT INTO mqtt_user (username, password, salt, is_superuser) VALUES
('emqx', 'efa1f375d76194fa51a3556a97e641e61685f914d446979da50a551a4333ffd7', NULL, true),
('sensor1', 'efa1f375d76194fa51a3556a97e641e61685f914d446979da50a551a4333ffd7', NULL, false);

/* Crear la tabla mqtt_acl */
CREATE TABLE mqtt_acl (
  id SERIAL PRIMARY KEY,
  allow INTEGER,
  ipaddr CHARACTER VARYING(60),
  username CHARACTER VARYING(100),
  clientid CHARACTER VARYING(100),
  access  INTEGER,
  topic CHARACTER VARYING(100)
);


/* Crear índices */
CREATE INDEX ipaddr ON mqtt_acl (ipaddr);
CREATE INDEX username ON mqtt_acl (username);
CREATE INDEX clientid ON mqtt_acl (clientid);

/* Insertar reglas por defecto en mqtt_acl */
INSERT INTO mqtt_acl (allow, ipaddr, username, clientid, access, topic) 
VALUES 
    (0, NULL, '$all', NULL, 1, '$SYS/#'),
    (1, '10.59.1.100', NULL, NULL, 1, '$SYS/#'),
    (0, NULL, '$all', NULL, 1, '/smarthome/+/temperature'),
    (1, NULL, '$all', NULL, 1, '/smarthome/%c/temperature');

/* Bloquear todos los usuarios */
INSERT INTO mqtt_acl (allow, ipaddr, username, clientid, access, topic) 
VALUES (0, NULL, '$all', NULL, 3, '+/#');

/* Crear nuestras propias reglas */
INSERT INTO mqtt_acl (allow, ipaddr, username, clientid, access, topic) 
VALUES (1, NULL, '$all', NULL, 3, '%u/%c/#');
