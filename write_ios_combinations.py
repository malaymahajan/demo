import orthagonal_operations
import json
import subprocess

if __name__ == "__main__":
    with open("combined_environment.json", 'r') as f:
        combined_env = json.load(f)

        factors = ["env", "device", "version"]
        levels = {
            "env": list(combined_env['ios']['env'].values()),
            "device": list(combined_env['ios']['device'].values()),
            "version": list(combined_env['ios']['version'].values())
        }

        combinations = orthagonal_operations.generate_testing_combinations(factors, levels)
        orthagonal_operations.update_combinations(combinations)

        remote_url = "https://github.com/malaymahajan/demo.git"

        orthagonal_operations.commit_and_push_changes("main", remote_url)


