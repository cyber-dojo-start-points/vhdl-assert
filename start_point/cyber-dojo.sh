set -e

# --------------------------------------------------------------
# Text files under /sandbox are automatically returned...
source ~/cyber_dojo_fs_cleaners.sh
function cyber_dojo_exit()
{
  # 2. Remove text files we don't want returned.
  #cyber_dojo_delete_dirs ...
  cyber_dojo_delete_files work-obj93.cf
}
trap cyber_dojo_exit EXIT SIGTERM


ghdl import *.vhdl

# Scrapes the workspace file for all entity names
entities=$(grep entity work-obj93.cf | cut -d \  -f 4)
echo $entities

# Compilation step
compilation_successful=true
for entity in $entities; do
   echo "entity=:${entity}:"
   if ! ghdl make $entity; then
      compilation_successful=false
   fi
done

if [ "$compilation_successful" = false ] ; then
   echo "Encountered a compilation error"
   exit 42
fi

# Simulation step
simulation_successful=true
for entity in $entities; do
   if ! ghdl run $entity; then
      simulation_successful=false
   fi
done

if [ "$simulation_successful" = true ] ; then
   echo "All tests passed!"
   exit 0
fi

exit 42
