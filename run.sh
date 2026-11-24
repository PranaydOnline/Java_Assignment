#!/bin/bash
set -e

# Detect or set JAVA_HOME if not already set
if [ -z "$JAVA_HOME" ]; then
    if [ -d "/Library/Java/JavaVirtualMachines/jdk-25.jdk/Contents/Home" ]; then
        export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-25.jdk/Contents/Home"
    elif command -v /usr/libexec/java_home >/dev/null 2>&1; then
        export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null || true)
    fi
fi

if [ -n "$JAVA_HOME" ]; then
    export PATH="$JAVA_HOME/bin:$PATH"
fi

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_ROOT"

echo "=========================================="
echo "1. Adapter Pattern (adapter.Main)"
echo "=========================================="
javac adapter/*.java
java adapter.Main

echo ""
echo "=========================================="
echo "2. Bridge Pattern (bridge.Main)"
echo "=========================================="
javac bridge/*.java
java bridge.Main

echo ""
echo "=========================================="
echo "3. Singleton Pattern (singleton/Main)"
echo "=========================================="
(cd singleton && javac *.java && java Main)

echo ""
echo "=========================================="
echo "4. Singleton Race Demo (singleton/threadexample)"
echo "=========================================="
(cd singleton/threadexample && javac *.java && java Stage4RaceDemo)
