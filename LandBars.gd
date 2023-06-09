extends VBoxContainer

@onready var Barm5 : ProgressBar = $HBoxContainer/TWhBar
@onready var Barm4 : ProgressBar = $HBoxContainer/TWhBar2
@onready var Barm3 : ProgressBar = $HBoxContainer/TWhBar3
@onready var Barm2 : ProgressBar = $HBoxContainer/TWhBar4
@onready var Barm1 : ProgressBar = $HBoxContainer/TWhBar5
@onready var Bar0 : ProgressBar = $HBoxContainer/TWhBar6
@onready var Barp1 : ProgressBar = $HBoxContainer/TWhBar7
@onready var Barp2 : ProgressBar = $HBoxContainer/TWhBar8
@onready var Barp3 : ProgressBar = $HBoxContainer/TWhBar9
@onready var Barp4 : ProgressBar = $HBoxContainer/TWhBar10
@onready var Barp5 : ProgressBar = $HBoxContainer/TWhBar11

@onready var BarSalg : ProgressBar = $HBoxContainer/SalgsVaerdi

@onready var World : Node2D = $"../../../.."

var akkumuleretMWh : float = 0.0
var akkumuleretSalg : float = 0.0
var ProduktionsPrisPerMWh : float = 50.0/0.93
var ProduktionsPrisTotal : float = 0.0

var n : int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	Barm5.max_value = Gs.maxBarTWh
	Barm4.max_value = Gs.maxBarTWh
	Barm3.max_value = Gs.maxBarTWh
	Barm2.max_value = Gs.maxBarTWh
	Barm1.max_value = Gs.maxBarTWh
	Bar0.max_value = Gs.maxBarTWh
	Barp1.max_value = Gs.maxBarTWh
	Barp2.max_value = Gs.maxBarTWh
	Barp3.max_value = Gs.maxBarTWh
	Barp4.max_value = Gs.maxBarTWh
	Barp5.max_value = Gs.maxBarTWh
	
	BarSalg.max_value = Gs.maxBarPrise


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var sldfj : = World.n
	#var s23dfj : = World.n
	while n < World.n:
		var DataTilAkkumulering : float = World.SimLand[n].y 
		akkumuleretMWh += DataTilAkkumulering
		akkumuleretSalg += DataTilAkkumulering * World.SimPris[n].y
		BarSalg.value = akkumuleretSalg / akkumuleretMWh
#		BarSalg.tooltip_text =  "Salgssum: " + String.num(akkumuleretSalg*1e-9,3) + " milliarder Euro\n" + "Produceret: " + String.num(akkumuleretMWh*1e-6,3) + " TWh\n"  + "Gennemsnitssalgsværdi: " + String.num(BarSalg.value,2) + " Euro/MWh\n"
		BarSalg.tooltip_text =  "Salgssum: " + String.num(akkumuleretSalg*1e-9,3) + " milliarder Euro\n" + "Produceret: " + String.num(akkumuleretMWh*1e-6,3) + " TWh\n"  + "Gennemsnitssalgsværdi: " + String.num(BarSalg.value,2) + " Euro/MWh\n" + "Produktionspris per enhed: " + String.num(ProduktionsPrisPerMWh,2) + " Euro/MWh\n" +  "Produktionspris i alt: " + String.num(ProduktionsPrisPerMWh * akkumuleretMWh * 1e-9,3) + " milliarder Euro\n" 
		DataTilAkkumulering *= 1e-6  # fra MWh Til TWh
		var Balance : float = (World.SimForbrug[n].y - World.SimFornybar[n].y)
		if  Balance < -4500.0:
			Barm5.value += DataTilAkkumulering
			Barm5.tooltip_text = String.num(Barm5.value,3) + " TWh"
		elif Balance < -3500.0:
			Barm4.value += DataTilAkkumulering
			Barm4.tooltip_text = String.num(Barm4.value,3) + " TWh"
		elif Balance < -2500.0:
			Barm3.value += DataTilAkkumulering
			Barm3.tooltip_text = String.num(Barm3.value,3) + " TWh"
		elif Balance < -1500.0:
			Barm2.value += DataTilAkkumulering
			Barm2.tooltip_text = String.num(Barm2.value,3) + " TWh"
		elif Balance < -500.0:
			Barm1.value += DataTilAkkumulering
			Barm1.tooltip_text = String.num(Barm1.value,3) + " TWh"
		elif Balance < 500.0:
			Bar0.value += DataTilAkkumulering
			Bar0.tooltip_text = String.num(Bar0.value,3) + " TWh"
		elif Balance < 1500.0:
			Barp1.value += DataTilAkkumulering
			Barp1.tooltip_text = String.num(Barp1.value,3) + " TWh"
		elif Balance < 2500.0:
			Barp2.value += DataTilAkkumulering
			Barp2.tooltip_text = String.num(Barp2.value,3) + " TWh"
		elif Balance < 3500.0:
			Barp3.value += DataTilAkkumulering
			Barp3.tooltip_text = String.num(Barp3.value,3) + " TWh"
		elif Balance < 4500.0:
			Barp4.value += DataTilAkkumulering
			Barp4.tooltip_text = String.num(Barp4.value,3) + " TWh"
		else:
			Barp5.value += DataTilAkkumulering
			Barp5.tooltip_text = String.num(Barp5.value,3) + " TWh"
			
		n +=1
	if n > World.n: #genstart?
		n = 0
		Barm5.value = 0.0
		Barm4.value = 0.0
		Barm3.value = 0.0
		Barm2.value = 0.0
		Barm1.value = 0.0
		Bar0.value = 0.0
		Barp1.value = 0.0
		Barp2.value = 0.0
		Barp3.value = 0.0
		Barp4.value = 0.0
		Barp5.value = 0.0
		akkumuleretSalg = 0.0
		akkumuleretMWh = 0.0
	
	
	
