# It's part of DynamicalSystems so add
using Pkg
Pkg.add(["DynamicalSystems", "DrWatson", "BSON"])


using DrWatson


# Initialize Project
initialize_project("Project_Name"; authors="My_Name")

# Active the Project Environment
@quickactivate "Project_Name"

# Navigation Basics
cd("Change current working directory to anywhere")
projectdir()
datadir()

# extracting parameter values into name
params_1 = Dict(:a => 2, :b => 3, :v => rand(5), :method = "linear")
savename(params_1)

struct A
    a
    b
    method
end
params_2 = A(0.5, 3.2, "linear")
savename(params_2)

savename("prefix", params_2, "bson")
# "prefix_a=0.5_b=3.2_method=linear.bson"

# Saving tools
save("name.bson", data)
safesave("name.bson", data)

# It adds git information for reproducibility
# like :gitcommit, :script, :gitpatch
@tagsave(datadir("name.bson"), data; safe = true)
load(datadir("name.bson"))

# Send entire project to Colleague
# and they will run
```
   julia> using Pkg
   julia> Pkg.add("DrWatson") # install globally, for using `quickactivate`
   julia> Pkg.activate("path/to/this/project")
   julia> Pkg.instantiate()
```
# Relative Paths, Exact Package Versions, Git Information


