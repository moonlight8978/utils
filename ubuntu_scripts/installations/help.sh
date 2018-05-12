case "$1" in
  "install") echo "1. git"
    echo "2. zsh"
    echo "3. packages"
    echo "4. node"
    echo "5. rails"
    exit 1
    ;;
  "git") echo "1. ./git.sh"
    exit 1
    ;;
  "zsh") echo "1. ./oh-my-zsh.sh"
    echo "2. ./pure.sh"
    exit 1
    ;;
  "packages") echo "1. ./packages.sh"
    exit 1
    ;;
  "node") echo "1. ./node.sh"
    exit 1
    ;;
  "rails") echo "1. ./rails.sh"
    exit 1
    ;;
  \?) echo "Invalid command"
    exit 1
    ;;
esac
shift $((OPTIND - 1))
