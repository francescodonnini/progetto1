import json

import requests
import time

from requests import HTTPError

NIFI_HOST = "http://nifi:8443"
FLOW_JSON_PATH = "/opt/templates/NiFi_Flow_WOUTES.json"  # Replace with your actual file

HEADERS = {"Content-Type": "application/json"}

def get_root_pg_id():
    resp = requests.get(f"{NIFI_HOST}/nifi-api/process-groups/root")
    resp.raise_for_status()
    return resp.json()["id"]


def upload_flow_definition(root_pg_id, flow_json_path):
    with open(flow_json_path, "r") as f:
        flow_json = json.load(f)
    resp = requests.post(
        f"{NIFI_HOST}/nifi-api/process-groups/{root_pg_id}/import",
        headers=HEADERS,
        json=flow_json
    )
    if resp.status_code == 200:
        print("Flow uploaded successfully.")
        pg_id = resp.json().get("flowSnippet", {}).get("processGroups", [{}])[0].get("id")
        if pg_id:
            print(f"Imported Flow Process Group ID: {pg_id}")
        else:
            print("Flow snippet imported, but no process group found.")
    else:
        print("Failed to upload flow.")
        print(resp.status_code, resp.text)


if __name__ == "__main__":
    # Optional: Start NiFi container (uncomment if you want to auto-run it)
    # subprocess.run(["docker", "run", "-d", "--name", "nifi", "-p", "8080:8080", "apache/nifi:latest"])
    wait_for_nifi()
    root_id = get_root_pg_id()
    upload_flow_definition(root_id, FLOW_JSON_PATH)
