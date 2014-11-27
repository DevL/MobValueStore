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
