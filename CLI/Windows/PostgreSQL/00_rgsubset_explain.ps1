# Subset data using rgsubset
# This script demonstrates how to run the rgsubset CLI command with example values.
# For more details, visit: https://documentation.red-gate.com/testdatamanager
#
# Key Options:
#   --database-engine: The database engine to use (e.g., SqlServer, PostgreSql).
#   Connection String Documentation - https://documentation.red-gate.com/testdatamanager/command-line-interface-cli/database-connection-string-formats
#   --source-connection-string: Connection string for the source database. 
#   --target-connection-string: Connection string for the target database.
#   --options-file: Path to the JSON file containing subset options.
#   --log-level: Logging level (e.g., Verbose, Info, Error).
#

# Example values
$DB_ENGINE = "PostgreSQL"
$SOURCE_CONN_STRING = "Host=Localhost;Port=5432;Database=pagila_treated;User Id=postgres;Password=Redg@te1;" 
$OPTIONS_FILE = "C:\Users\redgate\Desktop\TDM\TDM-Helper-Files\CLI\Windows\PostgreSQL\subset-options.json"
$OUTPUT_FILE = "subset_log.json"
$OUTPUT = "Human" # Human|Json
$LOG_LEVEL = "Debug"

Write-Host "Running subset for database engine: $DB_ENGINE"

rgsubset explain `
  --database-engine $DB_ENGINE `
  --source-connection-string "$SOURCE_CONN_STRING" `
  --options-file "$OPTIONS_FILE" `
  --log-level $LOG_LEVEL `
  --output-file $OUTPUT_FILE `
  --output $OUTPUT