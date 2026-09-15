# This is the main script orchestrating the whole set up of a new VM from scratch

path_scripts=$(dirname "$0")

echo 
echo "setting up new VM from scratch"
echo "=============================="
echo

chmod a+x $path_scripts/*.sh  # make sure all bash scripts are executable

# check config can be read, otherwise exit without further action
$path_scripts/get_config.sh || exit $?

$path_scripts/update_python.sh
$path_scripts/install_ecmwf_libs.sh
$path_scripts/install_podman.sh
$path_scripts/update_tropoe.sh
$path_scripts/install_mwr_l12l2.sh
$path_scripts/mars_setup.sh
$path_scripts/install_s3.sh
#$path_scripts/s3_create_buckets.sh eprofile-mwr-l1 eprofile-mwr-l2 eprofile-alc-l2  # comment this out if buckets alredy exist
#$path_scripts/s3_automount_buckets.sh eprofile-mwr-l1 eprofile-mwr-l2 eprofile-alc-l2 eprofile-ecmwf-data
$path_scripts/import_eprofile_config.sh
#$path_scripts/write_cron.sh
echo "Notification not yet included in this deployement script, please don't forget to do this !"
