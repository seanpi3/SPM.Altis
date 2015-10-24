{if(name vehicle _x == "MACK2411") then {	
			_x addAction ["Go to Tempest Base",{
					player setPos getPos tempestBaseSpawn;
					player setDir 288;	
			}];
		};
		if(name vehicle _x == "Ozadu") then {
				_x addAction ["Go to Tempest Base",{
					player setPos getPos tempestBaseSpawn;
					player setDir 288;		
			}];
		};
		if(name vehicle _x == "-T- Ozadu") then {
				_x addAction ["Go to Tempest Base",{
					player setPos getPos tempestBaseSpawn;
					player setDir 288;		
			}];
		};
		if(name vehicle _x == "-T- Mack") then {
			_x addAction ["Go to Tempest Base",{
				player setPos getPos tempestBaseSpawn;
				player setDir 288;		
			}];
		};
		if(name vehicle _x == "-T- Sneaky") then {
			_x addAction ["Go to Tempest Base",{
				player setPos getPos tempestBaseSpawn;
				player setDir 288;		
			}];
		};
		if(name vehicle _x == "-T- Sasquatch") then {
			_x addAction ["Go to Tempest Base",{
				player setPos getPos tempestBaseSpawn;
				_x setDir 288;		
			}];
		};
		if(name vehicle _x == "T- Steez") then {
			_x addAction ["Go to Tempest Base",{
				player setPos getPos tempestBaseSpawn;
				player setDir 288;		
			}];
		};
		if(name vehicle _x == "T- Jamooze") then {
			_x addAction ["Go to Tempest Base",{
				player setPos getPos tempestBaseSpawn;
				player setDir 288;		
			}];
		if(name vehicle _x == "T- Chaotic") then {
			_x addAction ["Go to Tempest Base",{
				player setPos getPos tempestBaseSpawn;
				player setDir 288;		
			}];
		};
		};
} forEach allUnits;