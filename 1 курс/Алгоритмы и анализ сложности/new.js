while (Math.abs(q-p)<=Precision){
	let hl=(q+p)/2;
		if (f(hl)*f(p)<=0)
			q=hl;
    else
      p=hl;
}
return (q+p)/2;
}