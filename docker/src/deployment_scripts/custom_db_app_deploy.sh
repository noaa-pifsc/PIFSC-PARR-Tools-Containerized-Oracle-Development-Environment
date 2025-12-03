#!/bin/sh

echo "running the custom database and/or application deployment scripts"

# run each of the sqlplus scripts to deploy the schemas, objects for each schema, applications, etc.
	echo "Create the DSC schemas"
	
	# change the directory to the DSC folder path so the SQL scripts can run without alterations
	cd ${DSC_FOLDER_PATH}

	# create the DSC schema(s)
sqlplus -s /nolog <<EOF
@dev_container_setup/create_docker_schemas.sql
$SYS_CREDENTIALS
EOF


	echo "Create the DSC objects"

	# change the directory to the DSC SQL folder to allow the scripts to run unaltered:
sqlplus -s /nolog <<EOF
@automated_deployments/deploy_dev_container.sql
$DSC_CREDENTIALS
EOF

	echo "the DSC objects were created"


	echo "SQL scripts executed successfully!"



	echo "Create the CAS/CAS_APX_APP schemas"


	# change the directory to the CAS folder path so the SQL scripts can run without alterations
	cd ${CAS_FOLDER_PATH}

# create the CAS schema(s)
sqlplus -s /nolog <<EOF
@dev_container_setup/create_docker_schemas.sql
$SYS_CREDENTIALS
EOF



	echo "Create the CAS objects"

# run the container database deployment script
sqlplus -s /nolog <<EOF
@automated_deployments/deploy_dev_container.sql
$CAS_CREDENTIALS
EOF

	echo "The CAS objects were created"


	echo "Create the CAS_APX_APP objects"

# run the container APEX app deployment script
sqlplus -s /nolog <<EOF
@automated_deployments/deploy_apex_dev_container.sql
$CAS_APP_CREDENTIALS
EOF

	echo "The CAS_APX_APP objects were created"






	echo "Create the PARR Tools schemas"


	# change the directory so the script can run without alterations
	cd ${PARR_TOOLS_FOLDER_PATH}

# create the PARR Tools schema(s)
sqlplus -s /nolog <<EOF
@dev_container_setup/create_docker_schemas.sql
$SYS_CREDENTIALS
EOF



	echo "Create the PICDM objects"

# run the container database deployment script
sqlplus -s /nolog <<EOF
@automated_deployments/deploy_dev_container.sql
$PICDM_CREDENTIALS
EOF

	echo "The PICDM objects were created"


	echo "Create the PDM objects"

# run the container APEX app deployment script
sqlplus -s /nolog <<EOF
@automated_deployments/deploy_apex_dev_container.sql
$PDM_CREDENTIALS
EOF

	echo "The PDM objects were created"




	echo "Create the ODS objects"

# run the container APEX app deployment script
sqlplus -s /nolog <<EOF
@automated_deployments/deploy_ODS_dev_container.sql
$PICDM_ODS_APP_CREDENTIALS
EOF

	echo "The ODS objects were created"





	echo "Create the UVM objects"

# run the container APEX app deployment script
sqlplus -s /nolog <<EOF
@automated_deployments/deploy_UVM_dev_container.sql
$PICDM_UVM_APP_CREDENTIALS
EOF

	echo "The UVM objects were created"


	echo "Create the BDM objects"

# run the container APEX app deployment script
sqlplus -s /nolog <<EOF
@automated_deployments/deploy_BDM_dev_container.sql
$PICDM_BDM_APP_CREDENTIALS
EOF

	echo "The BDM objects were created"



echo "custom deployment scripts have completed successfully"
