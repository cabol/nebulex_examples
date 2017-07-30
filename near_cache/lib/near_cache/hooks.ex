defmodule NearCache.Hooks do
  defmacro __using__(_opts) do
    quote do
      require Logger

      def post_hooks do
        [&log_hook/2]
      end

      def log_hook(result, {cache, :get, [key, opts]} = call) do
        Logger.debug "#{cache}.get(#{inspect key}, #{inspect opts}) ==> #{inspect result}"
      end
      def log_hook(_, _), do: :noop
    end
  end
end
