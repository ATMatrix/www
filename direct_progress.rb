require 'net/http'
require 'json'

def get_direct_remain
  direct_url = "https://api.etherscan.io/api?module=stats&action=tokensupply&contractaddress=0x887834D3b8D450B6bAB109c252Df3DA286d73CE4&apikey=AWEG6NREPDJXSKZYQHTMBHZFN5FSBZF3VR"

  resp = Net::HTTP.get_response(URI.parse(direct_url))
  result = JSON.parse(resp.body)

  total  = 20_000_000
  issued = result["result"].to_i / 10**18

  direct_remain = total - issued
rescue
  0
end


ico_goal = 20_000_000
raised = ico_goal - get_direct_remain

progress = raised.to_f / ico_goal
output = { progress: (progress * 100).to_i }


File.open('./progress.json', 'w') { |file|
  file.write(JSON.pretty_generate(output))
}