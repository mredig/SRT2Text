#!/bin/bash
set -e

# Get version from git tags
VERSION=$(git describe --tags --always --dirty 2>/dev/null || echo "unknown")

# Path to the version file
VERSION_FILE="Sources/SRT2TextLib/Version.swift"

# Update the version file
cat > "$VERSION_FILE" << EOF
extension SRTParser {
	public static let version = "$VERSION"
}
EOF

echo "Updated $VERSION_FILE with version: $VERSION"
