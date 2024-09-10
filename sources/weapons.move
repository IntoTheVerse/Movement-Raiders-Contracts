module publisher::cryptara_conquest_weapons
{
    use std::string;
    use std::vector;
    use std::signer;
    use aptos_token::token;
    use std::string::String;
    use aptos_token::token::TokenDataId;
    use publisher::cryptara_conquest_token;
    use publisher::cryptara_conquest_publisher_signer;

    struct ModuleData has key
    {
        weapon_data_ids: vector<TokenDataId>
    }

    struct Prices has key
    {
        prices: vector<u8>
    }

    fun init_module(admin: &signer) 
    {
        let prices = vector<u8>[0, 4, 7, 10, 13, 17, 20, 23, 27];
        move_to(admin, Prices { prices });

        token::create_collection(
            admin,
            string::utf8(b"CC Weapons"),
            string::utf8(b"The cutting edge weapons."),
            string::utf8(b"https://akrd.net/LniukunI-rP_qa_rn7SD4hIa6XB29Db6AjssvH5LFJE"),
            0,
            vector<bool>[false, false, false]
        );

        let weapon_data_ids: vector<TokenDataId> = 
        vector<TokenDataId>
        [
            token::create_tokendata(
                admin,
                string::utf8(b"CC Weapons"),
                string::utf8(b"Ion Pulse"),
                string::utf8(b"A sleek, high-tech sidearm that shoots pulses of ion energy, disorienting enemies with each vibrant shot."),
                0,
                string::utf8(b"https://akrd.net/f1C4ED65VOuCXT6BOBo8cgDlkuRCO2M_pmeUZvZmIuc"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Damage"), 
                    string::utf8(b"Range"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"6", 
                    b"12",
                    b"0",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
            token::create_tokendata(
                admin,
                string::utf8(b"CC Weapons"),
                string::utf8(b"Cyber Spin6"),
                string::utf8(b"A revolver that channels energy into concentrated laser blasts, each shot as precise as it is deadly."),
                0,
                string::utf8(b"https://akrd.net/4SrYz4473-Mu-3S174tXMcOmhMCLybqhBbVeI7bQIYA"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Damage"), 
                    string::utf8(b"Range"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"7", 
                    b"15",
                    b"4",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
            token::create_tokendata(
                admin,
                string::utf8(b"CC Weapons"),
                string::utf8(b"Nova Shatterer"),
                string::utf8(b"A futuristic shotgun that fires a wide spread of plasma pellets, turning foes into sizzling wreckage."),
                0,
                string::utf8(b"https://akrd.net/LH1Opz5X-n4TqGjteD6bIcJuADFHcjwLzhOm-O1bEUI"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Damage"), 
                    string::utf8(b"Range"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"8", 
                    b"8",
                    b"7",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
            token::create_tokendata(
                admin,
                string::utf8(b"CC Weapons"),
                string::utf8(b"Heat Flare"),
                string::utf8(b"This advanced blaster channels hyper-accelerated particles into deadly energy bolts, vaporizing targets in a flash of light."),
                0,
                string::utf8(b"https://akrd.net/UaFJssD78KMc8HsION0G8pRIerUjTXnWktH4yooTIVU"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Damage"), 
                    string::utf8(b"Range"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"5", 
                    b"14",
                    b"10",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
            token::create_tokendata(
                admin,
                string::utf8(b"CC Weapons"),
                string::utf8(b"Neon Vortex"),
                string::utf8(b"A rapid-fire submachine gun that discharges quantum rounds, warping space-time around each bullet for unpredictable trajectories."),
                0,
                string::utf8(b"https://akrd.net/Z9583f9ISLjvg9VS0m7Lx5SX8XnzfSPOTJzI-0Jkrmo"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Damage"), 
                    string::utf8(b"Range"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"8", 
                    b"12",
                    b"13",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
            token::create_tokendata(
                admin,
                string::utf8(b"CC Weapons"),
                string::utf8(b"Eclipse Reaper 77"),
                string::utf8(b"A lightweight rifle that fires concentrated photon beams, slicing through armor with precision and speed."),
                0,
                string::utf8(b"https://akrd.net/s8zoTP1DBXCNFfEsu7NNvg3zrxEoF3LStCZDviwIFeQ"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Damage"), 
                    string::utf8(b"Range"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"11", 
                    b"11",
                    b"17",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
            token::create_tokendata(
                admin,
                string::utf8(b"CC Weapons"),
                string::utf8(b"Mega Strike"),
                string::utf8(b"Equipped with magnetic acceleration, this sniper rifle delivers supersonic projectiles with pinpoint accuracy, piercing through any armor."),
                0,
                string::utf8(b"https://akrd.net/z66ZaQ2z6uTWa3yPVgZKTM7P9pz7XVqSa9SdHXkSzz4"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Damage"), 
                    string::utf8(b"Range"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"13", 
                    b"20",
                    b"20",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
            token::create_tokendata(
                admin,
                string::utf8(b"CC Weapons"),
                string::utf8(b"M2 Nova Disruptor"),
                string::utf8(b"This advanced blaster channels hyper-accelerated particles into deadly energy bolts, vaporizing targets in a flash of light."),
                0,
                string::utf8(b"https://akrd.net/9z1njszndGUAGy5rgyDo-OK-zdyWhl578QFn2pMzbWk"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Damage"), 
                    string::utf8(b"Range"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"15", 
                    b"14",
                    b"23",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
            token::create_tokendata(
                admin,
                string::utf8(b"CC Weapons"),
                string::utf8(b"Meteor Launcher"),
                string::utf8(b"A heavy weapon that launches explosive pulse charges, creating shockwaves that devastate entire enemy squads."),
                0,
                string::utf8(b"https://akrd.net/1ByLtxpq3v6kSu1mXwoI0pgWNJ4YE63wwwtuln1RVRc"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Damage"), 
                    string::utf8(b"Range"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"25", 
                    b"30",
                    b"27",
                ],
                vector<String>
                [
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
        ];

        move_to(admin, ModuleData 
        {
            weapon_data_ids
        });
    }

    public entry fun mint_weapon(receiver: &signer, type: u64) acquires ModuleData, Prices
    {
        let module_data = borrow_global_mut<ModuleData>(@publisher);
        let resource_signer = cryptara_conquest_publisher_signer::get_signer();

        let token_id = token::mint_token(&resource_signer, *vector::borrow(&module_data.weapon_data_ids, type), 1);
        token::direct_transfer(&resource_signer, receiver, token_id, 1);

        let prices = borrow_global<Prices>(@publisher).prices;
        let price = *vector::borrow(&prices, type);

        if(price > 0)
        {
            cryptara_conquest_token::burn(signer::address_of(receiver), price);
        }
    }
}