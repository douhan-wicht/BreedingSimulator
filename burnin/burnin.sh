#!/run/current-system/sw/bin/bash

# Run the burn-in phase
echo "Running burn-in phase..."
for i in {1..100}; do
    slim -d TotalLength=1000000 -d runID=$i -d NBurn=10000 /home/douhan/Documents/Unil/MSc1/A24/PGD/SLiM/BreedingSimulator/burnin.slim
done

echo "Burn-in phase completed."
