# PIFSC PARR Tools Containerized Oracle Developer Environment

## Overview
The PIFSC PARR Tools (PT) Containerized Oracle Developer Environment (PTCODE) project was developed to provide a custom containerized Oracle development environment (CODE) for the PT.  This repository can be forked to extend the existing functionality to any data systems that depend on the PT for both development and testing purposes.  

## Resources
-   ### PTCODE Version Control Information
    -   URL: https://github.com/noaa-pifsc/PIFSC-PARR-Tools-Containerized-Oracle-Development-Environment
    -   Version: 1.0 (git tag: PARR_Tools_CODE_v1.0)
    -   Upstream repository:
        -   CAS CODE (CCODE) Version Control Information:
            -   URL: https://github.com/noaa-pifsc/PIFSC-CAS-Containerized-Oracle-Development-Environment
            -   Version: 1.1 (git tag: CAS_CODE_v1.1)
-   ### PT Version Control Information
    -   URL: https://picgitlab.nmfs.local/centralized-data-tools/parr-tools
-   ### CAS Version Control Information
    -   URL: https://picgitlab.nmfs.local/centralized-data-tools/authorization-application-module
-   ### DSC Version Control Information
    -   URL: https://picgitlab.nmfs.local/centralized-data-tools/pifsc-dsc

