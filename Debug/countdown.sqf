 private["_count"]; 
 _count = 3;
 while{_count>0} do    {
 hint format["Match starting in: %1", _count];
 _count = _count - 1;
 sleep 1;   
 };
 hint "GO!";