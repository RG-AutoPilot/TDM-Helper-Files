# Classify data using rganonymize
# This script demonstrates how to run the rganonymize CLI command with example values.
# For more details, visit: https://documentation.red-gate.com/testdatamanager
#
# Key Options:
#   --database-engine: The database engine to use (e.g., SqlServer, PostgreSql).
#   --connection-string: Connection string for the database.
#   --classification-file: Path to the JSON file containing classification rules.
#   --log-level: Logging level (e.g., Verbose, Info, Error).

# Example values
$DB_ENGINE = "Oracle"
$CONNECTION_STRING = "Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=PDBPROD)));User Id=hr;Password=hr;"
$CLASSIFICATION_FILE = "C:\Users\redgate\Desktop\TDM\TDM-Helper-Files\CLI\Windows\Oracle\classification.json"
$OUTPUT = "Human" # Human|Json
$LOG_LEVEL = "Verbose"

Write-Host "Running classification for database engine: $DB_ENGINE"

rganonymize classify `
  --database-engine $DB_ENGINE `
  --connection-string "$CONNECTION_STRING" `
  --classification-file $CLASSIFICATION_FILE `
  --output-all-columns `
  --log-level $LOG_LEVEL `
  --output $OUTPUT