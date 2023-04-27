# 2D-Iteration-Benchmark
2D Iteration in Julia

### Results:
```
0.814084 seconds (20.14 k allocations: 980.531 MiB, 1.51% gc time, 0.96% compilation time)
1.743139 seconds (16.49 k allocations: 1.036 GiB, 2.74% gc time, 0.39% compilation time)
1.746377 seconds (6.51 k allocations: 767.037 MiB, 0.43% compilation time)
2.309628 seconds (8.90 k allocations: 1.343 GiB, 0.50% compilation time)
```

The naive way (one) might be fastest in Julia, but in most languages the other two would beat out by a landslide.Especially while loop against for loop.
