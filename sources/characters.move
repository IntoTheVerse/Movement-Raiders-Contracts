module publisher::cryptara_conquest_characters {
    use aptos_token_objects::token;
    use aptos_framework::object;
    use std::option::{Self, Option};
    use std::vector;
    use std::string::{Self, String};
    use aptos_std::smart_table::{Self, SmartTable};
    use aptos_token_objects::collection;
    use aptos_std::string_utils;
    use publisher::cryptara_conquest_token;
    use std::signer;
    use publisher::cryptara_conquest_publisher_signer;

    const ECOLLECTION_ALREADY_INITIALIZED: u64 = 0;

    struct Collection has key {
        soulbound: bool,
        mintable: bool,
        one_to_one_mapping: Option<SmartTable<address, address>>,
    }

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct Characters has key {
        characters: vector<Character>,
    }

    struct Character has store, copy, drop, key {
        name: String,
        description: String,
        moving_speed: u8,
        roll_speed: u8,
        roll_distance: u8,
        max_health: u8,
        price: u64,  // Changed to u64 for higher values
        uri: String,
    }

    fun init_module(admin: &signer) {
        let characters: vector<Character> = vector::empty();

        vector::push_back(&mut characters, Character {
            name: string::utf8(b"Rad Wraith"),
            description: string::utf8(b"Rad Wraith, a post-apocalyptic survivor with a cowboy hat, masters the shotgun for brutal close-quarters combat."),
            moving_speed: 8,
            roll_speed: 9,
            roll_distance: 8,
            max_health: 100,
            price: 0,
            uri: string::utf8(b"https://bafkreiaw7lfkdfrxbd2e27r2p4bykuk7zyegss767mmzfkonqaz7bhmp5q.ipfs.dweb.link/"),
        });

        vector::push_back(&mut characters, Character {
            name: string::utf8(b"Neuro Shock"),
            description: string::utf8(b"Neuro Shock, a genius marine scientist armed with cutting-edge tech, battles enemies with a blend of intellect and firepower."),
            moving_speed: 9,
            roll_speed: 10,
            roll_distance: 7,
            max_health: 110,
            price: 8,
            uri: string::utf8(b"https://bafkreieuzwuigcmhpqz3a2soo7qvmhzpcchzjo7hqqxlq2tzipu36gneuu.ipfs.dweb.link/"),
        });

        vector::push_back(&mut characters, Character {
            name: string::utf8(b"Shade Striker"),
            description: string::utf8(b"Shade Striker, a stealthy bandit clad in worn black gear and tech-enhanced gear, wields a glowing revolver with deadly precision."),
            moving_speed: 12,
            roll_speed: 11,
            roll_distance: 8,
            max_health: 105,
            price: 15,
            uri: string::utf8(b"https://bafkreiepfp3l3o2w5ndnpnvudzqz5kmo3kyet4s3rn5ycwae2lsts6ff44.ipfs.dweb.link/"),
        });

        vector::push_back(&mut characters, Character {
            name: string::utf8(b"Tech Shot"),
            description: string::utf8(b"Tech Shot, a master of customized firearms and gadgets, blends his tech savvy engineering skills with firepower to conquer enemies."),
            moving_speed: 13,
            roll_speed: 10,
            roll_distance: 7,
            max_health: 115,
            price: 18,
            uri: string::utf8(b"https://bafkreiepfp3l3o2w5ndnpnvudzqz5kmo3kyet4s3rn5ycwae2lsts6ff44.ipfs.dweb.link/"),
        });

        vector::push_back(&mut characters, Character {
            name: string::utf8(b"Cog Sniper"),
            description: string::utf8(b"Cog Sniper, a master marksman with a steampunk rifle, uses clockwork gadgets for precise and deadly combat."),
            moving_speed: 8,
            roll_speed: 10,
            roll_distance: 8,
            max_health: 120,
            price: 22,
            uri: string::utf8(b"https://bafkreiepfp3l3o2w5ndnpnvudzqz5kmo3kyet4s3rn5ycwae2lsts6ff44.ipfs.dweb.link/"),
        });

        vector::push_back(&mut characters, Character {
            name: string::utf8(b"Mecha Shade"),
            description: string::utf8(b"Mecha Shade, a lethal mercenary with cybernetic enhancements, wields advanced weaponry to dominate and obliterate bosses and enemies."),
            moving_speed: 7,
            roll_speed: 10,
            roll_distance: 9,
            max_health: 125,
            price: 25,
            uri: string::utf8(b"https://bafkreiepfp3l3o2w5ndnpnvudzqz5kmo3kyet4s3rn5ycwae2lsts6ff44.ipfs.dweb.link/"),
        });

        move_to(admin, Characters { characters });

        let constructor_ref = collection::create_unlimited_collection(
            &cryptara_conquest_publisher_signer::get_signer(),
            string::utf8(b"The brave dungeon raiders."),
            string::utf8(b"CC Characters"),
            option::none(),
            string::utf8(b"https://linktr.ee/intotheverse")
        );

        move_to(&object::generate_signer(&constructor_ref), Collection {
            soulbound: false,
            mintable: true,
            one_to_one_mapping: option::some(smart_table::new()),
        });
    }

    #[view]
    public fun get_all_metadata(): vector<Character> acquires Characters {
        let characters = borrow_global<Characters>(@publisher).characters;
        characters
    }

    public entry fun mint_character(creator: &signer, type: u64) acquires Characters {
        let characters = borrow_global<Characters>(@publisher).characters;
        let character = vector::borrow(&characters, type);

        token::create_named_token(
            &cryptara_conquest_publisher_signer::get_signer(),
            string::utf8(b"Raider Characters"),
            character.description,
            character.name,
            option::none(),
            string_utils::format2(&b"{},{}", character.uri, character.price),
        );

        move_to(creator, *character);

        if (character.price > 0) {
            cryptara_conquest_token::burn(signer::address_of(creator), character.price);
        }
    }
}
