flyway undo

flyway migrate

flyway -dryRunOutput='test.sql' migrate

flyway -skipCheckForUpdate migrate

flyway -validateOnMigrate=false migrate


flyway -skipCheckForUpdate -validateOnMigrate=false migrate


flyway -executeInTransaction="false" migrate


flyway check -changes "-check.buildUrl=jdbc:sqlserver://localhost;authentication=sqlPassword;databaseName=ADW_Check;encrypt=true;integratedSecurity=false;trustServerCertificate=true" "-check.reportFilename=checkreport.html"

flyway check -code "-check.buildUrl=jdbc:sqlserver://localhost;authentication=sqlPassword;databaseName=ADW_Check;encrypt=true;integratedSecurity=false;trustServerCertificate=true" "-check.reportFilename=codereport.html"

