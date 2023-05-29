extends Control






# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_sol_mw_text_submitted(new_text):
	if new_text.is_valid_float():
		Gs.EkstraSolMW = new_text.to_float()
		Gs.FaktorSol = (Gs.EkstraSolMW + Gs.effektivSolMW)/Gs.effektivSolMW 
		get_node("SolMW").text = String.num(Gs.EkstraSolMW)
		get_node("SkaleringSol").text = String.num(Gs.FaktorSol)
	else:
		get_node("SolMW").text = "0"
		get_node("SkaleringSol").text = "1"
		Gs.EkstraSolMW = 0
		Gs.FaktorSol = 1


func _on_lanvind_mw_text_submitted(new_text):
	if new_text.is_valid_float():
		Gs.EkstraLandvindMW = new_text.to_float()
		Gs.FaktorLand = (Gs.EkstraLandvindMW + Gs.effektivLandMW)/Gs.effektivLandMW 
		get_node("LandvindMW").text = String.num(Gs.EkstraLandvindMW)
		get_node("SkaleringLand").text = String.num(Gs.FaktorLand)
	else:
		get_node("LandvindMW").text = "0"
		get_node("SkaleringLand").text = "1"
		Gs.EkstraLandvindMW = 0
		Gs.FaktorLand = 1


func _on_havvind_mw_text_submitted(new_text):
	if new_text.is_valid_float():
		Gs.EkstraHavvindMW = new_text.to_float()
		Gs.FaktorHav = (Gs.EkstraHavvindMW + Gs.effektivHavMW)/Gs.effektivHavMW 
		get_node("HavvindMW").text = String.num(Gs.EkstraHavvindMW)
		get_node("SkaleringHav").text = String.num(Gs.FaktorHav)
	else:
		get_node("HavvindMW").text = "0"
		get_node("SkaleringHav").text = "1"
		Gs.EkstraHavvindMW = 0
		Gs.FaktorHav = 1


func _on_atom_mw_text_submitted(new_text):
	if new_text.is_valid_float():
		Gs.EkstraAtomMW = new_text.to_float()
		get_node("AtomMW").text = String.num(Gs.EkstraAtomMW)
	else:
		get_node("AtomMW").text = "0"
		Gs.EkstraAtomMW = 0


func _on_skalering_sol_text_submitted(new_text):
	if new_text.is_valid_float():
		Gs.FaktorSol = new_text.to_float()
		Gs.EkstraSolMW = Gs.effektivSolMW * (Gs.FaktorSol-1)
		get_node("SolMW").text = String.num(Gs.EkstraSolMW)
		get_node("SkaleringSol").text = String.num(Gs.FaktorSol)
	else:
		get_node("SolMW").text = "0"
		get_node("SkaleringSol").text = "1"
		Gs.EkstraSolMW = 0
		Gs.FaktorSol = 1


func _on_skalering_land_text_submitted(new_text):
	if new_text.is_valid_float():
		Gs.FaktorLand = new_text.to_float()
		Gs.EkstraLandvindMW =  Gs.effektivLandMW * (Gs.FaktorLand-1)
		get_node("LandvindMW").text = String.num(Gs.EkstraLandvindMW)
		get_node("SkaleringLand").text = String.num(Gs.FaktorLand)
	else:
		get_node("LandvindMW").text = "0"
		get_node("SkaleringLand").text = "1"
		Gs.EkstraLandvindMW = 0
		Gs.FaktorLand = 1


func _on_skalering_hav_text_submitted(new_text):
	if new_text.is_valid_float():
		Gs.FaktorHav = new_text.to_float()
		Gs.EkstraHavvindMW =  Gs.effektivHavMW * (Gs.FaktorHav-1)
		get_node("HavvindMW").text = String.num(Gs.EkstraHavvindMW)
		get_node("SkaleringHav").text = String.num(Gs.FaktorHav)
	else:
		get_node("HavvindMW").text = "0"
		get_node("SkaleringHav").text = "1"
		Gs.EkstraHavvindMW = 0
		Gs.FaktorHav = 1
