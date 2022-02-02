using PointProcessGeneration
using Test

@testset "PointProcessGeneration.jl" begin
    # Write your tests here.

    dim = 2
    n = 100
    ns = 10
    poisson(n; dim)

    colored_clusters(ns, n)

    normal(n)

    normal_clusters(ns, n; dim)
end
