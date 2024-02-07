import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Blob "mo:base/Blob";
import TrieMap "mo:base/TrieMap";
import Hash "mo:base/Hash";
import Time "mo:base/Time";
import Nat "mo:base/Nat";
import Nat64 "mo:base/Nat64";
import Int "mo:base/Int";

import BitcoinWallet "BitcoinWallet";
import BitcoinApi "BitcoinApi";
import Types "Types";
import Utils "Utils";

actor class BitcoinPaymentPortal(_network : Types.Network) {
  type GetUtxosResponse = Types.GetUtxosResponse;
  type MillisatoshiPerVByte = Types.MillisatoshiPerVByte;
  type SendRequest = Types.SendRequest;
  type Network = Types.Network;
  type BitcoinAddress = Types.BitcoinAddress;
  type Satoshi = Types.Satoshi;

  // The Bitcoin network to connect to.
  //
  // When developing locally this should be `regtest`.
  // When deploying to the IC this should be `testnet`.
  // `mainnet` is currently unsupported.
  stable let NETWORK : Network = _network;

  // The ECDSA key name.
  let KEY_NAME : Text = switch NETWORK {
    // For local development, we use a special test key with dfx.
    case (#regtest) "dfx_test_key";
    // On the IC we're using a test ECDSA key.
    case _ "test_key_1"
  };

  public type Subscription = {
    address: BitcoinAddress;
    lastBalance: Satoshi;
    endEpoch: Nat;
  };

  let DAILY_SATOSHI_RATE : Satoshi = 100;

  let subscriptions = TrieMap.TrieMap<Principal, Subscription>(Principal.equal, Principal.hash);

  public func get_p2pkh_address(caller: Principal) : async BitcoinAddress {
    await BitcoinWallet.get_p2pkh_address(NETWORK, KEY_NAME, [Blob.toArray(Principal.toBlob(caller))])
  };

  public func get_balance(caller: Principal) : async Satoshi {
    await BitcoinApi.get_balance(NETWORK, await get_p2pkh_address(caller))
  };

  public shared(msg) func get_caller_p2pkh_address() : async BitcoinAddress {
    await get_p2pkh_address(msg.caller)
  };

  public shared(msg) func get_caller_balance() : async Satoshi {
    await BitcoinApi.get_balance(NETWORK, await get_p2pkh_address(msg.caller))
  };

  public shared(msg) func is_caller_subscribed() : async Bool {
    let sub: ?Subscription = subscriptions.get(msg.caller);
    switch (sub) {
      case (null) false;
      case (?value) value.endEpoch > Int.abs(Time.now());
    };
  };

  public shared(msg) func get_caller_subscription_end_epoch() : async Int {
    let sub: ?Subscription = subscriptions.get(msg.caller);
    switch (sub) {
      case (null) 0;
      case (?value) value.endEpoch;
    };
  };

  public shared(msg) func subscribe() : async () {
    let sub: ?Subscription = subscriptions.get(msg.caller);
    switch (sub) {
      case (null) {
        let currentBalance = await get_balance(msg.caller);
        let daysSubscribed = Nat64.toNat(currentBalance / DAILY_SATOSHI_RATE);
        let endEpoch = Int.abs(Time.now()) + (daysSubscribed * 24 * 60 * 60 * 10**9);
        let address = await get_p2pkh_address(msg.caller);
        let sub: Subscription = {
          address = address;
          lastBalance = currentBalance;
          endEpoch = endEpoch;
        };
        subscriptions.put(msg.caller, sub);
      };
      case (?value) {
        let currentBalance = await get_balance(msg.caller);
        let oldBalance = value.lastBalance;
        let daysSubscribed = Nat64.toNat((currentBalance - oldBalance) / DAILY_SATOSHI_RATE);
        let endEpoch = Int.abs(Time.now()) + (daysSubscribed * 24 * 60 * 60 * 10 ** 9);
        let address = await get_p2pkh_address(msg.caller);
        let sub: Subscription = {
          address = address;
          lastBalance = currentBalance;
          endEpoch = endEpoch;
        };
        subscriptions.put(msg.caller, sub);
      };
    };
  };
};

