# Mini-projet: Déployez une infra complète via Terraform

## Contexte
Il s'agit d'écrire plusieurs modules permettant de reproduire aisément le déploiement et d'exporter ensuite un certain nombre de métadonnées produites lors de l'exécution dans un fichier texte.

## Etapes à réaliser

- Ecrivez un module pour créer une instance ec2 utilisant la dernière version de ubuntu bionic (qui s’attachera l’ebs et l’ip publique) dont la taille et le tag seront variabilisés
- Ecrivez un module pour créer un volume ebs dont la taille sera variabilisée
- Ecrivez un module pour une ip publique (qui s’attachera la security group)
- Ecrivez un module pour créer une security qui ouvrira le 80 et 443
- Créez un dossier app qui va utiliser les 4 modules pour déployer une ec2, bien-sûr vous allez surcharger les variables afin de rendre votre application plus dynamique
- A la fin du déploiement, installez nginx et enregistrez l’ip publique dans un fichier nommé ip_ec2.txt (ces éléments sont à intégrer dans le rôle ec2)