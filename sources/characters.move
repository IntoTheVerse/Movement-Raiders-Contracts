module publisher::cryptara_conquest_characters
{
    use aptos_framework::object;
    use std::option;
    use std::vector;
    use std::string::{Self, String};
    use aptos_token_objects::collection;
    use aptos_token_objects::token::{Self, Token};
    use publisher::cryptara_conquest_token;
    use publisher::cryptara_conquest_publisher_signer;
    use aptos_token_objects::property_map;
    use std::signer;

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct Characters has key
    {
        characters: vector<Character>
    }

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct Character has store, copy, drop, key
    {
        name: String,
        description: String,
        movingSpeed: u8,
        rollSpeed: u8,
        rollDistance: u8,
        maxHealth: u8,
        price: u8,
        uri: String
    }

    fun init_module(_admin: &signer) 
    {
        let characters: vector<Character> = 
        vector<Character>[
            Character
            {
                name: string::utf8(b"Rad Wraith"),
                description: string::utf8(b"Rad Wraith, a post-apocalyptic survivor with a cowboy hat, masters the shotgun for brutal close-quarters combat."),
                movingSpeed: 8,
                rollSpeed: 9,
                rollDistance: 8,
                maxHealth: 100,
                price: 0,
                uri: string::utf8(b"https://akrd.net/NiqFHcPSRLvY0Opv2TNGQE_M-K8HOVjPCwSyblXbfu8"),

            },
            Character
            {
                name: string::utf8(b"Neuro Shock"),
                description: string::utf8(b"Neuro Shock, a genius marine scientist armed with cutting-edge tech, battles enemies with a blend of intellect and firepower."),
                movingSpeed: 9,
                rollSpeed: 10,
                rollDistance: 7,
                maxHealth: 110,
                price: 8,
                uri: string::utf8(b"https://akrd.net/TmFPmCk6neG_H6OfXZkaxMwaeeUcVrG1S7L17Z2kJ7c"),
            },
            Character
            {
                name: string::utf8(b"Shade Striker"),
                description: string::utf8(b"Shade Striker, a stealthy bandit clad in worn black gear and tech-enhanced gear, wields a glowing revolver with deadly precision."),
                movingSpeed: 12,
                rollSpeed: 11,
                rollDistance: 8,
                maxHealth: 105,
                price: 15,
                uri: string::utf8(b"https://akrd.net/8BB8UvQ8mOfiQX5WnD1nu8rO-lZfzQXOT11FLShm7uw"),
            },
            Character
            {
                name: string::utf8(b"Tech Shot"),
                description: string::utf8(b"Tech Shot, a master of customized firearms and gadgets, blends his tech savvy engineering skills with firepower to conquer enemies."),
                movingSpeed: 13,
                rollSpeed: 10,
                rollDistance: 7,
                maxHealth: 115,
                price: 18,
                uri: string::utf8(b"https://akrd.net/cn_T2NJAjfxnIZlFrLRNl6lookaQy32h8x5SV9LDSps"),
            },
            Character
            {
                name: string::utf8(b"Cog Sniper"),
                description: string::utf8(b"Cog Sniper, a master marksman with a steampunk rifle, uses clockwork gadgets for precise and deadly combat."),
                movingSpeed: 8,
                rollSpeed: 10,
                rollDistance: 8,
                maxHealth: 120,
                price: 22,
                uri: string::utf8(b"https://akrd.net/iyZx568pPsYeRROecWFlTE1jOHWgz3keZp1Ms9EcM-s"),
            },
            Character
            {
                name: string::utf8(b"Mecha Shade"),
                description: string::utf8(b"Mecha Shade, a lethal mercenary with cybernetic enhancements, wields advanced weaponry to dominate in obliterate bosses and enemies."),
                movingSpeed: 7,
                rollSpeed: 10,
                rollDistance: 9,
                maxHealth: 125,
                price: 25,
                uri: string::utf8(b"https://akrd.net/4vf4KxY7HwUQK0cI3A5-bk_XOq_lm-5I_9GxnZ8Bv9Q"),
            }
        ];

        let resource_publisher = &cryptara_conquest_publisher_signer::get_signer();
        move_to(resource_publisher, Characters { characters });

        collection::create_unlimited_collection(
            resource_publisher,
            string::utf8(b"The brave dungeon raiders."),
            string::utf8(b"CC Characters"),
            option::none(),
            string::utf8(b"https://akrd.net/LniukunI-rP_qa_rn7SD4hIa6XB29Db6AjssvH5LFJE")
        );
    }

    public entry fun mint_character(creator: &signer, type: u64) acquires Characters
    {
        let resource_publisher = &cryptara_conquest_publisher_signer::get_signer();
        let characters = borrow_global<Characters>(signer::address_of(resource_publisher)).characters;
        let character = vector::borrow(&characters, type);

        let constructor_ref = token::create(
            resource_publisher,
            string::utf8(b"CC Characters"),
            character.description,
            character.name,
            option::none(),
            character.uri
        );

        let nft = object::object_from_constructor_ref<Token>(&constructor_ref);
        object::transfer(resource_publisher, nft, signer::address_of(creator));

        let properties = property_map::prepare_input(vector[], vector[], vector[]);
        let property_mutator_ref = property_map::generate_mutator_ref(&constructor_ref);
        property_map::init(&constructor_ref, properties);

        property_map::add_typed(
            &property_mutator_ref,
            string::utf8(b"Move Speed"),
            character.movingSpeed
        );

        property_map::add_typed(
            &property_mutator_ref,
            string::utf8(b"Roll Speed"),
            character.rollSpeed
        );

        property_map::add_typed(
            &property_mutator_ref,
            string::utf8(b"Roll Distance"),
            character.rollDistance
        );

        property_map::add_typed(
            &property_mutator_ref,
            string::utf8(b"Max Health"),
            character.maxHealth
        );

        if(character.price > 0)
        {
            cryptara_conquest_token::burn(signer::address_of(creator), character.price);
        }
    }
}