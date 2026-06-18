#!/bin/bash

set -e

find kubernetes -name deployment.yaml | while read file
do
    echo "Updating $file"

    # Add version under metadata.labels
    sed -i '/^  labels:/a\    version: v1' "$file"

    # Add version under template.metadata.labels
    sed -i '/^      labels:/a\        version: v1' "$file"
done

echo "Done!"
