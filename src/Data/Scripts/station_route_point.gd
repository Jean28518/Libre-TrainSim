class_name StationRoutePoint
extends Resource

var type = RoutePointType.STATION
var node_name = ""
var station_name = ""
var stop_type = StopType.REGULAR
var duration_since_station_before: int = 300
var planned_halt_time: int = 20
var minimal_halt_time: int = 15
var signal_time: int = 60
var waiting_persons: int = 100
var leaving_persons: int = 50
var arrival_sound_path = ""
var departure_sound_path = ""
var approach_sound_path = ""
var arrival_time: int = -1  # Only added by RouteManager.get_calculated_station_*()
var departure_time: int = -1 # Only added by RouteManager.get_calculated_station_*()
