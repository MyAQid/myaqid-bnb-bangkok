// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyAQid {
    address public owner;

    struct ProofRecord {
        bytes32 payloadHash;
        string issuerNamespace;
        string checkpointStage;
        uint256 timestamp;
    }

    mapping(string => ProofRecord[]) private assetHistory;
    mapping(bytes32 => bool) public hashExists;

    event ProvenanceAnchored(
        string indexed serialCode,
        string issuerNamespace,
        string checkpointStage,
        bytes32 payloadHash,
        uint256 timestamp
    );

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorised");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function anchorProof(
        string calldata serialCode,
        string calldata issuerNamespace,
        string calldata checkpointStage,
        bytes32 payloadHash
    ) external onlyOwner {
        assetHistory[serialCode].push(
            ProofRecord({
                payloadHash: payloadHash,
                issuerNamespace: issuerNamespace,
                checkpointStage: checkpointStage,
                timestamp: block.timestamp
            })
        );
        hashExists[payloadHash] = true;

        emit ProvenanceAnchored(
            serialCode,
            issuerNamespace,
            checkpointStage,
            payloadHash,
            block.timestamp
        );
    }

    function getProofCount(string calldata serialCode) external view returns (uint256) {
        return assetHistory[serialCode].length;
    }
}
