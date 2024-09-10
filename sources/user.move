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
        username: String
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
            username
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

    // view functions

    #[view]
    /// returns the user data for a given account address
    /// * account_address - the address of the account to get the user data for
    public fun get_user(account_address: address): (String) acquires User
    {
        assert_user_exists(account_address);
        let user = borrow_global<User>(account_address);
        (user.username)
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