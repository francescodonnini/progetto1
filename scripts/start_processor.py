from os import getenv
from requests import get, post, put

def access_token(url, username, password):
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
    }
    data = f'username={username}&password={password}' 
    response = post(f'{url}/access/token', headers=headers, data=data, verify=False)
    response.raise_for_status()
    return response.content.decode('utf-8').strip()


def get_processor(url, token, pid):
    headers = {
        'Authorization': f'Bearer {token}'
    }
    response = get(f'{url}/processors/{pid}', headers=headers, verify=False)
    response.raise_for_status()
    return response.json()

def start_processor(url, token, pid, version):
    headers = {
        'Authorization': f'Bearer {token}',
        'Content-Type': 'application/json'
    }
    data = {
        'state': 'RUNNING',
        'revision': {
            'version': version
        }
    }
    response = put(f'{url}/processors/{pid}/run-status', headers=headers, json=data, verify=False)
    response.raise_for_status()
    return response

def get_nifi_info():
    host = try_getenv('NIFI_HOST')
    port = int(try_getenv('NIFI_PORT'))
    username = try_getenv('NIFI_USERNAME')
    password = try_getenv('NIFI_PASSWORD')
    pid = try_getenv('NIFI_PID')
    return host, port, username, password, pid

def try_getenv(env_var):
    var = getenv(env_var)
    if var is None:
        raise ValueError(f'{env_var} is not set')
    return var

if __name__ == '__main__':
    host, port, username, password, pid = get_nifi_info()
    url = f'https://{host}:{port}/nifi-api'
    token = access_token(url, username, password)
    processor = get_processor(url, token, pid)
    start_processor(url, token, processor['id'], processor['revision']['version'])
