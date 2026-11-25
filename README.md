MyAQid — Invisible Web5 RWA Provenance & Sovereign Digital Passports

Agentic-ready, one-tap Web5 verification and digital vaults for physical goods, human identities, and business sovereign credentials. Zero wallets or seed phrases for everyday users; zero PII on-chain.

Live Web5 Platform: https://myaqid.io

Core Ledger Protocol: https://myaq.io

Active Hackathon Deployment: BNB Smart Chain (MyAQid.sol — BNB Bangkok Developer Track, 25–27 Nov 2026)

Cloud Infrastructure: Google Cloud Platform (GCP) & Firebase (europe-west2 London)

1. Overview & Problem Solved

Physical brands, sports equipment manufacturers, and SMEs lose billions to counterfeiting, post-sale customer blindness, and secondary-market "black holes", while mandatory European Union Digital Product Passport (DPP) rules (with the EU Central Registry operational since 20 July 2026) are turning product traceability into a legal requirement.

Meanwhile, 99% of everyday consumers ("Joe Bloggs on the street") and Web2 SMEs remain locked out of on-chain verification due to:

High-friction crypto onboarding (seed phrases, browser wallet extensions, gas tokens).

Conflicts between immutable public ledgers and statutory UK/EU GDPR Right-to-Erasure laws.

MyAQid solves both problems by pairing a sub-2-second Web2 user experience with a Web5 sovereign vault (W3C DIDs, Verifiable Credentials, and DWN-compatible data portability) anchored asynchronously to BNB Smart Chain via keyed HMAC-SHA-256 zero-PII digests.

2. The Four Universal Web5 Passports

Beneath a single passwordless interface, MyAQid manages four universal digital passport classes across 11 active commercial namespaces (MORR, JFLS, CARM, TAOM, PALM, MEGA, DKIS, TH.0, ESGYN, DFGR, BELC):

Product Passports: Counterfeit-resistant, cryptographically verified provenance, EU DPP role-based compliance data, Dual-Gate Quality Control (QC) custody logs (VERIFIED_AT_SOURCE -> IN_REGIONAL_CUSTODY -> OWNER_CLAIMED), and one-time claim protection.

Human Passports: Portable, user-owned sovereign credentials based on human capability, verified Point of Sale (POS) check-ins, and proof of RWA ownership.

Business Passports: Verified corporate identity, supplier proofs, and auditable operational milestones for SMEs.

Agent Passports (KYA): Scoped Know-Your-Agent verification credentials allowing autonomous AI agents to verify product authenticity and business authorisations programmatically via GET /api/verify/:passportId.

3. System Architecture & Privacy-by-Design

[Trigger: NTAG 424 DNA NFC Tap / POS QR Check-In / Dual-Gate QC Scan / API Call]
                                      |
                                      v
+----------------------------------------------------------------------+
|  LAYER 1: OFFLINE-FIRST OPERATIONAL STATE (Firebase + Firestore)     |
|  - Region: europe-west2 (London, UK GDPR Data Residency)             |
|  - Stores encrypted PII, consent timestamps, serials & QC states     |
|  - Native IndexedDB local queue for zero-Wi-Fi venue resilience      |
+-------------------------------------+--------------------------------+
                                      | Authenticated HTTPS Trigger
                                      v
+----------------------------------------------------------------------+
|  LAYER 2: MYAQ CORE LEDGER API (Node.js on Google Cloud Run)         |
|  - Validates NTAG 424 DNA dynamic tap / HTTP 409 1-time claim lock   |
|  - Strips ALL PII; computes keyed HMAC-SHA-256 payload digest        |
|  - Signs via hardware-backed Google Cloud KMS (HSM)                  |
+-------------------------------------+--------------------------------+
                                      |
                                      v
+----------------------------------------------------------------------+
|  LAYER 3: CHAIN-INTERCHANGEABLE SETTLEMENT (BNB Smart Chain Active)  |
|  - Smart Contract: MyAQid.sol (Solidity ^0.8.20)                     |
|  - Stores only bytes32 payloadHash, namespace, stage & timestamp     |
|  - Modular adapters ready for Hedera, TRON, NEAR, Base & Polygon     |
+----------------------------------------------------------------------+


Key Technical Invariants

Zero PII On-Chain & GDPR Right to Erasure: No names, emails, or personal details ever touch BNB Smart Chain. Off-chain records link to on-chain anchors exclusively via keyed HMAC-SHA-256 digests (HMAC_SHA256(userOrTenantSalt, canonicalJsonPayload)). Destroying a user's cryptographic salt upon a UK GDPR deletion request renders the on-chain hash mathematically unlinkable without breaking ledger immutability.

Anti-Clone One-Time Claim Guardrail (HTTP 409): Serialised QR fallback carriers enforce a strict one-time claim lock, immediately triggering DUPLICATE_CLAIM_ALERT on a second claim attempt.

Offline-First POS & Factory Resilience: Cloud Firestore IndexedDB persistence + local browser queueing ensures factory QC scans (/qc) and retail/ticket/tournament POS check-ins (/checkin) never stall if Wi-Fi drops.

4. Application Routes & Smart Contract

Front-End Routes (myaqid.io)

/verify/:passportId — Public Tap-to-Verify Certificate of Authenticity (COA), Dual-Gate QC timeline, EU DPP data views, and direct BscScan proof links (zero owner PII shown).

/checkin — Offline-resilient Point of Sale (POS) QR on-ramp for product purchases, ticket redemptions, and tournament/programme entries with Just-in-Time UK GDPR privacy notice.

/qc — PIN/role-protected Dual-Gate QC scanner for Gate 1 (Factory Origin) and Gate 2 (Regional Distribution Hub).

/vault — Passwordless magic-link Web5 vault for viewing Product, Human, Business, and Agent Passports with self-custody export.

Smart Contract (contracts/MyAQid.sol)

Compiler: Solidity ^0.8.20

Network: BNB Smart Chain

Events: ProvenanceAnchored(string indexed serialCode, string issuerNamespace, string checkpointStage, bytes32 payloadHash, uint256 timestamp)

5. Quick Start (Local Development)

# 1. Clone the repository
git clone https://github.com/Land3rs365/myaqid.git
cd myaqid

# 2. Install dependencies
npm install

# 3. Configure environment variables
cp .env.example .env
# Add Firebase config, Google Cloud Run API URL, and BNB RPC / Contract address

# 4. Run the Web5 front-end locally
npm run dev


6. Legal & Governance

Data Controller: MyAQ Ltd (United Kingdom, Companies House Registered; UK Information Commission Registered).

Brand & Design System: Monochrome #000000, #FFFFFF, and #A6A8AB visual system.

Built on: Google Cloud & BNB Chain.
