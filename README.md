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

mut b := sketch.bloom(1, 2) // 1*u64=64 bits, 2 hashing functions

b.add("simple")
b.add("fast")
b.add("safe")
b.add("compiled")

println(b.might_contain("simple"))   // true
println(b.might_contain("fast"))     // true
println(b.might_contain("safe"))     // true
println(b.might_contain("compiled")) // true

println(b.might_contain("complex"))     // ???
println(b.might_contain("slow"))        // ???
println(b.might_contain("unsafe"))      // ???
println(b.might_contain("interpreted")) // ???
```

## MinHash

```v
import mobarski.sketch


```


## Count-min sketch

```v
import mobarski.sketch


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
