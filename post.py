import json
import requests
import sys
import settings

mattermost_webhook_url = settings.mattermost_webhook_url
mattermost_username = settings.mattermost_username
mattermost_channel = settings.mattermost_channel
mattermost_iconurl = settings.mattermost_iconurl
verify_cert = settings.verify_cert

def post_text(text, username, channel, iconurl):
    """
    Mattermost POST method, posts text to the Mattermost incoming webhook URL
    """
    data = {}
    data['text'] = text
    if len(username) > 0:
        data['username'] = username
    if len(channel) > 0:
        data['channel'] = channel
    if len(iconurl) > 0:
        data['icon_url'] = iconurl

    headers = {'Content-Type': 'application/json'}
    r = requests.post(mattermost_webhook_url, headers=headers, data=json.dumps(data), verify=verify_cert)

    if r.status_code is not requests.codes.ok:
        logging.debug('Encountered error posting to Mattermost URL %s, status=%d, response_body=%s' %
                      (mattermost_webhook_url, r.status_code, r.json()))


if __name__ == "__main__":
	if not len(sys.argv) == 2:
		print("Start: post.py <Text>")
		sys.exit(1)
	else:
		text = str(sys.argv[1])

	post_text(text, mattermost_username, mattermost_channel, mattermost_iconurl)

