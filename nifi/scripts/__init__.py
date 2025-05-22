import time

from requests import get, post, HTTPError


def get_url(host, port):
    return f'https://{host}:{port}/nifi-api'

def access_token(url, username, password):
    endpoint = f'{url}/access/token'
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
    }
    data = f'username={username}&password={password}'
    response = post(endpoint, headers=headers, data=data, verify=False)
    response.raise_for_status()
    return response.content.decode('utf-8').strip()

def upload_flow(url, auth, path):
    with open(path, 'rb') as fp:
        endpoint = f'{url}/process-groups/root/process-groups/upload'
        files = { 'file': (path, fp, 'application/json') }
        response = post(endpoint, auth=auth, files=files, verify=False)
        response.raise_for_status()
        return response.json()

def upload_flow_test():
    url = get_url('nifi', 8443)
    token = access_token(url, 'admin', 'almeno12caratteri')
    return upload_flow(url, token, 'templates/download_dataset.json')
