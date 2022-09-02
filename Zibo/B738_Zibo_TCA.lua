if PLANE_ICAO == "B738" then

	G1 = 339

	dataref("pb1", "laminar/B738/parking_brake_pos", "writable")
	dataref("pb2", "sim/cockpit2/controls/parking_brake_ratio", "writable")
	dataref("pb", "sim/flightmodel/controls/parkbrake")

	local _pbrake_active = false

	function parkingBrakeZibo_v354()
		if (button(G1) == true) and (_pbrake_active == false) then
			_pbrake_active = true
			pb = 1
			command_once("laminar/B738/push_button/park_brake_on_off")
			pb1 = 1
			pb2 = 1
		elseif (button(G1) == false) and (_pbrake_active == true) then
			_pbrake_active = false
			pb = 0
			command_once("laminar/B738/push_button/park_brake_on_off")
			pb1 = 0
			pb2 = 0
		end
	end
	
	function parkingBrake()
	-- for older versions like 3.33h
		if (button(G1) == true) and (_pbrake_active == false) then
			_pbrake_active = true
			pb = 1
		elseif (button(G1) == false) and (_pbrake_active == true) then
			_pbrake_active = false
			pb = 0
		end
	end

	--do_every_frame("parkingBrake()")
	do_every_frame("parkingBrakeZibo_v354()")

end

-- sim/multiplayer/controls/parking_brake
-- [1.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.]
-- [0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.]
