#!/bin/bash

	# define the database scripts mapping using the pipe character as a delimiter
	# The elements should contain encoded values with the "|" character as the delimiter: sql path (within container)|sql script file|User Secret Name|Password Secret Name|Script Password Secrets (this can be one or more optional pipe-delimited secret names when a password is injected into the script - examples include a CREATE USER command) 

	# create the schemas, apex workspace, and apex developer account
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/PARR-Tools/modules/PARR-Tools/shared_SQL|@dev_container_setup/create_docker_schemas.sql|oracle_admin_user|oracle_pwd|picdm_pwd|picdm_bdm_pwd|picdm_uvm_pwd|picdm_app_pwd|picdm_ods_pwd|picdm_apx_user|picdm_apx_pwd")
	
	# deploy the data schema objects
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/PARR-Tools/modules/PARR-Tools/shared_SQL|@automated_deployments/deploy_dev_container.sql|picdm_user|picdm_pwd")

	# deploy the apex app schema objects and app
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/PARR-Tools/modules/PARR-Tools/shared_SQL|@automated_deployments/deploy_apex_dev_container.sql|picdm_app_user|picdm_app_pwd")

	# deploy ODS schema objects
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/PARR-Tools/modules/PARR-Tools/shared_SQL|@automated_deployments/deploy_ODS_dev_container.sql|picdm_ods_user|picdm_ods_pwd")

	# deploy UVM schema objects
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/PARR-Tools/modules/PARR-Tools/shared_SQL|@automated_deployments/deploy_UVM_dev_container.sql|picdm_uvm_user|picd_uvm_pwd")

	# deploy BDM schema objects
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/PARR-Tools/modules/PARR-Tools/shared_SQL|@automated_deployments/deploy_BDM_dev_container.sql|picdm_bdm_user|picdm_bdm_pwd")


	# define the array of compose files that are used by the individual projects (specify the path relative to the core/build directory
	COMPOSE_FILES+=("../../projects/PARR-Tools/build/parr_tools_secrets.yml")
	
	# add the secrets
	SECRET_MAPPING_ARR+=(
		["picdm_user"]="PICDM_USER"
		["picdm_pwd"]="PICDM_PWD"
		["picdm_app_user"]="PICDM_APP_USER"
		["picdm_app_pwd"]="PICDM_APP_PWD"
		["picdm_apx_user"]="PICDM_APX_USER"
		["picdm_apx_pwd"]="PICDM_APX_PWD"
		["picdm_ods_user"]="PICDM_ODS_USER"
		["picdm_ods_pwd"]="PICDM_ODS_PWD"
		["picdm_uvm_user"]="PICDM_UVM_USER"
		["picdm_uvm_pwd"]="PICDM_UVM_PWD"
		["picdm_bdm_user"]="PICDM_BDM_USER"
		["picdm_bdm_pwd"]="PICDM_BDM_PWD"
	)
	
	