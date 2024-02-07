
if (count != -1){
    if (count % 2 == 0){
        request_make("games/waitCount", "PATCH", ++count);
        request_make($"games/waitList/{irandom_range(0,9999)}/{global.username}", "PUT");
    } else{
        
    }
}