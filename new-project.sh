#!/bin/bash

NAME="$1"

if [ -z "$NAME" ]; then
	echo "Использование: new-project.sh имя_проекта"
	exit 1
fi

if [ -e "$NAME" ]; then
	echo "Папка $NAME уже существует"
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
