CREATE TABLE IF NOT EXISTS users(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(250) NOT NULL,
	cpf VARCHAR(25) NOT NULL UNIQUE,
	email VARCHAR(250) NOT NULL UNIQUE,
	password VARCHAR(250) NOT NULL,
	cellphone VARCHAR(25) NOT NULL,
	specialty VARCHAR(250) NOT NULL,
	council_name VARCHAR(25),
	council_state VARCHAR(25),
	council_number VARCHAR(25),
	is_deleted BOOLEAN DEFAULT FALSE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS patients(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(250) NOT NULL,
	cpf  VARCHAR(25) NOT NULL,
	email VARCHAR(250) NOT NULL,
	cellphone VARCHAR(25) NOT NULL,
	born_date DATE NOT NULL,
	observation TEXT,
	blood_type VARCHAR(25),
	is_deleted BOOLEAN DEFAULT FALSE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS places(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(250) NOT NULL,
	address_cep VARCHAR(25) NOT NULL,
	address VARCHAR(250) NOT NULL,
	address_number VARCHAR(25) NOT NULL,
	address_district VARCHAR(250) NOT NULL,
	address_city VARCHAR(250) NOT NULL,
	address_state VARCHAR(25) NOT NULL,
	address_complement VARCHAR(250),
	is_deleted BOOLEAN DEFAULT FALSE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


