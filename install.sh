#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

cat > ~/.norm/norm.sh << 'EOF'
#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

parent_dir="."  # Change this to the desired parent directory

norminette_files() {
    find "$parent_dir" -type f \( -name "*.c" -o -name "*.h" \) | while read -r file; do
        output=$(norminette "$file" 2>&1)
        if [ $? -eq 0 ]; then
            printf "${GREEN}File: %s ✔️${NC}\n" "$file"
        else
            printf "${RED}File: %s${NC}\n" "$file"
        fi
    done
}

norminette_files
EOF

cat > ~/.norm/norm_.sh << 'EOF'
#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

python3 -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip
pip3 install c-formatter-42
COMMAND="c_formatter_42"

norm() {
    find . -type f \( -name "*.c" -o -name "*.h" \) | while read -r FILE; do
        TMP_FILE="${FILE}.tmp"
        $COMMAND < "$FILE" > "$TMP_FILE" 2>&1
        if [ $? -eq 0 ]; then
            mv "$TMP_FILE" "$FILE"
            printf "${GREEN}Success${NC} - ${FILE} ✔️\n"
        else
            printf "${RED}Error${NC} - ${FILE}\n"
            rm "$TMP_FILE"
        fi
    done
    echo "Processing complete."
}

deactivate
rm -rf venv
EOF

mkdir -p ~/.norm
chmod +x ~/.norm/norm.sh
chmod +x ~/.norm/norm_.sh

echo "alias norm=\"~/.norm/norm.sh\"" >> ~/.bashrc
echo "alias norm=\"~/.norm/norm.sh\"" >> ~/.zshrc
echo "alias fix_norm=\"~/.norm/norm_.sh\"" >> ~/.bashrc
echo "alias fix_norm=\"~/.norm/norm_.sh\"" >> ~/.zshrc

echo -e "${GREEN}The 'norm' tool has been installed successfully. ✔️${NC}"
echo -e "${GREEN}The 'fix_norm' tool has been installed successfully. ✔️${NC}"
echo -e "You can now use 'norm' command to run the norminette on files."
echo -e "You can now use 'fix_norm' command to fix the norminette on files."
