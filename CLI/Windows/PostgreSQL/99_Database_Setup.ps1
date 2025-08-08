# Step 1 - Reset Target environment
# This is to ensure we have a schema only target to subset and anonymize #
# There are many methods of creating a schema only database - In this example we use Flyway to achieve this #

# Flyway - Create difference script

flyway clean `
"-environment=Treated" `
"-environments.Treated.url=jdbc:postgresql://localhost:5432/pagila_treated" `
"-environments.Treated.user=postgres" `
"-environments.Treated.password=Redg@te1" `
-schemas="pagila,public" `
-cleanDisabled='false'

flyway deploy `
"-environment=Treated" `
"-environments.Treated.url=jdbc:postgresql://localhost:5432/pagila_treated" `
"-environments.Treated.user=postgres" `
"-environments.Treated.password=Redg@te1" `
"-deploy.scriptFilename=C:\git\Demos\TDM-Helper-Files\CLI\Windows\PostgreSQL\pagila-schema-only.sql"

flyway diff `
"-diff.source=Prod" `
"-environments.Prod.url=jdbc:postgresql://localhost:5432/pagila_dev" `
"-environments.Prod.user=postgres" `
"-environments.Prod.password=Redg@te1" `
"-diff.target=Treated" `
"-environments.Treated.url=jdbc:postgresql://localhost:5432/pagila_treated" `
"-environments.Treated.user=postgres" `
"-environments.Treated.password=Redg@te1" `
"-diff.buildEnvironment=Build" `
"-environments.Build.url=jdbc:postgresql://localhost:5432/pagila_shadow" `
"-environments.Build.user=postgres" `
"-environments.Build.password=Redg@te1" `
"-diff.rebuild=true" `
"-diff.includeFlywayObjects=true" `
"-diff.artifactFilename=C:\git\Demos\TDM-Helper-Files\CLI\Windows\PostgreSQL\Artifact\PostgreSQL-Diff-Script.zip"

# Flyway - Generate Deployment Script

flyway generate `
"-generate.target=Treated" `
"-generate.version=001" `
"-generate.description=DifferencesBetweenProdAndTreated" `
"-generate.location=C:\git\Demos\TDM-Helper-Files\CLI\Windows\PostgreSQL\Artifact\" `
"-generate.artifactFilename=C:\git\Demos\TDM-Helper-Files\CLI\Windows\PostgreSQL\Artifact\PostgreSQL-Diff-Script.zip" `
"-generate.force=true"

# Flyway - Deploy changes, if any, to target

flyway deploy `
"-environment=Treated" `
"-environments.Treated.url=jdbc:postgresql://localhost:5432/pagila_treated" `
"-environments.Treated.user=postgres" `
"-environments.Treated.password=Redg@te1" `
"-deploy.scriptFilename=C:\git\Demos\TDM-Helper-Files\CLI\Windows\PostgreSQL\Artifact\V001__DifferencesBetweenProdAndTreated.sql"