# MyAQid: Invisible Web5 RWA Provenance & Sovereign Digital Passports

> **Agentic-ready, one-tap Web5 verification and digital vaults for physical goods, Point of Sale (POS) checkouts, and sovereign credentials. Zero wallets or seed phrases for users; zero PII on-chain. Hedera acts as our Verifier; BNB Smart Chain is our first active chain.**

* **Live Web5 MVP:** [https://myaqid.io](https://myaqid.io)
* **First Active Chain (BNB Smart Chain Testnet, Chain ID 97):** `MyAQid.sol` (`Solidity ^0.8.20`)
  * **Verified Contract Address:** `0xe42422648da0a7ca99CF6B5B088df14070C16b78`
  * **BscScan Proof:** [https://testnet.bscscan.com/address/0xe42422648da0a7ca99CF6B5B088df14070C16b78](https://testnet.bscscan.com/address/0xe42422648da0a7ca99CF6B5B088df14070C16b78)
* **Verifier Spine:** Hedera (HCS at $0.0008 USD/message; HTS Birth Certificates at $0.05 USD commercial planning rate)
* **Active Commercial Namespaces:** `MORR` / `JFLS` / `CARM` / `TAOM` / `PALM` / `MEGA` / `DKIS` / `TH.0` / `ESGYN` / `DFGR` / `BELC`
* **Data Controller:** MyAQ Ltd (United Kingdom, Companies House & UK Information Commission Registered)
* **Governance & Audit Oversight:** DFGR (Data Forensics, Governance and Risk)
* **Built on:** Hedera, BNB Chain & Google Cloud

---

### 1. The Problem

Physical brands and SMEs lose billions to counterfeiting, post-sale customer blindness, and secondary-market "black holes", while mandatory **European Union Digital Product Passport (DPP)** regulations (with the EU Central Registry live since 20 July 2026) turn product traceability into a legal requirement. Meanwhile, 99% of everyday people ("Joe Bloggs on the street") and Web2 SMEs across all sectors remain locked out of future-proofing their assets and businesses on-chain due to complex KYC onboarding, seed phrases, wallet extensions, gas fees, and conflicts between immutable public ledgers and global data privacy laws (UK/EU GDPR Right to Erasure).

### 2. The Solution: MyAQ & MyAQid (Web5 4-Passport Architecture)

**MyAQid** is a frictionless Web5 client and customer platform powered by the **MyAQ** cryptographic verification ledger. Everyday users tap an NFC-tagged product (`NTAG 424 DNA`) or scan a **Point of Sale (POS)** QR code (retail checkout, ticket purchase, or tournament and programme entry) in under two seconds to claim a sovereign Web5 digital vault (`MyAQid`) with a clear privacy notice, zero wallets, zero seed phrases, and zero gas fees.

Beneath a familiar Web2 interface, MyAQid manages **four universal Web5 Passports**:

1. **Product Passports (Two-Pronged EU DPP Model):**

   * **Client / B2B Prong (Factory-to-Customer Supply Chain & Dual-Gate QC):** Anchors origin batch specs, Gate 1 Factory QC (`VERIFIED_AT_SOURCE`), transit checkpoints (`IN_TRANSIT`), Gate 2 Regional Hub QC (`IN_REGIONAL_CUSTODY`), role-based repairer/customs views, and ESPR Art. 10(4) backup copies.
   * **Customer / Consumer Prong (RWA Ownership):** Delivers counterfeit-resistant, cryptographically verified provenance, one-time claim protection (`HTTP 409 DUPLICATE_CLAIM_ALERT`), warranty and direct-to-owner VIP engagement, peer-to-peer secondary transfer (v1.1), and a DFGR-governed Lost & Stolen Registry with formal Dispute Route (v1.1).
2. **Human Passports:** Portable, user-owned sovereign credentials proving human capability, verified POS entries, and RWA ownership across internal staff, client-winning founders, learners, and event participants.
3. **Business Passports:** Verified corporate identity, autonomous Operations Head division controls, and auditable operational milestones for SMEs across any industry.
4. **Agent Passports (KYA: Know Your Agent):** Scoped verification credentials allowing autonomous AI agents to verify authenticity programmatically via `/api/verify`.

### 3. Enterprise Architecture, Dual-Chain Settlement & Privacy-by-Design

* **Offline-First Cloud Layer:** Hosted 100% on **Google Cloud Platform (GCP)** and **Firebase** (`europe-west2` London, inheriting SOC 2 Type II and ISO 27001:2022), using Cloud Firestore native IndexedDB persistence so factory QC scans and customer POS check-ins never stall if Wi-Fi drops.
* **Dual-Chain Settlement (Hedera Verifier + BNB Smart Chain First Chain):** **Hedera** (HTS/HCS) serves as our Verifier, issuing permanent Product Birth Certificates and verified EU DPP credentials at USD-pegged rates ($0.0008/message HCS; $0.05/RWA HTS). **BNB Smart Chain** (`MyAQid.sol` at `0xe42422648da0a7ca99CF6B5B088df14070C16b78`) is our first active EVM settlement chain, logging immutable public `ProvenanceAnchored` events and POS activity on BscScan. Our modular four-method adapter layer supports seamless chain interchangeability across Hedera, BNB Chain, TRON, NEAR, Base, Polygon, and Arbitrum.
* **Zero-PII On-Chain & Global Privacy Matrix:** Zero personal data ever touches any public ledger or Gate 1 China factory scanner (PIPL shield). Off-chain records link to on-chain anchors strictly via keyed **HMAC-SHA-256** digests, guaranteeing irreversible Right to Erasure via salt destruction across UK/EU GDPR, APAC, North America, Central America, and South America (15-day global DSAR SLA).
* **DFGR Governance & Forensic Oversight:** **DFGR (Data Forensics, Governance and Risk)** sets and audits verification integrity standards, DPIA/DPA readiness, and EU DPP compliance mappings without acting as a legal Data Controller for MyAQid accounts.
* **Custodial-First to Self-Custody:** Custodial signing keys are encrypted inside hardware-backed **Google Cloud KMS**, with a sovereign W3C DID / Verifiable Credential export path for users who opt into self-custody.

### 4. Progress Built During BNB Bangkok Hackathon (25 to 27 November 2026)

1. **Verified Smart Contract Deployment (`MyAQid.sol`):** Authored, compiled (`Solidity ^0.8.20`), and deployed our EVM provenance registry on BNB Smart Chain Testnet (`0xe42422648da0a7ca99CF6B5B088df14070C16b78`), emitting verifiable `ProvenanceAnchored` proofs with zero PII on-chain.
2. **Serverless Ledger API (Google Cloud Run + KMS):** Built the stateless Node.js microservice connecting Firebase Auth and Cloud Firestore (`europe-west2`) to BNB Smart Chain via `ethers.js` and our Hedera Verifier adapter, generating keyed HMAC-SHA-256 digests and enforcing the strict `HTTP 409` one-time claim rule (`DUPLICATE_CLAIM_ALERT`).
3. **MyAQid Web5 Front-End:** Built the monochrome (`#231F20`, `#A7A9AC`, `#FFFFFF`) web application featuring `/verify/:passportId` (two-pronged EU DPP & Dual-Gate QC timeline with live BscScan and Hedera Verifier proofs), `/checkin` (offline-resilient POS QR on-ramp with Just-in-Time privacy notice), `/qc` (Gate 1 & Gate 2 scanner), `/ops` (autonomous division console), and `/vault` (passwordless digital vault).
4. **Physical Hardware Tagging Readiness:** Prepped live NXP `NTAG 424 DNA` NFC demo tags ahead of our confirmed residency at the **muShenzhen 3-Week Builders Garage** (starting 30 November 2026) for instant smartphone tap-to-verify product authentication.
