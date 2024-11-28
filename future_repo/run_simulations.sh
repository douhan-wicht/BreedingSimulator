#!/run/current-system/sw/bin/bash

# Define the mating strategies
mating_strategies=("random" "random-relatedness" "relatedness" "genetic_load" "mixed")

# Run the burn-in phase
echo "Starting burn-in phase..."
for i in {1..3}; do
    slim -d TotalLength=1000000 -d runID=$i -d NBurn=5000 ./burnin.slim
done
echo "Burn-in phase completed."

# Run the genetic load mating phase
for j in "${mating_strategies[@]}"; do
    echo "Starting $j mating phase..."
    for i in {1..3}; do
        echo "Running replicate $i for $j mating strategy..."
        slim -d TotalLength=1000000 -d runID=$i -d NBurn=5000 -d NGen=100 -d Mating=\"$j\" "./$j.slim"
        echo "Completed replicate $i for $j mating strategy."
    done
    echo "$j mating phase completed."
done
