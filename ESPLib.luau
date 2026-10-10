local _ESPLib = {}

local _esptypes = {
    ["chams"] = "chams",
}

function _ESPLib:Create(plr, esp, color, outline, thickness)
    local _runserv = game:GetService("RunService")
    local _cam = workspace.CurrentCamera
    local _rgui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
    local _espfolder = _rgui:FindFirstChild("_ESPLIB") or Instance.new("Folder", _rgui)
    _espfolder.Name = "_ESPLIB"
    
    local _uncaps = tostring(esp):lower()
    
    local _findesp = _esptypes[_uncaps]
    local _plrName = typeof(plr) == "Instance" and plr.Name or tostring(plr)
    local _plrchar = typeof(plr) == "Instance" and plr.Character or workspace:FindFirstChild(_plrName)
    if not _plrchar then return end 
    if _findesp == "chams" then
        if _espfolder:FindFirstChild(_plrName .. "-" .. _findesp) then return end
        local _highlight = Instance.new("Highlight")
        _highlight.Name = _plrName .. "-" .. _findesp
        _highlight.FillColor = color
        _highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        _highlight.Adornee = _plrchar
        _highlight.Parent = _espfolder
        if outline == false then
        _highlight.OutlineTransparency = 1
        else
        _highlight.OutlineColor = outline
        end
        if color == false then
        _highlight.FillTransparency = 1
        else _highlight.FillColor = color end 
    end
end
function _ESPLib:Remove(plr, esp)
    local _rgui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
    local _espfolder = _rgui:FindFirstChild("_ESPLIB")
    if not _espfolder then return end
    _espfolder.Name = "_ESPLIB"

    local _plrName = typeof(plr) == "Instance" and plr.Name or tostring(plr)
    local _uncaps = tostring(esp):lower()
    if _uncaps then
    local _searchesp = _espfolder:FindFirstChild(_plrName .. "-" .. _uncaps)
    if not _searchesp then return end
    _searchesp:Destroy()
    end
end
function _ESPLib:RemoveAll()
    local _rgui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
    local _espfolder = _rgui:FindFirstChild("_ESPLIB")
    for i,v in _espfolder:GetChildren() do
        v:Destroy()
    end
end -- GITHUB WONT UPDATE THE REMOVEALL FOR SOME REASON AND ITS STUCK AT ONLY :REMOVE() AAAAAAAAAAAAAAAAAAAAAAAA
return _ESPLib
