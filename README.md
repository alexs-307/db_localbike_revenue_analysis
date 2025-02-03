This is a repository for an Analytics Engineering seminar offered by Databird in Q1 2025.

The goal was to build a dbt model and a Metabase dashboard to make recommendations for LocalBike (brand selling bicycles) to increase net revenues

Metabase dashboard: https://freelance.metabaseapp.com/dashboard/11

Below, we outline

Business model roughly:
- coûts: main d’oeuvre (vente + atelier), coûts d’inventaire, bail du local magasin,
- revenus: order_items (price * quantity * (1-discount)) at order-level —> likely will need an intermediate model

Axes d’amélioration du revenu net

- **Axe #0: optimisation des stocks** [non traité dans l'analyse]
    - Reco #1: éviter de rater 1 vente pour faute de rupture de stocks (replenishment strategy)
        - source stocks ne contienne pas de date. Or, les stocks sont une donnée qui fluctue avec le temps & nous n’avons pas de data sur la demande non satisfaite —> donc on va considérer qu’il s’agit en gros du catalogue qu’ont ces magasins
    - Reco #2: enlever de l’inventaire/stocks les produits qui ne sont jamais vendus par les staffs (analyse des ventes historiques par produits et croiser avec les données stocks)
        - Analyse: faire une MRT table avec les stocks > 0 et un join sur les sales / store avec une where condition pour les productsqui n’ont pas d’entrée dans la vente
    - **Axe #1: augmenter la basket value ($) per order** xx$ / transaction (il y a surement des stores / sellers qui arrivent à vendre des accessoires à faire 1) de l’upsell et 2) cross-sellers
        - **1A. Upsell**: identifier s’il y a une opportunité de vendre des marques plus haut-de-gamme et/ou des modèles plus récents vs des autres au sein de chaque catégorie  notamment si un store/seller le fait
        - **1B. Cross-sell:** ajouter des items adjacents aux ventes de vélo (casque, gants…) pour fidéliser les clients + identifier les bundles les plus successfulls pour faire en sorte qu’il soit disponible et proposés dans tous les magasins
        - **1C. Inventaire**: ajuster les stocks disponibles dans chaque magasin pour mettre en oeuvre ces stratégies & éviter les ventes manquées
        - **1D. Remise** [non-traité]: étudier l'efficacité des stratégies de remise (discounts) pour voir si elles sont efficaces
    - **Axe #2: formation et augmentation de l’efficacité des équipes de vente**  —> Gestion des effectifs / efficacité
        - **2A.** dimensionner # vendeurs & managers / store avec les transactions effectuées par chaque magasin (en count et en $) —> analyse: **revenue per active employee for every store**
        - **2B.** Regarder qui sont les meilleurs vendeurs et s’inspirer de leur technique pour former les autres vendeurs y compris dans d’autres stores
            - Vendent-ils avec des discounts ? De quelle magnitude
        - **2C.** ratio staff TM / manager —> a t-on le bon nombre de managers / vs vendeurs ?
  
    - **Axe #3**: optimisation de la logistique de livraison et des inventaires [non-traité]
        - note: le data model n’est pas clair sur comment on doit traiter la donnée de stock vs le fait qu’il y a des informations de livraison —> analyse pour savoir s’il y a shipment quand les stocks ne sont pas disponibles
        - analyse: étudier la distribution de order_date > shipped_date controlled par required_date & region —> opérations plus rapides pour favoriser les recurring orders
