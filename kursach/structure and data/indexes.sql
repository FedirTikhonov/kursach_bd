CREATE INDEX client_name_scan ON clients(name);

EXPLAIN SELECT * FROM clients WHERE name = 'client_name_1001';

DROP INDEX client_name_scan;










