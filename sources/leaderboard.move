module publisher::cryptara_conquest_leaderboard
{
    use std::signer;
    use std::string::{String};
    use aptos_std::simple_map::SimpleMap;
    use aptos_std::smart_table::{Self, SmartTable};
    use publisher::cryptara_conquest_publisher_signer;

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct Leaderboards has key
    {
        leaderboards: SmartTable<String, u64>
    }

    fun init_module(_admin: &signer) 
    {
        let resource_publisher = &cryptara_conquest_publisher_signer::get_signer();
        move_to(resource_publisher, Leaderboards { leaderboards : smart_table::new<String, u64>() });
    }

    public entry fun add_score(user_address: String, score: u64) acquires Leaderboards
    {
        let resource_publisher = &cryptara_conquest_publisher_signer::get_signer();
        let leaderboards = borrow_global_mut<Leaderboards>(signer::address_of(resource_publisher));

        smart_table::upsert(&mut leaderboards.leaderboards, user_address, score);
    }

    #[view]
    public fun get_leaderboard(): SimpleMap<String, u64> acquires Leaderboards
    {
        let resource_publisher = &cryptara_conquest_publisher_signer::get_signer();
        let leaderboards = borrow_global<Leaderboards>(signer::address_of(resource_publisher));

        smart_table::to_simple_map(&leaderboards.leaderboards)
    }
}