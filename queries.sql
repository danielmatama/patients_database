SELECT 
  p.name,
  t.name AS treatment_name,
  mh.admitted_at,
  i.total_amount
FROM 
  patients p
  INNER JOIN medical_histories mh ON p.id = mh.patient_id
  INNER JOIN treatments_medical_histories tmh ON mh.id = tmh.medical_history_id
  INNER JOIN treatments t ON tmh.treatment_id = t.id
  INNER JOIN invoices inv ON mh.id = i.medical_history_id
  INNER JOIN invoice_items inv_itm ON i.id = ii.invoice_id AND tmh.treatment_id = ii.treatment_id;
