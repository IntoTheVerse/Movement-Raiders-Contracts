module publisher::cryptara_conquest_characters
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
        character_data_ids: vector<TokenDataId>
    }

    struct Prices has key
    {
        prices: vector<u8>
    }

    fun init_module(admin: &signer) 
    {
        let prices = vector<u8>[0, 8, 15, 18, 22, 25];
        move_to(admin, Prices { prices });

        token::create_collection(
            admin,
            string::utf8(b"CC Characters"),
            string::utf8(b"The brave dungeon raiders."),
            string::utf8(b"https://akrd.net/LniukunI-rP_qa_rn7SD4hIa6XB29Db6AjssvH5LFJE"),
            0,
            vector<bool>[false, false, false]
        );

        let character_data_ids: vector<TokenDataId> = 
        vector<TokenDataId>
        [
            token::create_tokendata(
                admin,
                string::utf8(b"CC Characters"),
                string::utf8(b"Rad Wraith"),
                string::utf8(b"Rad Wraith, a post-apocalyptic survivor with a cowboy hat, masters the shotgun for brutal close-quarters combat."),
                0,
                string::utf8(b"https://akrd.net/NiqFHcPSRLvY0Opv2TNGQE_M-K8HOVjPCwSyblXbfu8"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Move Speed"), 
                    string::utf8(b"Roll Speed"),
                    string::utf8(b"Roll Distance"),
                    string::utf8(b"Max Health"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"8", 
                    b"9",
                    b"8",
                    b"100",
                    b"0",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
            token::create_tokendata(
                admin,
                string::utf8(b"CC Characters"),
                string::utf8(b"Neuro Shock"),
                string::utf8(b"Neuro Shock, a genius marine scientist armed with cutting-edge tech, battles enemies with a blend of intellect and firepower."),
                0,
                string::utf8(b"https://akrd.net/TmFPmCk6neG_H6OfXZkaxMwaeeUcVrG1S7L17Z2kJ7c"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Move Speed"), 
                    string::utf8(b"Roll Speed"),
                    string::utf8(b"Roll Distance"),
                    string::utf8(b"Max Health"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"9", 
                    b"10",
                    b"7",
                    b"110",
                    b"8",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
            token::create_tokendata(
                admin,
                string::utf8(b"CC Characters"),
                string::utf8(b"Shade Striker"),
                string::utf8(b"Shade Striker, a stealthy bandit clad in worn black gear and tech-enhanced gear, wields a glowing revolver with deadly precision."),
                0,
                string::utf8(b"https://akrd.net/8BB8UvQ8mOfiQX5WnD1nu8rO-lZfzQXOT11FLShm7uw"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Move Speed"), 
                    string::utf8(b"Roll Speed"),
                    string::utf8(b"Roll Distance"),
                    string::utf8(b"Max Health"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"12", 
                    b"11",
                    b"8",
                    b"105",
                    b"15",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
            token::create_tokendata(
                admin,
                string::utf8(b"CC Characters"),
                string::utf8(b"Tech Shot"),
                string::utf8(b"Tech Shot, a master of customized firearms and gadgets, blends his tech savvy engineering skills with firepower to conquer enemies."),
                0,
                string::utf8(b"https://akrd.net/cn_T2NJAjfxnIZlFrLRNl6lookaQy32h8x5SV9LDSps"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Move Speed"), 
                    string::utf8(b"Roll Speed"),
                    string::utf8(b"Roll Distance"),
                    string::utf8(b"Max Health"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"13", 
                    b"10",
                    b"7",
                    b"115",
                    b"18",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
            token::create_tokendata(
                admin,
                string::utf8(b"CC Characters"),
                string::utf8(b"Cog Sniper"),
                string::utf8(b"Cog Sniper, a master marksman with a steampunk rifle, uses clockwork gadgets for precise and deadly combat."),
                0,
                string::utf8(b"https://akrd.net/iyZx568pPsYeRROecWFlTE1jOHWgz3keZp1Ms9EcM-s"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Move Speed"), 
                    string::utf8(b"Roll Speed"),
                    string::utf8(b"Roll Distance"),
                    string::utf8(b"Max Health"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"8", 
                    b"10",
                    b"8",
                    b"120",
                    b"22",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            ),
            token::create_tokendata(
                admin,
                string::utf8(b"CC Characters"),
                string::utf8(b"Mecha Shade"),
                string::utf8(b"Mecha Shade, a lethal mercenary with cybernetic enhancements, wields advanced weaponry to dominate in obliterate bosses and enemies."),
                0,
                string::utf8(b"https://akrd.net/4vf4KxY7HwUQK0cI3A5-bk_XOq_lm-5I_9GxnZ8Bv9Q"),
                signer::address_of(admin),
                1,
                0,
                token::create_token_mutability_config(&vector<bool>[false, false, false, false, true]),
                vector<String>
                [
                    string::utf8(b"Move Speed"), 
                    string::utf8(b"Roll Speed"),
                    string::utf8(b"Roll Distance"),
                    string::utf8(b"Max Health"),
                    string::utf8(b"Price"),
                ],
                vector<vector<u8>>
                [
                    b"7", 
                    b"10",
                    b"9",
                    b"125",
                    b"25",
                ],
                vector<String>
                [
                    string::utf8(b"u64"), 
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                    string::utf8(b"u64"),
                ],
            )
        ];

        move_to(admin, ModuleData 
        {
            character_data_ids
        });
    }

    public entry fun mint_character(receiver: &signer, type: u64) acquires ModuleData, Prices
    {
        let module_data = borrow_global_mut<ModuleData>(@publisher);
        let resource_signer = cryptara_conquest_publisher_signer::get_signer();

        let token_id = token::mint_token(&resource_signer, *vector::borrow(&module_data.character_data_ids, type), 1);
        token::direct_transfer(&resource_signer, receiver, token_id, 1);

        let prices = borrow_global<Prices>(@publisher).prices;
        let price = *vector::borrow(&prices, type);

        if(price > 0)
        {
            cryptara_conquest_token::burn(signer::address_of(receiver), price);
        }
    }
}