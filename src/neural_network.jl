using Flux
using Random

# Define the neural network model
function create_model(input_size:: Int, hidden_size:: Int, output_size:: Int)
    layer1 = Dense(input_size, hidden_size, relu)
    layer2 = Dense(hidden_size, output_size, sigmoid)
    return Chain(layer1, layer2)
end

# Define the loss function and optimizer
function create_loss_optimizer()
    loss(x,y) = Flux.mse(model(x), y)
    optimizer = Flux.ADAM()
    return loss, optimizer
end

# Train the model
function train_model(model, loss, optimizer, input_data, output_data, n_epochs:: Int)
    for epoch in 1:n_epochs
        train!(loss, params(model), [(input_data, output_data), optimizer])
    end
end

# Use the trained model to make predictions
function predict(model, input_data)
    return model(input_data)
end

# Generate some sample data to train 
function generate_sample_data(input_size::Int, n_samples::Int)
    input_data = rand(input_size, n_samples)
    output_data = sum(input_data, dims=1) .> 1.5
    return input_data, output_data
end