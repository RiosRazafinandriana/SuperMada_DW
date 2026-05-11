# 📊 SuperMada : Plateforme d'Analyse de Performance des Ventes

> Ce projet est une solution complète de **Business Intelligence**. Il transforme des données brutes (fichiers CSV) en un tableau de bord interactif permettant de piloter l'activité commerciale d'une chaîne de magasins.

---

## 🚀 Vue d'ensemble

L'objectif est d'automatiser le nettoyage des données de ventes et de les structurer pour répondre à des questions stratégiques : Quel magasin performe le mieux ? Quel est le panier moyen ? Quels sont les produits phares ?

### La chaîne de valeur (Pipeline)

| Étape | Description |
|-------|-------------|
| **Sources** | Fichiers CSV (Ventes, Produits, Magasins, Clients) |
| **Traitement (ETL)** | Utilisation d'Apache Hop pour nettoyer les erreurs et calculer les montants |
| **Stockage** | Base de données PostgreSQL structurée en "schéma en étoile" |
| **Visualisation** | Tableau de bord interactif avec Apache Superset |

---

## 🛠️ Architecture Technique

### 1. Intégration des données (Apache Hop)

Le projet utilise un **Workflow automatisé** qui gère les dépendances :

- **Nettoyage** : Gestion des clients anonymes et correction des formats de dates.
- **Calculs** : Génération automatique d'un calendrier sur 10 ans et calcul du chiffre d'affaires.
- **Sécurité** : Vérification des relations entre les tables pour éviter les données orphelines.

### 2. Base de données (PostgreSQL)

Les données sont organisées pour la performance :

- **Table de Faits** : Les transactions de ventes.
- **Dimensions** : Référentiels Produits, Magasins, Clients et Temps.

### 3. Dashboard (Apache Superset)

Le tableau de bord final permet de visualiser :

| Indicateur | Description |
|------------|-------------|
| **Chiffre d'Affaires** | Évolution mensuelle ventilée par point de vente |
| **Top 10 Produits** | Classement par volume de vente |
| **Panier Moyen** | Analyse de la dépense moyenne par transaction |
| **Répartition par Catégorie** | Part de chaque secteur (Alimentaire, Électronique, etc.) |

---

## 📂 Structure du dépôt

```
SuperMada/
├── /hop      → Pipelines (.hpl) et workflow global (.hwf)
├── /sql      → Scripts de création de la base de données
├── /data     → Exemples de fichiers sources utilisés
└── /images   → Captures d'écran du résultat final
```

---

## ⚙️ Installation Rapide

1. **Base de données** : Exécuter le script `sql/create_tables.sql` dans votre instance PostgreSQL.
2. **ETL** : Ouvrir le dossier `hop` dans Apache Hop et configurer la connexion à votre base de données.
3. **Lancement** : Exécuter le fichier `main_workflow.hwf`.
4. **Visualisation** : Importer le dataset dans Superset et connecter le tableau de bord.

---

## 📈 Résultats

*Section en cours de complétion.*

---

> **Note aux examinateurs** : Ce projet démontre la mise en place d'une architecture de données robuste, capable de traiter des volumes importants tout en garantissant la qualité et la fiabilité des indicateurs produits.