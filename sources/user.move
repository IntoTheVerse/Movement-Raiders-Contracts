module publisher::cryptara_conquest_player {
    use std::signer;
    use std::string::{Self, String};
    use publisher::cryptara_conquest_characters;
    use publisher::cryptara_conquest_weapons;

    /// A struct representing an account's user data
    struct User has key {
        /// The username of the user
        username: String
    }

    // Error codes

    /// Error code for when a user already exists for a given account address
    const E_USER_ALREADY_EXISTS: u64 = 0;

    /// Error code for when a user does not exist for a given account address
    const E_USER_DOES_NOT_EXIST: u64 = 1;

    // Entry functions

    /// Creates a user for the signing account with a given username
    /// * account - the signing account
    /// * username - the username to assign to the user
    public entry fun create_user(account: signer, username: String) {
        assert_user_does_not_exist(signer::address_of(&account));

        // Move the User resource to the account
        move_to(&account, User { username });

        // Mint a default character and weapon for the new user (uncomment if needed)
        cryptara_conquest_characters::mint_character(&account, 0);
        cryptara_conquest_weapons::mint_weapon(&account, 0);
    }

    /// Allows a user to change their username
    /// * account - the signing account
    /// * username - the new username
    public entry fun change_username(account: signer, new_username: String) acquires User {
        let account_address = signer::address_of(&account);
        assert_user_exists(account_address);

        // Borrow the User resource and update the username
        let user = borrow_global_mut<User>(account_address);
        user.username = new_username;
    }

    // View functions

    #[view]
    /// Returns the username of the user for a given account address
    /// * account_address - the address of the account to get the user data for
    public fun get_user(account_address: address): String acquires User {
        assert_user_exists(account_address);

        // Borrow the User resource and return the username
        let user = borrow_global<User>(account_address);
        user.username
    }

    // Assertion functions

    /// Asserts that a user does not exist for the given account address
    /// * account_address - the address of the account to check
    fun assert_user_does_not_exist(account_address: address) {
        assert!(!exists<User>(account_address), E_USER_ALREADY_EXISTS);
    }

    /// Asserts that a user exists for the given account address
    /// * account_address - the address of the account to check
    fun assert_user_exists(account_address: address) {
        assert!(exists<User>(account_address), E_USER_DOES_NOT_EXIST);
    }
}
