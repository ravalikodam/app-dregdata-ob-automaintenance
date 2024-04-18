Auto-Maintenance | RDS Domain
--------------------------------------------------------------------------------------------------------------------------------------------------------

**Getting Started:**
---------------------
This repository is used to version control the automation scripts created for auto-maintenance activity within RDS domain. The automation scripts are stored in the feature branch (i.e., ````develop````).

**Repository Structure:**
-------------------------

- `.github`: This directory contains folders with Bash scripts specifically designed for log cleanup within the RDS domain.
  - `workflows`: This directory is structured with both scripts and inventory folders to facilitate log cleanup tasks.
- `scripts`: This directory houses an automated Bash script tailored for log cleanup operations.
- `inventory`: This directory further divides into servers and config subdirectories to organize server details and configuration files.
  - `servers`: Inside this subdirectory, you'll find a file named **env.conf** that holds essential server details required for executing log cleanup tasks.
  - `config` : Within this subdirectory, there's a file named **vars.conf**. This file contains the necessary variables such as log paths and log file names that are crucial for the log cleanup process.
  
**Prerequisites:**
-------------------
Git/Git Bash

**Installation:**
--------------------
Before you can clone a GitHub repository, ensure that Git is installed on your machine. You can download Git from [Git official website](https://git-scm.com/downloads) and follow the installation instructions for your operating system.

**Usage:**
-------------
1. Open a Linux Terminal.
2. Ensure that you have the necessary permissions to access the repository.
3. Navigate to the Directory Where You Want to Clone the Repository: Use the `cd` command to navigate to the directory where you want to store the cloned repository. For example: 
   ```bash
   cd path/to/your/directory
   ```
4. Clone the Repository: Copy the following command and paste it into your terminal or command prompt. Press Enter to execute the command: 
   ```bash
   git clone https://github.com/ravalikodam/app-dregdata-ob-housekeeping-maintenance.git
   ```
   (i.e., This command instructs Git to clone the repository located at the specified URL).

5. Wait for the Cloning to Complete: Git will download all the files from the repository to your local machine. Wait for the process to complete.
6. Access the Cloned Repository: Once the cloning is finished, you can navigate into the cloned repository using the following command: 
   ```bash
   cd app-dregdata-ob-housekeeping-maintenance
   ```
7. Access the script specific to the individual task and make the necessary configuration changes in the config section as per the requirement.

**References/Documentations:**
------------------------------
Please refer to the documentation: https://cuscal.atlassian.net/wiki/spaces/EEP/pages/11456315418/Mock+Register+Logs+Clean-up+RDS+Domain

**Contributing:**
-------------------
Contributor: Engineering Environment Team
