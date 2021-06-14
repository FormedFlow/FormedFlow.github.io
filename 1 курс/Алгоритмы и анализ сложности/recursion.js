var sec_cnt=0;
add_cnt=0;
mpy_cnt=0;
pwr_cnt=0;

function sec(a){
	console.trace("sec count = ",++sec_cnt);
	return ++a;
}
function add (a,b){
	console.trace("add count = ",++add_cnt);
	if(b==0)
		return a;
	else 
		return sec(add(a,b-1));
}
function mpy (a,b){
	console.trace("mpy count = ",++mpy_cnt);
	if(b==1)
		return a;
	else 
		return add(a,mpy(a,b-1));
}
function pwr(a,b){
	console.trace("pwr = ",++pwr_cnt);
	if(b==0)
		return 1;
	else
		return mpy(a,pwr(a,b-1));
}
console.log(pwr(3,2));