function voronoi_metric(x, support)
    a = colwise(PeriodicEuclidean(ones(2)), support, x)
    b = partialsort!(a, 1:2)
    abs(b[2] - b[1])
end


function circle_metric(x, support, r)
    a = abs.(colwise(PeriodicEuclidean(ones(2)), support, x) .- r)
    partialsort!(a, 1)
end
