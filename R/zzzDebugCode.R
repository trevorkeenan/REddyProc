#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#+++ R script for deleting debugging code +++
#+++ Code used only for debugging can be written inside dummy functions .tmp.f().
#+++ With this script, these functions will be deleted on loading or sourcing the package.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Remove debugging code that is encapsulated in .tmp.f function blocks (to prevent R check complaints)
.tmp.f <- NULL	
