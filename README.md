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

Remembering 4 phrases in 1 u64 value:
```v
import mobarski.sketch

mut b := sketch.bloom(1, 2) // 1*u64=64 bits, 2 hashing functions

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
