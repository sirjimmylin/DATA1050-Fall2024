SELECT p.ssn, COUNT(DISTINCT alerts.id) AS alert_count
FROM physicians p
JOIN prescriptions pr ON p.ssn = pr.physician_id
JOIN alerts a ON pr.patient_id = a.patient_id AND pr.drug_name = a.drug2
GROUP BY p.ssn
ORDER BY alert_count DESC
LIMIT 1;
