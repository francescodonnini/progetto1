import subprocess
import sys

if __name__ == "__main__":
    queries = {
        '1R': 'Q1_RDD',
        '1D': 'Q1_DF',
        '1S': 'Q1_SQL',
        '2R': 'Q2_RDD',
        '2D': 'Q2_DF',
        '2S': 'Q2_SQL'
    }
    for (query, app_name) in queries.items():
        subprocess.run(f'sh scripts/submit-query.sh --query {query} --time 50  --appName {app_name}', shell=True)
    sys.exit(0)
