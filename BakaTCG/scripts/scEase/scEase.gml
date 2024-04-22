#region Ease In
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_sine(_x){
	return 1 - cos((_x * pi) / 2);
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_quad(_x){
	return power(_x, 2);
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_cubic(_x){
	return power(_x, 3);
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_quart(_x){
	return power(_x, 4);
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_quint(_x){
	return power(_x, 5);
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_expo(_x){
	return _x == 0 ? 0 : power(2, 10 * _x - 10);
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_circ(_x){
	return 1 - sqrt(1 - power(_x, 2));
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_back(_x){
	var c1 = 1.70158;
	var c3 = c1 + 1;
	
	return c3 * _x * _x * _x - c1 * _x * _x;
}
#endregion
#region Ease out
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_out_sine(_x){
	return sin((_x * pi) / 2);
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_out_quad(_x){
	return 1 - (1 - _x) * (1 - _x);
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_out_cubic(_x){
	return 1 - power(1 - _x, 3);
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_out_quart(_x){
	return 1 - power(1 - _x, 4);
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_out_quint(_x){
	return 1 - power(1 - _x, 5);
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_out_expo(_x){
	return _x == 1 ? 1 : 1 - power(2, -10 * _x);
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_out_circ(_x){
	return sqrt(1 - power(_x - 1, 2));
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_out_back(_x){
	var c1 = 1.70158;
	var c3 = c1 + 1;

	return 1 + c3 * power(_x - 1, 3) + c1 * power(_x - 1, 2);
}
#endregion
#region Ease In Out
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_out_sine(_x){
	return -(cos(pi * _x) - 1) / 2;
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_out_quad(_x){
	return _x < 0.5 ? 2 * _x * _x : 1 - power(-2 * _x + 2, 2) / 2;
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_out_cubic(_x){
	return _x < 0.5 ? 4 * _x * _x * _x : 1 - power(-2 * _x + 2, 3) / 2;
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_out_quart(_x){
	return _x < 0.5 ? 8 * _x * _x * _x * _x : 1 - power(-2 * _x + 2, 4) / 2;
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_out_quint(_x){
	return _x < 0.5 ? 16 * _x * _x * _x * _x * _x : 1 - power(-2 * _x + 2, 5) / 2;
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_out_circ(_x){
	return _x < 0.5 ? (1 - sqrt(1 - power(2 * _x, 2))) / 2 : (sqrt(1 - power(-2 * _x + 2, 2)) + 1) / 2;
}
/// @arg {real} x Absolute progress of the animation in the bounds of 0 (beginning of the animation) and 1 (end of animation).
/// @pure
function ease_in_out_back(_x){
	var c1 = 1.70158;
	var c2 = c1 * 1.525;

	return _x < 0.5
	  ? (power(2 * _x, 2) * ((c2 + 1) * 2 * _x - c2)) / 2
	  : (power(2 * _x - 2, 2) * ((c2 + 1) * (_x * 2 - 2) + c2) + 2) / 2;
}
#endregion
#region Useful
function ease_movement(_x, _target,_function, _stop){
	if (_stop) _x = clamp(_x,0,1);
	return _function(_x) * _target; 
}

function delta(){
	return delta_time / ((1/60)*1_000_000);
}
#endregion