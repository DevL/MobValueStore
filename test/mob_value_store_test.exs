defmodule MobValueStoreTest do
  use ExUnit.Case

  @described_module MobValueStore

  @describe "Initialising a local store"
  test "registers the store process as :local_mob" do
    @described_module.start
    assert Enum.member? Process.registered, :local_mob
  end

  test "can be initialised using an optional map" do
    assert @described_module.start(%{}) == :ok
  end

  @describe "Getting a value"
  test "returns nil for a non-existing key" do
    @described_module.start
    value = @described_module.get :this_key_does_not_exist
    assert value == nil
  end

  test "returns the value of an existing key" do
    @described_module.start %{existing_key: "esse est percipi"}
    value = @described_module.get :existing_key
    assert value == "esse est percipi"
  end

  @describe "Setting a value"
  test "stores a new value" do
    @described_module.start
    @described_module.put :new_key, "some value"
    value = @described_module.get :new_key
    assert value == "some value"
  end
end
