defmodule Processes do
  alias __MODULE__

  def sendRequest url do
    case HTTPoison.post url, [], [], [timeout: 50_000, recv_timeout: 50_000] do
      {:ok,    %HTTPoison.Response{status_code: 200, headers: headers}} 
          -> IO.inspect {headers}
      {:error, %HTTPoison.Error{reason: reason}}                  
          -> IO.inspect {:error, reason}
    end
  end

  def spawnProcesses number do
    for _ <- 1..number do
      spawn(fn -> sendRequest('http://localhost:3000/flip') end)
    end
  end

end
