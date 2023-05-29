extends Node

const effektivSolMW : float = 160.6584
const effektivHavMW : float = 822.4086
const effektivLandMW : float = 1013.1

var EkstraSolMW : float = 0
var EkstraLandvindMW : float = 0
var EkstraHavvindMW : float = 0
var EkstraAtomMW : float = 0

var FaktorSol : float = 1
var FaktorLand : float = 1
var FaktorHav : float = 1

var ProdSol : PackedFloat64Array
var ProdHav : PackedFloat64Array
var ProdLand : PackedFloat64Array
var Forbrug : PackedFloat64Array
var Datoer : PackedStringArray
var NDat: int = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("res://ElData.csv", FileAccess.READ)
	file.get_csv_line(";")
	file.get_csv_line(";")
	while file.get_position() < file.get_length():
		NDat += 1
		var nextline = file.get_csv_line(";")
		Datoer.append(nextline[0])
		ProdSol.append(nextline[6].to_float())
		ProdHav.append(nextline[8].to_float())
		ProdLand.append(nextline[9].to_float())
		Forbrug.append(nextline[10].to_float())
	file.close()
