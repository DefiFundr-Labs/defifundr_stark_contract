# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

## Try running some of the following tasks:

## Project Structure

```
defifundr_evm_contract/
├── contracts/                  # Solidity contracts
│   └── Lock.sol
├── ignition/modules/          # Deployment modules
│   └── Lock.ts
├── scripts/                   # Deployment scripts
├── test/                      # Unit tests
│   └── Lock.ts
├── hardhat.config.ts          # Hardhat configuration
├── package.json               # Project metadata and scripts
└── README.md                  # Project documentation
```

---

## Getting Started

### Prerequisites

- npm or yarn
- Hardhat CLI

### Installation

```bash
git clone  https://github.com/DefiFundr-Labs/defifundr_stark_contract
cd defifundr_stark_contract
yarn
```

### Compile Contracts

```bash
scarb build
```

### Run Tests

```bash
scarb test
```

### Local Deployment

```bash
yarn deploy
```

---

## Architecture Overview

- **contracts/Lock.sol**: Core contract demonstrating time-locked Ether storage.
- **ignition/modules/Lock.ts**: Hardhat Ignition script for deploying the contract.
- **test/Lock.ts**: Unit tests covering deployment and interaction logic.

### Interaction Flow

1. Contract is deployed using Hardhat Ignition.
2. Functions are accessed via test scripts or front-end integration.
3. Project configuration managed through `hardhat.config.ts`.

---

## NatSpec Documentation

All Solidity contracts should include [NatSpec comments](https://docs.soliditylang.org/en/latest/natspec-format.html).

Example:

```solidity
/// @title Lock Contract
/// @notice Stores Ether until a specific unlock time
/// @dev Demonstrates Solidity time-lock pattern
```

---

## Testing Strategy

- Tests are written in TypeScript using `chai` and `ethers.js`.
- Focus on unit-level testing and gas efficiency.
- Ensure 100% coverage for all public functions.

Run tests with coverage:

```bash
npx hardhat test
```

---

## Deployment Guide

### Localhost

```bash
npx hardhat node
npx hardhat run scripts/deploy.ts --network localhost
```

### Testnets (e.g., Goerli)

> Coming soon: Configuration for testnets and mainnet.

---

## Security Best Practices

- Use access control modifiers (`onlyOwner`).
- Avoid hardcoding sensitive values.
- Include assertions and invariants.
- Conduct manual and automated audits.

---

## API Documentation

To generate API documentation from Solidity contracts:

```bash
npm install --save-dev solidity-docgen
npx solidity-docgen
```

---

## Contribution Guidelines

1. Fork the repo and create a feature branch.
2. Write clear, descriptive commit messages.
3. Include relevant tests for any changes.
4. Ensure documentation is updated.
5. Open a pull request for review.

## Notes

- Documentation should be updated with every code change.
- Use automation tools like `solidity-docgen` to maintain API docs.
- New developers should be able to get started using this file alone.

---
