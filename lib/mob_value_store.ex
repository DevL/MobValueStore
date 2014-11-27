defmodule MobValueStore do
  def start(map \\ %{}) do
    pid = spawn_link(fn -> loop(map) end)
    Process.register(pid, :local_mob)
    :ok
  end

  def get(key) do
    send :local_mob, {:get, key, self}
    receive do
      value -> value
    end
  end

  def put(key, value) do
    send :local_mob, {:put, key, value, self}
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop map
      {:put, key, value, self} ->
        loop Map.put(map, key, value)
    end
  end
end

"""
defmodule KeyValueStore do
  def start_link do
    {:ok, spawn_link(fn -> loop(%{}) end)}
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop map
      {:put, key, value} ->
        loop Map.put(map, key, value)
    end
  end

  def register do
    {:ok, pid} = start_link
    Process.register(pid, :key_value_store)
  end

  def get(key) do
    send :key_value_store, {:get, key, self}
    receive do
      value -> value
    end
  end

  def put(key, value) do
    send :key_value_store, {:put, key, value}
  end
end
"""
