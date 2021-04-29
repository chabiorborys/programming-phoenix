defmodule Rumbl do
  import Supervisor.Spec


  children = [

    supervisor(Rumbl.Endpoint, [])
  ]



end
