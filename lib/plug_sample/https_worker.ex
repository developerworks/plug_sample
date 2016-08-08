defmodule PlugSample.HttpsWorker do

  def start_link do
    Plug.Adapters.Cowboy.https PlugSample.HttpsPlug, [],
      port:     443,
      otp_app:  :telegram_server,
      keyfile:  Path.expand(".") <> "/config/ssl/key.pem",
      certfile: Path.expand(".") <> "/config/ssl/cert.pem",
      dhfile:   Path.expand(".") <> "/config/ssl/dhparam.pem"
  end
end
