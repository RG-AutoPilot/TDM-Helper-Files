# Step 1 - Reset Target environment
# This is to ensure we have a schema only target to subset and anonymize #
# There are many methods of creating a schema only database - In this example we use Flyway to achieve this #

# Flyway - Create difference script

flyway diff `
"-diff.source=Prod" `
"-environments.Prod.url=jdbc:mysql://localhost:3306" `
"-environments.Prod.schemas=sakila" `
"-environments.Prod.user=root" `
"-environments.Prod.password=Redg@te1" `
"-diff.target=Treated" `
"-environments.Treated.url=jdbc:mysql://localhost:3306" `
"-environments.Treated.schemas=sakila_treated" `
"-environments.Treated.user=root" `
"-environments.Treated.password=Redg@te1" `
"-diff.buildEnvironment=Build" `
"-environments.Build.url=jdbc:mysql://localhost:3306" `
"-environments.Build.schemas=sakila_shadow" `
"-environments.Build.user=root" `
"-environments.Build.password=Redg@te1" `
"-diff.rebuild=true" `
"-diff.includeFlywayObjects=true" `
"-diff.artifactFilename=C:\git\Demos\TDM-Helper-Files\CLI\Windows\MySQL\Artifact\MySQL-Diff-Script.zip"

# Flyway - Generate Deployment Script

flyway generate `
"-generate.target=Treated" `
"-generate.version=001" `
"-generate.description=DifferencesBetweenProdAndTreated" `
"-generate.location=C:\git\Demos\TDM-Helper-Files\CLI\Windows\MySQL\Artifact\" `
"-generate.artifactFilename=C:\git\Demos\TDM-Helper-Files\CLI\Windows\MySQL\Artifact\MySQL-Diff-Script.zip" `
"-generate.force=true"

# Flyway - Deploy changes, if any, to target

flyway deploy `
"-environment=Treated" `
"-environments.Treated.url=jdbc:mysql://localhost:3306" `
"-environments.Treated.schemas=sakila_treated" `
"-environments.Treated.user=root" `
"-environments.Treated.password=Redg@te1" `
"-deploy.scriptFilename=C:\git\Demos\TDM-Helper-Files\CLI\Windows\MySQL\Artifact\V001__DifferencesBetweenProdAndTreated.sql"