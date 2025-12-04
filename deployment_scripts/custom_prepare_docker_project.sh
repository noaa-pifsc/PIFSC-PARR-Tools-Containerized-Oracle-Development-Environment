#! /bin/sh

echo "running custom scripts to prepare the docker project"

# load the project configuration script to set the runtime variable values
source ./sh_script_config/custom_project_config.sh

	echo "clone the DSC project's dependencies"

	git clone $dsc_git_url ../tmp/pifsc-dsc

	echo "copy the docker files from the repository to the docker/src subfolder"

	# copy the docker files from the repository to the docker/src subfolder
	cp -r ../tmp/pifsc-dsc/SQL ../docker/src/DSC/SQL

	echo "The DSC project's dependencies have been added to the docker/src folder"



	echo "clone the CAS project's dependencies"

	git clone $cas_git_url ../tmp/authorization-application-module

	echo "copy the docker files from the repository to the docker/src subfolder"

	# copy the docker files from the repository to the docker subfolder
	cp -r ../tmp/authorization-application-module/CAS/application_code ../docker/src/CAS/application_code

	# copy the docker files from the repository to the docker subfolder
	cp -r ../tmp/authorization-application-module/CAS/SQL ../docker/src/CAS/SQL

	# copy the docker files from the repository to the docker subfolder
	cp -r ../tmp/authorization-application-module/SAM/SQL ../docker/src/SAM/SQL

	echo "The CAS project's dependencies have been added to the docker/src subfolder"


	echo "clone the parr-tools project's dependencies"

	git clone $parr_tools_git_url ../tmp/parr-tools

	echo "create the parr-tools subdirectories"

	mkdir -p ../docker/src/parr-tools/PARR_dashboard
	mkdir -p ../docker/src/parr-tools/ODS
	mkdir -p ../docker/src/parr-tools/bulk_download/
	mkdir -p ../docker/src/parr-tools/data-set-access-verification

	echo "copy the docker files from the repository to the docker/src/parr-tools subfolder"
	# copy the docker files from the repository to the parr-tools subfolder
	cp -r ../tmp/parr-tools/shared_SQL ../docker/src/parr-tools/shared_SQL

	cp -r ../tmp/parr-tools/PARR_dashboard/application_code ../docker/src/parr-tools/PARR_dashboard/application_code

	cp -r ../tmp/parr-tools/PARR_dashboard/SQL ../docker/src/parr-tools/PARR_dashboard/SQL

	cp -r ../tmp/parr-tools/ODS/SQL ../docker/src/parr-tools/ODS/SQL

	cp -r ../tmp/parr-tools/bulk_download/SQL ../docker/src/parr-tools/bulk_download/SQL

	cp -r ../tmp/parr-tools/data-set-access-verification/SQL ../docker/src/parr-tools/data-set-access-verification/SQL

	echo "The parr-tools project's dependencies have been added to the docker/src subfolder"

echo "finished executing custom scripts to prepare the docker project"