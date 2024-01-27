-- DROP ROLES
DROP ROLES
IF EXISTS 'read_only_classicmodels_db'@'%';

-- CHECK TO SEE GONE
SELECT user, show_db_priv, account_locked
FROM mysql.user;

-- CREATE ROLE
CREATE ROLE
IF NOT EXISTS
      'read_only_classicmodels_db', 'admin_user',
      'read_only_employees_db', 'app_user';

SELECT user, show_db_priv, account_locked
FROM mysql.user;
