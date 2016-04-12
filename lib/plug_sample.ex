defmodule PlugSample do
  use Application
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(PlugSample.Worker, []),
    ]
    opts = [strategy: :one_for_one, name: PlugSample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
