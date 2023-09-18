while game:IsLoaded() do
glassparent = game.Workspace["Glass Bridge"].GlassPane
for i,v in ipairs(glassparent:GetChildren()) do
	if v:IsA("Folder") then
		for t,x in ipairs(v:GetChildren()) do
			x.CanCollide = true
			for b,c in ipairs(x:GetChildren()) do
					c:Destroy()
			end
		end
	end
end
wait(.01)
end
