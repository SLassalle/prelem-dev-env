# 🧪 prelem-dev-env

![CI](https://github.com/votre-org/prelem-dev-env/actions/workflows/validate-dev-env.yml/badge.svg)


Environnement de développement local pour l’application web 3-tiers :

- **Frontend** : Vue.js (Vite)
- **Backend** : WordPress headless
- **Base de données** : MySQL
- **Interface BDD** : PhpMyAdmin

Ce dépôt contient la configuration Docker pour lancer l’environnement complet en local avec une seule commande.

---

## ⚙️ Prérequis

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- Accès aux dépôts suivants :
  - [`prelem-frontend`](https://github.com/SLassalle/prelem-frontend)
  - [`prelem-backend-wordpress`](https://github.com/SLassalle/prelem-backend-wordpress)

---

## 🚀 Démarrage rapide

### 1. Cloner ce dépôt

```bash
git clone git@github.com:SLassalle/prelem-dev-env.git
cd prelem-dev-env
```

### 2. Cloner les projets frontend et backend

```bash
git clone git@github.com:SLassalle/prelem-frontend.git frontend
git clone git@github.com:SLassalle/prelem-backend-wordpress.git backend-wordpress
```

### 3. Lancer l’environnement complet

```bash
./scripts/start.sh
```

Ce script :

- Copie automatiquement .env.example en .env s’il n’existe pas
- Lance docker-compose up --build
- Rassemble tous les services dans un même réseau Docker

## 🌐 Accès aux services

Une fois l’environnement lancé, les services sont disponibles aux adresses suivantes :

| Service         | URL                         |
|------------------|-----------------------------|
| Frontend (Vue)   | http://localhost:5173       |
| WordPress        | http://localhost:8080       |
| PhpMyAdmin       | http://localhost:8081       |

---

## 🧾 Variables d’environnement

Aucune action manuelle n’est nécessaire :  
Le script `start.sh` copie automatiquement le fichier `.env.example` vers `.env` s’il n’existe pas.

### Exemple de contenu de `.env.example` :

```dotenv
# Base de données
MYSQL_DATABASE=wordpress
MYSQL_USER=wp
MYSQL_PASSWORD=wp
MYSQL_ROOT_PASSWORD=root

# Ports d'accès
MYSQL_PORT=3306
WORDPRESS_PORT=8080
FRONTEND_PORT=5173
PHPMYADMIN_PORT=8081
```

Tu peux modifier ces valeurs dans .env après sa génération.

## ✅ Bonnes pratiques

- Ne versionne jamais :
  - `.env`
  - `node_modules/`
  - `uploads/` ou tout contenu dynamique
- Ne monte **que** le dossier `wp-content` dans WordPress :
  - `/var/www/html/wp-content`
  - Cela permet de conserver le core WordPress à jour
- Mets toujours à jour le fichier `.env.example` si tu ajoutes une variable
- Garde les ports personnalisables via `.env` pour éviter les conflits sur différentes machines
- Utilise des branches (`feature/*`) et des commits clairs (`feat:`, `chore:`, etc.)

---

## 🧹 Nettoyage de l’environnement

Pour arrêter et supprimer tous les conteneurs, réseaux, et volumes persistants :

```bash
docker-compose down -v
```
Pour relancer proprement :

```bash
docker-compose up --build
```

---

## 👨‍💻 Workflow Git recommandé

Pour assurer un développement fluide et cohérent dans toute l’équipe, voici les conventions Git appliquées à ce projet :

### 🔀 Branches principales

| Branche | Rôle                                               |
|---------|-----------------------------------------------------|
| `main`  | Code stable validé, utilisé pour le déploiement recette/prod |
| `dev`   | Intégration des fonctionnalités en cours de développement    |

---

### 🛠️ Branches de travail

Chaque développeur crée une branche spécifique pour son développement :

```bash
git checkout -b feature/nom-fonctionnalite
```

🔁 Les branches doivent suivre ces préfixes :

- feature/ : ajout de fonctionnalité
- fix/ : correction de bug
- chore/ : tâches techniques (scripts, config…)
- test/ : ajout ou amélioration des tests

### 🚀 Exemple de workflow complet

```bash
# Je crée ma branche à partir de dev
git checkout dev
git pull origin dev
git checkout -b feature/ajout-navbar

# Je code, puis je commit
git add .
git commit -m "feat: ajout d'un composant Navbar"

# Je pousse ma branche sur GitHub
git push origin feature/ajout-navbar
```

### 🔁 Ouverture d'une Pull Request (PR)

- Base : dev
- Titre clair (ex: feat: ajout Navbar)
- Description du changement
- Attendre une validation avant merge

### ✅ Validation automatique (CI/CD)

Chaque PR déclenche :

- Lint (npm run lint)
- Tests unitaires (npm run test)
- Build du projet (npm run build)
- (bientôt) Analyse SonarQube

### 📦 Fusion vers main

Une fois que dev est stable :

- Une PR dev → main est créée
- Cela déclenche un déploiement automatique en environnement recette

---

## 🔗 Liens utiles

- [prelem-frontend](https://github.com/SLassalle/prelem-frontend)
- [prelem-backend-wordpress](https://github.com/SLassalle/prelem-backend-wordpress)
- (bientôt) [prelem-infrastructure](#)