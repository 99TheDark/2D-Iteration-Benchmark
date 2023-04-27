function one(arr::Matrix{Int64}, func::Function)::Nothing
    for i=1:size(arr, 2)
        for j=1:size(arr, 1)
            func(i, j)
        end
    end
end

function two(arr::Matrix{Int64}, func::Function)::Nothing
    w = size(arr, 1)
    h = size(arr, 2)
    for i=0:(w * h - 1)
        func(i % w + 1, i ÷ w + 1)
    end
end

function three(arr::Matrix{Int64}, func::Function)::Nothing
    w = size(arr, 1)
    h = size(arr, 2)
    i = 0
    while i < w * h
        func(i % w + 1, i ÷ w + 1)
        i += 1
    end
end

function four(arr::Matrix{Int64}, func::Function)::Nothing
    w = size(arr, 1)
    h = size(arr, 2)
    i = 1
    j = 1
    while j <= h
        func(i, j)
        i += 1
        if i > w 
            i = 1
            j += 1
        end
    end
end

width = 10000
height = 5000
arr2d = zeros(Int64, (width, height))

coords::Vector{Tuple{Int64, Int64}} = []

func = (x, y) -> push!(coords, (x, y))

#=

Results:
0.814084 seconds (20.14 k allocations: 980.531 MiB, 1.51% gc time, 0.96% compilation time)
1.743139 seconds (16.49 k allocations: 1.036 GiB, 2.74% gc time, 0.39% compilation time)
1.746377 seconds (6.51 k allocations: 767.037 MiB, 0.43% compilation time)
2.309628 seconds (8.90 k allocations: 1.343 GiB, 0.50% compilation time)

The naive way (one) might be fastest in Julia, but in most languages the other two would beat out by a landslide.Especially while loop against for loop.

=#

@time one(arr2d, func)
@time two(arr2d, func)
@time three(arr2d, func)
@time four(arr2d, func)

println()

println(length(coords))