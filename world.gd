extends Node2D

const skalerMW = -1.0/15.0
const skalerPris = -2.0


var n: int = 0;
var SimSol : PackedVector2Array
var SimHav : PackedVector2Array
var SimLand : PackedVector2Array
var SimAtom : PackedVector2Array
var SimFornybar : PackedVector2Array
var SimForbrug : PackedVector2Array
var SimPris : PackedVector2Array

var tmppris : float = 0
var tmpbalance : float = 0
var a : float =  0.0212
var b : float = 58.8055

# Called when the node enters the scene tree for the first time.
func _ready():
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
			$Sol.points = SimSol
			SimHav.append(Vector2(float(n), Gs.ProdHav[n]*Gs.FaktorHav))
			$Hav.points = SimHav
			SimLand.append(Vector2(float(n), Gs.ProdLand[n]*Gs.FaktorLand))
			$Land.points = SimLand
			SimAtom.append(Vector2(float(n), Gs.EkstraAtomMW))
			$Atom.points = SimAtom
			SimForbrug.append(Vector2(float(n), Gs.Forbrug[n]))
			$Forbrug.points = SimForbrug
			SimFornybar.append(Vector2(float(n), (Gs.EkstraAtomMW + Gs.ProdSol[n]*Gs.FaktorSol + Gs.ProdHav[n]*Gs.FaktorHav + Gs.ProdLand[n]*Gs.FaktorLand)))
			$Fornybare.points = SimFornybar
			tmpbalance = Gs.Forbrug[n] - (Gs.EkstraAtomMW + Gs.ProdSol[n]*Gs.FaktorSol + Gs.ProdHav[n]*Gs.FaktorHav + Gs.ProdLand[n]*Gs.FaktorLand)
			tmppris = a * tmpbalance + b
			SimPris.append(Vector2(float(n), tmppris))
			$Pris.points = SimPris
			
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
	$Sol.points = SimSol
	$Land.points = SimSol
	$Hav.points = SimSol
	$Atom.points = SimSol
	$Forbrug.points = SimSol
	$Fornybare.points = SimSol
	$Pris.points = SimSol
	
