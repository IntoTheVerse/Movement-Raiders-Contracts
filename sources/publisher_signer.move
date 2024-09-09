module publisher::cryptara_conquest_publisher_signer {
    use aptos_framework::account;
    use aptos_framework::resource_account;

    /// Struct representing the signer capability
    struct PermissionConfig has key {
        signer_cap: account::SignerCapability,
    }

    /// Initializes the PermissionConfig for the resource account.
    public fun initialize_permission_config(account: &signer) {
        let signer_cap = resource_account::retrieve_resource_account_cap(account, @resource_publisher);
        move_to(account, PermissionConfig { signer_cap });
    }

    /// Retrieves the signer for the publisher account using the PermissionConfig.
    public fun get_signer(): signer acquires PermissionConfig {
        // Borrow the PermissionConfig resource
        let permission_config = borrow_global<PermissionConfig>(@publisher);
        
        // Pass a reference to the signer capability to the function
        account::create_signer_with_capability(&permission_config.signer_cap)
    }
}
