# Source Code to Business Rules Mapping

This document maps every significant business rule in the AWSCards / CardDemo codebase to its exact source location.

---

## Table of Contents

1. [Transaction Posting (CBTRN02C.cbl)](#1-transaction-posting)
2. [Interest Calculation (CBACT04C.cbl)](#2-interest-calculation)
3. [Authentication / Signon (COSGN00C.cbl)](#3-authentication--signon)
4. [Bill Payment (COBIL00C.cbl)](#4-bill-payment)
5. [Transaction Entry (COTRN02C.cbl)](#5-transaction-entry)
6. [Account View (COACTVWC.cbl)](#6-account-view)
7. [Account Update (COACTUPC.cbl)](#7-account-update)
8. [Card List (COCRDLIC.cbl)](#8-card-list)
9. [Card Update (COCRDUPC.cbl)](#9-card-update)
10. [Data Structure Constraints (Copybooks)](#10-data-structure-constraints)
11. [Error Code Reference](#11-error-code-reference)

---

## 1. Transaction Posting

**Source file:** `app/cbl/CBTRN02C.cbl`

Batch program that reads the daily transaction file (DALYTRAN) and posts valid transactions to account balances. All validation is applied before posting.

| Rule ID | Business Rule | Section / Lines | Code |
|---------|--------------|-----------------|------|
| **TRAN-001** | A transaction must reference a card number that exists in the XREF file. | `1500-A-LOOKUP-XREF` | `READ XREF-FILE INTO CARD-XREF-RECORD / INVALID KEY MOVE 100 TO WS-VALIDATION-FAI[...]`|
| **TRAN-002** | The account linked to the card must exist in the account master file. | `1500-B-LOOKUP-ACCT` | `READ ACCOUNT-FILE INTO ACCOUNT-RECORD / INVALID KEY MOVE 101 TO WS-VALIDATION-FAIL-[...]`|
| **TRAN-003** | The transaction amount plus the net cycle activity must not exceed the credit limit: `CREDIT_LIMIT >= (CURR_CYC_CREDIT − CURR_CYC_DEBIT + TRAN_AMT)`. | `1500-B-LOOKUP-ACCT` | `C[...]`|
| **TRAN-004** | The account expiration date must be on or after the transaction origination date. | `1500-B-LOOKUP-ACCT` | `IF ACCT-EXPIRAION-DATE >= DALYTRAN-ORIG-TS (1:10) … ELSE MOVE 103 …`|
| **TRAN-005** | Positive transaction amounts are added to cycle credit; negative amounts are added to cycle debit. | `2800-UPDATE-ACCOUNT-REC` | `IF DALYTRAN-AMT >= 0 / ADD DALYTRAN-AMT TO ACCT-C[...]`|
| **TRAN-006** | A running balance is maintained per account × transaction type × category code in the TCATBAL file. If the key does not exist, a new record is created; otherwise the existing re[...]| Main processing loop | Various |
| **TRAN-007** | Transactions that fail any validation are written to the DALYREJS (reject) file; they are never posted to the account. | Main processing loop | `IF WS-VALIDATION-FAIL-REASON = 0 /[...]`|

This mapping continues with sections covering all major business rules in the system.
