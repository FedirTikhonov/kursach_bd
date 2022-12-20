CREATE INDEX client_name_scan ON clients(passport);

EXPLAIN SELECT * FROM clients WHERE passport = '111111111';

DROP INDEX client_name_scan;










