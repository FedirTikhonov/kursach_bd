CREATE ROLE db_manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public to db_manager;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO db_manager;
SELECT table_schema as schema, table_name as table, privilege_type as privilege
FROM information_schema.table_privileges
WHERE grantee = 'db_manager';

CREATE ROLE db_viewer;
GRANT SELECT ON ALL TABLES IN SCHEMA public to db_viewer;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO db_viewer;
SELECT table_schema as schema, table_name as table, privilege_type as privilege
FROM information_schema.table_privileges
WHERE grantee = 'db_viewer';

