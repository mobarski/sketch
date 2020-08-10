import hash

struct CountMin {
	k int
	size int
mut:
	data [][]u64
}

fn new_countmin(k int, size int) &CountMin {
	mut cm := &CountMin{k, size}
	cm.data = [][]u64{len:k, init:[]u64{len:size}}
	return cm
}

fn (mut c CountMin) add(item string) {
	for k in 0..c.k {
		h := hash.sum64_string(item, u64(k))
		i := h % u64(c.size)
		c.data[k][i]++
	}
}

fn (c CountMin) estimate(item string) u64 {
	mut vals := []u64{cap:c.k}
	for k in 0..c.k {
		h := hash.sum64_string(item, u64(k))
		i := h % u64(c.size)
		v := c.data[k][i]
		if false { // TODO option / separate function
			mean_other := (sum(c.data[k])-v) / u64(c.size-1)
			vals << u64(f64(v)-mean_other)
		} else {
			vals << v
		}
	}
	//println("$item $vals")
	return min(vals)
}


// ---[ UTIL ]------------------------------------------------------------------

fn sum(a []u64) u64 {
	mut out := u64(0)
	for x in a {
		out += x
	}
	return out
}

fn min(a []u64) u64 {
	mut out := a[0]
	for x in a {
		if x < out {
			out = x
		}
	}
	return out
}

// ---[ MAIN ]------------------------------------------------------------------

mut c := new_countmin(3,4)
c.add('test')
c.add('stop')
c.add('test')
println(c)
println(c.estimate("test"))
println(c.estimate("stop"))