## Prerequisites
-   See the CODE [Prerequisites](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#prerequisites) for details

## Repository Fork Diagram
-   See the CODE [Repository Fork Diagram](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#repository-fork-diagram) for details

## Runtime Scenarios
-   See the CODE [Runtime Scenarios](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#runtime-scenarios) for details

## Automated Deployment Process
-   ### Prepare the folder structure
    -   See the CODE [Prepare the folder structure](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#prepare-the-folder-structure) for details
    -   #### DSC Preparation
        -   The [SQL](https://picgitlab.nmfs.local/centralized-data-tools/pifsc-dsc/-/tree/main/SQL?ref_type=heads) folder is copied into a new "DSC" folder within the [docker/src](./docker/src) folder
    -   #### CAS Preparation
        -   The [CAS/SQL](https://picgitlab.nmfs.local/centralized-data-tools/authorization-application-module/-/tree/master/CAS/SQL?ref_type=heads) folder is copied into the [CAS folder](./docker/src/CAS) folder
        -   The [application_code](https://picgitlab.nmfs.local/centralized-data-tools/authorization-application-module/-/tree/master/CAS/application_code?ref_type=heads) folder is copied into the [CAS folder](./docker/src/CAS) folder
        -   The [SAM/SQL](https://picgitlab.nmfs.local/centralized-data-tools/authorization-application-module/-/tree/master/SAM/SQL?ref_type=heads) folder is copied into the [SAM folder](./docker/src/SAM) folder
    -   #### PT Preparation
        -   The [shared_SQL](https://picgitlab.nmfs.local/centralized-data-tools/parr-tools/-/tree/master/shared_SQL?ref_type=heads) folder is copied into the [parr-tools folder](./docker/src/parr-tools) folder
        -   The [PARR_dashboard/application_code](https://picgitlab.nmfs.local/centralized-data-tools/parr-tools/-/tree/master/PARR_dashboard/application_code?ref_type=heads) folder is copied into the [parr-tools folder](./docker/src/parr-tools) folder
        -   The [PARR_dashboard/SQL](https://picgitlab.nmfs.local/centralized-data-tools/parr-tools/-/tree/master/PARR_dashboard/SQL?ref_type=heads) folder is copied into the [parr-tools folder](./docker/src/parr-tools) folder
        -   The [ODS/SQL](https://picgitlab.nmfs.local/centralized-data-tools/parr-tools/-/tree/master/ODS/SQL?ref_type=heads) folder is copied into the [parr-tools folder](./docker/src/parr-tools) folder
        -   The [bulk_download/SQL](https://picgitlab.nmfs.local/centralized-data-tools/parr-tools/-/tree/master/bulk_download/SQL?ref_type=heads) folder is copied into the [parr-tools folder](./docker/src/parr-tools) folder
        -   The [data-set-access-verification/SQL](https://picgitlab.nmfs.local/centralized-data-tools/parr-tools/-/tree/master/data-set-access-verification/SQL?ref_type=heads) folder is copied into the [parr-tools folder](./docker/src/parr-tools) folder
-   ### Build and Run the Containers 
    -   See the CODE [Build and Run the Containers](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#build-and-run-the-containers) for details
    -   #### DSC Database Deployment
        -   [create_docker_schemas.sql](https://picgitlab.nmfs.local/centralized-data-tools/pifsc-dsc/-/blob/main/SQL/dev_container_setup/create_docker_schemas.sql?ref_type=heads) is executed by the SYS schema to create the DSC schema and grant the necessary privileges
        -   [deploy_dev_container.sql](https://picgitlab.nmfs.local/centralized-data-tools/pifsc-dsc/-/blob/main/SQL/automated_deployments/deploy_dev_container.sql?ref_type=heads) is executed with the DSC schema to deploy the objects to the DSC schema
    -   #### CAS Database and Application Deployment
        -   [create_docker_schemas.sql](https://picgitlab.nmfs.local/centralized-data-tools/authorization-application-module/-/blob/master/CAS/SQL/dev_container_setup/create_docker_schemas.sql?ref_type=heads) is executed to create the CAS schemas, roles, and APEX workspace
        -   [deploy_dev_container.sql](https://picgitlab.nmfs.local/centralized-data-tools/authorization-application-module/-/blob/master/CAS/SQL/automated_deployments/deploy_dev_container.sql?ref_type=heads) is executed with the CAS schema to deploy the objects to the CAS schema
        -   [deploy_apex_dev_container.sql](https://picgitlab.nmfs.local/centralized-data-tools/authorization-application-module/-/blob/master/CAS/SQL/automated_deployments/deploy_apex_dev_container.sql?ref_type=heads) is executed with the CAS_APX_APP schema to deploy the objects to the CAS_APX_APP schema and the app to the CAS_APX_APP APEX workspace
    -   #### PT Database and Applications Deployment
        -   [create_docker_schemas.sql](https://picgitlab.nmfs.local/centralized-data-tools/parr-tools/-/blob/master/shared_SQL/dev_container_setup/create_docker_schemas.sql?ref_type=heads) is executed to create the PT schemas, roles, and APEX workspace
        -   [deploy_dev_container.sql](https://picgitlab.nmfs.local/centralized-data-tools/parr-tools/-/blob/master/shared_SQL/automated_deployments/deploy_dev_container.sql?ref_type=heads) is executed to deploy the PICDM database schema objects
        -   [deploy_apex_dev_container.sql](https://picgitlab.nmfs.local/centralized-data-tools/parr-tools/-/blob/master/shared_SQL/automated_deployments/deploy_apex_dev_container.sql?ref_type=heads) is executed to deploy the PICDM Apex application
        -   [deploy_ODS_dev_container.sql](https://picgitlab.nmfs.local/centralized-data-tools/parr-tools/-/blob/master/shared_SQL/automated_deployments/deploy_ODS_dev_container.sql?ref_type=heads) is executed to deploy the Operational Data Store (ODS) database schema objects
        -   [deploy_UVM_dev_container.sql](https://picgitlab.nmfs.local/centralized-data-tools/parr-tools/-/blob/master/shared_SQL/automated_deployments/deploy_UVM_dev_container.sql?ref_type=heads) is executed to deploy the URL Verification Module (UVM) database schema objects
        -   [deploy_BDM_dev_container.sql](https://picgitlab.nmfs.local/centralized-data-tools/parr-tools/-/blob/master/shared_SQL/automated_deployments/deploy_BDM_dev_container.sql?ref_type=heads) is executed to deploy the Bulk Download Module (BDM) database schema objects

## Customization Process
-   ### Implementation
    -   \*Note: this process will fork the PTCODE parent repository and repurpose it as a project-specific CODE
    -   Fork [this repository](#ptcode-version-control-information)
    -   See the CODE [Implementation](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#implementation) for details
-   ### Upstream Updates
    -   See the CODE [Upstream Updates](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#upstream-updates) for details

## Container Architecture
-   See the CODE [container architecture documentation](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file/-/blob/main/README.md?ref_type=heads#container-architecture) for details

## Connection Information
-   See the CODE [connection information documentation](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file/-/blob/main/README.md?ref_type=heads#connection-information) for details
-   ### PT Database Connection Information
    -   Connection information can be found in [create_docker_schemas.sql](https://picgitlab.nmfs.local/centralized-data-tools/parr-tools/-/blob/master/shared_SQL/dev_container_setup/create_docker_schemas.sql?ref_type=heads)
-   ### CAS Database Connection Information
    -   Connection information can be found in [create_docker_schemas.sql](https://picgitlab.nmfs.local/centralized-data-tools/authorization-application-module/-/blob/master/CAS/SQL/dev_container_setup/create_docker_schemas.sql?ref_type=heads)
-   ### DSC Database Connection Information
    -   Connection information can be found in [create_docker_schemas.sql](https://picgitlab.nmfs.local/centralized-data-tools/pifsc-dsc/-/blob/main/SQL/dev_container_setup/create_docker_schemas.sql?ref_type=heads)