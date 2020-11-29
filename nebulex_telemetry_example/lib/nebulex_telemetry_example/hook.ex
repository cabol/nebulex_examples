defmodule NebulexTelemetryExample.Profiling do
  alias Nebulex.Hook

  def prof(%Hook{step: :before}) do
    System.system_time(:microsecond)
  end

  def prof(%Hook{step: :after_return, acc: start}) do
    diff = System.system_time(:microsecond) - start
    IO.puts("#=> Duration: #{diff}")
  end
end

defmodule NebulexTelemetryExample.Hoook do
  use Nebulex.Hook

  @decorate around(&NebulexTelemetryExample.Profiling.prof/1)
  def test(var) do
    :ok = Process.sleep(1000)
    var
  end
end
