#!/run/current-system/sw/bin/bash

# Define the mating strategies
mating_strategies=("random")

# Run the burn-in phase
echo "Starting burn-in phase..."
for i in {1..10}; do
    slim -d TotalLength=1000000 -d runID=$i -d NBurn=10000 ../burnin/burnin.slim
done
echo "Burn-in phase completed."

# Run the random mating phase
echo "Starting random mating phase..."
for i in {1..10}; do
    for j in "${mating_strategies[@]}"; do
        slim -d TotalLength=1000000 -d runID=$i -d NBurn=10000 -d NGen=100 -d Mating='"random_mating"' ./2_monogamous_random_mating.slim
    done
done
echo "Random mating phase completed."
