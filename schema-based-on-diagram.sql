CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INTEGER REFERENCES patients(id),
  status VARCHAR(255) NOT NULL
);

CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL
);

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL(10, 2) NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  medical_history_id INTEGER REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL(10, 2) NOT NULL,
  quantity INTEGER NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  invoice_id INTEGER REFERENCES invoices(id),
  treatment_id INTEGER REFERENCES treatments(id)
);

CREATE TABLE treatments_medical_histories (
  treatment_id INTEGER REFERENCES treatments(id),
  medical_history_id INTEGER REFERENCES medical_histories(id),
  PRIMARY KEY (treatment_id, medical_history_id)
);

CREATE INDEX mh_patientid_asc ON medical_histories (patient_id ASC);

CREATE INDEX tr_historyid_asc ON treatment_medical_histories (medical_history_id  ASC);

CREATE INDEX tr_treatmentid_asc ON treatment_medical_histories (treatment_id  ASC);

CREATE INDEX invoices_mhistoryid_asc ON invoices (medical_history_id ASC);

CREATE INDEX invitems_invid_asc ON invoice_items (invoice_id ASC);

CREATE INDEX invitems_treatmentid_asc ON invoice_items (treatment_id ASC);
