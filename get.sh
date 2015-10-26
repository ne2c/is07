__check_environment() {
  if [ -z "$PROJECTNAME" ]; then
    echo "The project name must be set."
    return 1
  else
    REPO_HTTPS=https://github.com/ne2c/is07-$PROJECTNAME.git
    REPO_SSH=git@github.com:ne2c/is07-$PROJECTNAME.git
    if ! wget --quiet --spider ${REPO_HTTPS%.*}; then
      echo "The specified project name does not exist."
      return 1
    fi
  fi
}
__setup_project() {
  if [ $? -eq 0 ]; then
    git clone $REPO_HTTPS .
  fi
}
# Function calls
__check_environment
__setup_project