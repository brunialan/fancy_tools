gco() {

    # Vérifie si on est dans un dépôt git
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
        echo "Erreur : pas dans un dépôt Git."
        return 1
    }

    # Vérifie si message vide
    if [ -z "$1" ]; then
        echo "Usage: gco 'votre message'"
        return 1
    fi

    # Récupère la branche actuelle
    branch=$(git branch --show-current)

    # Commit avec préfixe automatique
    git commit -m "[$branch] $1"
}
