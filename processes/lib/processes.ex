defmodule Processes do
  alias __MODULE__

  def sendRequest url do
    case HTTPoison.post! url, "" do
      {:ok,    %HTTPoison.Response{status_code: 200, body: body}} 
          -> IO.inspect {body}
      {:error, %HTTPoison.Error{reason: reason}}                  
          -> IO.inspect {:error, reason}
    end
  end

  def spawnProcesses number do
    for _ <- 0..number do
      spawn(fn -> sendRequest('http://localhost:3000/flip') end)
    end
  end

end
