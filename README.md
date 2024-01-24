# Norm Tool

The Norm Tool is a set of scripts designed to simplify code formatting using Norminette and a custom C code formatter. It includes two scripts, `norm.sh` and `norm_.sh`, along with aliases for easy access.

## Features

- `norm.sh`: Runs Norminette on C and header files within a specified directory.
- `fix_norm`: Activates a virtual environment and uses a custom C code formatter to fix code formatting issues.

## Installation

1. Run the setup script:

    ```bash
    bash install.sh
    ```

    This script will create aliases and install the necessary dependencies.

3. Restart your terminal or run:

    ```bash
    source ~/.bashrc  # or ~/.zshrc
    ```

## Usage

### Running Norminette

To run Norminette on C and header files within the current directory, use the `norm` command:

```bash
norm
```

### Formatting Code

To fix code formatting issues using the custom C code formatter, use the `fix_norm` alias:

```bash
fix_norm
```
