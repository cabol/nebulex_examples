defmodule NearCache.Hooks do
  defmacro __using__(_opts) do
    quote do
      require Logger

      def pre_hooks do
        hook = fn
          _, {cache, :get, [key, opts]} ->
            Enum.each(cache.__levels__, fn level ->
              result = level.get(key, opts)

              Logger.debug(
                "#{level}.get(#{inspect(key)}, #{inspect(opts)}) ==> #{inspect(result)}"
              )
            end)

          _, _ ->
            :noop
        end

        {:pipe, [hook]}
      end
    end
  end
end
