	private [
		"_curr",
		"_parent",
		"_void"
	];

	_curr = _this select 0;
	_parent = _this select 1;
	_void = configFile >> "*";

	while { true } do {
	    if( _curr == _void ) exitwith { false };
	    if( _curr == _parent ) exitwith { true };
	    _curr = inheritsFrom _curr;
	};
	