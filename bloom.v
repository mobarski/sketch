import hash

// TODO benchmark for other data types: u8 u 16 u32

const (
	n_bits = sizeof(u64)*8
)

struct Bloom {
	n_hash int
mut:
	data []u64
}

// pub
fn bloom(size int, n_hash int) &Bloom {
	mut b := &Bloom{
		n_hash: n_hash
		data:   []u64{len:size}
	}
	return b
}

fn (mut b Bloom) add(item string) {
	bloom_add(mut b.data, b.n_hash, item)
}

fn (b Bloom) might_contain(item string) bool {
	return bloom_has(b.data, b.n_hash, item)
}

// ----------------------------------------------------------------------------

fn bloom_idx_mask(b []u64, item string, salt u64) (u64,u64) {
	val := hash.sum64_string(item, salt)
	max := u64(b.len) * n_bits
	pos := val % max
	idx := pos / n_bits
	bit_pos := pos % n_bits
	mask := u64(1)<<bit_pos
	return idx, mask
}

fn bloom_add(mut b []u64, k int, item string) {
	for i in 0..k {
		idx,mask := bloom_idx_mask(b, item, u64(i))
		b[idx] |= mask
	}
}

fn bloom_has(b []u64, k int, item string) bool {
	for i in 0..k {
		idx,mask := bloom_idx_mask(b, item, u64(i))
		if b[idx] & mask == 0 { return false }
	}
	return true
}

if false {
	mut b := bloom(1,2)

	b.add("this")
	b.add("is")
	b.add("a")
	b.add("test")

	println(b)

	println(b.might_contain("this"))
	println(b.might_contain("is"))
	println(b.might_contain("a"))
	println(b.might_contain("test"))
	println("")
	println(b.might_contain("aaa"))
	println(b.might_contain("xyz"))
	println(b.might_contain("other"))
	println(b.might_contain("nope"))
}


if true {
	mut b := bloom(1, 2)

	b.add("v is simple")
	b.add("v is fast")
	b.add("v is safe")
	b.add("v is compiled")

	println(b.might_contain("v is simple"))   // true
	println(b.might_contain("v is fast"))     // true
	println(b.might_contain("v is safe"))     // true
	println(b.might_contain("v is compiled")) // true

	println(b.might_contain("v is complex"))     // false
	println(b.might_contain("v is slow"))        // false
	println(b.might_contain("v is unsafe"))      // false
	println(b.might_contain("v is interpreted")) // false
}
