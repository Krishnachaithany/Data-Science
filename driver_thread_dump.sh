#!/bin/bash

# Specify the output directory for the thread dumps
OUTPUT_DIR=/dbfs/path/to/output/

# Specify the interval between thread dump collections (in seconds)
COLLECTION_INTERVAL=60

# Create the output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Infinite loop to collect thread dumps
while true; do
  # Generate a unique filename for each thread dump
  TIMESTAMP=$(date +%Y%m%d%H%M%S)
  OUTPUT_FILE=$OUTPUT_DIR/thread_dump_$TIMESTAMP.txt

  # Trigger the thread dump collection
  kill -3 $(pgrep -f spark.driver.DatabricksDriver)

  # Wait for the thread dump to be generated
  sleep 5

  # Move the generated thread dump to the output file
  mv /databricks/driver/*.tdump $OUTPUT_FILE

  # Wait for the specified interval before collecting the next thread dump
  sleep $COLLECTION_INTERVAL
done
TION_INTERVAL
done
