using DrWatson
using Random
@quickactivate "BasicML"

include(joinpath(projectdir(), "src", "neural_network.jl"))

# Define the number of input, hidden, and output neurons
input_size = 2
hidden_size = 5
output_size = 1

# Create the neural network model
model = create_model(input_size, hidden_size, output_size)

# Generate some sample data to train the model
n_samples = 100
input_data, output_data = generate_sample_data(input_size, n_samples)

# Define the loss function and optimizer
loss, optimizer = create_loss_and_optimizer()

# Train the model
n_epochs = 1000
train_model(model, loss, optimizer, input_data, output_data, n_epochs)

# Use the trained model to make predictions on new input data
new_input_data = rand(input_size, 5)
predictions = predict(model, new_input_data)