# This file is intended to hide some "boring" code that is 
# useful to produce a nice "e-essay", but is not interesting 
# in the context of the main ideas of the essay. Plotting code
# is a good candidate to hide. 
#
# On the other hand, distinguishing the Forward Euler and 
# Symplectic Euler schemes is interesting and should possibly 
# be kept in the main notebook. There is no hard and fast rule
# though, so please use your best judgement and your own tast.
#

using Test, Plots, ForwardDiff, Printf, LinearAlgebra
gr(fmt=:png)

function plot_trajectory(traj, step=5)
    Rs = reshape(traj, size(traj, 1), N, D)
    
    @gif for n=1:step:size(traj, 1)
               
        # Sun - yellow
        scatter(Rs[1:n, 1, 1], 
                Rs[1:n, 1, 2], 
                color=:yellow, markersize=:30,
                size=(600, 600), xlim=(-2, 2), 
                ylim=(-2, 2), legend=false)
        
        # Earth - blue
        plot!(Rs[1:n, 2, 1], Rs[1:n, 2, 2], color=:blue)
        scatter!([Rs[n, 2, 1]], [Rs[n, 2, 2]], color=:blue, markersize=:20)
        
        # Mars - red
        plot!(Rs[1:n, 3, 1], Rs[1:n, 3, 2], color=:red)
        scatter!([Rs[n, 3, 1]], [Rs[n, 3, 2]], color=:red, markersize=:10)
        
        if size(Rs, 2) > 3
            # for the spaceshop, see later...
            plot!(Rs[1:n, 4, 1], Rs[1:n, 4, 2], color=:green)
            scatter!([Rs[n, 4, 1]], [Rs[n, 4, 2]], color=:green, markersize=:5)
        end
    end
end

;