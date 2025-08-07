# Step 1 - Reset Target environment
# This is to ensure we have a schema only target to subset and anonymize #
# There are many methods of creating a schema only database - In this example we use Flyway to achieve this #

flyway prepare deploy `
"-prepare.source=Prod" `
"-environments.Prod.url=jdbc:sqlserver://localhost;databaseName=NewWorldDB;encrypt=false;integratedSecurity=true;trustServerCertificate=true" `
"-environments.Prod.user=Redgate" `
"-environments.Prod.password=Redg@te1" `
"-prepare.target=Treated" `
"-environment=Treated" `
"-environments.Treated.url=jdbc:sqlserver://localhost;databaseName=NewWorldDB_Treated;encrypt=false;integratedSecurity=true;trustServerCertificate=true" `
"-environments.Treated.user=Redgate" `
"-environments.Treated.password=Redg@te1" `
"-prepare.scriptFilename=C:\Users\redgate\Desktop\TDM\TDM-Helper-Files\CLI\Windows\MSSQL\Artifact\Deploy_Script.sql" `
"-deploy.scriptFilename=C:\Users\redgate\Desktop\TDM\TDM-Helper-Files\CLI\Windows\MSSQL\Artifact\Deploy_Script.sql" `
"-prepare.force=true" 