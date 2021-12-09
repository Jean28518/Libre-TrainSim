extends Node

var scenario: String = Root.currentScenario
var world: Node = find_parent("World")
var step: int = 0
var player: LTSPlayer
var message_sent: bool = false


func _process(delta: float) -> void:
	if Root.scenario_editor:
		return
	if world == null:
		world = find_parent("World")
	if player == null:
		player = world.get_node("Players/Player")
		player.force_close_doors()
		player.force_pantograph_up()
		player.startEngine()
		player.enforced_braking = false
		player.command = 0
		player.soll_command = 0

	send_message(delta)
	if scenario == "H/V Form Signals":
		hv_form_signals()
		return
	elif scenario == "H/V Light Signals":
		hv_light_signals()
		return
	elif scenario == "KS Signals":
		ks_signals()
		return
	elif scenario == "HL Signals":
		hl_signals()
		return
	message_sent = true

func hv_form_signals() -> void:
	match step:
		0:
			message = tr("TUTORIAL_HV_FORM_0")
			if player.distance_on_route >= 120:
				next_step()
		1:
			message = tr("TUTORIAL_HV_FORM_1")
			if player.distance_on_route >= 380:
				next_step()
		2:
			message = tr("TUTORIAL_HV_FORM_2")
			if player.distance_on_route >= 620:
				next_step()
		3:
			message = tr("TUTORIAL_HV_FORM_3")
			if player.distance_on_route >= 920:
				next_step()
		4:
			message = tr("TUTORIAL_HV_FORM_4")
			if player.distance_on_route >= 1220:
				next_step()
		5:
			message = tr("TUTORIAL_HV_FORM_5")
			if player.distance_on_route >= 1420:
				next_step()
		6:
			message = tr("TUTORIAL_HV_FORM_6")
			if player.distance_on_route >= 1620:
				next_step()
		7:
			message = tr("TUTORIAL_HV_FORM_7")
			if player.distance_on_route >= 1910:
				next_step()
		8:
			message = tr("TUTORIAL_HV_FORM_8")
			if player.speed == 0:
				next_step()
		9:
			message = tr("TUTORIAL_SIGNAL_BYE")


func hv_light_signals() -> void:
	match step:
		0:
			message = tr("TUTORIAL_HV_LIGHT_0")
			if player.distance_on_route >= 120:
				next_step()
		1:
			message = tr("TUTORIAL_HV_LIGHT_1")
			if player.distance_on_route >= 380:
				next_step()
		2:
			message = tr("TUTORIAL_HV_LIGHT_2")
			if player.distance_on_route >= 620:
				next_step()
		3:
			message = tr("TUTORIAL_HV_LIGHT_3")
			if player.distance_on_route >= 920:
				next_step()
		4:
			message = tr("TUTORIAL_HV_LIGHT_4")
			if player.distance_on_route >= 1220:
				next_step()
		5:
			message = tr("TUTORIAL_HV_FORM_5")
			if player.distance_on_route >= 1420:
				next_step()
		6:
			message = tr("TUTORIAL_HV_FORM_6")
			if player.distance_on_route >= 1620:
				next_step()
		7:
			message = tr("TUTORIAL_HV_LIGHT_7")
			if player.distance_on_route >= 1910:
				next_step()
		8:
			message = tr("TUTORIAL_HV_LIGHT_8")
			if player.speed == 0:
				next_step()
		9:
			message = tr("TUTORIAL_SIGNAL_BYE")


func ks_signals() -> void:
	match step:
		0:
			message = tr("TUTORIAL_KS_0")
			if player.distance_on_route >= 120:
				next_step()
		1:
			message = tr("TUTORIAL_KS_1")
			if player.distance_on_route >= 420:
				next_step()
		2:
			message = tr("TUTORIAL_KS_2")
			if player.distance_on_route >= 820:
				next_step()
		3:
			message = tr("TUTORIAL_KS_3")
			if player.distance_on_route >= 1080:
				next_step()
		4:
			message = tr("TUTORIAL_KS_4")
			if player.distance_on_route >= 1420:
				next_step()
		5:
			message = tr("TUTORIAL_KS_5")
			if player.distance_on_route >= 1910:
				next_step()
		6:
			message = tr("TUTORIAL_KS_6")
			if player.speed == 0:
				next_step()
		7:
			message = tr("TUTORIAL_SIGNAL_BYE")


func hl_signals() -> void:
	match step:
		0:
			message = tr("TUTORIAL_HL_0")
			if player.distance_on_route >= 120:
				next_step()
		1:
			message = tr("TUTORIAL_HL_1")
			if player.distance_on_route >= 320:
				next_step()
		2:
			message = tr("TUTORIAL_HL_2")
			if player.distance_on_route >= 620:
				next_step()
		3:
			message = tr("TUTORIAL_HL_3")
			if player.distance_on_route >= 910:
				next_step()
		4:
			message = tr("TUTORIAL_HL_4")
			if player.distance_on_route >= 1120:
				next_step()
		5:
			message = tr("TUTORIAL_HL_5")
			if player.distance_on_route >= 1320:
				next_step()
		6:
			message = tr("TUTORIAL_HL_6")
			if player.distance_on_route >= 1620:
				next_step()
		7:
			message = tr("TUTORIAL_HL_7")
			if player.distance_on_route >= 1910:
				next_step()
		8:
			message = tr("TUTORIAL_HL_8")
			if player.speed == 0:
				next_step()
		9:
			message = tr("TUTORIAL_SIGNAL_BYE")


var send_message_timer: float = 0
var message: String = ""
func send_message(delta: float) -> void:
	send_message_timer += delta
	if not message_sent and send_message_timer > 1:
		message_sent = true
		player.show_textbox_message(message)


func next_step() -> void:
	step += 1
	message_sent = false
	send_message_timer = 0
