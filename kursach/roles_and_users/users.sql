CREATE USER jeff;
ALTER USER jeff WITH ENCRYPTED PASSWORD '0000';
GRANT db_viewer TO jeff;

CREATE USER ryan;
ALTER USER ryan WITH ENCRYPTED PASSWORD '0000';
GRANT db_manager TO ryan;
