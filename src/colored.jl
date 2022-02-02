function normal_clusters(nx, ny; dim=2, σ=0.1)
    x0 = poisson(nx; dim)
    λ = ny / nx
    y0 = clusters(x0, () -> normal(rand(Poisson(λ)); dim) * σ)
    x0, y0
end


function circle_clusters(nx, ny; radius=0.05)
    λ = ny / nx
    x0 = poisson(nx)
    y0 = clusters(x0, () -> radius * circle_poisson(rand(Poisson(λ))))
    x0, y0
end


function anarchy(n)
    z = poisson(n)
    ix = map(w -> w[1] > w[2], eachcol(z))
    x0 = z[:, ix]
    y0 = z[:, .!ix]
    x0, y0
end


function poisson(nx, ny; dim=2)
    x0 = poisson(nx; dim)
    y0 = poisson(ny; dim)
    x0, y0
end


function colored_clusters(nsup, npp; σ=0.1)
    dim = 2
    z = poisson(4nsup; dim)
    d = pairwise(PeriodicEuclidean(ones(dim)), z; dims=2)
    mix = map(i -> minimum(d[:, (1:end) .!= i]), 1:4nsup)
    ix = sortperm(mix)
    z = z[:, 2nsup + 1:end]
    xs = z[:, 1:2:end]
    ys = z[:, 2:2:end]
    λ = npp / nsup
    x0 = clusters(xs, () -> normal(rand(Poisson(λ)); dim) * σ)
    y0 = clusters(ys, () -> normal(rand(Poisson(λ)); dim) * σ)
    x0, y0
end


function target_circles(n=1500, radius=0.125)
    dim = 2
    z = poisson(n; dim)
    center = reshape([0.5, 0.5], 2, 1)
    d = pairwise(PeriodicEuclidean(ones(2)), z, center; dims=dim)[:]
    ix = mod.(div.(d, radius), 2) .== 1
    x0 = z[:, ix]
    y0 = z[:, .!ix]
    x0, y0
end
