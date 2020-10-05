import requests


def test_federation_connection(protocol,host, port, acct, passwd):
    """ Make the connection test to Thalamus Server
        from the GNU Health HMIS using the institution
        associated admin and the related credentials
    """
    conn = ''

    print("Credentials -->", acct, passwd)


    url = protocol +"://" + host + ':' + str(port) + '/people/' + acct

    try:
        conn = requests.get(url,
            auth=(acct, passwd), verify=False)

    except:
        print ("ERROR authenticating to Server")
        login_status = -2


    if conn:
        print ("***** Connection to Thalamus Server OK !******")
        login_status = 0

    else:
        print ("##### Wrong credentials ####")
        login_status = -1

    print (login_status)
    return (login_status)

