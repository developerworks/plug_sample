defmodule PlugSample.Worker do

  def start_link do
    Plug.Adapters.Cowboy.http PlugSample.MyPlug, []
  end
end
