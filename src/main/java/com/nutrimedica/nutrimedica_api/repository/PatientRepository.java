package com.nutrimedica.nutrimedica_api.repository;

import com.nutrimedica.nutrimedica_api.dto.Patient;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public class PatientRepository {

    private final JdbcTemplate jdbcTemplate;

    public PatientRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void createPatient(Patient patient) {
        String sql = "INSERT INTO patients (name, cpf, email, cellphone, born_date, observation, blood_type)" +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql, patient.getName(), patient.getCpf(), patient.getEmail(), patient.getCellphone(),
                            patient.getBornDate(), patient.getObservation(), patient.getBloodType());
    }

    public Optional<Patient> findById(Long id) {
        String sql = "SELECT * FROM patients WHERE id = ?";
        return jdbcTemplate.query(
                sql,
                ps -> ps.setLong(1, id),
                rs -> rs.next()
                        ? Optional.of(new Patient(
                                rs.getLong("id"),
                                rs.getString("name"),
                                rs.getString("cpf"),
                                rs.getString("email"),
                                rs.getString("cellphone"),
                                rs.getDate("born_date").toLocalDate(),
                                rs.getString("observation"),
                                rs.getString("blood_type")
                        ))
                        : Optional.empty()
        );
    }

    public List<Patient> getPatients() {
        String sql = "SELECT * FROM patients";
        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> new Patient(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("cpf"),
                        rs.getString("email"),
                        rs.getString("cellphone"),
                        rs.getDate("born_date").toLocalDate(),
                        rs.getString("observation"),
                        rs.getString("blood_type")
                )
        );
    }

    public void deletePatient(Long id) {
        String sql = "DELETE FROM patients WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    public void updatePatient(Patient patient) {
        String sql = "UPDATE patients SET name = ?, cpf = ?, email = ?, cellphone = ?, born_date = ?, observation = ?, blood_type = ? WHERE id = ?";
        jdbcTemplate.update(sql, patient.getName(), patient.getCpf(), patient.getEmail(), patient.getCellphone(),
                            patient.getBornDate(), patient.getObservation(), patient.getBloodType(), patient.getId());
    }
}