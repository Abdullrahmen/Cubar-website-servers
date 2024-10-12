#!/usr/bin/python3
"""
Fabric script that creates and distributes an archive web_dynamic nodejs project
to the web servers
"""

from fabric.connection import Connection
from datetime import datetime
from os.path import exists, isdir

serverIP = '54.172.133.147'
privateKeyPath = "/home/vagrant/Cubar/Keys/cubar-first-server.pem"
releasesPath = "/data/web_dynamic_nodejs/releases/"

def do_pack():
    """generates a tgz archive from web_dynamic_nodejs folder to versions folder"""
    try:
        c = Connection(f"ubuntu@{serverIP}", connect_kwargs={"key_filename": privateKeyPath})
        date = datetime.now().strftime("%Y%m%d%H%M%S")
        if isdir("versions") is False:
            c.local("mkdir versions")
        file_name = "versions/web_dynamic_nodejs_{}.tgz".format(date)
        c.local("tar -cvzf {} web_dynamic_nodejs".format(file_name))
        return file_name
    except:
        return None
    

def do_deploy(archive_path):
    """distributes an archive to the web servers"""
    if exists(archive_path) is False:
        return False
    try:
        file_n = archive_path.split("/")[-1]
        no_ext = file_n.split(".")[0]
        with Connection(f"ubuntu@{serverIP}", connect_kwargs={"key_filename": privateKeyPath}) as c:
            c.put(archive_path, '/tmp/')
            c.run('mkdir -p {}{}/'.format(releasesPath, no_ext))
            c.run('tar -xzf /tmp/{} -C {}{}/'.format(file_n, releasesPath, no_ext))
            c.run('rm /tmp/{}'.format(file_n))
            c.run('mv {0}{1}/web_dynamic_nodejs/* {0}{1}/'.format(releasesPath, no_ext))
            c.run('rm -rf {}{}/web_dynamic_nodejs'.format(releasesPath, no_ext))
            c.run('rm -rf /data/web_dynamic_nodejs/current')
            c.run('ln -s {}{}/ /data/web_dynamic_nodejs/current'.format(releasesPath, no_ext))
            c.run('sudo kill -9 $(sudo lsof -t -i :8080)')
        return True
    except:
        return False

def deploy():
    """creates and distributes an archive to the web servers"""
    archive_path = do_pack()
    if archive_path is None:
        return False
    return do_deploy(archive_path)

if __name__ == "__main__":
    print(deploy())