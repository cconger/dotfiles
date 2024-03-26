-- Check if there is a pyproject.toml
local f=io.open("./pyproject.toml", "r")
local config="~/.config/ruff/pyproject.toml"
if f~=nil then 
  config="./pyproject.toml"
end

return {
  settings = {
    args = {
--      "--config=" .. config
    }
  }
}
