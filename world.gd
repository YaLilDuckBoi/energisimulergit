extends Node2D

const skalerMW = -1.0/16.0
const skalerPris = -1.0/16.0 * 25


var n: int = 0;
var SimSol : PackedVector2Array
var SimHav : PackedVector2Array
var SimLand : PackedVector2Array
var SimAtom : PackedVector2Array
var SimFornybar : PackedVector2Array
var SimForbrug : PackedVector2Array
var SimPris : PackedVector2Array

var SkaleretSimSol : PackedVector2Array
var SkaleretSimHav : PackedVector2Array
var SkaleretSimLand : PackedVector2Array
var SkaleretSimAtom : PackedVector2Array
var SkaleretSimFornybar : PackedVector2Array
var SkaleretSimForbrug : PackedVector2Array
var SkaleretSimPris : PackedVector2Array


var tmppris : float = 0
var tmpbalance : float = 0
var a : float =  0.0212
var b : float = 58.8055

# Called when the node enters the scene tree for the first time.
func _ready():
	if 0:
		$Sol.scale.y = skalerMW
		$Hav.scale.y = skalerMW
		$Land.scale.y = skalerMW
		$Atom.scale.y = skalerMW
		$Forbrug.scale.y = skalerMW
		$Fornybare.scale.y = skalerMW
		$Pris.scale.y = skalerPris

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for j in 6:
		if n < Gs.NDat:
			SimSol.append(Vector2(float(n), Gs.ProdSol[n]*Gs.FaktorSol))
			SkaleretSimSol.append(Vector2(float(n), skalerMW*Gs.ProdSol[n]*Gs.FaktorSol))
			$Sol.points = SkaleretSimSol
			SimHav.append(Vector2(float(n), Gs.ProdHav[n]*Gs.FaktorHav))
			SkaleretSimHav.append(Vector2(float(n), skalerMW*Gs.ProdHav[n]*Gs.FaktorHav))
			$Hav.points = SkaleretSimHav
			SimLand.append(Vector2(float(n), Gs.ProdLand[n]*Gs.FaktorLand))
			SkaleretSimLand.append(Vector2(float(n), skalerMW*Gs.ProdLand[n]*Gs.FaktorLand))
			$Land.points = SkaleretSimLand
			SimAtom.append(Vector2(float(n), Gs.EkstraAtomMW))
			SkaleretSimAtom.append(Vector2(float(n), skalerMW*Gs.EkstraAtomMW))
			$Atom.points = SkaleretSimAtom
			SimForbrug.append(Vector2(float(n), Gs.Forbrug[n]))
			SkaleretSimForbrug.append(Vector2(float(n), skalerMW*Gs.Forbrug[n]))
			$Forbrug.points = SkaleretSimForbrug
			SimFornybar.append(Vector2(float(n), (Gs.EkstraAtomMW + Gs.ProdSol[n]*Gs.FaktorSol + Gs.ProdHav[n]*Gs.FaktorHav + Gs.ProdLand[n]*Gs.FaktorLand)))
			SkaleretSimFornybar.append(Vector2(float(n), skalerMW*(Gs.EkstraAtomMW + Gs.ProdSol[n]*Gs.FaktorSol + Gs.ProdHav[n]*Gs.FaktorHav + Gs.ProdLand[n]*Gs.FaktorLand)))
			$Fornybare.points = SkaleretSimFornybar
			tmpbalance = Gs.Forbrug[n] - (Gs.EkstraAtomMW + Gs.ProdSol[n]*Gs.FaktorSol + Gs.ProdHav[n]*Gs.FaktorHav + Gs.ProdLand[n]*Gs.FaktorLand)
			tmppris = a * tmpbalance + b
			SimPris.append(Vector2(float(n), tmppris))
			SkaleretSimPris.append(Vector2(float(n), skalerPris  * tmppris))
			$Pris.points = SkaleretSimPris
			$CanvasLayer/Dato.text = Gs.Datoer[n]
			
			n += 1
	$Camera2D.position.x = min(float(Gs.ProdSol.size()),float(n)+300.0)
	




func _on_simuler_pressed():
	n = 0;
	SimSol.clear()
	SimHav.clear()
	SimLand.clear()
	SimAtom.clear()
	SimForbrug.clear()
	SimFornybar.clear()
	SimPris.clear()

	SkaleretSimSol.clear()
	SkaleretSimHav.clear()
	SkaleretSimLand.clear()
	SkaleretSimAtom.clear()
	SkaleretSimForbrug.clear()
	SkaleretSimFornybar.clear()
	SkaleretSimPris.clear()

	$Sol.points = SimSol
	$Land.points = SimSol
	$Hav.points = SimSol
	$Atom.points = SimSol
	$Forbrug.points = SimSol
	$Fornybare.points = SimSol
	$Pris.points = SimSol
	
