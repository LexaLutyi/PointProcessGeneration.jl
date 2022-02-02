module PointProcessGeneration

using Distributions
using Distances

# Write your package code here.
include("simple.jl")
include("metric.jl")
include("support.jl")
include("colored.jl")

# simple
export poisson, normal, circle_poisson, circle_uniform
# with support
export clusters, voronoi, circles
# colored
export normal_clusters, circle_clusters, anarchy, colored_clusters, target_circles

end
