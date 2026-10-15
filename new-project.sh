#!/bin/bash

NAME="$1"

if [ -z "$NAME" ]; then
	echo "Using: new-project.sh project_name"
	exit 1
fi

if [ -e "$NAME" ]; then
	echo "The forled $NAME is already exists"
	exit 1
fi

mkdir -p "$NAME/src" "$NAME/tests" "$NAME/docs"

touch "$NAME/src/main.py" "$NAME/tests/test_main.py" "$NAME/docs/.gitkeep"

cat > "$NAME/.gitignore" << 'EOF'
.venv/
__pycache__/
*.pyc
.env
EOF

echo "# $NAME" > "$NAME/README.md"

cd "$NAME" || exit 1

git init -q

git add .

git commit -m "Initial project structure" -q

echo "The project $NAME is ready to work"
