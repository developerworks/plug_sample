defmodule PlugSample.HttpWorker do

  def start_link do
    Plug.Adapters.Cowboy.http PlugSample.HttpPlug, [], port: 80
  end
end
