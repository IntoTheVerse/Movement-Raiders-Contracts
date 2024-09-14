# Movement Realms Smart Contracts 

- Smart contracts have been deployed to [Movement Testnet (Aptos Environment)](https://explorer.movementlabs.xyz/account/0xdc494026c03645c91f7ad28a5119c34d4001329c15e98e446485a4cef48bb9ff/modules/code/cryptara_conquest_characters?network=testnet) 

# Web2 backend is created at: 
- [https://github.com/IntoTheVerse/movement-realms-backend](https://github.com/IntoTheVerse/movement-realms-backend)

![image](https://github.com/user-attachments/assets/720131e7-4d73-4ec1-8631-784561be9d1d)

- **Smart Contracts can be tested on the explorer (by running transactions)**
![image](https://github.com/user-attachments/assets/7ad1498a-714f-4c15-aeae-8b09c572a0df)

- All hero assets minted showing up on Nightly Wallet 

![image](https://github.com/user-attachments/assets/c82638d0-8ffc-450c-b2a7-3a4ee24feaf0)

- Weapon Assets
![image](https://github.com/user-attachments/assets/555d8dc7-c6e8-4e00-a170-20a1a1d5c67d)


# Tech stack used 
1. Unity Game Engine
2. Move Programming Language 
3. Aptos CLI for deploying contracts
4. Lync Unity SDK (For integrating smart contract on Movement Labs testnet with Unity Game) 
5. Movement Hasura GraphQL Indexer
6. MongoDB to store and display certain transactions created by player's public key/wallet, since the graphQL user interface was not indexing transactions created (as it is in beta)
7. Razor, Nightly and Petra

# Game concept 

Movement Realms is a browser based fast-paced 2D action survival RPG powered by movementlabs and LYNC SDK
- Procedurally generated dungeons
- RPG rogue-like mechanics where a player has to unlock hidden secrets, weapons, and loot from the chests and beat the enemies guarding these chests 
- The level ends with a boss enemy battle at the last scene - after completing which player proceeds to the next level 
- The enemy difficulty increases as levels increase, so it is essential for players to level up, by purchasing new warriors and weapons from the marketplace 
- The marketplace is embedded within the application so you do not have to exit the game application and shop from elsewhere (enhancing player retention in web3)
- Players have speed, roll speed, roll distance, and Health points programmed on chain
- Weapons have Damage and Range programmed on chain
- We are implementing a codex feature to upgrade these features on-chain as you level up
- All purchases are to be done using tokens obtained as loot from the game
- The game features an on-chain leaderboard which highlights number of kills made, health points maintained, and time taken to complete the levels 

# GTM strategies 
- Play to Airdrop strategies with game progress linked to Zealy and Galxe Quests 
- Collaborare with memecoin communities for reward pools 
- Rewards are proportional to the player performance in game (number of heroes & weapons unlocked, amount of loot collected, game level up NFTs collected, leaderboard position for every week, player upgrades made)
- Have a weekly and global leaderboard for games to reward for short term (weekly contests) and long term (monthly contests)
- Easily accessible via desktop browser and compatible with movement based wallets 
- Ease of onboarding powered by Lync account abstraction

# Some cool features we are building on-chain with Move 
- Player Profile and Leaderboards 🥇🥈🥉
- In Game on-chain loot collection 🏴‍☠️💎
- Level Pass NFTs for completing every level and saving game state on-chain
- In Game Marketplace for warriors and weapons 🏪
- Reversible permadeath - on chain reversible death ⚰️🔫🪄 (Pay to respwan frozen NFTs)
- NFTs owning NFTs using token v2 (more composability, and scalability) ⚔️(having features like `Max Moving Speed`, `Roll Speed`, `Roll Distance` and `Max Health` on chain and upgradable 
- Account Abstraction so you don't have to worry about transactions as you play 🎮 (Play web3 games at Web2 speeds and UX)






