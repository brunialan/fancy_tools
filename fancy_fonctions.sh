
gco() {

 
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
        echo "Erreur : pas dans un dépôt Git."
        return 1
    }

  
    if [ -z "$1" ]; then
        echo "Usage: gco 'votre message'"
        return 1
    fi

  
    branch=$(git branch --show-current)

    
    git commit -m "[$branch] $1"
}
