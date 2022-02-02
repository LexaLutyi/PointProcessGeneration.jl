# Процессы для которых требуется указать только число точек


poisson(n; dim=2) = rand(dim, n)


function circle_uniform(n)
    ws = range(0., length=n, step=2π / n)
    [f(w) for f in (cos, sin), w in ws]
end


function circle_poisson(n)
    ws = rand(n) * 2π
    [f(w) for f in (cos, sin), w in ws]
end


normal(n; dim=2) = rand(Normal(), dim, n)
