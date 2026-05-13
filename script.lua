J lplr = game:GetService("Players").LocalPlayer;
local mt = getrawmetatable(game);
local old = mt.__namecall;

setreadonly(mt, false);
mt.__namecall = newcclosure(function(self, ...)
    if on and getnamecallmethod() == "FireServer" and self.Parent == lplr.Character and type((...)) == "table" then
        local n, c = {}, 0;
        for _, v in next, (...) do for i = 1, m do c += 1; n[c] = v; end; end;
        return old(self, n, select(2, ...));
    end;
    return old(self, ...);
end);
setreadonly(mt, true);
