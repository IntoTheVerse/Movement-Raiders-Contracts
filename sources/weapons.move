module publisher::cryptara_conquest_weapons
{
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

    struct Collection has key 
    {
        soulbound: bool,
        mintable: bool,
        one_to_one_mapping: Option<SmartTable<address, address>>
    }

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct Weapons has key
    {
        weapons: vector<Weapon>
    }

    struct Weapon has store, copy, drop, key
    {
        name: String,
        description: String,
        damage: u8,
        range: u8,
        price: u8,
        uri: String
    }

    fun init_module(admin: &signer) 
    {
        let weapons: vector<Weapon> =
        vector<Weapon>[
            Weapon
            {
                name: string::utf8(b"Ion Pulse"),
                description: string::utf8(b"A sleek, high-tech sidearm that shoots pulses of ion energy, disorienting enemies with each vibrant shot."),
                damage: 6,
                range: 12,
                price: 0,
                uri:string::utf8(b"https://bafkreido4s6mxcpr32ofnfa3on7r7llvldn3vz6tvr7tkkgl65ydfvi2zu.ipfs.dweb.link/"),
            },
            Weapon
            {
                name: string::utf8(b"Cyber Spin6"),
                description: string::utf8(b"A revolver that channels energy into concentrated laser blasts, each shot as precise as it is deadly."),
                damage: 7,
                range: 15,
                price: 4,
                uri:string::utf8(b"https://bafkreifwdtlpnw2dudcakwxgyx2c2sqpvsyplhqtm2hknwblakicjgooza.ipfs.dweb.link/"),
            },
            Weapon
            {
                name: string::utf8(b"Nova Shatterer"),
                description: string::utf8(b"A futuristic shotgun that fires a wide spread of plasma pellets, turning foes into sizzling wreckage."),
                damage: 8,
                range: 8,
                price: 7,
                uri:string::utf8(b"https://bafkreifohicxw7de4ioav7jk4pwicjgpicq6esk6t7htzi22dwemgy2stu.ipfs.dweb.link/"),
            },
            Weapon
            {
                name: string::utf8(b"Heat Flare"),
                description: string::utf8(b"This advanced blaster channels hyper-accelerated particles into deadly energy bolts, vaporizing targets in a flash of light."),
                damage: 5,
                range: 14,
                price: 10,
                uri:string::utf8(b"https://bafkreif3f6dxcozlwwmbskayylz45cszw6srfg22snf6w62lrzql24b2za.ipfs.dweb.link/"),
            },
            Weapon
            {
                name: string::utf8(b"Neon Vortex"),
                description: string::utf8(b"A rapid-fire submachine gun that discharges quantum rounds, warping space-time around each bullet for unpredictable trajectories."),
                damage: 8,
                range: 12,
                price: 13,
                uri:string::utf8(b"https://bafkreiffq5r6gmiomepa2zfzkjxickclj7zr3naxb4h2w3e5zaedj2cari.ipfs.dweb.link/"),
            },
            Weapon
            {
                name: string::utf8(b"Eclipse Reaper 77"),
                description: string::utf8(b"A lightweight rifle that fires concentrated photon beams, slicing through armor with precision and speed."),
                damage: 11,
                range: 11,
                price: 17,
                uri:string::utf8(b"https://bafkreienor4dykkgtdei3vv5nprraxrlx2vwwatsuritv6wz5jrkypgyh4.ipfs.dweb.link/"),
            },
            Weapon
            {
                name: string::utf8(b"Mega Strike"),
                description: string::utf8(b"Equipped with magnetic acceleration, this sniper rifle delivers supersonic projectiles with pinpoint accuracy, piercing through any armor."),
                damage: 13,
                range: 20,
                price: 20,
                uri:string::utf8(b"https://bafkreihh4mufscyiwreiskcysibhcis6fw4ppuxm5xsn7e2rocobjkif34.ipfs.dweb.link/"),
            },
            Weapon
            {
                name: string::utf8(b"M2 Nova Disruptor"),
                description: string::utf8(b"This advanced blaster channels hyper-accelerated particles into deadly energy bolts, vaporizing targets in a flash of light."),
                damage: 15,
                range: 14,
                price: 23,
                uri:string::utf8(b"https://bafkreiflkuyvzoeoozkjnxw7kbq6vmti6d2k23aglpycta3rg23ngkc72u.ipfs.dweb.link/"),
            },
            Weapon
            {
                name: string::utf8(b"Meteor Launcher"),
                description: string::utf8(b"A heavy weapon that launches explosive pulse charges, creating shockwaves that devastate entire enemy squads."),
                damage: 25,
                range: 30,
                price: 27,
                uri:string::utf8(b"https://bafkreihasi6uoegmxpcbcrel4x5wuqaacyt7edgjr2eghzlmzgsflyahje.ipfs.dweb.link/"),
            },
        ];

        move_to(admin, Weapons { weapons });

        let constructor_ref = collection::create_unlimited_collection(
            &cryptara_conquest_publisher_signer::get_signer(),
            string::utf8(b"The cutting edge weapons."),
            string::utf8(b"CC Weapons"),
            option::none(),
            string::utf8(b"https://linktr.ee/intotheverse")
        );

        move_to(&object::generate_signer(&constructor_ref), Collection {
            soulbound: false,
            mintable: true,
            one_to_one_mapping: option::some(smart_table::new())
        });
    }

    #[view]
    public fun get_all_metadata(): vector<Weapon>  acquires Weapons
    {
        let weapons = borrow_global<Weapons>(@publisher).weapons;
        weapons
    }

    public entry fun mint_weapon(creator: &signer, type: u64) acquires Weapons
    {
        let weapons = borrow_global<Weapons>(@publisher).weapons;
        let weapon = vector::borrow(&weapons, type);

        token::create_named_token(
            &cryptara_conquest_publisher_signer::get_signer(),
            string::utf8(b"Raider Weapons"),
            weapon.description,
            weapon.name,
            option::none(),
            string_utils::format2(&b"{},{}", weapon.uri, weapon.price),
        );

        move_to(creator, *weapon);

        if(weapon.price > 0)
        {
            cryptara_conquest_token::burn(signer::address_of(creator), weapon.price);
        }
    } 
}