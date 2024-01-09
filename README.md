# Setting up PostgreSQL Database and Jupyter Notebook on VS Code

## Prerequisites
- Docker installed
- Visual Studio Code installed
- Poetry installed (for managing Python dependencies)

## Step 1: Create Docker Volume
```bash
make volume-create
```

## Step 2: Run PostgreSQL container
```bash
make postgres-up
```

## Step 3: Install Python Dependencies
```bash
poetry install
```

## Step 4: Install Jupyter extension for VS Code
- Open VS Code
- Go to Extensions
- Search for "Jupyter" and install the extension

## Step 5: Execute QUeries in Jupyter notebook
- Open *notebook.ipynb* in VS Code
- Click on "Run All" to execute all cells from the given notebook

You have now successfully set up a PostgreSQL database container and an interactive Jupyter Notebook on Visual Studio Code.