module publisher::cryptara_conquest_weapons
{
    use aptos_framework::object;
    use std::option;
    use std::vector;
    use std::string::{Self, String};
    use aptos_token_objects::collection;
    use publisher::cryptara_conquest_token;
    use aptos_token_objects::token::{Self, Token};
    use publisher::cryptara_conquest_publisher_signer;
    use aptos_token_objects::property_map;
    use std::signer;

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct Weapons has key
    {
        weapons: vector<Weapon>
    }

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct Weapon has store, copy, drop, key
    {
        name: String,
        description: String,
        damage: u8,
        range: u8,
        price: u8,
        uri: String
    }

    fun init_module(_admin: &signer) 
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
                uri:string::utf8(b"https://akrd.net/f1C4ED65VOuCXT6BOBo8cgDlkuRCO2M_pmeUZvZmIuc"),
            },
            Weapon
            {
                name: string::utf8(b"Cyber Spin6"),
                description: string::utf8(b"A revolver that channels energy into concentrated laser blasts, each shot as precise as it is deadly."),
                damage: 7,
                range: 15,
                price: 4,
                uri:string::utf8(b"https://akrd.net/4SrYz4473-Mu-3S174tXMcOmhMCLybqhBbVeI7bQIYA"),
            },
            Weapon
            {
                name: string::utf8(b"Nova Shatterer"),
                description: string::utf8(b"A futuristic shotgun that fires a wide spread of plasma pellets, turning foes into sizzling wreckage."),
                damage: 8,
                range: 8,
                price: 7,
                uri:string::utf8(b"https://akrd.net/LH1Opz5X-n4TqGjteD6bIcJuADFHcjwLzhOm-O1bEUI"),
            },
            Weapon
            {
                name: string::utf8(b"Heat Flare"),
                description: string::utf8(b"This advanced blaster channels hyper-accelerated particles into deadly energy bolts, vaporizing targets in a flash of light."),
                damage: 5,
                range: 14,
                price: 10,
                uri:string::utf8(b"https://akrd.net/UaFJssD78KMc8HsION0G8pRIerUjTXnWktH4yooTIVU"),
            },
            Weapon
            {
                name: string::utf8(b"Neon Vortex"),
                description: string::utf8(b"A rapid-fire submachine gun that discharges quantum rounds, warping space-time around each bullet for unpredictable trajectories."),
                damage: 8,
                range: 12,
                price: 13,
                uri:string::utf8(b"https://akrd.net/Z9583f9ISLjvg9VS0m7Lx5SX8XnzfSPOTJzI-0Jkrmo"),
            },
            Weapon
            {
                name: string::utf8(b"Eclipse Reaper 77"),
                description: string::utf8(b"A lightweight rifle that fires concentrated photon beams, slicing through armor with precision and speed."),
                damage: 11,
                range: 11,
                price: 17,
                uri:string::utf8(b"https://akrd.net/s8zoTP1DBXCNFfEsu7NNvg3zrxEoF3LStCZDviwIFeQ"),
            },
            Weapon
            {
                name: string::utf8(b"Mega Strike"),
                description: string::utf8(b"Equipped with magnetic acceleration, this sniper rifle delivers supersonic projectiles with pinpoint accuracy, piercing through any armor."),
                damage: 13,
                range: 20,
                price: 20,
                uri:string::utf8(b"https://akrd.net/z66ZaQ2z6uTWa3yPVgZKTM7P9pz7XVqSa9SdHXkSzz4"),
            },
            Weapon
            {
                name: string::utf8(b"M2 Nova Disruptor"),
                description: string::utf8(b"This advanced blaster channels hyper-accelerated particles into deadly energy bolts, vaporizing targets in a flash of light."),
                damage: 15,
                range: 14,
                price: 23,
                uri:string::utf8(b"https://akrd.net/9z1njszndGUAGy5rgyDo-OK-zdyWhl578QFn2pMzbWk"),
            },
            Weapon
            {
                name: string::utf8(b"Meteor Launcher"),
                description: string::utf8(b"A heavy weapon that launches explosive pulse charges, creating shockwaves that devastate entire enemy squads."),
                damage: 25,
                range: 30,
                price: 27,
                uri:string::utf8(b"https://akrd.net/1ByLtxpq3v6kSu1mXwoI0pgWNJ4YE63wwwtuln1RVRc"),
            },
        ];

        let resource_publisher = &cryptara_conquest_publisher_signer::get_signer();
        move_to(resource_publisher, Weapons { weapons });

        collection::create_unlimited_collection(
            resource_publisher,
            string::utf8(b"The cutting edge weapons."),
            string::utf8(b"CC Weapons"),
            option::none(),
            string::utf8(b"https://akrd.net/LniukunI-rP_qa_rn7SD4hIa6XB29Db6AjssvH5LFJE")
        );
    }

    public entry fun mint_weapon(creator: &signer, type: u64) acquires Weapons
    {
        let resource_publisher = &cryptara_conquest_publisher_signer::get_signer();
        let weapons = borrow_global<Weapons>(signer::address_of(resource_publisher)).weapons;
        let weapon = vector::borrow(&weapons, type);

        let constructor_ref = token::create_named_token(
            resource_publisher,
            string::utf8(b"CC Weapons"),
            weapon.description,
            weapon.name,
            option::none(),
            weapon.uri
        );

        let nft = object::object_from_constructor_ref<Token>(&constructor_ref);
        object::transfer(resource_publisher, nft, signer::address_of(creator));

        let properties = property_map::prepare_input(vector[], vector[], vector[]);
        let property_mutator_ref = property_map::generate_mutator_ref(&constructor_ref);
        property_map::init(&constructor_ref, properties);

        property_map::add_typed(
            &property_mutator_ref,
            string::utf8(b"Damage"),
            weapon.damage
        );

        property_map::add_typed(
            &property_mutator_ref,
            string::utf8(b"Range"),
            weapon.range
        );

        if(weapon.price > 0)
        {
            cryptara_conquest_token::burn(signer::address_of(creator), weapon.price);
        }
    } 
}