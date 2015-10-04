switch (castleDefence) do {
	case "opfor": {
	//SystemChat "setting up blueforMarkers";
		//This needs to be redone for proper groups
			if (side player == east	) then 
				{
					castleDefenceMarker = createMarker ["castleDefenceMarker", position CastleFlag];
					castleDefenceMarker setMarkerType "o_unknown";
					castleDefenceMarker setMarkerColor "ColorEAST";
					castleDefenceMarker setMarkerText "Defend The Castle";
					castleDefenceMarker setMarkerSize [.5, .5];
				};
		

			if (side player == west) then 
				{
					castleOffenceMarker = createMarker ["castleOffenceMarker", position CastleFlag];
					castleOffenceMarker setMarkerType "o_unknown";
					castleOffenceMarker setMarkerColor "ColorEAST";
					castleOffenceMarker setMarkerText "Capture The Castle";
					castleOffenceMarker setMarkerSize [.5, .5];
					
				};

	};
	case "bluefor": {
			if (side player == west) then 
				{
					castleDefenceMarker = createMarker ["castleDefenceMarker", position CastleFlag];
					castleDefenceMarker setMarkerType "o_unknown";
					castleDefenceMarker setMarkerColor "ColorWEST";
					castleDefenceMarker setMarkerText "Defend The Castle";
					castleDefenceMarker setMarkerSize [.5, .5];
	
				};
			if (side player == east) then 
				{
					castleOffenceMarker = createMarker ["castleOffenceMarker", position CastleFlag];
					castleOffenceMarker setMarkerType "o_unknown";
					castleOffenceMarker setMarkerColor "ColorWEST";
					castleOffenceMarker setMarkerText "Capture The Castle";
					castleOffenceMarker setMarkerSize [.5, .5];
						
				};

	};

};