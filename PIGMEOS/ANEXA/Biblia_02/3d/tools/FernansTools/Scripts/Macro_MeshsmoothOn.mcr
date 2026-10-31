macroScript F_MeshsmoothOn category:"Fernans Tools"
(
	--go through all object of the scene
	for i in $* do
	(
		-- Find if meshsmooth exists in modifier stack
		-- Switch modifier on or off depending on actual macroscript
		for m in i.modifiers where classof m == MeshSmooth  do
		(
			m.enabled = true
			m.enabledInViews = true
--			m.update  = 0
		)
		
		for m in i.modifiers where classof m == TurboSmooth  do
		(
			m.enabled = true
			m.enabledInViews = true			
--			m.update  = 0
		)

	)
	
	--update $
)
