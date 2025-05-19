from requests import post

def get_url(host, port):
    return f'https://{host}:{port}/nifi-api'

def access_token(url, username, password):
    endpoint = f'{url}/access/token'
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
    }
    data = f'username={username}&password={password}'
    response = post(endpoint, headers=headers, data=data, verify=False)
    if response.status_code == 201:
        return response.content
    print(f'error {response.status_code}')
    return None

def upload_template(url, token, template_path):
    with open(template_path, 'rb') as fp:
        endpoint = f'{url}/process-groups/root/templates/upload'
        headers = {
            'Authorization': f'Bearer {token}',
            'Content-Type': 'multipart/form-data'
        }
        response = post(endpoint, headers=headers, data=fp, verify=False)
        return response.json