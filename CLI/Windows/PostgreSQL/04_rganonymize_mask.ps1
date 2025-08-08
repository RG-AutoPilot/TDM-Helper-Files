# Mask data using rganonymize
# This script demonstrates how to run the rganonymize CLI command with example values.
# For more details, visit: https://documentation.red-gate.com/testdatamanager
#
# Key Options:
#   --database-engine: The database engine to use (e.g., SqlServer, PostgreSql).
#   --connection-string: Connection string for the database.
#   --masking-file: Path to the JSON file containing masking rules.
#   --log-level: Logging level (e.g., Verbose, Info, Error).

# Example values
$DB_ENGINE = "PostgreSQL"
$CONNECTION_STRING = "Host=Localhost;Port=5432;Database=pagila_treated;User Id=postgres;Password=Redg@te1;"
$MASKING_FILE = "C:\git\Demos\TDM-Helper-Files\CLI\Windows\PostgreSQL\masking.json"
$OPTIONS_FILE = "C:\git\Demos\TDM-Helper-Files\CLI\Windows\PostgreSQL\masking-options.json"
$OUTPUT = "Human" # Human|Json
# https://documentation.red-gate.com/testdatamanager/command-line-interface-cli/anonymization/masking/enabling-deterministic-masking
$DETERMINISTIC_SEED="my-secret-seed" # Can be any string, but must be at least 4 characters long
$LOG_LEVEL = "Verbose"

Write-Host "Running masking for database engine: $DB_ENGINE"

rganonymize mask `
  --database-engine $DB_ENGINE `
  --connection-string "$CONNECTION_STRING" `
  --masking-file $MASKING_FILE `
  --options-file "$OPTIONS_FILE" `
  --deterministic-seed "$DETERMINISTIC_SEED" `
  --log-level $LOG_LEVEL `
  --output $OUTPUT