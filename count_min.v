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
		vals << v
	}
	//println("$item $vals")
	return min(vals)
}

/*
fn (c CountMin) estimate2(item string) u64 {
	mut vals := []f64{cap:c.k}
	for k in 0..c.k {
		h := hash.sum64_string(item, u64(k))
		i := h % u64(c.size)
		v := c.data[k][i]
		noise := (sum(c.data[k])-v) / u64(c.size-1)
		vals << f64(v)-noise
	}
	//println("$item $vals")
	return u64(median(vals))
}
*/

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

// TODO u64
fn median(a []int) int {
	mut data := a.clone()
	data.sort()
	println(data)
	return data[a.len/2] // TODO even vs odd len
}

// ---[ MAIN ]------------------------------------------------------------------

mut c := new_countmin(3,4)
c.add('test')
c.add('stop')
c.add('test')
println(c)
println(c.estimate("test"))
println(c.estimate("stop"))
println(median([2,2,4,5,6,7,1,2,3,3,4,5,6]))
