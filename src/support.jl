"""
    clusters(support::PP, cluster::Function)

generate clusters with centers from support
"""
clusters(support, cluster) = reduce(hcat, [cluster() .+ c for c in eachcol(support)])


function surface_points(n, support, metric)
    all_points = rand(size(support, 1), 1000 * n)
    
    a = [metric(x, support) for x in eachcol(all_points)]
    
    ix = sortperm(a)[1:n]
    all_points[:, ix]
end


voronoi(n, support) = surface_points(n, support, voronoi_metric)

circles(n, support, r) = surface_points(n, support, (x, s) -> circle_metric(x, s, r))
