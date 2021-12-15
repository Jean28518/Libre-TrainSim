extends Node2D


func _ready():
	$Table/Arrival/Label.text = " " + TranslationServer.translate("ARRIVAL:") + " "
	$Table/Departure/Label.text = " " + TranslationServer.translate("DEPARTURE:") + " "
	$Table/Station/Label.text = " " + TranslationServer.translate("STATION:") + " "


func update_display(station_table: Array, current_station_table_index: int, is_in_station: bool):
	$CurrentStation.visible = is_in_station
	var arrString = ""
	var depString = ""
	var staString = ""
	for i in range(current_station_table_index, station_table.size()):

		if station_table[i].stop_type == StopType.BEGINNING or\
				station_table[i].stop_type == StopType.DO_NOT_STOP:
			arrString += "\n"
		else:
			arrString += Math.seconds_to_string(station_table[i].arrival_time) + "\n"

		if station_table[i].stop_type == StopType.END:
			depString += "\n"
		else:
			depString += Math.seconds_to_string(station_table[i].departure_time) + "\n"

		staString += station_table[i].station_name + "\n"

	$Table/Arrival/Label2.text = arrString
	$Table/Departure/Label2.text = depString
	$Table/Station/Label2.text = staString
