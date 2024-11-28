#!/run/current-system/sw/bin/bash

# Define the mating strategies
mating_strategies=("genetic_load")

# Run the burn-in phase
echo "Starting burn-in phase..."
for i in {1..3}; do
    slim -d TotalLength=1000000 -d runID=$i -d NBurn=5000 ../burnin/burnin.slim
done
echo "Burn-in phase completed."

# Run the genetic load mating phase
echo "Starting genetic load mating phase..."
for i in {1..3}; do
    for j in "${mating_strategies[@]}"; do
        slim -d TotalLength=1000000 -d runID=$i -d NBurn=5000 -d NGen=100 -d Mating='"genetic_load"' ./genetic-load_low-budget_regime.slim
    done
done
echo "Genetic load mating phase completed."
