module publisher::cryptara_conquest_player
{
    use std::signer;
    use std::string::{String};
    use publisher::cryptara_conquest_characters;
    use publisher::cryptara_conquest_weapons;

    // structs

    /// a struct representing an accounts user data
    struct User has key
    {
        /// the username of the user
        username: String,
        lastMapLevel: u8,
        reloadCounter: u64,
        heartsLostCounter: u64
    }

    // error codes

    /// error code for when a user already exists for a given account address
    const EUserAlreadyExists: u64 = 0;

    /// error code for when a user does not exist for a given account address
    const EUserDoesNotExist: u64 = 1;

    // entry functions

    /// creates a user for the signing account with a given username
    /// * account - the signing account
    /// * username - the username to assign to the user
    public entry fun create_user(account: signer, username: String)
    {
        assert_user_does_not_exist(signer::address_of(&account));

        move_to(&account, User {
            username,
            lastMapLevel: 0,
            reloadCounter: 0,
            heartsLostCounter: 0
        });

        cryptara_conquest_characters::mint_character(&account, 0);
        cryptara_conquest_weapons::mint_weapon(&account, 0);
    }

    public entry fun change_username(account: signer, username: String) acquires User
    {
        let account_address = signer::address_of(&account);
        assert_user_exists(account_address);
        let user = borrow_global_mut<User>(account_address);
        user.username = username;
    }

    public entry fun change_last_map_level(account: signer, level: u8) acquires User
    {
        let account_address = signer::address_of(&account);
        assert_user_exists(account_address);
        let user = borrow_global_mut<User>(account_address);
        if(level > user.lastMapLevel)
        {
            user.lastMapLevel = level;
        }
    }

    public entry fun add_reload_counter(account: signer) acquires User
    {
        let account_address = signer::address_of(&account);
        assert_user_exists(account_address);
        let user = borrow_global_mut<User>(account_address);
        user.reloadCounter = user.reloadCounter + 1;
    }

    public entry fun add_hearts_lost_counter(account: signer) acquires User
    {
        let account_address = signer::address_of(&account);
        assert_user_exists(account_address);
        let user = borrow_global_mut<User>(account_address);
        user.heartsLostCounter = user.heartsLostCounter + 1;
    }

    // view functions

    #[view]
    /// returns the user data for a given account address
    /// * account_address - the address of the account to get the user data for
    public fun get_user(account_address: address): (String, u8) acquires User
    {
        assert_user_exists(account_address);
        let user = borrow_global<User>(account_address);
        (user.username, user.lastMapLevel)
    }

    // assert statements

    /// asserts that a user does not exist for a given account address
    /// * account_address - the address of the account to check
    fun assert_user_does_not_exist(account_address: address)
    {
        assert!(!exists<User>(account_address), EUserAlreadyExists);
    }

    /// asserts that a user exists for a given account address
    /// * account_address - the address of the account to check
    fun assert_user_exists(account_address: address)
    {
        assert!(exists<User>(account_address), EUserDoesNotExist);
    }
}