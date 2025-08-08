# Map data using rganonymize
# This script demonstrates how to run the rganonymize CLI command with example values.
# For more details, visit: https://documentation.red-gate.com/testdatamanager
#
# Key Options:
#   --classification-file: Path to the JSON file containing classification rules.
#   --masking-file: Path to the JSON file where masking rules will be generated.

# Example values
$CLASSIFICATION_FILE = "C:\git\Demos\TDM-Helper-Files\CLI\Windows\MySQL\classification.json"
$MASKING_FILE = "C:\git\Demos\TDM-Helper-Files\CLI\Windows\MySQL\masking.json"
$OUTPUT = "Human" # Human|Json

Write-Host "Running mapping from classification file to masking file"

rganonymize map `
  --classification-file $CLASSIFICATION_FILE `
  --masking-file $MASKING_FILE `
  --output $OUTPUT