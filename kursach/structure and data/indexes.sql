EXPLAIN SELECT * FROM clients_to_optimise WHERE name = 'client_name_1999';

CREATE INDEX client_name_scan ON clients_to_optimise(name);

EXPLAIN SELECT * FROM clients_to_optimise WHERE passport = '111111111';

DROP INDEX client_name_scan;










