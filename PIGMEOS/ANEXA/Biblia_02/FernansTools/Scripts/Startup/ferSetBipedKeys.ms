macroScript FernansTools_bipedKeys_bias0
	category:"Fernans Tools"
	tooltip:"Set bias to 0"
	buttonText:"Bias=0"
	icon:#("fernans", 4)
(
	p=selectParent()
	forAllChildrenDo p setBias0
)
macroScript FernansTools_bipedKeys_bias25
	category:"Fernans Tools"
	tooltip:"Set bias to 25"
	buttonText:"Bias=25"
	icon:#("fernans", 5)
(
	p=selectParent()
	forAllChildrenDo p setBias25
)

macroScript FernansTools_bipedKeys_bias50
	category:"Fernans Tools"
	tooltip:"Set bias to 50"
	buttonText:"Bias=50"
	icon:#("fernans", 6)
(
	p=selectParent()
	forAllChildrenDo p setBias50
)

macroScript FernansTools_bipedKeys_continuity0
	category:"Fernans Tools"
	tooltip:"Set continuityto 0"
	buttonText:"continuity=0"
	icon:#("fernans", 0)
(
	p=selectParent()
	forAllChildrenDo p setcontinuity0
)

macroScript FernansTools_bipedKeys_continuity25
	category:"Fernans Tools"
	tooltip:"Set continuityto 25"
	buttonText:"continuity=25"
	icon:#("fernans", 0)
(
	p=selectParent()
	forAllChildrenDo p setcontinuity25
)


macroScript FernansTools_bipedKeys_EaseTo50
	category:"Fernans Tools"
	tooltip:"Set EaseTo 50"
	buttonText:"easeTo=50"
	icon:#("fernans", 7)
(
	p=selectParent()
	forAllChildrenDo p seteaseto50
)
macroScript FernansTools_bipedKeys_EaseFrom50
	category:"Fernans Tools"
	tooltip:"Set EaseFrom 50"
	buttonText:"easeFrom=50"
	icon:#("fernans", 8)
(
	p=selectParent()
	forAllChildrenDo p seteasefrom50
)
macroScript FernansTools_bipedKeys_ResetEaseToFrom
	category:"Fernans Tools"
	tooltip:"Reset EaseTo&From"
	buttonText:"ResetEase"
	icon:#("fernans", 9)
(
	p=selectParent()
	forAllChildrenDo p seteaseto0
	forAllChildrenDo p seteasefrom0
)


fn selectParent obj:undefined = (
	if (obj==undefined) then (
		a=getCurrentSelection()
		if (a.count>0) then obj=a[1] else obj=undefined
	)
	if (obj!=undefined) then
	(
		try (
			obj=biped.getNode obj.controller #turn	
		) catch ()
--		) catch(obj=undefined)
--		do (
--			tienepadre=true
--			if (obj.parent==undefined) then 
--				tienepadre=false
--			else (
--				a=obj.parent
--				if (classof a)==Biped_Object then
--					 obj=obj.parent	
--				else tienepadre=false
--			)
--		) while (tienepadre)
--		print obj
		return obj
	)
)

fn forAllChildrenDo obj fnc=(
	if (obj!=undefined) do
	(
		c=obj.children.count
		if (c>0) do (
			for a=1 to c do (
				forAllChildrenDo obj.children[a] fnc
			)			
		)
		if (classof obj.controller==Vertical_Horizontal_Turn) then (
				for d=1 to 3 do (
					a=getKeyIndex obj.controller[d].controller currentTime
					if (a>0) do (
						k=biped.getKey obj.controller[d].controller a
						fnc k
					)
				)
		) else if (classof obj.controller==prs) then (
				if (classof obj.rotation.controller==tcb_rotation) do
					(a=getKeyIndex obj.rotation.controller currentTime
					 if (a>0) do fnc (getKey obj.rotation.controller a))
		) else (
				a=getKeyIndex obj.controller currentTime
				if (a>0) do (
					k=biped.getKey obj.controller a
					fnc k
				)
		)
	)
)

fn setBias0 mobj = (
		mobj.bias=0
)

fn setbias25 mobj = (
	mobj.bias=25
)

fn setbias50 mobj = (
		mobj.bias=50
)

fn setcontinuity0 mobj = (
		mobj.continuity=0
)
fn setcontinuity25 mobj = (
		mobj.continuity=25
)

fn seteaseto50 mobj = (
		mobj.easeto=50
)
fn seteasefrom50 mobj = (
		mobj.easefrom=50
)
fn seteaseto0 mobj = (
		mobj.easeto=0
)
fn seteasefrom0 mobj = (
		mobj.easefrom=0
)

macroScript FernansTools_convertEulerRotationToTCBRotation
	category:"Fernans Tools"
	tooltip:"convertEulerRotationToTCBRotation"
	buttonText:"Euler->TCB"
(
	for obj in selection do (obj[3][2].controller = tcb_rotation ())
)