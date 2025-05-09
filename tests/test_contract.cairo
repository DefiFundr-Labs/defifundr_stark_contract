use starknet::ContractAddress;

use snforge_std::{declare, ContractClassTrait, DeclareResultTrait};

use defifundr_contract::IHelloStarknetSafeDispatcher;
use defifundr_contract::IHelloStarknetSafeDispatcherTrait;
use defifundr_contract::IHelloStarknetDispatcher;
use defifundr_contract::IHelloStarknetDispatcherTrait;

fn deploy_contract(name: ByteArray) -> ContractAddress {
    let contract = declare(name).unwrap().contract_class();
    let (contract_address, _) = contract.deploy(@ArrayTrait::new()).unwrap();
    contract_address
}

#[test]
fn test_increase_balance() {
    let contract_address = deploy_contract("HelloStarknet");

    let dispatcher = IHelloStarknetDispatcher { contract_address };

    let balance_before = dispatcher.get_balance();
    assert(balance_before == 0, 'Invalid balance');

    dispatcher.increase_balance(42);

    let balance_after = dispatcher.get_balance();
    assert(balance_after == 42, 'Invalid balance');
}

#[test]
#[feature("safe_dispatcher")]
fn test_cannot_increase_balance_with_zero_value() {
    let contract_address = deploy_contract("HelloStarknet");

    let safe_dispatcher = IHelloStarknetSafeDispatcher { contract_address };

    let balance_before = safe_dispatcher.get_balance().unwrap();
    assert(balance_before == 0, 'Invalid balance');

    match safe_dispatcher.increase_balance(0) {
        Result::Ok(_) => core::panic_with_felt252('Should have panicked'),
        Result::Err(panic_data) => {
            assert(*panic_data.at(0) == 'Amount cannot be 0', *panic_data.at(0));
        },
    };
}

#[cfg(test)]
mod tests {
    use super::*;
    use starknet::ContractAddress;
    use core::num::traits::Zero;

    #[test]
    fn test_validate_wallet() {
        // Deploy the contract and create a dispatcher
        let contract_address = deploy_contract("HelloStarknet");
        let dispatcher = IHelloStarknetDispatcher { contract_address };

        // Test 1: Zero address (should fail validation)
        let zero_address = Zero::zero();
        let is_valid = dispatcher.validate_wallet(zero_address);
        assert(!is_valid, 'Zero address invalid');

        // Test 2: Valid address
        let valid_address: ContractAddress = starknet::contract_address_const::<'USER'>();
        let is_valid = dispatcher.validate_wallet(valid_address);
        assert(is_valid, 'Valid address should pass');
    }
}
