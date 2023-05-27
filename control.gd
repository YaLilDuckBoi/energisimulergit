extends Control

var solmw : float = 0
var landvindmw : float = 0
var havvindmw : float = 0
var atommw : float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_sol_mw_text_submitted(new_text):
	if new_text.is_valid_float():
		solmw = new_text.to_float()
		get_node("SolMW").text = String.num(solmw)
	else:
		get_node("SolMW").text = "0"
		solmw = 0


func _on_lanvind_mw_text_submitted(new_text):
	if new_text.is_valid_float():
		landvindmw = new_text.to_float()
		get_node("LanvindMW").text = String.num(landvindmw)
	else:
		get_node("LanvindMW").text = "0"
		landvindmw = 0


func _on_havvind_mw_text_submitted(new_text):
	if new_text.is_valid_float():
		havvindmw = new_text.to_float()
		get_node("HavvindMW").text = String.num(havvindmw)
	else:
		get_node("HavvindMW").text = "0"
		havvindmw = 0


func _on_atom_mw_text_submitted(new_text):
	if new_text.is_valid_float():
		atommw = new_text.to_float()
		get_node("AtomMW").text = String.num(atommw)
	else:
		get_node("AtomMW").text = "0"
		atommw = 0
