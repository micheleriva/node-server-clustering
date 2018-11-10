defmodule Processes do

  Application.ensure_all_started(:inets)
  Application.ensure_all_started(:ssl)

  def sendRequest url do
    case :httpc.request(:get, {url, []}, [], []) do
      {:ok, {_httpStatus, headers, body}} -> {headers, body}
      {:error, cause} -> {:error, cause}
    end
  end

end
