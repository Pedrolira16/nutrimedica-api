CREATE TABLE IF NOT EXISTS users(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(250) NOT NULL,
	cpf VARCHAR(25) NOT NULL UNIQUE,
	email VARCHAR(250) NOT NULL UNIQUE,
	password VARCHAR(250) NOT NULL,
	cellphone VARCHAR(25) NOT NULL,
	cellphone_alternative VARCHAR(25),
	is_deleted BOOLEAN DEFAULT FALSE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS doctors (
    user_id INT PRIMARY KEY,
    council_name VARCHAR(25),
    council_state VARCHAR(25),
    council_number VARCHAR(25),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS receptionists (
    user_id INT PRIMARY KEY,
    shift VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id)
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

CREATE TABLE IF NOT EXISTS agenda_events(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(250) NOT NULL,
	duration INT NOT NULL,
	payment_method VARCHAR(25) NOT NULL,
	description TEXT,
	is_deleted BOOLEAN DEFAULT FALSE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS attendances(
	id INT AUTO_INCREMENT PRIMARY KEY,
	patient_id INT NOT NULL,
	user_id INT NOT NULL,
	place_id INT NOT NULL,
	agenda_event_id INT,
	done BOOLEAN DEFAULT FALSE,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	observation TEXT,
	is_deleted BOOLEAN DEFAULT FALSE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (patient_id) REFERENCES patients(id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (place_id) REFERENCES places(id),
	FOREIGN KEY (agenda_event_id) REFERENCES agenda_events(id)
);
