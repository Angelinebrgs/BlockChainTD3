🗳️ TD3 Blockchain — Smart Contract avec Hardhat & Ganache
📌 Objectif

Ce projet a pour but de :

Mettre en place un environnement de développement Ethereum avec Hardhat

Déployer un smart contract localement avec Ganache

Interagir avec le contrat via la console Hardhat

Comprendre le cycle complet : compile → deploy → interaction

🛠️ Technologies utilisées

⚡ Node.js

🧱 Hardhat

🧪 Ganache Desktop

🦊 MetaMask (optionnel)

📁 Structure du projet
BlockChainTD3/
├── contracts/
│   └── Vote.sol
├── scripts/
│   └── deploy.js
├── hardhat.config.js
├── .env
└── package.json
🚀 Installation
npm install
⚙️ Configuration
🔹 Hardhat (hardhat.config.js)
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.20",
  networks: {
    ganache: {
      url: "http://127.0.0.1:8545",
      chainId: 1337
    }
  }
};
🧱 Smart Contract

Le contrat Vote.sol permet :

🗳️ d’enregistrer un vote (voter)

📊 de récupérer le nombre de votes (getVotes)

🧪 Compilation
npx hardhat compile

✔️ Résultat : compilation réussie

🚀 Déploiement
npx hardhat run scripts/deploy.js --network ganache

👉 Résultat attendu :

✅ Contrat déployé à : 0x...
🧠 Interaction avec le contrat
npx hardhat console --network ganache
const voteContract = await ethers.getContractAt("Vote", "0xADRESSE_DU_CONTRAT")

await voteContract.voter(1)
await voteContract.getVotes(1)
❗ Problème rencontré (Étape 4)

Erreur :

Error: connect ECONNREFUSED 127.0.0.1:7545
🔍 Analyse

Le problème provient d’un mauvais paramétrage du réseau local :

Hardhat tente de se connecter à 127.0.0.1:7545

Ganache doit être configuré sur 127.0.0.1:8545

🛠️ Solution

✔️ Vérifier que Ganache est bien lancé

✔️ Vérifier le port RPC (8545)

✔️ Adapter hardhat.config.js si nécessaire

📚 Concepts clés appris

Différence entre :

📍 Adresse de contrat (0x...)

🔗 Transaction hash

Fonctionnement d’un réseau Ethereum local

Déploiement et interaction avec Hardhat

Debug d’erreurs réseau (ECONNREFUSED)

🏁 État actuel
Étape	Statut
Initialisation	✅
Smart contract	✅
Compilation	✅
Configuration Ganache	✅
Déploiement	⚠️ En cours
Interaction	⏳ À venir
💡 Remarques

Les principales difficultés ont été liées à :

la configuration du réseau local (ports Ganache)

l’identification correcte de l’adresse du contrat

👨‍💻 Auteur

Projet réalisé dans le cadre du TD3 Blockchain

⭐ Bonus

Une fois le déploiement local fonctionnel, il sera possible de :

déployer sur Sepolia

vérifier le contrat sur Etherscan

connecter MetaMask