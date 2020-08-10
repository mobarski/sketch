Data sketches library for the [V language](https://vlang.io).

# Installation

```
v install mobarski.sketch
```

# Usage

This library implements the following probabilistic data structures:
 * [ ] **Bloom filter** - for membership estimation
 * [ ] **MinHash** - for cardinality and similarity estimation
 * [ ] **Count-min sketch** - for frequency estimation
 * [ ] **LogLog** - for cardinality estimation

## Bloom filter

```v
import mobarski.sketch

mut s := sketch.bloom(1, 2) // 1*u64=64 bits, 2 hashing functions

s.add("v is simple")
s.add("v is fast")
s.add("v is safe")
s.add("v is compiled")

println(s.might_contain("v is simple"))   // true
println(s.might_contain("v is fast"))     // true
println(s.might_contain("v is safe"))     // true
println(s.might_contain("v is compiled")) // true

println(s.might_contain("v is complex"))     // false
println(s.might_contain("v is slow"))        // false
println(s.might_contain("v is unsafe"))      // false
println(s.might_contain("v is interpreted")) // false
```

## Count-min sketch

```v
import mobarski.sketch

mut s := sketch.new_countmin(4,3) // 4 items, 3 hashing functions
s.add("foo")
s.add("bar")
s.add("foo")
println(s.estimate("foo")) // 2
println(s.estimate("bar")) // 1
println(s.estimate("xyz")) // 0
```


## MinHash

```v
import mobarski.sketch

mut s := sketch.new_minhash(100)
for i in 0..20000 {
	h.add(i.str())
	h.add(i.str())
	h.add(i.str())
}
println(h.estimate())
```

## LogLog

```v
import mobarski.sketch


```


# External links

- [Bloom filter](https://en.wikipedia.org/wiki/Bloom_filter)
- [MinHash](https://en.wikipedia.org/wiki/MinHash)
- [Count-Min sketch](https://en.wikipedia.org/wiki/Count%E2%80%93min_sketch)
- [LogLog]()
