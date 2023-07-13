#!/bin/bash

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Save the norm script
cat > norm.sh << 'EOF'
#!/bin/bash

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

parent_dir="."  # Change this to the desired parent directory

norminette_files() {
    find "$parent_dir" -type f \( -name "*.c" -o -name "*.h" \) | while read -r file; do
        output=$(norminette "$file" 2>&1)
        if [ $? -eq 0 ]; then
            printf "${GREEN}File: %s${NC}" "$output"
        else
            printf "${RED}File: %s${NC}" "$output"
        fi
        echo
    done
}

norminette_files
EOF

# Move the norm script to a directory in PATH
mkdir -p ~/.norm
mv norm.sh ~/.norm

# Make the script executable
chmod +x ~/.norm/norm.sh

# Add the alias to .bashrc (Bash) or .zshrc (Zsh)
echo "alias norm=\"~/.norm/norm.sh\"" >> ~/.bashrc
echo "alias norm=\"~/.norm/norm.sh\"" >> ~/.zshrc

echo -e "${GREEN}The 'norm' tool has been installed successfully.${NC}"
echo -e "${GREEN}You can now use 'norm' command to run the norminette on files.${NC}"